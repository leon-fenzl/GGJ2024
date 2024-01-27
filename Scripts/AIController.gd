extends Node
@export var speed:=500.0
@onready var ai := $".."

@onready var pointInPath:Vector2
@onready var direction:Vector2
@onready var distanceToPlayer:=Vector2.ZERO

@onready var col : KinematicCollision3D
@onready var agent := $"../NavigationAgent2D"
@onready var aTree := $"../AnimationTree"
func _physics_process(delta):
	pointInPath = agent.get_next_path_position()
	CalculateDistance()
	if distanceToPlayer.length() > 10.0:
		direction = (pointInPath - ai.global_position).normalized()
		ai.velocity = lerp(ai.velocity,direction * ai.speed*delta,10*delta)
	else:
		ai.velocity = lerp(ai.velocity, Vector2.ZERO, 10*delta)
	#GetCollisions()
func CalculateDistance():
	distanceToPlayer = agent.target_position - ai.global_position
#func GetCollisions():
	#for i in get_slide_collision_count():
		#col = get_slide_collision(i)
		#col.get_collider()
#func PushRigids():
	#if col.get_collider() is RigidBody3D:
		#if is_on_wall() && col.get_collider().gravity_scale>0.5:
			#col.get_collider().apply_central_impulse(-col.get_normal()*(col.get_collider().mass))
func MakeNavPath()->void:
	agent.set_target_position(ai.target.position)
func _on_timer_timeout():
	MakeNavPath()
