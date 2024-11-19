#!/bin/bash

EnableWindowsTargeting=true dotnet publish --self-contained --runtime linux-musl-x64 --framework net8.0 --tl:on ../src/Jackett.sln
cp ../*.* ../src/Jackett.Server/bin/Release/net8.0/linux-musl-x64/publish/
pushd ../src/Jackett.Server/bin/Release/net8.0/linux-musl-x64/
rm -rf Jackett
mv publish Jackett
tar --zstd -cvf Jackett.tar.zstd Jackett
mv Jackett publish
popd
mv ../src/Jackett.Server/bin/Release/net8.0/linux-musl-x64/Jackett.tar.zstd .
