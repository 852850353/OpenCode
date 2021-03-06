TEMPLATE = app
CONFIG += console c++11 nokeywords
CONFIG -= app_bundle
CONFIG -= qt

HEADERS += \
    gen-cpp/shared_constants.h \
    gen-cpp/shared_types.h \
    gen-cpp/SharedService.h

SOURCES += \
    gen-cpp/shared_constants.cpp \
    gen-cpp/shared_types.cpp \
    gen-cpp/SharedService.cpp \
    thrift-client/mian.cpp



LIBS += \
    -lthrift -lthriftz            #thrift相关库文件

win32:LIBS += -lws2_32              #平台相关
