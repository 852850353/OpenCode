推荐工程环境：MSYS+MINGW64,我的系统是windows

我在Qt的Pro中导入了依赖库，这是MSYS的功劳，使得我我不用编译源码，如下：

	LIBS += \
		-lthrift -lthriftz            	#thrift相关库文件

	win32:LIBS += -lws2_32              #平台相关,主要WinSock库
	
如果你是源码安装，那么请在Pro中加入thrift安装所在的头文件目录


这是一个示例工程采用了thrift的框架
虽然我给你配置好了模板工程库。这只是用来测试RPC通信的例子

如果你想要基于这个开发，需要注意以下几点：
	1.首先你需要执行 GenCode.sh 的脚本，我在脚本内也添加了相应的中文注释，你可以修改这个脚本
	2.TARGET_PATH="" 代码生成目录默认为空
	3.根据我对thrift的测试，每一次生成的代码都将会覆盖之前生成的代码，有可能你更改后文件会被清空

	祝你好运
	
*****************************************************************************************************
*****************************************************************************************************
*****************************************************************************************************	
	
Recommended engineering environment: MSYS+MINGW64,My system is windows

I imported dependency libraries into Qt's Pro, thanks to MSYS, so I didn't have to compile the source code,as follows:

	LIBS += \
		-lthrift -lthriftz            	#Thrift related library files

	win32:LIBS += -lws2_32              #Platform-related, main WinSock Libraries
	
If you are a source installation, Please add the header directory where thrift installation is located in Pro



This is an example project using thrift framework.
Although I configure the template engineering library for you.
This is just an example to test RPC communication.

If you want to build on this development, you need to pay attention to the following points:

	1.  First you need to execute the GenCode. sh script. 
		I also added the corresponding Chinese comments in the script.
		You can modify the script.
		
	2.  TARGET_PATH="" Code Generation Directory defaults to empty
	
	3.  According to my test on thrift, every generated code will overwrite the previous generated code.
		It is possible that the file will be emptied after you change it.
		
	Good luck