extends Node3D

func _ready():
	# Load the texture containing the text
	var texture = preload("res://assets/ClimbingGame.png")

	# Create a new ShaderMaterial
	var material = ShaderMaterial.new()

	# Assign the texture to the material
	material.albedo_texture = texture

	# Create a MeshInstance3D node
	var mesh_instance = MeshInstance3D.new()
	mesh_instance.mesh = PrimitiveMesh.create_plane() # You might want to use a more appropriate mesh
	mesh_instance.material_override = material
	add_child(mesh_instance)
