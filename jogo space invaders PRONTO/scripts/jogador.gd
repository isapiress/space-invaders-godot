extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var TIRO

var delay_tiro
# Called when the node enters the scene tree for the first time.
func _ready():
	TIRO = preload ("res://comp/tiro.tscn")
	delay_tiro = 1
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		
	if Input.is_action_pressed("mover_direita"):
		move_and_collide(Vector2(200, 0) * delta)
		
	if Input.is_action_pressed("mover_esquerda"):
		move_and_collide(Vector2(-200, 0) * delta)
		
	if Input.is_action_pressed("tiro") and delay_tiro > 0.5:
		var tiro = TIRO.instance()
		get_tree().get_root().add_child(tiro)
		tiro.position = self.position 
		delay_tiro = 0 
	else: 
		delay_tiro = delay_tiro + delta 
		
		
		if Global.hp == 2:
			get_node("AnimatedSprite").animation = "2 vidas"
		if Global.hp == 1:
			get_node("AnimatedSprite").animation = "1 vida"
		
			
	
