$(document).ready(function() {
  $(".command").click(function(e){
    var command=$(this).data("cmd")
    $.post( "commands", { command: command } )
  })
})
