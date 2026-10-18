extends Node2D
var button_type = null

func _on_exit_pressed() -> void:
	button_type = "exit"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_In")
	
func _on_fade_timer_timeout() -> void:
	if button_type == "exit":
		get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
	elif button_type == "exit":
		get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
