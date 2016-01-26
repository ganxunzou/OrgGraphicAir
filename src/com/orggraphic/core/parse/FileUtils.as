package com.orggraphic.core.parse
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.controls.Alert;

	/**
	 * 文件工具类
	 * @autor ganxz
	 * 2016-1-24
	 */
	public class FileUtils
	{
		/**
		 * 读取文件 
		 * @param path
		 * @return 
		 * 
		 */		
		public static function readFile(path:String):String
		{
			var f:File = new File(File.applicationDirectory.nativePath +"\\Data.xml");
			if(!f.exists)
			{
				Alert.show(File.applicationDirectory.nativePath +"\\Data.xml文件不存在");
				return "";
			}
			var fs:FileStream = new FileStream();
			fs.open(f,FileMode.READ);
			var str:String = fs.readMultiByte(fs.bytesAvailable,'utf-8');
			fs.close();
			return str;
		}
	}
}