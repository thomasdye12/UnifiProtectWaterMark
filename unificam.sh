wget http://10.0.1.2/images/unifi.png
mv unifi.png user_logo
ubnt_ipc_cli -T=ubnt_osd -r=1 -m='{"functionName":"ChangeOsdSettings", "useCustomLogo":1}'
ubnt_ipc_cli -T=ubnt_osd -r=1 -m='{"functionName":"ChangeOsdSettings", "logoScale":120}'
cfgmtd -w -p /etc/
killall ubnt_osd
