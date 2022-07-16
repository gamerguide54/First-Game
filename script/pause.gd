extends Control


func _on_UNPASE_pressed():
	#play a song
	$PressSong.play()
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	


func _on_Paused_pressed():
	#play a song
	$PressSong.play()
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	


func _on_QUIT_pressed():
	#play a song
	$PressSong.play()
	yield($PressSong, "finished")
	get_tree().paused = not get_tree().paused
	#change the screne
	get_tree().change_scene("res://Scenes/TitleMenu.tscn")
