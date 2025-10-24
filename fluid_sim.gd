extends Node2D

var gravity: float = 50.0
var vel: Vector2 = Vector2.ZERO
var radius: float = 10.0

var pos: Vector2      
var bounds: Rect2       

func _ready() -> void:
	position = Vector2.ZERO 
	var screen = get_viewport().get_visible_rect().size

	var half_bound = screen * 0.25
	bounds = Rect2(screen * 0.5 - half_bound, half_bound * 2.0)

	pos = bounds.get_center()

func _process(delta: float) -> void:
	vel += Vector2.DOWN * gravity * delta
	pos += vel * delta

	if pos.x - radius < bounds.position.x:
		pos.x = bounds.position.x + radius
		vel.x = -vel.x
	elif pos.x + radius > bounds.position.x + bounds.size.x:
		pos.x = bounds.position.x + bounds.size.x - radius
		vel.x = -vel.x

	if pos.y - radius < bounds.position.y:
		pos.y = bounds.position.y + radius
		vel.y = -vel.y
	elif pos.y + radius > bounds.position.y + bounds.size.y:
		pos.y = bounds.position.y + bounds.size.y - radius
		vel.y = -vel.y

	queue_redraw()

func _draw() -> void:
	draw_rect(bounds, Color(0.8, 0.8, 0.8), false, 2.0)
	draw_circle(pos, radius, Color.AQUA)
