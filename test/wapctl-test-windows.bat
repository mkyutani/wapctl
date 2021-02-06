python wapctl --help

python wapctl -pkg1 calc -y
python wapctl -p
python wapctl -pl wap-name-which-does-not-exist
python wapctl -pl calc
python wapctl -pi calc -s, -H
python wapctl -p0 calculator -y

python wapctl -a
python wapctl -al wap-name-which-does-not-exist
python wapctl -al “d‘ì
python wapctl -ai “d‘ì -s, -H
python wapctl -a1 “d‘ì -y
python wapctl -pi calculator -s, -H
python wapctl -p0 calculator -y

python wapctl -I
python wapctl -Il wap-name-which-does-not-exist
python wapctl -Il zoom
python wapctl -Ii zoom -s, -H
python wapctl -Iz zoom

python wapctl -P
python wapctl -Pl wap-name-which-does-not-exist
python wapctl -Pl Microsoft.MicrosoftEdge
python wapctl -Pi Microsoft.MicrosoftEdge -e -s, -H
python wapctl -P1 Microsoft.MicrosoftEdge -e -y
python wapctl -pi msedge -s, -H
python wapctl -p0 msedge -y
python wapctl -Pz paint

python wapctl -S
python wapctl -Sl wap-name-which-does-not-exist
python wapctl -Sl docker
python wapctl -Si docker -s, -H
python wapctl -S0 docker -y
python wapctl -Si docker -s, -H
python wapctl -S1 docker -y
python wapctl -Si docker -s, -H

python wapctl -R
python wapctl -Rl wap-name-which-does-not-exist
python wapctl -Rl docker
python wapctl -Ri docker -s, -H
python wapctl -R0 docker -y
python wapctl -Ri docker -s, -H
python wapctl -R1 docker -y
python wapctl -Ri docker -s, -H

python wapctl -pi > wapctl-test-windows.log
