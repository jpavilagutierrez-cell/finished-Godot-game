extends CharacterBody3D

@onready var player: CharacterBody3D = $"../../player"


const SPEED = 3.5
var gravity = 9.8
@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D

	
	# Option B: Delete the player from the world instead (uncomment below if preferred)
	# queue_free() 
#called when the node enters the scene tree for the first time.
func _ready():
	pass

	
#called every frame. 'delta' is the elasped time since the previous frame.
func _process(delta):

		# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	velocity = Vector3.ZERO
	nav_agent.set_target_position(player.global_transform.origin)
	
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
	var player_zombie_diff = global_position.x - player.global_position.x
	if player_zombie_diff >= 0 :
		rotation.y = -360
	else:
		rotation.y = 360
	
	move_and_slide()
