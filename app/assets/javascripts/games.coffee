$ ->
  Game =
    data:
      turns: 0
      gameOver: false

    initialize: ->
      @data.gameOver = false
      @.player()
      @.prepareBoard()
      @.ifClick()

    prepareBoard: ->
      $("form").hide()
      Game.data.turns = 0
      $("#board").empty()
      $("<div>", {class: "square", id: square}).appendTo("#board") for square in [0..8]

    player: ->
      @data.player1 = $("input[name='player']").val()

    ifClick: ->
      $(".square").click ->
        if $(@).hasClass("square")
          $(@).html("X").addClass("xmove").removeClass("square")
          Game.data.turns++
          $('#msg').html(Game.data.turns)
          Game.checkWin()
          if Game.data.gameOver == false
            Game.checkOver()
          else
          	Game.done()

    aiMove: ->
      if Game.data.turns < 8
        posmove = Math.floor(Math.random() * 8)
        if $('#' + posmove).hasClass("xmove") or $('#' + posmove).hasClass("omove")
      	  @.aiMove()
        else
      	  $('#' + posmove).html("O").addClass("omove").removeClass("square")
      	  Game.data.turns++
      	  Game.checkWin()
      	  if Game.data.gameOver == true
            Game.done()

    checkOver: ->
      if Game.data.turns < 8
        Game.aiMove()
      else
      	$('#msg2').html("Tie Game")

    checkWin: ->
      if $("#0").hasClass("xmove") and $("#1").hasClass("xmove") and $("#2").hasClass("xmove")
      	$('#msg2').html("X Win") and Game.data.gameOver = true
      else if $("#3").hasClass("xmove") and $("#4").hasClass("xmove") and $("#5").hasClass("xmove")
      	$('#msg2').html("X Win") and Game.data.gameOver = true
      else if $("#6").hasClass("xmove") and $("#7").hasClass("xmove") and $("#8").hasClass("xmove")
      	$('#msg2').html("X Win") and Game.data.gameOver = true
      else if $("#0").hasClass("xmove") and $("#3").hasClass("xmove") and $("#6").hasClass("xmove")
      	$('#msg2').html("X Win") and Game.data.gameOver = true
      else if $("#1").hasClass("xmove") and $("#4").hasClass("xmove") and $("#7").hasClass("xmove")
      	$('#msg2').html("X Win") and Game.data.gameOver = true
      else if $("#2").hasClass("xmove") and $("#5").hasClass("xmove") and $("#8").hasClass("xmove")
      	$('#msg2').html("X Win") and Game.data.gameOver = true
      else if $("#0").hasClass("xmove") and $("#4").hasClass("xmove") and $("#8").hasClass("xmove")
      	$('#msg2').html("X Win") and Game.data.gameOver = true
      else if $("#2").hasClass("xmove") and $("#4").hasClass("xmove") and $("#6").hasClass("xmove")
      	$('#msg2').html("X Win") and Game.data.gameOver = true
      else if $("#0").hasClass("omove") and $("#1").hasClass("omove") and $("#2").hasClass("omove")
      	$('#msg2').html("O Win") and Game.data.gameOver = true
      else if $("#3").hasClass("omove") and $("#4").hasClass("omove") and $("#5").hasClass("omove")
      	$('#msg2').html("O Win") and Game.data.gameOver = true
      else if $("#6").hasClass("omove") and $("#7").hasClass("omove") and $("#8").hasClass("omove")
      	$('#msg2').html("O Win") and Game.data.gameOver = true
      else if $("#0").hasClass("omove") and $("#3").hasClass("omove") and $("#6").hasClass("omove")
      	$('#msg2').html("O Win") and Game.data.gameOver = true
      else if $("#1").hasClass("omove") and $("#4").hasClass("omove") and $("#7").hasClass("omove")
      	$('#msg2').html("O Win") and Game.data.gameOver = true
      else if $("#2").hasClass("omove") and $("#5").hasClass("omove") and $("#8").hasClass("omove")
      	$('#msg2').html("O Win") and Game.data.gameOver = true
      else if $("#0").hasClass("omove") and $("#4").hasClass("omove") and $("#8").hasClass("omove")
      	$('#msg2').html("O Win") and Game.data.gameOver = true
      else if $("#2").hasClass("omove") and $("#4").hasClass("omove") and $("#6").hasClass("omove")
      	$('#msg2').html("O Win") and Game.data.gameOver = true
      else
        $('#msg2').html("Game On")

    done: ->
      $('#msg3').html("Done")
      $('#board').hide()
      $("#playform").show();

  $("form").on "submit", (evt) ->
    evt.preventDefault()
    $inputs = $("input[type='text']")
    $('#board').show()
    $('#msg3').html("msg")
    Game.initialize()