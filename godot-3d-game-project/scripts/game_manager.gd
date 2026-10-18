extends Node
class_name GameManager

var time = 0.0
var stopped = false
@onready var timer = $timer

func _process(delta):
	if stopped:
		return
	time += delta
	timer.text = time_to_string()

func reset():
	time = 0.0
	
func time_to_string() -> String:
	var msec = fmod(time, 1) * 1000
	var sec = fmod(time, 60)
	var min = time / 60
	var format_string = "%02d : %02d : %02d"
	var actual_string = format_string % [min, sec, msec]
	return actual_string
