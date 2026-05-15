extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var INIMIGO 

# Called when the node enters the scene tree for the first time.
func _ready():
	INIMIGO = preload ("res://comp/inimigo.tscn")
	for i in range(3):
		for j in range(15):
			var inimigo = INIMIGO.instance()
			add_child(inimigo)
			
			inimigo.position.x = 50 * j + get_node("PosInicialInimigo").position.x
			inimigo.position.y = 60 * i + get_node ("PosInicialInimigo").position.y
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_tree().get_nodes_in_group("Inimigo").size() == 0:
		get_tree().change_scene("res://scenes/Final.tscn")
	get_node("vidas").text = "Vidas: "+str(Global.hp)
	
