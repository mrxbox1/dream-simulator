extends Area3D

@export var target_node: Node
@export_enum("Enable target", "Disable target", "Toggle target", "Destroy target (and self)") var signal_sent: int

func trigger():
	match signal_sent:
		0: target_node.enable()
		1: target_node.disable()
		2: target_node.toggle()
		3: target_node.queue_free(); self.queue_free()
