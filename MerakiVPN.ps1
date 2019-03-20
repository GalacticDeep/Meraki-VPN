#Adding a Meraki VPN connection to a Windows Device
#Ben Stitt
#3/20/2019

#Based on the GUI directions from Meraki's how-to: https://documentation.meraki.com/MX/Client_VPN/Client_VPN_OS_Configuration#Windows_10
#Tested in Windows 10 and I'm unsure of its functionality in Windows 7 or 8. Should work on Server 2012 and up, but not tested.
#furthermore, by changing the parameters you can use this for just about any VPN you would set up with Windows 10

$connectionName =  "Bumbledore" #whatever you want to name your connection
$serverAddress = "127.0.0.1" #can be either IP address or DNS of the VPN server you are connecting to. Meraki VPN will show what it is on the VPN page of the Meraki dashboard
$preSharedKey = "superawesomehexnumberthing" #Meraki dashboard for VPN will show Pre-Shared Key (PSK)


# you will get a prompt for transmitting a secret key over unsecure test stream. Press "Y" to continue, or alternatively you can add, "-y" to the end of the powershell command
Add-VpnConnection -Name $connectionName -ServerAddress $serverAddress -TunnelType L2tp -RememberCredential -AuthenticationMethod Pap -EncryptionLevel Optional -L2tpPsk $preSharedKey
