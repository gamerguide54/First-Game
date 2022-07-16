extends Control

signal coin_collected
var coins = 0

func _ready():
	pass
	#change the text to a number 
	$coins.text = String(coins)


	
	


func _on_coin_collected():
	coins = coins + 1 
	_ready()
	
