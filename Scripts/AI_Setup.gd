extends CharacterBody2D

@export var speed := 300.0
@export var target : Node2D
@onready var onGrab := false
@onready var onLaunch := false
@onready var launchDir := Vector2.ZERO
@onready var holdPos := Vector2.ZERO
@onready var ctrlr := $AICtrlr
enum STATES{WALKING, GRABBED, LAUNCHED}
@onready var state
func _ready():
	state = 0
func _physics_process(delta):
	match state:
		STATES.WALKING:
			ctrlr.MoveToTarget(delta)
			velocity = ctrlr.direction*speed*delta
		STATES.GRABBED:
			velocity = Vector2.ZERO
			global_position = lerp(global_position,Vector2(target.position.x, target.position.y-20),10*delta)
			set_collision_mask_value(1,false)
		STATES.LAUNCHED:
			if launchDir.length()> 50:
				velocity += launchDir*50*delta
				target.aiTarget = null
				onLaunch = true
			else: state = 0
	move_and_slide()
