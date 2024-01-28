extends CharacterBody2D

@export var speed := 300.0
@export var target : Node2D
@export var onGrab := false
@export var onLaunch := false
@onready var launchDir := Vector2.ZERO
@onready var holdPos := Vector2.ZERO

func _physics_process(delta):
	Grabbed()
	Launch(delta)
	move_and_slide()
func Grabbed():
	if onGrab == true:
		position = holdPos
		set_collision_mask_value(1,false)
func Launch(DELTA:float):
	if onLaunch == true:
		velocity += launchDir*10*DELTA
