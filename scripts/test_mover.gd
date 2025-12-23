extends StaticBody3D

@export var has_moved: bool = false

func enable():
	has_moved = true
	position.y += 1

func disable():
	has_moved = false
	position.y -= 1

func toggle():
	has_moved = !has_moved
	match has_moved:
		true: position.y += 1
		false: position.y -= 1
