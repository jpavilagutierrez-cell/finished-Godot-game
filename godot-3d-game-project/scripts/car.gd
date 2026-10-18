extends CharacterBody3D

var speed = 0.0

const GRAVITY = -300
const MAX_SPEED = 20.0
const ACCELERATION = 12.0
const BRAKE = 16.0
const FRICTION = 6.0
const TURN_SPEED = 2.5

@onready var camera = $Camera3D

var first_person = false

# Camera positions
var third_person_pos = Vector3(0, 3, 6)
var first_person_pos = Vector3(-0.071, -0.906, -3.815)

func _physics_process(delta):

	# Restart
	if Input.is_action_pressed("restart"):
		get_tree().change_scene_to_file("res://scenes/world.tscn")

	# Toggle camera
	if Input.is_action_just_pressed("toggle_camera"):
		toggle_camera()

	if is_on_floor() == false:
		velocity.y += GRAVITY * delta
		
	# Forward / reverse movement
	if Input.is_action_pressed("up"):
		speed += ACCELERATION * delta
	elif Input.is_action_pressed("down"):
		speed -= BRAKE * delta
	else:
		speed = move_toward(speed, 0, FRICTION * delta)

	speed = clamp(speed, -MAX_SPEED/2, MAX_SPEED)

	# Turning
	var turn_input = Input.get_axis("left", "right")

	if abs(speed) > 0.1:
		rotate_y(-turn_input * TURN_SPEED * delta)

	# Move forward based on car direction
	var forward = -transform.basis.z
	velocity.x = forward.x * speed
	velocity.z = forward.z * speed

	move_and_slide()


func toggle_camera():
	first_person = !first_person

	if first_person:
		camera.position = first_person_pos
	else:
		camera.position = third_person_pos
