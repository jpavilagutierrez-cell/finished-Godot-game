# Assign your Player node in the inspector
@export var player_target: Node
@export var test : Node
# Fixed height above the player level map
@export var height_offset: float = 40.0 

# Toggle whether the map rotates with the player's view camera
@export var rotate_with_player: bool = true 
@export var main_camera: Camera3D 

func _ready() -> void:
	rotation_degrees = Vector3(-90, 0, 0) 
	
	if not player_target:
		push_error("Minimap Error: Please assign a player target in the Inspector!")

func _process(_delta: float) -> void:
	if not player_target:
		return
		
	# 1. Track player position on X and Z axes, keeping fixed Y height
	global_position = Vector3(
		player_target.global_position.x,
		player_target.global_position.y + height_offset,
		player_target.global_position.z
		)
	
	# 2. Rotate the map matching the camera view if enabled
	if rotate_with_player and main_camera:
		global_rotation.y = main_camera.global_rotation.y
	else:
		global_rotation.y = 0 
