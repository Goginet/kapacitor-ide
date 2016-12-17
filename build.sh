#!/bin/bash

TICKSCRIPT_STUDIO_BUILD_ENVIRONMENT=deploy

gulp build

go build -v -o tickscript-studio ./server
