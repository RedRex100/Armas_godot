extends Node2D

const OBJETO = preload("res://Cenas/Bala.tscn")

@onready var spawn_point = $M

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("spawnou")
		spawn_objeto()

func spawn_objeto():
	if spawn_point == null:
		print("SpawnPoint não encontrado!")
		return

	var obj = OBJETO.instantiate()
	obj.global_position = spawn_point.global_position
	add_child(obj)
