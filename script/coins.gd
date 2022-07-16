extends Area2D
signal coin_collected


func _on_coins_body_entered(body):
	#animation play
	$AnimationPlayer.play("coin_jump")
	#animation speed
	$AnimationPlayer.playback_speed = 2
	#send a signal 
	emit_signal("coin_collected")
	#play a song
	$coins_collected.play()


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
