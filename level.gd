extends Node2D

var playerScore = 0
var oponentScore = 0

func _ready():
	_restart_game()

func _process(delta):
	$PlayerCounter.text = str(playerScore)
	$OponentCounter.text = str(oponentScore)

func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	#$Ball.reset_ball()
	$RestartTimer.start()

func _on_player_arc_body_entered(body):
	if body is Ball:
		#add a point to the OponentCounter
		oponentScore += 1
		_restart_game()


func _on_oponent_arc_body_entered(body):
	if body is Ball:
		#add a point to the PlayerCounter
		playerScore += 1
		_restart_game()
