package com.orggraphic.core.vo
{
	import com.orggraphic.enums.NodeType;

	/**
	 * TODO:
	 * @autor ganxz
	 * 2016-1-24
	 */
	public class CircleVO extends NodeVO
	{
		public var bgColor:String = "0xffffff";
		public var borderColor:String = "0x0000ff";
		public var radius:Number;
		public var corp:FontVO;
		public var desc:FontVO;
		
		public function CircleVO()
		{
			super();
			type = NodeType.TYPE_CIRCLE;
		}
	}
}