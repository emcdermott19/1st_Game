### Player.gd

extends CharacterBody2D

# player movement variables
@export var speed = 300
@export var gravity = 600
@export var jump_height = -500

# movement and physics
func _physics_process(delta):
	# vertical movement velocity (down)
	velocity.y += gravity * delta
	# horizontal movement processing (left, right)
	horizontal_movement()
	# applies movement
	move_and_slide() 
	
# horizontal movement calculation
func horizontal_movement():
	# if keys are pressed it will return 1 for ui_right, -1 for ui_left, and 0 for neither
	var horizontal_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	# horizontal velocity which moves player left or right based on input
	velocity.x = horizontal_input * speed

# singular input captures
func _input(event):
	# on jump
	if event.is_action_pressed("ui_jump") and is_on_floor():
		velocity.y = jump_height
		# flip the sprite based on the direciton pressed
	if Input.is_action_pressed("ui_left"):
		$Sprite2D.flip_h = true
	if Input.is_action_pressed("ui_right"):
		$Sprite2D.flip_h = false
