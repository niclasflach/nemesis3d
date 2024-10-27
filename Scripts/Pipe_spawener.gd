extends Node3D

@export var enemy_to_spawn = load("res://Scenes/enemy_mine.tscn")
@export var number_of_enemies = 5.0
@export var spawn_interval = 1.0
@export var distance_to_start = 400.0
@export var player :Node

@onready var spawn_timer = $Timer




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
	print(number_of_enemies ,"left")
	spawn_timer.wait_time = spawn_interval
	number_of_enemies = number_of_enemies -1
