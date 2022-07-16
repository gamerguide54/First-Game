extends Control


func _ready():
	pass


func _on_1_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")


func _on_2_pressed():
	get_tree().change_scene("res://Levels/Level2.tscn")
