extends "res://addons/godot-xr-tools/objects/pickable.gd"

@export var is_enabled = false :set = set_enabled

@onready var original_transform = transform 

func set_enabled(new_enabled):
	is_enabled = new_enabled
	
	if is_picked_up() and !is_enabled:
		let_go()
		
	if $CollisionShape3D:
		$CollisionShape3D.disabled = !enabled

func let_go(p_linear_velocity: Vector3 = Vector3.ZERO, p_angular_velocity: Vector3 = Vector3.ZERO) -> void:
#func let_go(p_linear_velocity: Vector3, p_angular_velocity: Vector3) -> void:
	if picked_up_by:
		picked_up_by.remove_child(self)
		original_parent.add_child(self)
		
		transform = original_transform
		collision_mask = original_collision_mask
		collision_layer = original_collision_layer
		
		picked_up_by = null
		by_controller = null

func _ready():
	set_enabled(is_enabled)
