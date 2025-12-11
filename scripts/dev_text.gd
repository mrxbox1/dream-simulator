# Thanks to JD-86 for creating a YouTube tutorial that I followed to create a script class for this entity.
# func_godot unfortunately does not provide many resources on scripting in its manual...
@tool
extends Label3D

@export var entProperties: Dictionary = {
	"text": "INSERT TEXT HERE",
	"size": 6
}

func _func_godot_apply_properties(properties: Dictionary):
	entProperties = properties

func _ready() -> void:
	text = entProperties["text"]
	font_size = entProperties["size"]
