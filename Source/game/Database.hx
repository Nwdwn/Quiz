package game;
import sys.db.Sqlite;
import sys.db.ResultSet;
import sys.db.Connection;

/**
 * ...
 * @author ...Ruben
 */


 
class Database

{
	
	
	var DB = Sqlite.open( "Assets/db/databasequiz" ); 			// connects with the databse
	public function new() 										// constructor
	{
		
	}
	
	/**
	 *  reads the table
	 * @return
	 */
	
	public function readTable(): Array<Array<String>>
	{ 
		var _result = new Array<Array<String>>();
		var _request = DB.request( "select * from quiz order by random()" );
		
		for ( _row in _request  ) 
		{
			_result.push([ _row.question, _row.answer, _row.wronga1, _row.wronga2, _row.wronga3]);
		}
		
		return _result;
	}
	
	/**
	 * reads the score's and name's from the database
	 * @return
	 */
	
	public function readScores(): Array<String> 
	
	{
		var _result = new Array<String>();
		var _request:ResultSet = DB.request("SELECT name, score FROM highscore ORDER BY score DESC LIMIT 4");
		
		for ( _row in _request )
		{
			_result.push(_row.score +" "+ _row.name);
		}
		
		return _result;	
	}
	
	/**
	 * writes the score in to the name and score database
	 * @param	_name
	 * @param	_score
	 */
	
	public function writeScore(_name:String, _score:Int)
	{
		
		DB.request("INSERT INTO highscore(name, score) VALUES ('" + _name + "', " + _score + ")");
		
	}	
	
	
}

