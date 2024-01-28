extends CharacterBody2D

@export var speed = 300.0
@export var zoom := Vector2.ZERO
@onready var spr := $Directions
@onready var cam := $Camera2D
@onready var aiTarget :Node = null
@onready var ctrlr := $PlayerCtrlr
func _ready():
	cam.zoom = zoom
func _physics_process(delta):
	if Input.is_action_pressed("grab"):
		if aiTarget != null:
			aiTarget.onGrab = true
			aiTarget.onLaunch = false
			aiTarget.holdPos =lerp(aiTarget.holdPos,Vector2(position.x, position.y-20),10*delta)
	if Input.is_action_just_released("grab"):
		if aiTarget != null:
			aiTarget.onGrab = false
			aiTarget.onLaunch = true
			aiTarget.launchDir = velocity
			aiTarget = null
	move_and_slide()
func _on_area_2d_body_entered(body):
	if body.is_in_group("mob"):
		if aiTarget ==null:
			aiTarget = body
