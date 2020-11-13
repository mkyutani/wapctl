python wapctl --help

python wapctl pkg start calc -y
python wapctl p
python wapctl p list wap-name-which-does-not-exist
python wapctl p list calc
python wapctl p show calc -s, -H
python wapctl p stop calculator -y

python wapctl a
python wapctl a list wap-name-which-does-not-exist
python wapctl a list “d‘ì
python wapctl a show “d‘ì -s, -H
python wapctl a start “d‘ì -y
python wapctl p show calculator -s, -H
python wapctl p stop calculator -y

python wapctl ins
python wapctl ins list wap-name-which-does-not-exist
python wapctl ins list zoom
python wapctl ins show zoom -s, -H
python wapctl ins remove zoom

python wapctl pkg
python wapctl pkg list wap-name-which-does-not-exist
python wapctl pkg list microsoft.microsoftedge
python wapctl pkg show microsoft.microsoftedge -s, -H
python wapctl pkg start microsoft.microsoftedge -y
python wapctl p show msedge -s, -H
python wapctl p stop msedge -y
python wapctl pkg remove paint

python wapctl svc
python wapctl svc list wap-name-which-does-not-exist
python wapctl svc list docker
python wapctl svc show docker -s, -H
python wapctl svc stop docker -y
python wapctl svc show docker -s, -H
python wapctl svc start docker -y
python wapctl svc show docker -s, -H

python wapctl run
python wapctl run list wap-name-which-does-not-exist
python wapctl run list docker
python wapctl run show docker -s, -H
python wapctl run stop docker -y
python wapctl run show docker -s, -H
python wapctl run start docker -y
python wapctl run show docker -s, -H
