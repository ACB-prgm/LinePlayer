tool
extends Line2D


onready var parent = get_parent()


func _ready():
	width_curve = parent.width_curve


func _process(delta):
	points = parent.points
