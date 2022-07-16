extends Node2D





func _on_fallzone_body_entered(body):
	#print("fallzone")
	#send to player
	body.fallzone()
	



#1
func _on_F1_body_entered(body):
	$fallingplatformers/F1/Timer.start()
	
	
#1
func _on_Timer_timeout():
	#turn of the pf visible
	$fallingplatformers/F1/pf1.visible = false
	#disabled the pf 
	$fallingplatformers/StaticBody2D/pf1.disabled = true
  

#2
func _on_F2_body_entered(body):
	$fallingplatformers/F2/Timer.start()
	
	


#2
func _on_Timer_timeout2():
	#turn of the pf visible
	$fallingplatformers/F2/pf2.visible = false
	#disabled the pf 
	$fallingplatformers/StaticBody2D/pf2.disabled = true



