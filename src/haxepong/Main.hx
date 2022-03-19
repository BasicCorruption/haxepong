package haxepong;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();

		Lib.current.addChild(new FlxGame(640, 480, Game, 1, 60, 60, true, false));
	}
}
