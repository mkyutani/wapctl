# wapctl

wapctl - Command line interface to control Windows applications

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
```
C:\> python -m pip install --upgrade pip
```

3. Install chardet library.
```
C:\> pip install chardet
```

## Usage

The basic command interface of wapctl is like `wapctl target`, which search target from various location, i.e. Shell:AppsFolder, Windows Store packages, registry 'uninstall', shell startups, Win32 services, and running processes.  If you give no targets to wapctl, it assumes targets are all found items.
You can specify modes and operations. Mode options mean locations to search targets and operation options actions to found targets.  Operations is one of `list`, `info`, `start`, `stop`, and `remove`. Wapctl assumes `list` if you give no operation options.

You cannot show some information and control targets (eg. Win32 services) without administrator privileges.  Let you be an account with administrator privileges and execute wapctl on run-as-administrator WSL bash or Command Prompt.

### Running processes

You can list, show information and stop the running processes with the complete or partial name of processes.

* List the running processes.


```bash
$ wapctl --process --list
...
$ wapctl --process --list calc
process Calculator
```

* Show information of the running processes. Output columns mean (1)mode ("process"), (2)process name, (3)PID, (4)priority, (5)owner, (6)product name, (7)version, (8)description, (9)company name, (10)executable path, (11)command line, respectively.  You can change the column separator with option '-s'.


```bash
$ wapctl --process --info calc
application Calculator 19192 8 DOMAIN\account Microsoft Calculator 10.2009.4.0 Calculator.exe Microsoft Corporation C:\Program Files\WindowsApps\Microsoft.WindowsCalculator_10.2009.4.0_x64__8wekyb3d8bbwe\Calculator.exe "C:\Program Files\WindowsApps\Microsoft.WindowsCalculator_10.2009.4.0_x64__8wekyb3d8bbwe\Calculator.exe" -ServerName:App.AppXsm3pg4n7er43kdh1qp4e79f1j7am68r8.mca

$ wapctl --process --info calc -s, | cut -d, -f 11
"C:\Program Files\WindowsApps\Microsoft.WindowsCalculator_10.2009.4.0_x64__8wekyb3d8bbwe\Calculator.exe" -ServerName:App.AppXsm3pg4n7er43kdh1qp4e79f1j7am68r8.mca
```

* Stop the running processes.

```bash
$ wapctl --process --stop calc
Stop Calculator process (19192), ok? [Y/n]
```

### Applications programs in Shell:AppsFolder

You can list, show information and start the application programs in 'Shell:AppsFolder' by explorer folder search.

* List the application programs.


```bash
$ wapctl --application --list
...
$ wapctl --application --list zoom
application Zoom
```

* Show information of the application programs. Output columns are mean (1)mode ("application"), (2)name and (3)path to start.

```bash
$ wapctl --applicatoin --info zoom
application Zoom zoom.us.Zoom Video Meetings
```

* Start the application program.

```bash
$ wapctl --application --start zoom
Run Zoom application (zoom.us.Zoom Video Meetings), ok? [Y/n]
```

### Installed applications in 'Uninstall' registry

You can list, show information, and remove (uninstall) the installed applications in 'Uninstall' registry.

* List the installed applications.


```bash
$ wapctl --installed --list
...
$ wapctl --installed --list slack
installed Slack
```

* Show information of the installed applications. Output columns mean (1)mode ("installed", (2)application name, (3)application version, (4)publisher name, and (5)uninstall command, respectively.

```bash
$ wapctl --installed --info slack
installed Slack 4.9.0 Slack Technologies Inc. "C:\Users\account\AppData\Local\slack\Update.exe" --uninstall
```

* Uninstall the installed applications.

```bash
$ wapctl ins remove slack
Uninstall Slack installed ("C:\Users\account\AppData\Local\slack\Update.exe" --uninstall), ok? [y/N] n
```

### Packages registered in Windows Store
                        
You can list, show information, start and remove the packages registered in Windows Store.

* List the Windows Store packages.

```bash
$ wapctl --package --list
...
$ wapctl --package --list paint
package Microsoft.MSPaint
```

* Show information of the Windows Store packages. Output columns mean (1)mode ("package", (2)package name, (3)package full name, (4)publisher, (5)executable, respectively.

```bash
$ wapctl --package --info paint
package Microsoft.MSPaint Microsoft.MSPaint_6.2004.20027.0_x64__8wekyb3d8bbwe Microsoft Corporation PaintStudio.View.exe
```

* Start the Windows Store packages.

```bash
$ wapctl --package --start paint
Start Microsoft.MSPaint package (Microsoft.MSPaint_8wekyb3d8bbwe), ok? [Y/n] n
```

* Uninstall the Windows Store packages.

```bash
$ wapctl --package --remove paint
Uninstall Microsoft.MSPaint package (Microsoft.MSPaint_6.2004.20027.0_x64__8wekyb3d8bbwe), ok? [y/N] n
```

### Win32 Services

You can list, show information, start and stop the Win32 services.

* List the Win32 services.

```bash
$ wapctl --service --list
...
$ wapctl --service --list search
service Windows Search
```

* Show information of the Win32 services. Output columns mean (1)mode("service"), (2)service name, (3)internal name, (4)start mode, (5)current state, (6)PID, (7)path, respectively.

```bash
$ wapctl --service --info search
service Windows Search WSearch Auto Running 3320 C:\WINDOWS\system32\SearchIndexer.exe /Embedding
```

* Start the Win32 services.

```bash
$ wapctl --service --start search
Start Windows Search service (WSearch), ok? [Y/n]
```

* Stop the Win32 services.

```bash
$ wapctl --service --stop search
Stop Windows Search service (WSearch), ok? [Y/n]
```

### Startup programs in Shell startup, 'Run' registry and UWP

You can list, show information, start and remove the startup programs in Shell startup, 'Run' registry and Universal Windows Platform (UWP) startup task.

* List the startup programs.

```bash
$ wapctl --startup --list
...
$ wapctl --startup --list docker
startup Docker Desktop
```

* Show information of the startup programs. Output columns mean (1)mode("startup"), (2)name, (3)type, (4)state, and (5)command line.

```bash
$ wapctl --startup --info docker
startup Docker Desktop Run:User enabled C:\Program Files\Docker\Docker\Docker Desktop.exe
```

* Enable the startup programs.  This operation DOESN'T START ANY STOPPED TASKS but only set/unset flags in registry.

```bash
$ wapctl --startup --start docker
Enable Docker Desktop startup (disabled), ok? [Y/n]
```

* Disable the startup programs.  This operation DOESN'T STOP ANY RUNNING TASKS but only set/unset flags in registry.

```bash
$ wapctl --startup --stop docker
Disable Docker Desktop startup (enabled), ok? [Y/n]
```

## Options

* -h
* --help
  * show this help message and exit
* -a
* --application
  * mode: shell applications in 'Shell:AppsFolder'
* -e
* --exact
  * only exact match
* -H
* --print-header
  * print header
* -i
* --info
  * operation: info
* -I
* --installed
  * mode: installed packages in 'Uninstall' registry
* -l
* --list
  * operation: list
* -p
* --process
  * mode: running processes
* -P
* --package
  * mode: Windows Store packages (UWP)
* -R
* --startup
  * mode: shell startups in shell startup folders, 'Run' registry and UWP configuration
* -s SEPARATOR
* --separator SEPARATOR
  * field separator for output
* -S
* --service
  * mode: Win32 services
* -y
* --yes
  * assume yes
* -z
* --remove
  * operation: remove
* -0
* -k
* --stop
* --kill
  * operation: stop
* -1
* -x
* --start
* --execute
  * operation: start

## RETURN_CODE

Wapctl returns 0 on success, and non-zero on error.

* ENOENT: Found no objects.

## Contributing
Pull requests are welcome.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)

