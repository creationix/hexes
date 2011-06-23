# Hexes

This is a simple game that uses a remote nodejs server to sync up piece movements between all players.

Before you can run this, you need some dependencies installed.

Once the code is checked out, run this from the root of the code tree and npm will grab all the dependencies automatically.

    npm install

To start the server simply type the following in this folder:

    node server.js

Then go to http://localhost:8080/ in a webkit browser (chrome, safari, etc..) to see the game served from your local laptop.

To play, simply click (or tap) on a piece, and then click where you want it to go.  Open the same url in a couple browser windows to see them stay synced.

# iOS Install

Go to the url in Safari and add to desktop as an icon.  Then when you launch this icon, it will appear as a local native app, but really load from your server/laptop.

# webOS Experiments

There is a `REMOTE_SERVER` variable in `index.html` that points to my remote server.  You can launch this app over the `file://` urls or as a webOS application and it will use `REMOTE_SERVER` as the socket.io server.

Then you plug up the phone via USB (assuming you have the Palm SDK installed) and run the local launch script:

    ./launch.sh


