#include "gen-cpp/SharedService.h"
#include <thrift/transport/TSocket.h>
#include <thrift/transport/TBufferTransports.h>
#include <thrift/protocol/TBinaryProtocol.h>
#include <thrift/server/TSimpleServer.h>
#include <thrift/transport/TServerSocket.h>
#include <thrift/transport/TBufferTransports.h>

using namespace apache::thrift;
using namespace apache::thrift::protocol;
using namespace apache::thrift::transport;
using boost::shared_ptr;
using namespace  ::shared;
int main(int argc, char **argv)
{
    ::apache::thrift::stdcxx::shared_ptr<TSocket> socket(new TSocket("127.0.0.1",9090));
    ::apache::thrift::stdcxx::shared_ptr<TTransport> transport(new TBufferedTransport(socket));
    ::apache::thrift::stdcxx::shared_ptr<TProtocol> protocol(new TBinaryProtocol(transport));
    SharedServiceClient client(protocol);
    try
    {
        transport->open();
    }
    catch(TTransportException)
    {
        transport->close();
    }

    SharedStruct testStruc;
    client.getStruct(testStruc,1234);
    printf("client.getStruct key:%d value:%s\n",testStruc.key,testStruc.value.c_str());
    transport->close();

    getchar();
    return 0;
}
