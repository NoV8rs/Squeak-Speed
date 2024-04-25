extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300
@onready var sprite_2d = $Sprite2D

func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
	
	if Input.is_action_just_pressed("jump") && is_on_floor():
		velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("movement_left", "movement_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
	print(velocity)
	
	# Sprite animations for left and right movement, fliping the Player
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
