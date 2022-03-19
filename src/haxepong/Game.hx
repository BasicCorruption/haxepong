package haxepong;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;

class Game extends FlxState
{
	static var boxbottom:FlxSprite;
	static var boxleft:FlxSprite;
	static var boxright:FlxSprite;
	static var boxtop:FlxSprite;

	public override function create()
	{
		super.create();

		boxbottom = new FlxSprite();
		boxbottom.makeGraphic(640, 10, FlxColor.WHITE);
		boxbottom.y = 470;

		boxtop = new FlxSprite();
		boxtop.makeGraphic(640, 10, FlxColor.WHITE);
		boxtop.y = 0;

		boxleft = new FlxSprite();
		boxleft.makeGraphic(10, 480, FlxColor.RED);
		boxleft.x = 0;

		boxright = new FlxSprite();
		boxright.makeGraphic(10, 480, FlxColor.RED);
		boxright.x = 630;

		add(boxright);
		add(boxleft);
		add(boxbottom);
		add(boxtop);
	}

	public override function update(dt:Float)
	{
		super.update(dt);
	}
}
