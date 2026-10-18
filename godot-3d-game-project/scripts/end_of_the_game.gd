extends Node2D

var button_type = null
func _ready():
	# Unlock and show the mouse cursor
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)



func _on_backtomenu_pressed() -> void:
	button_type = "backtomenu"
	$Fade_transition.show()
	$Fade_transition/Fade_timer.start()
	$Fade_transition/AnimationPlayer.play("Fade_In")

func _on_fade_timer_timeout() -> void:
	if button_type == "backtomenu":
		get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
	elif button_type == "backtomenu":
		get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
