(function() {
  var client_height, header_cover, header_cover_height, header_top;

  header_cover = window.document.getElementById("cover");

  client_height = window.innerHeight || document.documentElement.clientHeight;

  header_cover_height = header_cover.getBoundingClientRect().height;

  if (header_cover_height < client_height) {
    header_top = header_cover.getBoundingClientRect().top;
    if (header_top > 0) {
      header_cover_height = client_height - header_top;
      header_cover.style.height = header_cover_height + "px";
    }
  }

}).call(this);
