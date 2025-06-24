# Unifi Protect WaterMark
This adds a watermark to UniFi protect cameras 

This is to go with the following [YT video](https://youtu.be/2cx5mDbYJj4) Where i talk about how to do this and change the watermark


``` bash
ssh ubnt@<cameraIP>
wget http://10.0.1.2/images/unifi.png
mv unifi.png user_logo
ubnt_ipc_cli -T=ubnt_osd -r=1 -m='{"functionName":"ChangeOsdSettings", "useCustomLogo":1}'
ubnt_ipc_cli -T=ubnt_osd -r=1 -m='{"functionName":"ChangeOsdSettings", "logoScale":120}'
cfgmtd -w -p /etc/
killall ubnt_osd
```


# The steps are as follows 

1. SSH into the camera, this might need you to turn on SSH on the NVR. The password is the recovery code in unifi protect.
2. Run the commands in the order above, replacing the http url with the url of the watermark you want to add.
3. Done, sometimes a reboot is required to get it to show up on the stream but most of the time it isn't.



## Turn on SSH for the cameras
You may need to turn on SSH for the cameras if you get an error connecting 
 1. SSH into the NVR as root, and then the password set in the controller.
 2. install nano
 3. edit the file to set SSH to true.
 4. Reboot protect 
``` bash
apt-get update; apt-get install nano -y
nano /usr/share/unifi-protect/app/config/default.json
systemctl restart unifi-protect
```

