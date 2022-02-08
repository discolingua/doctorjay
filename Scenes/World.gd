class_name GameWorld
extends Node2D

var timer = 0

func _process(_delta):
	if Input.is_key_pressed(KEY_R):
		var _r = get_tree().reload_current_scene()



func _on_Penalty_Zone_body_entered(_this):
	if _this.get_name() == "Player":
		timer += 5
		print(timer)
		$UI/TimerText.bbcode_text = str(timer)

		
