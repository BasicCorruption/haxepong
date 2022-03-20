package haxepong;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import haxepong.assets.Resources;
import haxepong.keys.Movement;
import haxepong.physics.Ball;
import haxepong.physics.Direction;

class Game extends FlxState
{
	public static var boxbottom:FlxSprite;
	public static var boxleft:FlxSprite;
	public static var boxright:FlxSprite;
	public static var boxtop:FlxSprite;

	public static var player1:FlxSprite; // Left
	public static var player2:FlxSprite; // Right

	public static var ball:FlxSprite;

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

		if (player1.overlaps(ball) || player1.x < ball.x + (ball.width / 2))
		{
			if (player1.y == ball.y)
			{
				Ball.push(Direction.RIGHT, 1);
			}
			else if (player1.y >= ball.y)
			{
				Ball.push(Direction.RIGHT_UP, 1);
			}
			else if (player1.y <= ball.y)
			{
				Ball.push(Direction.RIGHT_DOWN, 1);
			}
		}
		if (player2.overlaps(ball) || player2.x > ball.x + (ball.width / 2))
		{
			if (player2.y == ball.y)
			{
				Ball.push(Direction.LEFT, 1);
			}
			else if (player2.y >= ball.y)
			{
				Ball.push(Direction.LEFT_UP, 1);
			}
			else if (player2.y <= ball.y)
			{
				Ball.push(Direction.LEFT_DOWN, 1);
			}
		}

		ball.x += Ball.mfx;
		ball.y += Ball.mfy;
	}
}
