$(document).ready(function() {
  $(".ffmpeg").click(function(e){
    var command=$(this).data("cmd")
    $.post( "video", { command: command } )
  })
})
