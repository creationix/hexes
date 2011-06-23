var Stack = require('stack'),
    Creationix = require('creationix'),
    Http = require('http');

// Allow the user to specify the port via environment variables
var PORT = process.env.PORT || 8080;

// Serve static files in the web folder
var server = Http.createServer(Stack(
  Creationix.log(),
  Creationix.static("/", __dirname + "/web", "index.html")
));

// Listen to socket.io traffic too
var io = require('socket.io').listen(server);

// Keep a mapping of all the pieces in the game
var map = {
  1: {x: 1, y: 0},
  2: {x: 3, y: 1},
  3: {x: 1, y: 2},
  4: {x: 3, y: 3},
  5: {x: 1, y: 4},
  6: {x: 3, y: 5},
  7: {x: 1, y: 6}
};


// Every time a new client connects or reconnects, we get this
io.sockets.on('connection', function (client) {
  
  // Send the client te initial map
  client.emit('map', map);
  
  // In this simple example, we re-broadcast the move to all clients.
  // In a real game there would some rule checking and other logic here.
  client.on('move', function (params) {
    io.sockets.emit('move', params);
  });

});

server.listen(PORT);
console.log("Server running at port http://localhost:%s/", PORT);

var repl = require('repl');
var net = require('net');
net.createServer(function (connection) {
  connection.write("Welcome to the backdoor\n");
  require('child_process').exec("uname -a", function (err, stdout, stderr) {
    connection.write(stdout + "\n");
    var context = repl.start("hexes server> ", connection).context;
    context.io = io;
    context.map = map;
    context.server = server;
    context.reload = function () {
      io.sockets.emit('reload');
    };
    context.move = function (id, x, y) {
      io.sockets.emit('move', {id: id, x: x, y: y});
    };
  });
}).listen(9000);

