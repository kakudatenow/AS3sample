package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class ReplaceMC extends MovieClip {
		var InitStageSize = {
			width:0, height:0
		};
		var LR:String;
		var TB:String;
		
		
		
		
		public function ReplaceMC(container, argLR, argTB) {
			// constructor code
			container.addChild(this);
			
			InitStageSize.width = stage.stageWidth;
			InitStageSize.height = stage.stageHeight;
			
			//trace("size: " + InitStageSize.width + ", " + InitStageSize.height);
			
			LR = argLR;
			TB = argTB;
			
			textArea.text = LR + TB;
			
			replace();
			
			stage.addEventListener(Event.RESIZE, onResized);
		}
		
		
		
		
		
		function onResized(e:Event) {
			replace();
		}
		
		
		
		
		
		// 自分自身を現在のstageに合わせてリプレースする
		public function replace() {
			Object(parent).textArea.text += stage.stageWidth + ", " + stage.stageHeight + "\n";
			
			switch (LR) {
				case "L":
					x = (InitStageSize.width - stage.stageWidth) / 2;
					break;
				case "R":
					x = InitStageSize.width + (stage.stageWidth - InitStageSize.width) / 2 - width;
					break;
				default:
					;
			}
			switch (TB) {
				case "T":
					y = (InitStageSize.height - stage.stageHeight) / 2;
					break;
				case "B":
					y = InitStageSize.height + (stage.stageHeight - InitStageSize.height) / 2 - height;
					break;
				default:
					;
			}
			
			Object(parent).textArea.text += LR + TB + ": " + x + ", " + y + "\n";
		}

	}
}
