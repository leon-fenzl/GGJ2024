extends Node2D
@export var rangeValue:int
@export var time:float
@onready var mob = preload("res://chars/ai_mob.tscn")
@export var player : Node2D
@onready var instance
func _ready():
	$Timer.set_wait_time(time)
func _on_timer_timeout():
	instance = mob.instantiate()
	instance.position = self.position + Vector2(randi_range(rangeValue*-1,rangeValue),randi_range(rangeValue*-1,rangeValue))
	instance.target = player
	get_node("..").add_child(instance)
