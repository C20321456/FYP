extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_gravity_scale(0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#apply_central_force(Vector3.UP * 50)
	pass
