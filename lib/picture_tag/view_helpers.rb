require 'action_view'

module PictureTag
  module ViewHelpers

    def self.included klass
      klass.class_eval do
        include ActionView::Context
      end
    end

    def picture_tag src, options={}, &block
      image_options = options.fetch(:image, {})
      picture_options = options.except(:image)

      content_tag :picture, picture_options do
        "<!--[if IE 9]><video style='display: none;'><![endif]-->".html_safe +
        capture(&block) +
        "<!--[if IE 9]></video><![endif]-->".html_safe +
        image_tag(src, image_options)
      end
    end

    def source_tag options={}
      tag :source, options
    end

  end
end
