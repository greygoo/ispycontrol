$(document).ready(function() {
  $(".command").mousedown(function(e){
    var command=$(this).data("cmd")
    $.post( "commands", { command: command } )
  })

  $(".command").mouseup(function(e){
    $.post( "commands", { command: "move_stop" } )
  })
})
