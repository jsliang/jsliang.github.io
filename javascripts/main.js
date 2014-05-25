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
    },
    genNavMenu: function(nav_ul_selector, heading_selector) {
      /*
      install navigation menu based on nav_ul_selector & heading_selector
      
      Usage example:
      <ul id="navmenu"></ul>
      <div class="section"><h2>Heading A</h2></div>
      <div class="section"><h2>Heading B</h2></div>
      <div class="section"><h2>Heading C</h2></div>
      <script>
      window.aboutJS.genNavMenu("#navmenu", ".section > h2");
      </script>
      */

      var gen_heading_li_node, gen_home_li_node, heading, headings_info, nav_ul, setupHeadings, _i, _len, _results;

      setupHeadings = function(heading_selector) {
        var entry, heading, heading_text, headings, headings_info, stripHTMLTags, stripWhitespace, _i, _len;

        stripHTMLTags = function(orig_str) {
          return orig_str.replace(/(<([^>]+)>)/ig, "").trim();
        };
        stripWhitespace = function(orig_str) {
          return orig_str.replace(/(\s)/ig, "").trim();
        };
        headings_info = [];
        headings = document.querySelectorAll(heading_selector);
        for (_i = 0, _len = headings.length; _i < _len; _i++) {
          heading = headings[_i];
          heading_text = stripHTMLTags(heading.innerHTML);
          heading.id = "nav" + stripWhitespace(heading_text);
          entry = {
            id: heading.id,
            text: heading_text
          };
          headings_info.push(entry);
        }
        return headings_info;
      };
      nav_ul = document.querySelector(nav_ul_selector);
      if (nav_ul != null) {
        headings_info = setupHeadings(heading_selector);
        if (headings_info.length > 0) {
          gen_home_li_node = function(nav_ul) {
            var home_li_node, text_node;

            home_li_node = document.createElement("li");
            text_node = document.createTextNode("Home");
            home_li_node.appendChild(text_node);
            home_li_node.onclick = function() {
              return window.scrollTo(0, 0);
            };
            return nav_ul.appendChild(home_li_node);
          };
          gen_heading_li_node = function(nav_ul, heading) {
            var hid, htext, li_node, text_node;

            hid = heading.id;
            htext = heading.text;
            li_node = document.createElement("li");
            li_node.headingid = hid;
            text_node = document.createTextNode(htext);
            li_node.appendChild(text_node);
            li_node.onclick = function() {
              var heading_element, heading_top;

              heading_element = document.getElementById(this.headingid);
              heading_top = heading_element.parentNode.offsetTop;
              return window.scrollTo(0, heading_top);
            };
            return nav_ul.appendChild(li_node);
          };
          gen_home_li_node(nav_ul);
          _results = [];
          for (_i = 0, _len = headings_info.length; _i < _len; _i++) {
            heading = headings_info[_i];
            _results.push(gen_heading_li_node(nav_ul, heading));
          }
          return _results;
        }
      }
    }
  };

  /*
  top-level function for other scripts to use
  */


  window.aboutJS = aboutJS;

}).call(this);
