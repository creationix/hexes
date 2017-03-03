return {
  name = "creationix/hexes",
  version = "3.0.0",
  description = "An example luvi app using web sockets",
  homepage = "https://github.com/creationix/hexes",
  tags = {"game", "example"},
  license = "MIT",
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
  luvi = {
    flavor = "tiny"
  },
  files = {
    "web/**",
    "*.lua",
  }
}
