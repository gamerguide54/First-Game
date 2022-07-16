extends Control


func _on_Retrey_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")
	
	
func _on_Main_Menu_pressed():
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")
