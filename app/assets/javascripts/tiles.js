  //load color picker
  $(document).ready(function(){
    $(".colors").minicolors({
      position: 'top right'
    });
  })

  //tiles on select add/remove class
  function toggleClass(e){
    if ($(e).hasClass("selected")){
      $(e).removeClass("selected");
      alert("Tile unselected");
    }
    else{
      $(e).addClass("selected");
      alert("Tile selected");
    }
  }

  //Update colors on selecting of Tiles
  function updateTileColors(){
    if ($(".selected").size() == 0){
      alert("Please select a square!")
    }
    else{
      selectedColor = $(".colors").val();
      selectedTiles = []
      $(".selected").map(function() {
        $(this).css("background-color",selectedColor);
        selectedTiles.push($( this ).attr("id"))
      });
      $.ajax({
        type: "POST",
        url: "/homes/update_tile_color",
        data: {tiles: selectedTiles.join(","),color_code: selectedColor}
      });
    }
  }

  //Reload Tiles
  function reloadTile(){
    if ($(".selected").size() == 0){
      $.ajax({
        type: "get",
        url: "/homes/reload_tiles"
      });
    }
  }

  window.setInterval(reloadTile,8000);