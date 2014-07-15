module PictureTag
  module ViewHelpers

    def picture_tag(&block)
      tag :img do
        block
      end
    end

    # <img
    #   sizes="(min-width: 40em) 80vw, 100vw"
    #   srcset="examples/images/medium.jpg 375w, examples/images/medium.jpg 480w, examples/images/large.jpg 768w" 
    #   alt="A giant stone face at The Bayon temple in Angkor Thom, Cambodia">


    def source_tag(srcset=[], media='', sizes=[])
      content_tag :source, media:"meddiaiiaaia", srcset:"srcccc", sizes:"sziizizzzee"
    end

    # = picture_tag do
    #   = source_tag srcset: '…', media: '…' sizes: '…'
    #   = image_tag 'foo.png', alt: 'bar'
  end
end