extends Control



#coming from the player max
func _on_enemy_hid_max_remove():
	#remove 33% from lifebar
	$ProgressBar.value-=30
	#if the number is less than 1%
	if $ProgressBar.value < 1:
		print("yes")
		get_tree().change_scene("res://Scenes/DeadScreen.tscn")
	
	
	
