#
# stretch the height of header#cover to browser inner height
#

header_cover = window.document.getElementById("cover")
client_height = window.innerHeight or document.documentElement.clientHeight
header_cover_height = header_cover.getBoundingClientRect().height

# strech only if header#cover is shorter than browser inner height
if header_cover_height < client_height
    header_top = header_cover.getBoundingClientRect().top

    if header_top > 0
        header_cover_height = client_height - header_top
        header_cover.style.height = header_cover_height + "px"
