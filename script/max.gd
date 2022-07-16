extends KinematicBody2D




#Const (use to store data but only can change by the user)
#variable (use to store data)
enum States {AIR, FLOOR, LADDER}
var states = States.AIR
var velocity = Vector2(0,0)
var on_ladder := false
export var Speed = 250
export var JumpFace = 950
export var ladder_speed = 500
const DonwFace = 30
const sidehitspeed = 1000
export var HitFace = 700

#make a signal to send to other nodes
signal remove




#Any code under this line runs over and over 30 times per sec 
func _physics_process(delta):
	print (on_ladder)
	match states:
		States.AIR:
			if is_on_floor():
				states = States.FLOOR
				continue
				
			elif ladder():
				states = States.LADDER
				continue
				
			$AnimatedSprite.play("jump")
			if Input.is_action_pressed("left"): 
				velocity.x = -Speed 
				$AnimatedSprite.flip_h = true 
				
			elif Input.is_action_pressed("right"):
				 velocity.x = Speed
				 $AnimatedSprite.flip_h = false
				
			else:
				velocity.x = lerp(velocity.x,0,0.2)

			move_fall()




		States.FLOOR:
			if not is_on_floor():
				states = States.AIR
				continue
				
			elif ladder():
				states = States.LADDER
				continue
				
			if Input.is_action_pressed("left"):
				velocity.x = -Speed 
				$AnimatedSprite.play("walk")    
				$AnimatedSprite.flip_h = true
				
			elif Input.is_action_pressed("right"):
				velocity.x = Speed
				$AnimatedSprite.play("walk")
				$AnimatedSprite.flip_h = false
				
			else:
				$AnimatedSprite.play("idle")
				velocity.x = lerp(velocity.x,0,0.2)
				
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = -JumpFace
				$jump.play()
				states = States.AIR
				
			move_fall()



		States.LADDER:
			if not on_ladder:
				states = States.FLOOR
				continue
				
			if Input.is_action_pressed("jump"):
				$AnimatedSprite.play("climp")
				velocity.y = -ladder_speed

			else:
				$AnimatedSprite.stop()
				
			velocity = move_and_slide(velocity,Vector2.UP)






func ladder() -> bool:
	if on_ladder and (Input.is_action_pressed("jump")):
		return true
		
	else:
		return false



func move_fall():
	velocity.y = velocity.y + DonwFace
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
	
#coming from the endpint
func max_entered():
	Input.action_release("left")
	Input.action_release("right")
	$Timer3.start()



#coming from the enemy topchecker 	
func hit():
	#jumpup
	velocity.y = -HitFace 



#coming from the fallzone
func fallzone():
	#jumpup
	velocity.y = -HitFace
	#change the player color
	set_modulate(Color(1,0.3,0.3,0.3))
	$Timer2.start()



#coming from the enemy with enemy position
func sidehit(var enemyposition):
	
	#if max position is less and enemy position
	if position.x < enemyposition:
		velocity.x = -sidehitspeed
		set_modulate(Color(1,0.3,0.3,0.3))
		$Timer.start()
		#send a signal to the progressbar
		emit_signal("remove")
	
	
		#if max position is greaterand enemy position
	elif position.x > enemyposition:
		velocity.x = sidehitspeed
		set_modulate(Color(1,0.3,0.3,0.3))
		$Timer.start()
		#send a signal to the progressbar
		emit_signal("remove")



	#stop the user input
	Input.action_release("left")
	Input.action_release("right")



#when timer runs out
func _on_Timer_timeout():
	#set back the color 
	set_modulate(Color(1,1,1,1))
	
	
#when timer runs out
func _on_Timer2_timeout():
	get_tree().change_scene("res://Scenes/DeadScreen.tscn")



func _on_Timer3_timeout():
	get_tree().change_scene("res://Scenes/WinScreen.tscn")


func add_coin():
	pass
	
	




func _on_ladder_body_entered(body):
	on_ladder = true
	

func _on_ladder_body_exited(body):
	on_ladder = false
