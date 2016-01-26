package com.orggraphic.core.vo
{
	import com.orggraphic.enums.NodeType;

	/**
	 * 节点VO
	 * @autor ganxz
	 * 2016-1-24
	 */
	public class NodeVO extends BaseVO
	{
		/**
		 * 节点类型
		 * 默认 ""
		 */		
		public var type:String = "";
		
		/**
		 * 节点X坐标
		 */		
		public var x:Number = 0;
		
		/**
		 * 节点Y坐标
		 */		
		public var y:Number = 0;
	}
}