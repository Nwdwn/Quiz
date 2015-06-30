package;


import openfl.display.Sprite;
import openfl.events.ContextMenuEvent;
import openfl.utils.Timer;
import openfl.events.TimerEvent;
import openfl.events.KeyboardEvent;
import game.Game;

class Main extends Sprite
{
	/**
	 * adds the Game class
	 */
	public function new ()	
	{
		super ();
		
		var game = new Game(stage);
			game.visible = true;
		addChild (game);
	}	
}