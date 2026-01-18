extends Area3D

## Choose "Add position on teleport" if you want a more seamless effect.
## If you want to teleport to a specific position, choose "Set position on teleport".
## Same for the "destination teleporter position" except, in this case, only destination_teleporter is used.
@export_enum("Add destination position on teleport", 
			"Set destination position on teleport", 
			"Add destination teleporter position on teleport",
			"Set destination teleporter position on teleport") var on_teleport: int
## NOT in any way related to the destination_teleporter var.
## Use if you want to teleport to a position.
@export var destination_position: Vector3
## NOT in any way related to the destination_position var.
## Use if you want to teleport to a specific teleporter.
@export var destination_teleporter: Area3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func teleport(player) -> void:
	assert(destination_teleporter == null and on_teleport == 2 or 3,
			"'destination_teleporter' is null!\n
			Set 'destination_teleporter' or use 'destination_position' instead by setting 'on_teleport' to either 0 or 1.")
	
	match on_teleport:
		0: player.position = destination_position - position; 
		1: player.position = destination_position;
		2: player.global_position = destination_teleporter.global_position - position; 
		3: player.global_position = destination_teleporter.global_position;
	
	if destination_teleporter != null:
		destination_teleporter.stand_by(player)

func stand_by(player):
	await _on_body_exited(player) 

func _on_body_entered(body: Node3D) -> void:
	if body:
		teleport(body)

func _on_body_exited(body: Node3D) -> void:
	pass
