extends Spatial

func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		arr = get_all_children(child,arr)
	return arr

var warp = true

func toggle_warp():
	if (warp == true):
		warp = false
		for child in children:
			if child is MeshInstance:
				child.get_surface_material(0).set_shader_param("warp",Vector2(0,0))
		return
	if (warp == false):
		warp = true
		for child in children:
			if child is MeshInstance:
				child.get_surface_material(0).set_shader_param("warp",Vector2(200,200))
		return

onready var children = get_all_children(self)
onready var player = get_node('/root/Main/Player')

func _ready():
	for child in children:
		if child is MeshInstance:
			child.get_surface_material(0).set_shader_param("warp",Vector2(200,200))

func _physics_process(_delta):
	for child in children:
		if child is MeshInstance:
			child.get_surface_material(0).set_shader_param("player",player.transform.origin)

func _input(event):
	if event.is_action_pressed("ui_focus_next"):
		toggle_warp()
