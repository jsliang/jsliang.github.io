aboutJS =
    makeCover: (cover_selector) ->
        ###
        stretch the height of "cover" object to browser inner height

        Usage example:
            <div id="cover">...</div>
            <script>
            window.aboutJS.makeCover(window.document.getElementById("cover"));
            </script>
        ###
        cover = document.querySelector(cover_selector)
        if cover?
            client_height = window.innerHeight or document.documentElement.clientHeight
            cover_height = cover.getBoundingClientRect().height

            # strech only if header#cover is shorter than browser inner height
            if cover_height < client_height
                header_top = cover.getBoundingClientRect().top

                if header_top > 0
                    cover_style_height = client_height - header_top
                    cover.style.height = cover_style_height + "px"

###
top-level function for other scripts to use
###
window.aboutJS = aboutJS
