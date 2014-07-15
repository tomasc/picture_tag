module PictureTag
  module ViewHelpers

    def picture_tag &block
      content_tag :picture, &block
      # tag :picture do
      #   &block
      # end
    end

    # <img
    #   sizes="(min-width: 40em) 80vw, 100vw"
    #   srcset="examples/images/medium.jpg 375w, examples/images/medium.jpg 480w, examples/images/large.jpg 768w"
    #   alt="A giant stone face at The Bayon temple in Angkor Thom, Cambodia">

    def source_tag options={}
      tag :source, options
    end
  end
end