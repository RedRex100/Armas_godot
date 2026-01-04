extends CharacterBody2D

@onready var col_em_pe = $CollisionPolygon2D_EmPe
@onready var col_agachado = $CollisionPolygon2D_Agachado
@onready var triangulo_em_pe = $Triangulo_EmPe
@onready var triangulo_agachado = $Triangulo_Agachado

var speed := 200  # velocidade do personagem
var h_speed = 0
var permissao = false
func _physics_process(delta):
	position.x += speed * delta * (Input.get_action_strength("ui_right")- Input.get_action_strength("ui_left"))
	if is_on_floor():
		h_speed = (550 - 784 * delta) * Input.get_action_strength("ui_up")
	else:
		h_speed += -784 * delta
	position.y += h_speed * delta * -1
	if Input.is_action_pressed("ui_down"):
		col_em_pe.disabled = true
		col_agachado.disabled = false
		triangulo_em_pe.visible = false
		triangulo_agachado.visible = true

	else:
		col_em_pe.disabled = false
		col_agachado.disabled = true
		triangulo_em_pe.visible = true
		triangulo_agachado.visible = false
	move_and_slide()
