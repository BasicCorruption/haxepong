package haxepong;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxepong.keys.Movement;

class Game extends FlxState
{
	static var boxbottom:FlxSprite;
	static var boxleft:FlxSprite;
	static var boxright:FlxSprite;
	static var boxtop:FlxSprite;

	static var player1:FlxSprite; // Left
	static var player2:FlxSprite; // Right

	public override function create()
	{
		super.create();

		player1 = new FlxSprite();
		player1.makeGraphic(25, 50, FlxColor.LIME);
		player1.screenCenter(XY);
		player1.x -= 180;
		add(player1);

		player2 = new FlxSprite();
		player2.makeGraphic(25, 50, FlxColor.LIME);
		player2.screenCenter(XY);
		player2.x += 180;
		add(player2);

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

		var a = Movement.checkWASD(player1, 5);
		var b = Movement.checkULDR(player2, 5);
		player1.x = a[0];
		player1.y = a[1];
		player2.x = b[0];
		player2.y = b[1];
	}
}
