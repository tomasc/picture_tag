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
        source_tag.must_match Regexp.new("<source.*?\/>")
      end
    end

    # ---------------------------------------------------------------------

    describe '#picture_tag' do
      let(:src) { 'src' }
      let(:alt) { 'alt' }
      let(:content) { 'content' }

      it 'returns picture tag' do
        picture_tag(src, alt: alt) { content }.must_match Regexp.new("\\A<picture>.*?</picture>\\z")
      end

      it 'wraps content in the picture tag' do
        picture_tag(src, alt: alt) { content }.must_match Regexp.new("<picture>.*#{content}.*</picture>")
      end

      it 'adds image tag after the content' do
        picture_tag(src, alt: alt) { content }.must_match Regexp.new("#{content}.*<img.*?/></picture>")
      end

      it 'passes src to the image tag' do
        picture_tag(src) { content }.must_match Regexp.new("<img.*?src=\".*?#{src}.*?\".*?/>")
      end

      it 'passes options to the image tag' do
        picture_tag(src, alt: alt) { content }.must_match Regexp.new("<img.*?alt=\"#{alt}\".*?/>")
      end
    end

  end
end