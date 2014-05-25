(function() {
  var aboutJS;

  aboutJS = {
    makeCover: function(cover_selector) {
      /*
      stretch the height of "cover" object to browser inner height
      
      Usage example:
          <div id="cover">...</div>
          <script>
          window.aboutJS.makeCover(window.document.getElementById("cover"));
          </script>
      */

      var client_height, cover, cover_height, cover_style_height, header_top;

      cover = document.querySelector(cover_selector);
      if (cover != null) {
        client_height = window.innerHeight || document.documentElement.clientHeight;
        cover_height = cover.getBoundingClientRect().height;
        if (cover_height < client_height) {
          header_top = cover.getBoundingClientRect().top;
          if (header_top > 0) {
            cover_style_height = client_height - header_top;
            return cover.style.height = cover_style_height + "px";
          }
        }
      }
    }
  };

  /*
  top-level function for other scripts to use
  */


  window.aboutJS = aboutJS;

}).call(this);
