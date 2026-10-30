class_name GlobImpl

var health: int
var location: Coordinate
var search_distance: int
var active = true
var window_size = DisplayServer.window_get_size()

func _init(initial_location: Coordinate) -> void:
	health = 10
	location = initial_location
	search_distance = 50
	
func _move_to(new_location: Coordinate):
	print("Moving to %s" % new_location)
	location.change(new_location)

func _ls():
	print("Glob%d | %d HP at %s" % [(get_instance_id() % 1000), health, location])

func _next_location() -> Coordinate:
	# give it a maximum of 1000 attempts
	while true:
		# generate a random point in rectangle of bounds
		var possible_point = Coordinate.random(window_size.x, window_size.y)

		# check if point is in circle
		if location.distance(possible_point) <= search_distance:
			print("Found the location to go to! %s" % possible_point)
			return possible_point
	
	return Coordinate.new()

func search(search_space: Array):
	#_ls()
	
	if search_space.is_empty():
		return 
		
	for i in range(search_space.size()):
		var poi = search_space[i]
		if poi.active and location.distance(poi.get_location()) <= search_distance:
			print("Found poi at %d", poi)
			health += 2
			poi.active = false
			_move_to(poi.get_location())
			return
		
	print("Didn't find anything, will move to a random location!")
	
	var new_loc = _next_location()
	_move_to(new_loc)
