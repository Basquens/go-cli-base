#!/bin/bash

rm -Rf build/

# Reference:
# https://github.com/golang/go/blob/master/src/go/build/syslist.go
os_archs_all=(
    darwin/386
    darwin/amd64
    dragonfly/amd64
    freebsd/386
    freebsd/amd64
    freebsd/arm
    linux/386
    linux/amd64
    linux/arm
    linux/arm64
    linux/ppc64
    linux/ppc64le
    linux/mips
    linux/mipsle
    linux/mips64
    linux/mips64le
    linux/s390x
    nacl/386
    nacl/amd64p32
    nacl/arm
    netbsd/386
    netbsd/amd64
    netbsd/arm
    openbsd/386
    openbsd/amd64
    openbsd/arm
    plan9/386
    plan9/amd64
    plan9/arm
    solaris/amd64
    windows/386
    windows/amd64
)

os_archs=(
    darwin/386
    darwin/amd64
    dragonfly/amd64
    freebsd/386
    freebsd/amd64
    freebsd/arm
    linux/386
    linux/amd64
    linux/arm
    linux/arm64
    solaris/amd64
    windows/386
    windows/amd64
)

os_archs_builded=()

for os_arch in "${os_archs[@]}"
do
    goos=${os_arch%/*}
    goarch=${os_arch#*/}
    GOOS=${goos} GOARCH=${goarch} go build -o build/cmd.${goos}.${goarch} . >/dev/null 2>&1
    os_archs_builded+=(${os_arch})
done

echo "builded:"
for os_arch in "${os_archs_builded[@]}"
do
    printf "\t%s\n" "${os_arch}"
done
echo