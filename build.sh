#!/bin/bash

EnableWindowsTargeting=true dotnet publish --self-contained --runtime linux-musl-x64 --framework net8.0 --tl:on Jackett.sln
cp ../*.* Jackett.Server/bin/Release/net8.0/linux-musl-x64/publish/
pushd Jackett.Server/bin/Release/net8.0/linux-musl-x64/
rm -rf Jackett
mv publish Jackett
tar --zstd -cvf Jackett.tar.zstd Jackett
popd
mv Jackett.Server/bin/Release/net8.0/linux-musl-x64/Jackett.tar.zstd .
