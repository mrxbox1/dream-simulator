extends Area3D

#@export var toggle: bool = false
@export var pressed: bool = false

func _on_area_entered(area: Area3D) -> void:
	if area.name == "Interaction":
		print("hey")
		if Input.is_action_just_pressed("interact"):
			pressed = !pressed
