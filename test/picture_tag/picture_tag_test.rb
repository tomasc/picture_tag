require 'test_helper'

module PictureTag
  describe PictureTagHelper do
    include PictureTagHelper

    describe '#source_tag' do
      it 'returns valid source tag' do
        source_tag.must_equal ''
      end
    end
  end
end