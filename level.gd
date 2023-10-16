extends Node2D



func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	$Ball.reset_ball()


func _on_player_arc_body_entered(body):
	_restart_game()


func _on_oponent_arc_body_entered(body):
	_restart_game()
