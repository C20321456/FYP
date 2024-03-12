extends MeshInstance3D

var colors =[
				Color(1, 0, 0), # Red
				Color(0, 1, 0),  # Green
				Color(0, 0, 1),  # Blue
				Color(5, 0, 5),  # Pink
				Color(5, 5, 0),  # Yellow
				Color(0, 5, 4),  # Cyan
				Color(79, 0, 87) # Purple
			]
				# List of colors to cycle through
var current_color_index = 0
var timer_node # Variable to hold reference to the Timer node

func _ready():
	# Attempt to find the Timer node
	timer_node = get_node("../Timer")
	# If Timer node is found, connect its timeout signal
	if timer_node:
		timer_node.timeout.connect(_on_timer_timeout) # Adjusted method name
		# Start the Timer
		timer_node.start()
	else:
		print("Timer node not found")

func _on_timer_timeout(): # Adjusted method name
	# Change the color of the MeshInstance3D
	if material_override:
		material_override.albedo_color = colors[current_color_index]
	# Increment the color index
	current_color_index = (current_color_index + 1) % colors.size()
