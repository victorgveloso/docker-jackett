#!/bin/bash

EnableWindowsTargeting=true dotnet publish --self-contained --runtime linux-musl-x64 --framework net8.0 --tl:on Jackett.sln
