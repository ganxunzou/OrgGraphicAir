package com.orggraphic.comps
{
	/**
	 * UICirCle
	 * @autor ganxz
	 * 2016-1-18
	 */
	import com.orggraphic.core.vo.CircleVO;
	import com.orggraphic.skins.UICircleSkin;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class UICircle extends SkinnableComponent
	{
	
		[Bindable]
		private var _circleVo:CircleVO;
		
		
		public function UICircle()
		{
			super();
			
			setStyle("skinClass",UICircleSkin);
		}
		
		public function get circleVo():CircleVO
		{
			return _circleVo;
		}

		public function set circleVo(value:CircleVO):void
		{
			if(_circleVo == value)
				return;
			
			_circleVo = value;
			if(skin)
			{
				skin.invalidateDisplayList();
			}
		}
		
		override public function set x(value:Number):void
		{
			_circleVo.x = value;
			super.x = value;
		}
		
		override public function set y(value:Number):void
		{
			_circleVo.y = value;
			super.y = value;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			trace("CirCle updateDisplayList");
			
			var w:Number = _circleVo.radius * 2;
			var h:Number = _circleVo.radius * 2;
			setActualSize(w,h);
			super.updateDisplayList(w,h);
			
		}
	}
}