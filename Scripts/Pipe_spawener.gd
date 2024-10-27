extends Node3D

@export var enemy_to_spawn = load("res://Scenes/enemy_mine.tscn")
@export var number_of_enemies = 5.0
@export var spawn_interval = 1.0
@export var distance_to_start = 400.0
@export var player :Node

@onready var spawn_timer = $Timer

var instance


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.distance_to(player.position) < distance_to_start and spawn_timer.is_stopped() and number_of_enemies > 0:
		spawn_timer.wait_time = spawn_interval
		spawn_timer.start()
		print("in range for spawning")


func _on_timer_timeout():
	print("spawning an enemy")
	instance = enemy_to_spawn.instantiate()
	instance.position = position
	print("shooting")
	print(instance.position)
	get_parent().add_child(instance)
		
	print(number_of_enemies ,"left")
	number_of_enemies = number_of_enemies -1
	spawn_timer.stop()
	if number_of_enemies > 0:
		spawn_timer.wait_time = spawn_interval
		spawn_timer.start()
		
