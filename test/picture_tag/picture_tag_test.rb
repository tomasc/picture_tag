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
        source_tag.must_match Regexp.new("\<source.*?\/\>")
      end
    end

    # ---------------------------------------------------------------------

    describe '#picture_tag' do
      it 'returns picture tag' do
        content = 'foo'
        picture_tag { content }.must_match Regexp.new("\<picture\>#{content}\<\/picture\>")
      end
    end

  end
end