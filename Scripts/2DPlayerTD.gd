extends CharacterBody2D

@export var speed = 300.0
@export var zoom := Vector2.ZERO
@onready var walk := Vector2.ZERO
@onready var spr := $SprPlayer
@onready var anim := $SprAnimation

func _ready():
	$Camera2D.zoom = zoom
func _physics_process(delta):
	Walk()
	velocity = lerp(velocity,walk*speed*delta,10*delta)
	move_and_slide()
func Walk():
	walk = Input.get_vector("left","right","forward","back").normalized()
	new_animation
