package game;
import haxe.macro.Type.TFunc;
import haxe.Timer;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.utils.Timer;


/**
 * ...
 * @author ... Ruben Visser
 */
class Display extends Sprite
{
	var text:Array<TextField> = new Array<TextField>();
	var correctAnswer:Int;
	var questionTextField:TextField;
	var optionsArray:Array<TextField>;
	var timeField:TextField;
	var scoreField:TextField;
	var nameField = new openfl.text.TextFormat( "_sans", 24, 0x000000, true );
	
	// textfield for the nameinput 
	
	public var tf:TextField = new EditableField();
		
	// markup of the text for questions and time
	
	public function new() 
	{
		super();

		//text
		var questionTextFormat:TextFormat = new TextFormat ("newtimesroman", 24, 0xFF00FF, true, false, false, null, null, TextFormatAlign.JUSTIFY);
			questionTextField = new TextField();
			questionTextField.x = 0;
			questionTextField.y = 100;
			questionTextField.width = 800;
			questionTextField.height = 50;
			questionTextField.defaultTextFormat = questionTextFormat;
		addChild( questionTextField );
		//time	
			timeField = new TextField();
			timeField.x = 0;
			timeField.y = 70;
			timeField.width = 700;
			timeField.height = 50;
			timeField.defaultTextFormat = questionTextFormat;
			timeField.text = "";
		addChild( timeField );
		
		createTextField();
		
		optionsArray = new Array<TextField>();
		
		// Selects index in array i = iterator from=(0/to4)
			
		for ( i in 0 ... 4 )
		{
			var answeroptionTextField:TextField = new TextField();
				answeroptionTextField.defaultTextFormat = questionTextFormat;
				answeroptionTextField.x = 0;
				answeroptionTextField.y = 160 + ( i * 50 );
				answeroptionTextField.width = 800;
				answeroptionTextField.height = 50;
				addChild( answeroptionTextField );
				optionsArray.push (answeroptionTextField);
		}
		
		// fills the fields with the text
		
		fillFields("text", ["1", "2", "3", "4"]);
		
	// fills the "vraag" with string and antwoorden with an array of strings
		
	}
		
	public function fillFields(vraag:String, antwoorden:Array<String>)
	
	// definition of the markup in how the questions are displayed
	{
		
		questionTextField.text = vraag;
		
		optionsArray[0].text = "(1) " + antwoorden[0];
		optionsArray[1].text = "(2) " + antwoorden[1];
		optionsArray[2].text = "(3) " + antwoorden[2];
		optionsArray[3].text = "(4) " + antwoorden[3];
	}
	// shows the timer, 5 - timer(6) is 5,4,3,2,1!
	public function showTimer(timer:Int)
	{
		var time = Std.string(5 - timer);
		timeField.text = time;
	}
	// shows the score 
	public function showScores(_scores:Array<String>)
	{
		questionTextField.text = "";
		timeField.text = "";
		fillFields("Highscores:", _scores);	
	}
	
		
	// draws the text field for the name
	
	function createTextField()
	{
		var textField = new openfl.text.TextFormat("newtimesroman", 24, 0xFF00FF, true, false, false, null, null, TextFormatAlign.JUSTIFY);

		tf.defaultTextFormat = nameField;
		tf.type = openfl.text.TextFieldType.INPUT;
		tf.border = true;
		tf.width = 400;
		tf.height = 50;
		tf.text = "Typ snel je naam in";
		addChild( tf );
	}
	
}