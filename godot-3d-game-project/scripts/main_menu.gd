extends Node2D

var button_type = null


func _on_start_pressed() -> void:
	button_type = "start"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_In")

func _on_controls_pressed() -> void:
	button_type = "controls"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_In")

func _on_fade_timer_timeout() -> void:
	if button_type == "start":
		get_tree().change_scene_to_file("res://scenes/world.tscn")
	elif button_type == "controls":
		get_tree().change_scene_to_file("res://scenes/controls.tscn")
	elif button_type == "exit":
		get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")		
