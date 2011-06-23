#!/bin/sh
palm-package web
palm-install *.ipk
palm-launch com.creationix.hexes
rm *.ipk
