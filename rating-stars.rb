module Jekyll
  class RatingStars < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @stars           = text
    end

    def render(context)
      @size = Float(@stars) * 20
      html_output_for(@size)
    end

    def html_output_for (size)
"<div class='star-rating' style='width: 50px;'>
<div class='current-rating' style='width: #{size}px;'></div></div>"
    end
  end
end

Liquid::Template.register_tag('rating', Jekyll::RatingStars)