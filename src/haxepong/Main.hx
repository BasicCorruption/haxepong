package haxepong;

import flixel.FlxGame;
import flixel.FlxState;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		Lib.current.addChild(new FlxGame(0, 0, FlxState, 1, 60, 60, true, false));
	}
}
