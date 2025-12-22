@tool

@export var entProperties: Dictionary = {
	"target": "INSERT TARGET ENTITY HERE"
}

func _func_godot_apply_properties(properties: Dictionary):
	entProperties = properties

func _ready() -> void:
	var target = entProperties["target"]
