extends CharacterBody2D

@export var speed := 300.0
@export var target : Node2D

func _physics_process(delta):
	move_and_slide()
