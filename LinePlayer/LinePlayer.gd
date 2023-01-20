tool
extends Node2D


const HEAD_RADIUS = 80
#onready var line = $Line2D

onready var last_neck_pos = $MainLine2D.points[0]


func _ready():
	if Engine.editor_hint:
		$AnimationPlayer.current_animation = "Run"
		


func _process(delta):
	var curr_neck_pos = $MainLine2D.points[0]
	var neck_pos_change = last_neck_pos - curr_neck_pos
	$MountLine2D.position -= neck_pos_change
	$Eye.position -= neck_pos_change
	$BackEye.position -= neck_pos_change
	update()
	
	last_neck_pos = curr_neck_pos


func _draw():
	var head_pos = $MainLine2D.points[0] - Vector2(0, HEAD_RADIUS * 0.95)
#	draw_circle($Line2D.points[0] - Vector2(0, HEAD_RADIUS * 0.95), HEAD_RADIUS* 1.1, Color(0,0,0,1))
	draw_circle($BackEye.position, HEAD_RADIUS * .25, Color.black)
	draw_circle($BackEye.position + Vector2(5,-5), HEAD_RADIUS * .1, Color.white)
	draw_circle(head_pos, HEAD_RADIUS * 1.1, Color.black)
	draw_circle(head_pos, HEAD_RADIUS, $MainLine2D.default_color)
	draw_arc(head_pos, HEAD_RADIUS * 0.95, deg2rad(180), deg2rad(45), 10, Color(.85, .85, .25), 10.0)
	draw_circle($Eye.position, HEAD_RADIUS * .3, Color.black)
	draw_circle($Eye.position + Vector2(5,-5), HEAD_RADIUS * .1, Color.white)
	
	
