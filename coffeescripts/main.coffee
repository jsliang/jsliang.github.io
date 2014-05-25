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
                header_top = cover.offsetTop

                if header_top > 0
                    cover_style_height = client_height - header_top
                    cover.style.height = cover_style_height + "px"

    setupNavMenu: (nav_ul_selector, heading_selector) ->
        ###
        install navigation menu based on nav_ul_selector & heading_selector

        Usage example:
        <ul id="navmenu">
            <li class="trigger">
                <i class='fa fa-bars'></i>
            </li>
        </ul>
        <div class="section"><h2>Heading A</h2></div>
        <div class="section"><h2>Heading B</h2></div>
        <div class="section"><h2>Heading C</h2></div>
        <script>
        window.aboutJS.setupNavMenu("#navmenu", ".section > h2");
        </script>
        ###
        trigger_button_selector = ".trigger"
        nav_ul = document.querySelector(nav_ul_selector)
        if nav_ul?
            trigger_button = nav_ul.querySelector(trigger_button_selector)
            trigger_button.onclick = () ->
                genNavMenu(nav_ul_selector, heading_selector)

        genNavMenu = (nav_ul_selector, heading_selector) ->
            setupHeadings = (heading_selector) ->
                stripHTMLTags = (orig_str) ->
                    return orig_str.replace(/(<([^>]+)>)/ig, "").trim()
                stripWhitespace = (orig_str) ->
                    return orig_str.replace(/(\s)/ig, "").trim()

                headings_info = []

                headings = document.querySelectorAll(heading_selector)

                for heading in headings
                    heading_text = stripHTMLTags(heading.innerHTML)

                    # add id to each heading for anchoring
                    heading.id = "nav" + stripWhitespace(heading_text)

                    entry = 
                        id: heading.id
                        text: heading_text
                    
                    headings_info.push(entry)

                return headings_info

            generated_class = "generated"

            if nav_ul?
                headings_info = setupHeadings(heading_selector)
                if headings_info.length > 0
                    hide_generated_li_nodes = () ->
                        trigger_button.style.display = "inherit";

                        for generated_li in document.querySelectorAll("." + generated_class)
                            console.log generated_li
                            generated_li.parentNode.removeChild(generated_li)

                    gen_home_li_node = (nav_ul) ->
                        home_li_node = document.createElement("li")

                        text_node = document.createTextNode("Home")
                        home_li_node.appendChild(text_node)
                        home_li_node.setAttribute("class", generated_class)

                        home_li_node.onclick = () ->
                            window.scrollTo(0, 0)
                            hide_generated_li_nodes()

                        nav_ul.appendChild(home_li_node)

                    gen_heading_li_node = (nav_ul, heading) ->
                        hid = heading.id
                        htext = heading.text

                        li_node = document.createElement("li")
                        li_node.headingid = hid

                        li_node.setAttribute("class", generated_class)

                        text_node = document.createTextNode(htext)
                        li_node.appendChild(text_node)

                        li_node.onclick = () ->
                            heading_element = document.getElementById(this.headingid)
                            heading_top = heading_element.parentNode.offsetTop
                            window.scrollTo(0, heading_top)

                            hide_generated_li_nodes()

                        nav_ul.appendChild(li_node)

                    gen_home_li_node(nav_ul)

                    for heading in headings_info
                        gen_heading_li_node(nav_ul, heading)

                    trigger_button.style.display = "none";


###
top-level function for other scripts to use
###
window.aboutJS = aboutJS
