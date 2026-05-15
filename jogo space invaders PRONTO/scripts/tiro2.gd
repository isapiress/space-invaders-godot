extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var colisao = move_and_collide(Vector2(0,800) * delta)
	if colisao != null: 
		if colisao.collider.is_in_group("jogador"): 
			queue_free()
			 
			Global.hp = Global.hp - 1
			
			if Global.hp == 0:
				get_tree().change_scene("res://scenes/Final.tscn")
			
			
		
				
