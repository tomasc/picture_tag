require 'action_view'

module PictureTag
  module ViewHelpers

    def self.included klass
      klass.class_eval do
        include ActionView::Context
      end
    end

    def picture_tag &block
      content_tag :picture, &block
    end

    def source_tag options={}
      tag :source, options
    end

  end
end