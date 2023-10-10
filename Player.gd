extends CharacterBody2D



func _physics_process(delta):
	#initial direction == Vector2(0,0)
	var direction = Vector2.ZERO
	var speed = 400
	#keyboard up|down pressing events listening
	if Input.is_action_pressed("ui_up"):
		direction.y -=1	
	if Input.is_action_pressed("ui_down"):
		direction.y +=1                                         
		
	move_and_slide(speed * direction)

