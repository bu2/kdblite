\d .qlog

error:{2 (string .z.p),": ",$[10h~type x;x;string x],"\n";}
abort:{error x;'x}
print:{1 (string .z.p),": ",$[10h~type x;x;string x],"\n";}
warn:print
info:print
debug:print


\d .kdblite

openConnection:{.qlog.info"q IPC connection opened for [",(string x),"]"};
closeConnection:{.qlog.info"q IPC connection closed for [",(string x),"]"};
handleRequest:{.qlog.info"q IPC GET request from [",(string .z.w),"]"; value x};
handleAsyncRequest:{.qlog.info"q IPC SET request from [",(string .z.w),"]"; value x};

setupIPC:{
 .z.po:openConnection;
 .z.pc:closeConnection;
 .z.pg:handleRequest;
 .z.ps:handleAsyncRequest;
 }

init:{
 setupIPC[];
 }


\d .

.kdblite.init[]
