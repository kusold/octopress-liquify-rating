module Jekyll
  class RatingStars < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @stars           = text
    end

    def render(context)
      @size = @stars * 20
      html_output_for(@size)
    end

    def html_output_for (size)
"<style type='text/css'>
.star-rating-wrap{
  white-space:nowrap;
}
.star-rating,
.star-rating div.current-rating{
  background: url(https://github.com/Kusold/octopress-liquify-rating/raw/master/star.gif) left -1000px repeat-x;
}
.star-rating{
  position:relative;
  width:100px !important;
  height:25px !important;
  overflow:hidden !important;
  list-style:none;
  margin:0 !important;
  padding:0 !important;
  background-position: left top;
  display: block;
}
.star-rating div{
  display: inline;
  background: none !important;
  border: 0 !important;
}
div.star-rating div.current-rating{
  position:absolute;
  top:0;
  left:0;
  text-indent:-9999px;
  height:25px !important;
  line-height:25px !important;
  outline:none;
  overflow:hidden;
  border: none;
  padding: 0 !important;
  margin: 0 !important;
}
.star-rating div.current-rating{
  z-index:1;
  background-image: url(https://github.com/Kusold/octopress-liquify-rating/raw/master/star.gif) !important;
  background-position: left bottom !important;
}
</style>
<div class='star-rating' style='width: 50px;'>
<div class='current-rating' style='{size}px;'>
</div>
</div>"
    end
  end
end

Liquid::Template.register_tag('rating', Jekyll::RatingStars)