extends Area2D


func _ready():
	$AnimationPlayer.play("saw")
	#animation speed
	$AnimationPlayer.playback_speed = 10
