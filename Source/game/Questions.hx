package game;
import game.Database;
import sys.db.Sqlite;

/**
 * ...
 * @author ... Ruben Visser
 */
class Questions
{

	
	// question = string
	// answer = string
	// options = array of strings
	
	var dataBase = new game.Database();
	var questions = new Array<Array<String>>();
	public	var question : String;
	var answer : String;
	public var options = new Array<String>();
	var score : Int = 0;
	
	
	// requests access from DB, also; it selects from random for randomized questions 
	
	public function new() 
	{
		
		// requests the DB, and the random event
		questions = dataBase.readTable();
		
		
		next();	
	}
	
	// randomizes the array
	
	public function randomize(input:Array<String>)
	{

		// randomize an array, uses input.shift(shift pulls the first element of an array and returns it, then, the Std.random radomizes the returned result )
		
		for (i in input.iterator())
		{
			var temp = input.shift();
			
			input.insert(Std.random(input.length), temp);
		}
		
	}
	
	
	// return the questions in its value, either true or false.

	
	public function next(): Bool
	
	{
		if (questions.length == 0) return false;
		
		var _question = questions.pop();
		
		question = _question.shift();
		answer = _question[0];
		
		
		options = _question.copy();
		
		randomize(options);
		
		return true;
	}
	
	// checks the answer if its true/false, this is what a bool(lean) does.
	
	public function checkAnswer(_quizint:Int): Bool
	
	{
		trace(answer + " " + options [ _quizint ]);
		
		if ( answer == options [ _quizint ] )
		
		// if score is true return ++ score
		
		{
			score++;
			
			return true;
			
		}
		
		// if not return false
		
		else return false;
		
	}
		
	// check score, in an int(whole number)
	
	public function checkScore():Int 
	{
		return score;
	}
}