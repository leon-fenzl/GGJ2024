extends Node
@onready var player := $".."
@onready var aTree := $"../AnimTree"
@onready var walk := Vector2.ZERO

func _physics_process(delta):
	Walk()
	AnimationController()
	player.velocity = lerp(player.velocity,walk*player.speed*delta,10*delta)
func Walk():
	walk = Input.get_vector("left","right","forward","back").normalized()
func AnimationController():
	if player.velocity == Vector2.ZERO:
		pass
	else:
		aTree.set("parameters/WalkBS/blend_position",walk)
