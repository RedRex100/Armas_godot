extends CharacterBody2D

var speed := 200  # velocidade do personagem
var accelerate = 9.8 
var d

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	var global = to_global(input_vector)
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if global.y == 0:
		pass
	if global.y == 0 && Input.get_action_strength("ui_up") == 1:
		pass
	input_vector = input_vector.normalized()

	velocity = input_vector * speed
	move_and_slide()
