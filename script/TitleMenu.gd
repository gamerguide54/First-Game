extends Control

func _on_quit_pressed():
	#Play a song an Go to level1
	$PressSong.play()
	yield($PressSong, "finished") 
	get_tree().quit()


func _on_play_pressed():
	#Play a song an Exit the game
	$PressSong.play()
	yield($PressSong, "finished")
	get_tree().change_scene("res://Levels/Level1.tscn")
	
