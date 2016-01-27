# docker-goxc
:earth_africa: `goxc` Docker image

![](https://raw.githubusercontent.com/multiarch/dockerfile/master/logo.jpg)

* Docker Hub: https://hub.docker.com/r/multiarch/goxc/

## Usage

```console
$ docker run -it --rm multiarch/goxc goxc -h
 goxc version: 0.17.1
  build date:
Usage: goxc [<option(s)>] [<task(s)>]
Help Options:
  -h <topic>     Help - default topic is 'options'. Also 'tasks', or any task or alias name.
  -ht            Help - show tasks (and task aliases)
  -version       Print version
  -v             Verbose output
Help Topics:
  options           default)
  tasks         lists all tasks and aliases
  <task-name>   task description, task options, and default values
  <alias-name>  lists an alias's task(s)
Tasks options:
  -+tasks=       Additional tasks to run first. See '-help tasks' for tasks list
  -t             Build cross-compiler toolchain(s). Equivalent to -tasks=toolchain
  -tasks+=       Additional tasks to run last. See '-help tasks' for tasks list
  -tasks-=       Tasks to exclude. See '-help tasks' for tasks list
Platform filtering:
  -arch=         Specify Arch (default is all - "386 amd64 arm")
  -bc=           Specify build constraints (e.g. 'linux,arm windows')
  -os=           Specify OS (default is all - "linux darwin windows freebsd openbsd solaris dragonfly")
Config files:
  -c=            config name
  -wc            (over)write config. Overwrites are additive. Try goxc -wc to produce a starting point.
Package versioning:
  -br=           Branch name (use this if you've forked a repo)
  -bu=           Build name (use this for pre-release builds)
  -pr=           Prerelease info (usually 'alpha', 'snapshot' ...)
  -pv=           Package version (usually [major].[minor].[patch]. default='snapshot')
Build:
  -build-ccflags= Build flag 'print-commands'
  -build-compiler= Build flag 'compiler'
  -build-gccgoflags= Build flag
  -build-gcflags= Build flag
  -build-installsuffix= Build flag
  -build-ldflags= Build flag
  -build-print-commands= Build flag 'print-commands'
  -build-processors= Processors to use during build
  -build-race=   Build flag 'race'
  -build-tags=   Build flag
  -build-verbose= Build flag 'verbose'
Other options:
  -codesign=     identity to sign darwin binaries with (only applied when host OS is 'darwin')
  -d=            Destination root directory (default=$GOBIN/(appname)-xc)
  -env=          Use env variables
  -goroot=       Specify Go ROOT dir (useful when you have multiple Go installations)
  -include=      Include resources in archives (default=INSTALL*,README*,LICENSE*)
  -main-dirs-exclude= Exclude given comma-separated directories from 'main' packages (default=Godeps,testdata,_project,vendor)
  -max-processors= Max processors (for parallelizing tasks)
  -n=            Application name. By default this is the directory name.
  -o=            Output file name for compilation (this string is a template, with default -o="{{.Dest}}{{.PS}}{{.Version}}{{.PS}}{{.Os}}_{{.Arch}}{{.PS}}{{.ExeName}}{{.Ext}}")
  -pi=           DEPRECATED option name. Use -pr instead
  -q=            Quiet (no output except for errors)
  -resources-exclude= Include resources in archives (default=*.go)
  -resources-include= Include resources in archives (default=INSTALL*,README*,LICENSE*)
  -wd=           Specify directory to work on
  -wlc=          write 'local' config
```

## Examples

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
