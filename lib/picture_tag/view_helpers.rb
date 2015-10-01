require 'action_view'

module PictureTag
  module ViewHelpers

    def self.included klass
      klass.class_eval do
        include ActionView::Context
      end
    end

    def picture_tag srcset, options={}, &block
      picture_options = options.except(:image)
      image_options = options.fetch(:image, {})
      image_options[:srcset] = srcset

      content_tag :picture, picture_options do
        "<!--[if IE 9]><video style='display: none;'><![endif]-->".html_safe +
        capture(&block) +
        "<!--[if IE 9]></video><![endif]-->".html_safe +
        tag("img", image_options)
      end
    end

    def source_tag options={}
      tag :source, options
    end

  end
end
