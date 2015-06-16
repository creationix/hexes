return {
  name = "creationix/hexes",
  version = "2.0.1",
  description = "An example luvit program using web sockets",
  dependencies = {
    "creationix/weblit-websocket",
    "creationix/weblit-app",
    "creationix/weblit-logger",
    "creationix/weblit-auto-headers",
    "creationix/weblit-static",
    "luvit/json",
    "luvit/require",
    "luvit/pretty-print",
  },
  files = {
    "web/**",
    "*.lua",
  }
}
