extends CharacterBody2D

class_name Ball
#speed and direction initialized at zero
var speed = 0
var direction = Vector2.ZERO
#boolean state variable - "to know if something is happening"
var is_moving = false
@onready var timer = get_parent().find_child("RestartTimer")


#what we want the ball to do once its loaded
func _ready():
	#godot function that enerates new seed for randi() -> IMPORTANT
	randomize()
	reset_ball()
	
func reset_ball():
	timer.stop()
	speed = 600
	#horizontal direction chosen randomly
	direction.x = [-1,1][randi() % 2]
	#vertical direction chosen randomly -> 0.8 = diagonal direction
	direction.y = [-0.8,0.8][randi() % 2]
	#if all this is happening then
	is_moving = true
	
#the function that executes itself at every frame, giving us the living effect
func _physics_process(delta):	#delta gives us the % of time happening between frames
		if is_moving:
			var collide = move_and_collide(speed * direction * delta)
			if collide:
				direction = direction.bounce(collide.get_normal())
				$AudioCollision.play()
	

func _on_restart_timer_timeout():
	reset_ball()
