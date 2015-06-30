package game;


import game.Database;
import game.Display;
import openfl.display.DisplayObject;
import openfl.display.Sprite;
import openfl.utils.Timer;
import openfl.events.TimerEvent;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author ... Ruben Visser
 */



class Game extends Sprite
{
	var database:game.Database = new game.Database();	// database from class questions 
	var display:game.Display = new game.Display();		// display shows input from Display : Text,Correctanswer,answertextfield,questionsarray
	var questions:Questions = new Questions();
	
	public var timer:Timer = new Timer(1000); //timer
	
	/**
	 * This is the main game.
	 * 
	 * @param	_stage		reference to the main DisplayObject
	 */
	public function new (_stage:DisplayObject)
	{
		super ();															// Constructor
		
		addChild(display);													// adds the display class
		
		display.fillFields( questions.question, questions.options );		// Filld the field with questions and options
		display.showTimer(0);												// shows the timer from 0 
		timer.addEventListener(TimerEvent.TIMER, onTimer); 					// starts the timer on keyevent
		_stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyPressed ); 	// starts the timer on keyevent
		timer.start();														// timer start 
	
	}

	
	
	
	
	/**
	 * Writes the score and name to the DB
	 */
	public function questioncheck()
	{
		
		//trace(questions.checkScore());									// a trace for the console										
		database.writeScore(display.tf.text, questions.checkScore());		// writes the score using the editabletext function
		display.showScores(database.readScores());							// checks the score and returns the score value(readscore)
		
		
		}
	/**
	 * 	Shows t
	 * @param	e
	 */
	public function onTimer(e:TimerEvent)
	{
		display.showTimer(timer.currentCount);
		
		if (timer.currentCount == 6)
		{
			timer.reset(); // resets the initial timer upon start.
			if (questions.next() == false ) questioncheck() ;
			display.fillFields( questions.question, questions.options ); // displays the questions of type: questions and the options type from questions.
			display.showTimer(0); // shows the timer 
			timer.start(); // starts the timer after new array input 
		}
	}
	
	/**
	 * This function 
	 * @param	e
	 */
	
	function onKeyPressed(e:KeyboardEvent)
	
	{
		if (!timer.running) return;
		
		switch (e.keyCode)
		{
			case 49:
				{
					
					timer.reset();
					
					trace(questions.checkAnswer( 0 )); 
					
					if (questions.next() == false )
					{
						questioncheck() ;
						return;
					}
					
					display.fillFields( questions.question, questions.options );
					
					timer.start();
				}
			case 50: 
				{
					
					timer.reset();
					
					trace(questions.checkAnswer( 1 )); 
					
					if (questions.next() == false )
					{
						questioncheck() ;
						return;
					}
			
					display.fillFields( questions.question, questions.options );
					
					timer.start();
				}
			case 51: 
				{
					
					timer.reset();
					
					trace(questions.checkAnswer( 2 )); 
					
					if (questions.next() == false )
					{
						questioncheck() ;
						return;
					}
			
					display.fillFields( questions.question, questions.options );
					
					timer.start();
				}
			case 52: 
				{
					
					
					timer.reset();
					
					trace(questions.checkAnswer( 3 )); 
					
					if (questions.next() == false )
					{
						questioncheck() ;
						return;
					}

					display.fillFields( questions.question, questions.options );
					
					timer.start();
				}
				
			// exits the game on esc
				case 27:
					{
						Sys.exit(0);
					}
			
			default: trace(e);
		}
		
	}
}