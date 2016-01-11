# docker-goxc
:earth_africa: `goxc` Docker image

## Usage

Cross build [scaleway/scaleway-cli](https://github.com/scaleway/scaleway-cli) from local.

```console
$ docker run -it --rm -v $(pwd):/go/src/github.com/scaleway/scaleway-cli -w /go/src/github.com/scaleway/scaleway-cli multiarch/goxc goxc -env=GO15VENDOREXPERIMENT=1
Adding GO15VENDOREXPERIMENT=1
[goxc:go-install] 2016/01/11 10:31:27 Task go-install succeeded
[goxc:xc] 2016/01/11 10:31:27 Parallelizing xc for 13 platforms, using max 7 of 8 processors
[goxc:xc] 2016/01/11 10:32:17 Task xc succeeded
[goxc:codesign] 2016/01/11 10:32:17 Task codesign succeeded
[goxc:copy-resources] 2016/01/11 10:32:17 Task copy-resources succeeded
[goxc:archive-zip] 2016/01/11 10:32:18 Artifact(s) archived to /go/src/github.com/scaleway/scaleway-cli/dist/1.7.0-rc1/scw_1.7.0-rc1_windows_386.zip
[goxc:archive-zip] 2016/01/11 10:32:18 Artifact(s) archived to /go/src/github.com/scaleway/scaleway-cli/dist/1.7.0-rc1/scw_1.7.0-rc1_freebsd_386.zip
[goxc:archive-zip] 2016/01/11 10:32:18 Artifact(s) archived to /go/src/github.com/scaleway/scaleway-cli/dist/1.7.0-rc1/scw_1.7.0-rc1_freebsd_arm.zip
[goxc:archive-zip] 2016/01/11 10:32:18 Artifact(s) archived to /go/src/github.com/scaleway/scaleway-cli/dist/1.7.0-rc1/scw_1.7.0-rc1_windows_amd64.zip
[goxc:archive-zip] 2016/01/11 10:32:18 Artifact(s) archived to /go/src/github.com/scaleway/scaleway-cli/dist/1.7.0-rc1/scw_1.7.0-rc1_freebsd_amd64.zip
[goxc:archive-zip] 2016/01/11 10:32:19 Artifact(s) archived to /go/src/github.com/scaleway/scaleway-cli/dist/1.7.0-rc1/scw_1.7.0-rc1_darwin_386.zip
[goxc:archive-zip] 2016/01/11 10:32:19 Artifact(s) archived to /go/src/github.com/scaleway/scaleway-cli/dist/1.7.0-rc1/scw_1.7.0-rc1_darwin_amd64.zip
[goxc:archive-zip] 2016/01/11 10:32:20 Task archive-zip succeeded
[goxc:archive-tar-gz] 2016/01/11 10:32:22 Task archive-tar-gz succeeded
[goxc:deb] 2016/01/11 10:32:28 Task deb succeeded
[goxc:deb-dev] 2016/01/11 10:32:28 Task deb-dev succeeded
[goxc:downloads-page] 2016/01/11 10:32:28 Task downloads-page succeeded
[goxc:deb-source] 2016/01/11 10:32:30 Task deb-source succeeded
[goxc:downloads-page] 2016/01/11 10:32:30 Task downloads-page succeeded
$ 
```

---

Fetch and cross build [moul/anonuuid](https://github.com/moul/anonuuid).
*(works out of the box with `docker` as the only dependency)*

```console
$ docker run -it --rm -v /tmp:/dist multiarch/goxc sh -xec 'go get -d github.com/moul/anonuuid; goxc -bc=linux -wd /go/src/github.com/moul/anonuuid -env=GO15VENDOREXPERIM
ENT=1 -d /dist xc'
+ go get -d github.com/moul/anonuuid
+ goxc -bc=linux -wd /go/src/github.com/moul/anonuuid -env=GO15VENDOREXPERIMENT=1 -d /dist xc
Adding GO15VENDOREXPERIMENT=1
[goxc:xc] 2016/01/11 11:57:19 Parallelizing xc for 3 platforms, using max 7 of 8 processors
[goxc:xc] 2016/01/11 11:57:21 Task xc succeeded
$ find /tmp/snapshot/ -ls
33685520    4 drwxr-xr-x   5 moul     moul         4096 Jan 11 12:55 /tmp/snapshot/
33685522    4 drwxr-xr-x   2 moul     moul         4096 Jan 11 12:57 /tmp/snapshot/linux_arm
33685550 3360 -rwxr-xr-x   1 moul     moul      3437720 Jan 11 12:57 /tmp/snapshot/linux_arm/anonuuid
33685549    4 drwxr-xr-x   2 moul     moul         4096 Jan 11 12:57 /tmp/snapshot/linux_386
33685559 3368 -rwxr-xr-x   1 moul     moul      3448120 Jan 11 12:57 /tmp/snapshot/linux_386/anonuuid
33685521    4 drwxr-xr-x   2 moul     moul         4096 Jan 11 12:57 /tmp/snapshot/linux_amd64
33685560 4180 -rwxr-xr-x   1 moul     moul      4279736 Jan 11 12:57 /tmp/snapshot/linux_amd64/anonuuid
$
```

## Examples

* [scaleway-community/scaleway-docker](https://github.com/scaleway-community/scaleway-docker/blob/4afd6ebd27d5919d93aa0b1c0bede4560e397258/Makefile#L47-L59)

## License

MIT
