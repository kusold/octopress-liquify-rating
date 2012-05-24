# Title: Rating Stars
# Author: Mike Kusold http://mikekusold.com
# Description: A plugin that allows the author to assign a 0-5 star ranking to whatever he chooses.
#
# Credits: This code is strongly based around how KomodoMedia tackled a similar problem in their
#          blog post: http://www.komodomedia.com/blog/2006/01/css-star-rating-part-deux/
#
# Syntax {% rating 0.0-5.0 %}
#
# Example:
# {% rating 3.5 %}
#
# Output:
# <div class='star-rating' style='width: 50px;'>
# <div class='current-rating' style='width: 70px;'></div></div>
#
# Installation: Copy rating-stars.rb into your Plugin/ directory.
#               Copy rating-stars.css into your Stylesheets/ directory
#               Modify your .themes/classic/source/custom/head.html file to include the rating-stars.css file
#

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