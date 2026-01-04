extends Node2D

const OBJETO = preload("res://Cenas/Bala.tscn")

@onready var spawn_point = %Marcador

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("spawnou")
		spawn_objeto()
	if Input.is_action_just_pressed("ui_cancel"):
		for child in get_children():
			if child.name == "PNG_da_arma" or child.name == "Marcador":
				pass
			else:
				print(child.name)
				child.queue_free()

func spawn_objeto():
	var obj = OBJETO.instantiate()
	obj.position = spawn_point.position
	add_child(obj)

	print("Bala criada:", obj, " em ", obj.global_position)
	
