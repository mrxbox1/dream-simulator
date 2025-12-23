extends Area3D

@export var target_node: Node
@export_enum("Enable target", "Disable target", "Toggle target") var signal_sent: int

func trigger():
	match signal_sent:
		0: target_node.enable()
		1: target_node.disable()
		2: target_node.toggle()
