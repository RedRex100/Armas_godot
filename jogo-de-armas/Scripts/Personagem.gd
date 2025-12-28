extends CharacterBody2D

var speed := 200  # velocidade do personagem
var h_speed
var d = 0
var permissao = false
func _physics_process(delta):
	position.x += speed * delta * (Input.get_action_strength("ui_right")- Input.get_action_strength("ui_left"))
	print(position)
	if position.y == 0 && Input.get_action_strength("ui_up") == 1:
		permissao = true
	if permissao:
		d += delta
		h_speed = speed - d * 196
		position.y += h_speed * delta * -1
		if position.y >= 0:
			position.y = 0  
			d = 0
			permissao = false
			h_speed = 0
	move_and_slide()
