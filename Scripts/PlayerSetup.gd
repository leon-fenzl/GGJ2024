extends CharacterBody2D

@export var speed = 300.0
@export var zoom := Vector2.ZERO
@onready var spr := $Directions
@onready var cam := $Camera2D
@onready var aiTarget :Node = null
@onready var ctrlr := $PlayerCtrlr
func _ready():
	cam.zoom = zoom
func _input(event):
	if Input.is_action_just_pressed("grab"):
		if aiTarget != null:
			aiTarget.state = 1
	if Input.is_action_just_released("grab"):
		if aiTarget != null:
			aiTarget.state = 2
			aiTarget.launchDir = velocity
			aiTarget = null
func _physics_process(delta):
	$LevitationArea.bodies
	move_and_slide()
func _on_levitation_area_body_entered(body):
	if body.is_in_group("mob"):
		if aiTarget ==null:
			aiTarget = body
			print(aiTarget)
func _on_levitation_area_body_exited(body):
	if body == aiTarget :
		if aiTarget !=null:
			aiTarget = null
			print(aiTarget)


