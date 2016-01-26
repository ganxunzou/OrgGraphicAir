package com.orggraphic.comps
{
	/**
	 * TODO:
	 * @autor ganxz
	 * 2016-1-19
	 */
	import com.orggraphic.core.parse.GlobalInfo;
	import com.orggraphic.core.vo.LineVO;
	import com.orggraphic.skins.UILineSkin;
	
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.text.TextLineMetrics;
	
	import mx.utils.StringUtil;
	
	import spark.components.Group;
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class UILine extends SkinnableComponent
	{
		
		[SkinPart(required="true")]
		public var topLbl:Label;
		
		[SkinPart(required="true")]
		public var bottomLbl:Label;
		
		private var _lineVo:LineVO;
		//箭头角度
		private var arrowJiaoDu:Number=30;
		private var arrowLen:Number = 10;
		
		public function UILine()
		{
			super();
			setStyle("skinClass",UILineSkin);
		}
		
		public function get lineVo():LineVO
		{
			return _lineVo;
		}

		public function set lineVo(value:LineVO):void
		{
			if(_lineVo == value)
				return;
			
			_lineVo = value;
			if(skin)
			{
				skin.invalidateDisplayList();
			}
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			trace("Line updateDisplayList");
			var fX:Number = lineVo.fromNode.x + lineVo.fromNodeX;
			var fY:Number = lineVo.fromNode.y + lineVo.fromNodeY;
			
			var toX:Number = lineVo.ToNode.x + lineVo.ToNodeX;
			var toY:Number = lineVo.ToNode.y + lineVo.ToNodeY;
			
			move(fX,fY);
			
			var xLen:Number = toX - fX;
			var yLen:Number = toY - fY;
			
			var w:Number = Math.abs(xLen);
			var h:Number = Math.abs(yLen);
			var xBian:Number = Math.sqrt(w*w + h*h);
			
			setActualSize(w,h);
			
			super.updateDisplayList(w,h);
			
			var g:Graphics = this.graphics;
			g.clear();
			g.lineStyle(lineVo.thickness,uint(lineVo.color));
			g.moveTo(0,0);
			g.lineTo(toX-fX,toY - fY);
			
			
			if(toX >= fX && toY >= fY)
			{
				quadrant4(xBian,w,h,g);
			}
			else if(toX < fX && toY >= fY)
			{
				quadrant3(xBian,w,h);
			}
			else if(toX < fX && toY < fY)
			{
				quadrant2();
			}
			else if(toX > fX && toY < fY)
			{
				quadrant1();
			}
			
//			g.beginFill(0xff000);
//			g.drawRect(0,0,w,h);
//			g.endFill();
			
		}

		/**
		 * 第1象限 
		 * 
		 */		
		private function quadrant1():void
		{
			
		}
		
		/**
		 * 第2象限 
		 * 
		 */		
		private function quadrant2():void
		{
			
		}
		
		/**
		 * 第3象限 
		 * 注意 X轴是负值，角度大于90度
		 */		
		private function quadrant3(xBian:Number,w:Number,h:Number):void
		{
			var huDu:Number = Math.atan(w/h);//弧度
			var jiaoDu:Number = huDu * (180/Math.PI);//角度
			
			if(topLbl && lineVo.topDesc)
			{
				var tM:TextLineMetrics = measureText(lineVo.topDesc.text);
				var jz:Number = (xBian - tM.width)/2;
				topLbl.rotation = 90 + jiaoDu;
				trace(Math.sin(getHuDuByJiaoDu(90-jiaoDu)) * tM.height);
				topLbl.x = -(Math.sin(huDu) * jz) + Math.sin(getHuDuByJiaoDu(90-jiaoDu)) * tM.height;
				topLbl.y = (Math.cos(huDu) * jz) + Math.cos(getHuDuByJiaoDu(90-jiaoDu)) * tM.height;;
			}
			
			if(bottomLbl && lineVo.bottomDesc)
			{
				var tM1:TextLineMetrics = measureText(lineVo.bottomDesc.text);
				var jz1:Number = (xBian - tM1.width)/2;
				bottomLbl.rotation = 90 + jiaoDu;
				bottomLbl.x = -(Math.sin(jiaoDu * (Math.PI/180)) * jz1) ;
				bottomLbl.y = (Math.cos(jiaoDu * (Math.PI/180)) * jz1) ;
			}
		}
		
		/**
		 * 第4象限 
		 * tx > fx && ty > fy
		 */		
		private function quadrant4(xBian:Number,w:Number,h:Number,g:Graphics):void
		{
			var huDu:Number = Math.atan(w/h);//弧度
			var jiaoDu:Number = huDu * (180/Math.PI);//角度
			
			if(topLbl && lineVo.topDesc)
			{
				var tM:TextLineMetrics = measureText(lineVo.topDesc.text);
				var jz:Number = (xBian - tM.width)/2;
				topLbl.rotation = 90 - jiaoDu;
				topLbl.x = ((Math.sin(huDu) * jz) + Math.sin(getHuDuByJiaoDu(90-jiaoDu)) * tM.height) ;
				topLbl.y = (Math.cos(huDu) * jz) - Math.cos(getHuDuByJiaoDu(90-jiaoDu)) * tM.height;
			}
			
			if(bottomLbl && lineVo.bottomDesc)
			{
				var tM1:TextLineMetrics = measureText(lineVo.bottomDesc.text);
				var jz1:Number = (xBian - tM1.width)/2;
				bottomLbl.rotation = 90 - jiaoDu;
				bottomLbl.x = (Math.sin(jiaoDu * (Math.PI/180)) * jz1) ;
				bottomLbl.y = (Math.cos(jiaoDu * (Math.PI/180)) * jz1) ;
			}
			
			//绘制箭头
			g.moveTo(w,h);
			//左下角线
			g.beginFill(uint(lineVo.color));
			g.lineTo(w - (Math.cos(getHuDuByJiaoDu(90-arrowJiaoDu-jiaoDu)) * arrowLen),h - (Math.sin(getHuDuByJiaoDu(90-arrowJiaoDu-jiaoDu)) * arrowLen));
			g.lineTo(w - (Math.sin(getHuDuByJiaoDu(jiaoDu-arrowJiaoDu)) * arrowLen),h - (Math.cos(getHuDuByJiaoDu(jiaoDu-arrowJiaoDu)) * arrowLen));
			g.lineTo(w,h);	
			g.endFill();
		}
		
		/**
		 * 根据角度获取弧度 
		 * @param huDu
		 * @return 
		 * 
		 */		
		private function getJiaoDuByHuDu(huDu:Number):Number
		{
			var jiaoDu:Number = huDu * (180/Math.PI);//角度
			return jiaoDu;
		}
		
		/**
		 * 根据角度获取弧度 
		 * @param jiaoDu
		 * @return 
		 * 
		 */		
		private function getHuDuByJiaoDu(jiaoDu:Number):Number
		{
			var huDu:Number = jiaoDu * (Math.PI/180);//角度
			return huDu;
		}
	}
}