extends CharacterBody2D
const SPEED = 400

func _physics_process(delta):
	#initial direction == Vector2(0,0)
	var direction = Vector2.ZERO
	
	# Handle up movement.     
	if Input.is_action_pressed("ui_up"):         
		direction.y -= direction * SPEED     
	# Handle down movement.     
	if Input.is_action_pressed("ui_down"):         
		direction.y += direction * SPEED     
	
		#shorter way to state it
	#var direction = Input.get_axis("ui_up", "ui_down")     
	#velocity.y = direction * SPEED      
	
	move_and_slide()

