
local env = require('env')
local pathJoin = require('luvi').path.join

require('weblit-websocket')
require('weblit-app')

  .bind {
    host = "0.0.0.0",
    -- Allow the user to specify the port via environment variables
    port = env.PORT or 8080,
  }

  .use(require('weblit-logger'))
  .use(require('weblit-auto-headers'))

  .use(require('weblit-static')(pathJoin(module.dir, "web")))

  .websocket({
    path = "/socket",
    protocol = "hexes",
  }, require('./game'))

  .start()

require('uv').run()
