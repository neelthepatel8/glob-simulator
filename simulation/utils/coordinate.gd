class_name Coordinate
extends RefCounted

static var x: int
static var y: int

static var window_size = DisplayServer.window_get_size()

func _init(p_x: int = 0, p_y: int = 0) -> void:
		x = p_x
		y = p_y
		
static func from_vector2(v: Vector2): 
	x = v.x
	y = v.y
	
func distance(p: Coordinate) -> int:
	return int(((x - p.x) ** 2) + (y - p.y) ** 2) ** 0.5

func change(new: Coordinate):
	x = new.x
	y = new.y

func _to_string() -> String:
	return "(%d, %d)" % [x, y]

func to_vector2() -> Vector2:
	return Vector2(x, y)

static func random(xmax: int, ymax: int) -> Coordinate:
	var rx = randi_range(0, xmax)
	var ry = randi_range(0, ymax)
	return Coordinate.new(rx, ry)


static func center() -> Coordinate:
	return Coordinate.new(window_size.x / 2, window_size.y / 2)
