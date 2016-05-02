$ ->
  #Game vars and function for initialization
  Game =
    data:
      turns: 0
      gameOver: false

    initialize: ->
      @data.gameOver = false
      @.player()
      @.prepareBoard()
      @.ifClick()

    #Preps for a new game
    prepareBoard: ->
      $("form").hide()
      Game.data.turns = 0
      $("#board").empty()
      $("<div>", {class: "square", id: square}).appendTo("#board") for square in [0..8]

    #Takes submited palyer name (and dose nothing with it)
    player: ->
      @data.player1 = $("input[name='player']").val()

    #Handles player moves (clicks)
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

    #generates ai move (random possible move)
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

    #If the game is not over Ai makes a move
    checkOver: ->
      if Game.data.turns < 8
        Game.aiMove()
      else
      	$('#msg2').html("Tie Game")

    #Checkes if anyone has won
    checkWin: ->
      postitions = [0..8]
      posCheck = []
      playedCount = 0
      for p in postitions by 1
      	posCheck.push p
      first = posCheck.slice(0, 2)
      second = posCheck.slice(3, 5)
      third = posCheck.slice(6, 8)
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

    #Handles end of game
    done: ->
      $('#msg3').html("Done")
      $('#board').hide()
      $("#playform").show();

  #Handles form (but really just initilizes a new game)
  $("form").on "submit", (evt) ->
    evt.preventDefault()
    $inputs = $("input[type='text']")
    $('#board').show()
    $('#msg3').html("msg")
    Game.initialize()