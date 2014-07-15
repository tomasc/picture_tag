require 'action_view'

module PictureTag
  module ViewHelpers

    def self.included klass
      klass.class_eval do
        include ActionView::Context
      end
    end

    def picture_tag src, options={}, &block
      content_tag :picture do
        capture(&block) +
        image_tag(src, options)
      end
    end

    def source_tag options={}
      tag :source, options
    end

  end
end