package haxepong;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import haxepong.assets.Resources;
import haxepong.keys.Movement;

class Game extends FlxState
{
	static var boxbottom:FlxSprite;
	static var boxleft:FlxSprite;
	static var boxright:FlxSprite;
	static var boxtop:FlxSprite;

	static var player1:FlxSprite; // Left
	static var player2:FlxSprite; // Right

	static var ball:FlxSprite;

	public override function create()
	{
		super.create();

		ball = new FlxSprite(0, 0, Resources.ball__png);
		ball.screenCenter(XY);
		add(ball);

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

		if (player1.overlaps(boxleft) || player1.overlaps(boxright))
		{
			trace("Player 1 loses!");
			player1.screenCenter(XY);
			player1.x -= 180;
		}

		if (player2.overlaps(boxleft) || player2.overlaps(boxright))
		{
			trace("Player 2 loses!");
			player2.screenCenter(XY);
			player2.x += 180;
		}

		if (player1.overlaps(ball) || player1.x < ball.x + (ball.width / 2)) {}
		if (player2.overlaps(ball) || player2.x > ball.x + (ball.width / 2)) {}
	}
}
