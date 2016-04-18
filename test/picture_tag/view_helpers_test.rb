require 'picture_tag/view_helpers'
require 'test_helper'

module PictureTag
  describe ViewHelpers do
    include ViewHelpers
    include ActionView::Helpers
    include ActionView::Helpers::TagHelper

    # =====================================================================

    describe '#source_tag' do
      it 'returns source tag' do
        source_tag.must_match Regexp.new('<source.*?/>')
      end
    end

    # ---------------------------------------------------------------------

    describe '#picture_tag' do
      let(:srcset) { 'srcset' }
      let(:alt) { 'alt text' }
      let(:src) { 'foo bar src' }
      let(:image_options) { { alt: alt, src: src } }
      let(:content) { 'content' }
      let(:ie9_start) { "<!--[if IE 9]><video style='display: none;'><![endif]-->" }
      let(:ie9_end) { '<!--[if IE 9]></video><![endif]-->' }

      it 'returns picture tag' do
        picture_tag(srcset, image: image_options) { content }.must_match Regexp.new('\\A<picture>.*?</picture>\\z')
      end

      it 'wraps content in the picture tag' do
        picture_tag(srcset, image: image_options) { content }.must_match Regexp.new("<picture>.*#{content}.*</picture>")
      end

      it 'adds image tag after the content' do
        picture_tag(srcset, image: image_options) { content }.must_match Regexp.new("#{content}.*<img.*?/></picture>")
      end

      it 'passes srcset to the image tag srcset' do
        picture_tag(srcset) { content }.must_match Regexp.new("<img.*?srcset=\".*?#{srcset}.*?\".*?/>")
      end

      it 'passes alt to the image tag' do
        picture_tag(srcset, image: image_options) { content }.must_match Regexp.new("<img.*?alt=\"#{alt}\".*?/>")
      end

      it 'passes src to the image tag' do
        picture_tag(srcset, image: image_options) { content }.must_match Regexp.new("<img.*?src=\"#{src}\".*?/>")
      end

      it 'wraps content with the IE9 fix' do
        index_of_content = picture_tag(srcset) { content }.index(content)
        index_of_ie9_start_tag = picture_tag(srcset) { content }.index(ie9_start)
        index_of_ie9_end_tag = picture_tag(src) { content }.index(ie9_end)
        (index_of_ie9_start_tag < index_of_content).must_equal true
        (index_of_ie9_end_tag > index_of_content).must_equal true
      end
    end
  end
end
