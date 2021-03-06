package {
	import flash.display.*;
	import flash.events.*;
	
	public class MovingCar extends MovieClip {
		private var leftArrow, rightArrow, upArrow: Boolean;
		
		public function MovingCar() {

			// move every frame
			addEventListener(Event.ENTER_FRAME, moveCar);
			
			// respond to key events
			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressedDown);
			stage.addEventListener(KeyboardEvent.KEY_UP,keyPressedUp);
		}
		
		// set arrow variables to true
		public function keyPressedDown(event:KeyboardEvent) {
			if (event.keyCode == 37) {
				leftArrow = true;
			} else if (event.keyCode == 39) {
				rightArrow = true;
			} else if (event.keyCode == 38) {
				upArrow = true;
			}
		}
		
		// set arrow variables to false
		public function keyPressedUp(event:KeyboardEvent) {
			if (event.keyCode == 37) {
				leftArrow = false;
			} else if (event.keyCode == 39) {
				rightArrow = false;
			} else if (event.keyCode == 38) {
				upArrow = false;
			}
		}
		
		// turn or move car forward
		public function moveCar(event:Event) {
			if (leftArrow) {
				car.rotation -= 5;
			}
			if (rightArrow) {
				car.rotation += 5;
			}
			if (upArrow) {
				moveForward();
			}
		}
		
		// calculate x and y speed and move car
		public function moveForward() {
			var speed:Number = 5.0;
			var angle:Number = 2*Math.PI*(car.rotation/360);
			var dx:Number = speed*Math.cos(angle);
			var dy:Number = speed*Math.sin(angle);
			car.x += dx;
			car.y += dy;
		}
	}
}
