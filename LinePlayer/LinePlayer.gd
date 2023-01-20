tool
extends Node2D


#onready var line = $Line2D


func _physics_process(delta):
	update()

func _draw():
	draw_circle($Line2D.points[0] - Vector2(0, 80), 80, $Line2D.default_color)
