# wapctl

wapctl - Control Windows applications under Windows Subsystem for Linux (WSL)

## Installation

Copy wapctl to the directory for executable programs (ex. /usr/local/bin, ~/bin) and change permission +x.

```bash
# Example
$ cp -pf wapctl /usr/local/bin
$ chmod +x /usr/local/bin/wapctl
```
### Environment

Wapctl depends on some environmental items.

* Windows 10
* Windows PowerShell 5.1
* Python 3.8 (WSL or Windows Store Version)

### Preparation for Python of Windows Store Version

1. Install Python 3.8 from Windows Store.
2. Upgrade pip.
```bash
$ python -m pip install --upgrade pip
```
3.Install chardet library.
```bash
$ pip install chardet
```

## Usage

The basic command interface of wapctl is like `wapctl mode [op [target]]`.
`Mode` is one of `process` (abbrev. `p`), `application` (`a`),
`installed` (`ins`), `package` (`pkg`), `service` (`svc`), and `startup` (`run`). You cannot omit `mode` parameter.
`Op` is one of `list`, `show`, `start`, `stop`, and `remove`. Wapctl assumes `list` if you omit `op` parameters.
You can also specify the `target` parameter which specifies the complete or partial name of targets, case insensitively.

You cannot show some information and control targets (eg. Win32 services) without administrator privileges.  Let you become an account with administrator privileges and run-as-administrator WSL bash.

### Running processes

You can list, show information and stop the running processes with the complete or partial name of processes.

* List the running processes.


```bash
$ wapctl p list
...
$ wapctl p list docker
com.docker.backend
com.docker.proxy
com.docker.service
Docker Desktop
docker-mutagen

```

* Show information of the running processes. Output columns mean (1)process name, (2)PID, (3)priority, (4)owner, (5)product name, and (6)company name, (7)command line, respectively.


```bash
$ wapctl p show 'Docker Desktop'
Docker Desktop 812 8 DOMAIN\account Docker Desktop Docker Desktop "C:\Program Files\Docker\Docker\Docker Desktop.exe"
```

* Stop the running processes.

```bash
$ wapctl p stop 'Docker Desktop'
Stop Docker Desktop (12108), ok? [Y/n]
```

### Applications programs in Shell:AppsFolder

You can list, show information and start the application programs in 'Shell:AppsFolder' by explorer folder search.

* List the application programs.


```bash
$ wapctl a list
...
$ wapctl a list zoom
Zoom
```

* Show information of the application programs. Output columns are mean (1)name and (2)path to start.

```bash
$ wapctl a show zoom
Zoom zoom.us.Zoom Video Meetings
```

* Start the application program.

```bash
$ wapctl a start zoom
Run Zoom (zoom.us.Zoom Video Meetings), ok? [Y/n]
```

### Installed applications in 'Uninstall' registry

You can list, show information, and remove (uninstall) the installed applications in 'Uninstall' registry.

* List the installed applications.


```bash
$ wapctl ins list
...
$ wapctl ins list slack
Slack
```

* Show information of the installed applications. Output columns mean (1)application name, (2)application version, (3)publisher name, and (4)uninstall command, respectively.

```bash
$ wapctl ins show slack
Slack 4.9.0 Slack Technologies Inc. "C:\Users\account\AppData\Local\slack\Update.exe" --uninstall
```

* Uninstall the installed applications.

```bash
$ wapctl ins remove slack
Uninstall Slack ("C:\Users\account\AppData\Local\slack\Update.exe" --uninstall), ok? [y/N] n
```

### Packages registered in Windows Store
                        
You can list, show information, start and remove the packages registered in Windows Store.

* List the Windows Store packages.

```bash
$ wapctl pkg list
...
$ wapctl pkg list paint
Microsoft.MSPaint
```

* Show information of the Windows Store packages. Output columns mean (1)package name, (2)package full name, (3)publisher, (4)executable, respectively.

```bash
$ wapctl pkg show paint
Microsoft.MSPaint Microsoft.MSPaint_6.2004.20027.0_x64__8wekyb3d8bbwe Microsoft Corporation PaintStudio.View.exe
```

* Start the Windows Store packages.

```bash
$ wapctl pkg start paint
Start Microsoft.MSPaint (Microsoft.MSPaint_8wekyb3d8bbwe), ok? [Y/n] n
```

* Uninstall the Windows Store packages.

```bash
$ wapctl pkg remove paint
Uninstall Microsoft.MSPaint (Microsoft.MSPaint_6.2004.20027.0_x64__8wekyb3d8bbwe), ok? [y/N]
```

### Win32 Services

You can list, show information, start and stop the Win32 services.

* List the Win32 services.

```bash
$ wapctl svc list
...
$ wapctl svc list search
Windows Search
```

* Show information of the Win32 services. Output columns mean (1)service name, (2)internal name, (3)start mode, (4)current state, (5)PID, (6)path, respectively.

```bash
$ wapctl svc show search
Windows Search WSearch Auto Running 3320 C:\WINDOWS\system32\SearchIndexer.exe /Embedding
```

* Start the Win32 services.

```bash
$ wapctl svc start search
Start Windows Search (WSearch), ok? [Y/n]
```

* Stop the Win32 services.

```bash
$ wapctl svc stop search
Stop Windows Search (WSearch), ok? [Y/n]
```

### Startup programs in Shell startup, 'Run' registry and UWP

You can list, show information, start and remove the startup programs in Shell startup, 'Run' registry and Universal Windows Platform (UWP) startup task.

* List the startup programs.

```bash
$ wapctl run list
...
$ wapctl run list docker
Docker Desktop
```

* Show information of the startup programs. Output columns mean (1)name, (2)type, and (3)state.

```bash
$ wapctl run show docker
Docker Desktop Run:User enabled
```

* Enable the startup programs.  This operation DOESN'T START ANY STOPPED TASKS but only set/unset flags in registry.

```bash
$ wapctl run start docker
Enable Docker Desktop (disabled), ok? [Y/n]
```

* Disable the startup programs.  This operation DOESN'T STOP ANY RUNNING TASKS but only set/unset flags in registry.

```bash
$ wapctl run stop docker
Disable Docker Desktop (enabled), ok? [Y/n]
```

## Options

* -h
* --help
  * Show help message
* -s SEPARATOR
* --separator SEPARATOR
  * Field separator for output
* -y
* --yes
  * Assume yes

## Contributing
Pull requests are welcome.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

