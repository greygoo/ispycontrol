$(document).ready(function() {
  $(".control").click(function(e){
    var command=$(this).data("cmd")
    $.post( "control", { command: command } )
  })
})
