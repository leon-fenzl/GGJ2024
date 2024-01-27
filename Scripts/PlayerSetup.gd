extends CharacterBody2D

@export var speed = 300.0
@export var zoom := Vector2.ZERO
@onready var spr := $Directions
@onready var cam := $Camera2D
func _ready():
	cam.zoom = zoom
func _physics_process(delta):
	move_and_slide()
