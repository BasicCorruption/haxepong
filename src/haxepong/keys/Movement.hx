package haxepong.keys;

import flixel.FlxG;
import flixel.FlxObject;

class Movement
{
	public static function checkWASD(obj:FlxObject, mf:Float):Array<Float>
	{
		var x = obj.x;
		var y = obj.y;

		if (FlxG.keys.pressed.W)
		{
			y -= mf;
		}
		if (FlxG.keys.pressed.A)
		{
			x -= mf;
		}
		if (FlxG.keys.pressed.S)
		{
			y += mf;
		}
		if (FlxG.keys.pressed.D)
		{
			x += mf;
		}

		return [x, y];
	}

	public static function checkULDR(obj:FlxObject, mf:Float):Array<Float>
	{
		var x = obj.x;
		var y = obj.y;

		if (FlxG.keys.pressed.UP)
		{
			y -= mf;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			x -= mf;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			y += mf;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			x += mf;
		}

		return [x, y];
	}
}
