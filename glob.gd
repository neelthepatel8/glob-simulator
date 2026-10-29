class_name Glob
extends Sprite2D

var impl: GlobImpl
var elapsed_ticks := 0

@export var health_loss_time = 1
@export var CONFIG: Config

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	assert(CONFIG != null, "Glob spawned without CONFIG")
	impl = GlobImpl.new(Coordinate.new(position.x, position.y), CONFIG.xmax, CONFIG.ymax)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func tick(delta: float) -> void:
	
	# check if glob is dead
	if not impl.active:
		visible = false
		return
	
	# elapsed ticks runner
	elapsed_ticks += 1
	
	# keep decreasing health as time passes
	if elapsed_ticks == health_loss_time:
		impl.health -= 2
		elapsed_ticks = 0 
	
	# if health at any point is 0 then set inactive
	if impl.health == 0:
		impl.active = false
		return
			
	# every tick, search for food, rerender
	impl.search(CONFIG.points_of_interest)
	_rerender(delta)

func _rerender(delta: float):
	
	position = impl.location.to_vector2().abs()
