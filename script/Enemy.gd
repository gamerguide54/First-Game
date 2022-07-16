extends KinematicBody2D

#variable (use to store data)
var velocity = Vector2(0,0)
export var direction = -1
export var speed = 50
export var detects_cliffs = true 


#Any code under this line of code will run ones
func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true 
	$floor.position.x = $CollisionShape2D.shape.get_extents().x * direction




#Any code under this line runs over and over 30 times per sec 
func _physics_process(delta):
	
	#flip the enemy when it get to a wall or to a end of a floor  
	if is_on_wall() or not $floor.is_colliding() and is_on_floor() and detects_cliffs:
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor.position.x = $CollisionShape2D.shape.get_extents().x * direction
		
		
	
	#helps the enemy drop down on the floor
	velocity.y += 20
	
	
	#the direction the enemy is going 
	if direction == -1:
		velocity.x = -speed 
		
		
	elif direction == 1:
		velocity.x = speed

	
	
	#use to move the enemy
	velocity = move_and_slide(velocity,Vector2.UP)
	
	
	
	
	
	
	
#when the player hit the top of the enemy
func _on_Topchecker_body_entered(body):
	$AnimatedSprite.play("dad")
	#speed = 0
	set_collision_layer_bit(4, false)
	set_collision_mask_bit(0, false)
	$Topchecker.set_collision_layer_bit(0, false)
	$Topchecker.set_collision_mask_bit(0, false)
	$sideschecker.set_collision_mask_bit(0, false)
	set_modulate(Color(0,0,0,0))
	#start a timer
	$Timer.start()
	#this sends data to the player
	body.hit()
	

#when the timer times out
func _on_Timer_timeout():
	#klled the enemy
	#queue_free()
	
	set_collision_layer_bit(4, true)
	set_collision_mask_bit(0, true)
	$Topchecker.set_collision_layer_bit(0, true)
	$Topchecker.set_collision_mask_bit(0, true)
	$sideschecker.set_collision_mask_bit(0, true)
	#set back the enemy color
	set_modulate(Color(1,1,1,1))
	#play the walk Animated
	$AnimatedSprite.play("walk")
	




#when the player hit the side of the enemy
func _on_sideschecker_body_entered(body):
	#sends data to the player with the enemy position
	body.sidehit(position.x)
	
	

