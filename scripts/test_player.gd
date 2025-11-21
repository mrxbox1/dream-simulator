extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY = 0.01

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("ui_left"):
		rotate_y(5 * delta)
	if Input.is_action_pressed("ui_right"):
		rotate_y(-5 * delta)
	
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED: Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else: Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

# Thank you to rbarongr on GitHub for creating a First Person Controller which I pinched some code from, as you can see below.
# You can see their repository here: https://github.com/rbarongr/GodotFirstPersonController/tree/main
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		#print(event.relative)
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		$Camera3D.rotation.x = clamp(
			$Camera3D.rotation.x - event.relative.y * MOUSE_SENSITIVITY, 
			-1.5, 1.5
		)
