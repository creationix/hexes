local jsonEncode = require('json').stringify
local jsonDecode = require('json').parse

-- Keep a mapping of all the pieces in the game
local map = {
  {x = 1, y = 0},
  {x = 3, y = 1},
  {x = 1, y = 2},
  {x = 3, y = 3},
  {x = 1, y = 4},
  {x = 3, y = 5},
  {x = 1, y = 6},
}

local clients = {}

-- This function is called for every client websocket connection.
return function (req, read, write)

  p("New client", req.socket)

  -- Send the client te initial map
  write {
    opcode = 1,
    payload = jsonEncode {
      map = map
    }
  }

  -- Add the client's write function to the list so we can broadcast to it.
  clients[#clients + 1] = write

  -- Read move events from the client.
  for event in read do

    if event.opcode == 1 then

      local data = jsonDecode(event.payload)

      if data.move then
        -- Update the internal map
        local node = map[data.move.id + 1]
        node.x = data.move.x
        node.y = data.move.y

        -- In this simple example, we re-broadcast the move to all clients.
        -- In a real game there would some rule checking and other logic here.
        event.mask = false
        for i = 1, #clients do
          clients[i](event)
        end
      end
    end
  end

  -- Close the connection when the input stream is done.
  write()

  p("Client disconnect", req.socket)

  -- Remove the client from the list upon disconnect
  for i = #clients, 1, -1 do
    if clients[i] == write then
      table.remove(clients, i)
      break
    end
  end

end
