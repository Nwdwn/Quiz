
package game ;

import openfl.events.Event;
import openfl.text.TextField;
import openfl.events.KeyboardEvent;

/**
 * Pretty minimalistic alternative for editable texts on Neko
 * 
 * @author Manno, used by Ruben, removed to neko 
 */
class EditableField extends TextField
{

	public function new()
	{
		super();
		addEventListener( Event.ADDED_TO_STAGE, init );
		addEventListener( Event.REMOVED_FROM_STAGE, uninit );
	}

	/**
	 * Keyboard event handler
	 * 
	 * @param event 	The KeyboardEvent.KEY_UP event
	 */
	function registerKey( event:KeyboardEvent)
	{
		if( event.keyCode >= 65 && event.keyCode <= 90 || event.keyCode == 32 )
		{
			text += String.fromCharCode( event.keyCode );
		}
		else if( event.keyCode == 8 ) // backspace
		{
			text = text.substr( 0, text.length-1 );
		}
	}

	/**
	 * The added to stage event handler
	 * 
	 * @param event 	The Event.ADDED_TO_STAGE event
	 */
	function init( event:Event )
	{
		stage.addEventListener( openfl.events.KeyboardEvent.KEY_DOWN, registerKey );
	}

	/**
	 * The removed from stage event handler
	 * 
	 * @param event 	The Event.REMOVED_FROM_STAGE event
	 */
	function uninit( event:Event )
	{
		stage.removeEventListener( openfl.events.KeyboardEvent.KEY_DOWN, registerKey );
	}
}