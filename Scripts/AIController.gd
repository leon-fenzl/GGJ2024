extends Node
@export var speed:=500.0
@onready var ai := $".."

@onready var pointInPath:Vector2
@onready var direction:Vector2
@onready var distanceToPlayer:=Vector2.ZERO

@onready var col : KinematicCollision3D
@onready var agent := $"../NavigationAgent2D" as NavigationAgent2D
@onready var aTree := $"../AnimationTree"
var rng = RandomNumberGenerator.new()
func _ready():
	await get_tree().create_timer(0.25).timeout
	MakeNavPath()
func CalculateDistance():
	distanceToPlayer = agent.target_global_position - ai.global_position
func MakeNavPath()->void:
	agent.set_target_position(ai.target.position)
func _on_timer_timeout():
	MakeNavPath()
func MoveToTarget(DELTA:float):
	direction = ai.to_local(agent.get_next_path_position()).normalized()
	aTree.set("parameters/Walk/blend_position",direction)
#func GetCollisions():
	#for i in get_slide_collision_count():
		#col = get_slide_collision(i)
		#col.get_collider()
#func PushRigids():
	#if col.get_collider() is RigidBody3D:
		#if is_on_wall() && col.get_collider().gravity_scale>0.5:
			#col.get_collider().apply_central_impulse(-col.get_normal()*(col.get_collider().mass))

