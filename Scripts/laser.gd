extends Node3D

const SPEED = 500.0
# Called when the node enters the scene tree for the first time.
@onready var mesh = $MeshInstance3D
@onready var ray = $RayCast3D


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.basis * Vector3(0,0,SPEED) *delta
	
