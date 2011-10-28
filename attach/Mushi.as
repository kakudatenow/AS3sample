package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Mushi extends MovieClip {
		
		
		public function Mushi(_y) {
			// constructor code
			trace("constructor:", this);
			this.y = _y;
			this.addEventListener(MouseEvent.CLICK, onClicked);
		}
		
		
		public function setY(y) {
			trace("set y to " + y);
			
		}
		
		function onClicked(e) {
			trace("clicked");
			this.y = 200;
		}
	}
	
}
