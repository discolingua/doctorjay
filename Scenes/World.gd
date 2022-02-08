class_name GameWorld
extends Node2D

var timer = 0
var penalty = 0
var basket : bool = false

onready var startTime : float = OS.get_unix_time()

func _process(_delta):
	if Input.is_key_pressed(KEY_R):
		var _r = get_tree().reload_current_scene()
	var _nowTime : float = OS.get_unix_time()
	var _elapsed : float = _nowTime - startTime + penalty
	$UI/TimerText.bbcode_text = str(_elapsed)


func _on_Penalty_Zone_body_entered(_this):
	if _this.get_name() == "Player":
		penalty += 5.0
		$UI/TimerText.bbcode_text = str(timer)

func _on_Basket_body_entered(_this):
	if _this.get_name() == "Ball":
		if not basket:
			basket = true
			var _nowTime : float = OS.get_unix_time()
			var _elapsed : float = _nowTime - startTime + penalty 
			$UI/MessageText.bbcode_text = str("YOUR TIME WAS ", _elapsed)

