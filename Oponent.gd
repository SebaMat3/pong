extends CharacterBody2D

const SPEED = 600
@onready var ball = get_parent().find_child("Ball") 

func _physics_process(delta): 	 	
	velocity.y = _get_oponent_direction() * SPEED 	
	#velocity.x = 0 	 	
	
	move_and_collide(velocity * delta) 

# on every frame: evaluate vertical position difference between Ball and Oponent
# and return 3 different outputs for primary stances: Still - Go up - Go down
func _get_oponent_direction():
						# position.y == self.position.y
	if abs(ball.position.y - position.y) > 25:
		if  ball.position.y > position.y : 
			return 1 #when the oponent is lower than the ball 1 -> Go Down
		else: 
			return -1 #when the oponent is higher than the ball -1 -> Go Up
	else:
		return 0 #when the distance is shorter -> remain still
