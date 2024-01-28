extends Camera2D

@export var shakeStrength : float
@export var displace_Height:float
@export var lerpSpeed:float
@onready var parent := $".."

var rng = RandomNumberGenerator.new()

func _ready():
	set_as_top_level(true)
func _physics_process(delta: float) -> void:
	position = lerp(position,(parent.global_position+Vector2(0,displace_Height)),lerpSpeed*delta)
	CameraShake(delta)
func CameraShake(DELTA:float):
	if shakeStrength>0:
		shakeStrength = lerpf(shakeStrength,0,10*DELTA)
	offset = RandomShakeStrength()
func RandomShakeStrength() -> Vector2:
	return Vector2(rng.randf_range(-shakeStrength,shakeStrength),rng.randf_range(-shakeStrength,shakeStrength))
