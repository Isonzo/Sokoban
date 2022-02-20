extends Control


func _ready():
	$Title/AnimationPlayer.play("type")
	


func _on_Button_pressed():
	get_tree().change_scene("res://levels/level_1.tscn")
