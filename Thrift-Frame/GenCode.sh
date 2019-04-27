#!/bin/bash
echo "**********************************"
echo "**********************************"
thrift -version
echo "**********************************"
echo "**********************************"

#平台配置
DEFINES=Win32

#生成开发语言
DEV_LANGUAGE+=" --gen cpp"
#DEV_LANGUAGE+=" --gen java"

#配置你的生成路径
#TARGET_PATH=$(cd `dirname $0`; pwd)			#当前目录
TARGET_PATH=""									#为空

#thrift -gen ${DEV-LANGUAGE}-out ${TARGET_PATH}
#配置你代码生成的依赖文件
SOURCE_THRIFT="./shared.thrift"


#配置你代码生成产生路径，默认当前

EXE_SCRIPT+="thrift"

if [ ! -n "$TARGET_PATH" ]; then
	echo "Default directory generation code"
else
	echo "Setting the code generation path"
	if [ ! -d "$TARGET_PATH" ];then
		echo "make dir $TARGET_PATH"
		mkdir ${TARGET_PATH}
	fi
	EXE_SCRIPT+=" -o ${TARGET_PATH}"
fi

EXE_SCRIPT+="${DEV_LANGUAGE} ${SOURCE_THRIFT}"
echo "Implementing orders : $EXE_SCRIPT"

${EXE_SCRIPT}
if [ $? -ne 0 ]; then
    echo "Code generation failure"
else
    echo "Successful code generation"
fi