package haxepong.physics;

class Ball
{
	public static var mfx:Float = 0;
	public static var mfy:Float = 0;

	public static function push(direction:Direction, speed:Float)
	{
		switch (direction)
		{
			case LEFT:
				mfx = (0 - 1) * speed;
			case LEFT_DOWN:
				mfx = (0 - 1) * speed;
				mfy = speed;
			case LEFT_UP:
				mfx = (0 - 1) * speed;
				mfy = (0 - 1) * speed;
			case RIGHT:
				mfx = speed;
			case RIGHT_DOWN:
				mfx = speed;
				mfy = speed;
			case RIGHT_UP:
				mfx = speed;
				mfy = (0 - 1) * speed;
			case UP:
				mfy = (0 - 1) * speed;
			case DOWN:
				mfy = speed;
		}
	}
}
