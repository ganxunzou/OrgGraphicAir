package com.orggraphic.core.vo
{
	/**
	 * TODO:
	 * @autor ganxz
	 * 2016-1-24
	 */
	public class LineVO extends BaseVO
	{
		public var startArrow:Boolean;
		public var fromNode:NodeVO;
		public var fromNodeX:Number;
		public var fromNodeY:Number;
		
		public var endArrow:Boolean;
		public var ToNode:NodeVO;
		public var ToNodeX:Number;
		public var ToNodeY:Number;
		
		public var topDesc:FontVO;
		public var bottomDesc:FontVO;
		
		public var thickness:Number;
		public var color:String;
		
		public function LineVO()
		{
			super();
		}
	}
}