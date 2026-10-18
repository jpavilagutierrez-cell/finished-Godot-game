extends Camera3D


@export var player: CharacterBody3D # Drag your player node here in the inspector

func _process(delta):
	if player:
		# Move the camera strictly to the player's X and Y coordinates
		global_position.x = player.global_position.x
		global_position.z = player.global_position.z
