# Kali Tools Wifite2
[![Solid00](https://camo.githubusercontent.com/f42cc52be78e6cf23a93ecae7dda9799660fe87b/68747470733a2f2f692e696d6775722e636f6d2f51354b534462672e676966)](https://github.com/D3vD3m0n/)

---


----------

Install Realtek / Alfa Cards:
----------
RTL8812AU/21AU and RTL8814AU drivers with monitor mode and frame injection

https://github.com/4k4xs4pH1r3/realtek


----------

Clean the Enviroment:
----------
```shell
rm -r /usr/share/hcxtools/ /usr/share/hcxdumptool/ /usr/share/cowpatty/ /usr/share/bully/ /usr/share/wifite2/ /usr/local/lib/python2.7/dist-packages/cpyrit/
```


Edit APT Repo
----------
```shell
nano /etc/apt/sources.list
```
Add this repo
```shell
deb http://ftp.debian.org/debian/ stretch main contrib non-free
```

This will install `wifite`
----------
```shell
sudo pat install dirmngr -y && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010 04EE7237B7D453EC EF0F382A1A7B6500 && apt-get update -y && apt-get upgrade -y && apt-get install python2.7-dev python3 python-dev python3-dev libssl-dev build-essential libssl-dev libblas-dev libatlas-base-dev libpq-dev libffi-dev zlib1g-dev libxml2-dev libxslt1-dev zlib1g-dev libpcap-dev python-pip libpcap-dev -y && apt-get remove --purge pyrit -y && pip install psycopg2 && pip install --upgrade wheel pip install scapy && apt-get install python-scapy && pip list --outdated && pip install --upgrade wheel && pip install --upgrade setuptools && cd /usr/share/ && git clone https://github.com/JPaulMora/Pyrit.git && cd Pyrit && python setup.py clean && python setup.py build && python setup.py install && pip install psycopg2-binary && sudo pip install virtualenvwrapper && pip install scrapy && apt install neofetch git make clang libpcap-dev reaver tshark wireshark aircrack-ng pixiewps libssl-dev libcurl4-openssl-dev libpcap0.8-dev libcurl4-doc libidn11-dev libkrb5-dev libldap2-dev librtmp-dev libssh2-1-dev libssl-doc -y && cd /usr/share/ && git clone https://github.com/ZerBea/hcxtools.git && cd hcxtools && make && make install && cd /usr/share && git clone https://github.com/ZerBea/hcxdumptool.git  && cd hcxdumptool && make && make install && cd /usr/share && git clone https://github.com/joswr1ght/cowpatty.git && cd cowpatty && make && make install && cd /usr/share && git clone https://github.com/aanarchyy/bully.git && cd bully/src && make && make install && neofetch && cd /usr/share && git clone https://github.com/4k4xs4pH1r3/wifite2.git && cd wifite2 && sudo python setup.py install && neofetch
```

----------
Set interface down + monitor mode + activate interface + TX power
----------

  ```shell
  airmon-ng check kill && sudo service NetworkManager restart && sudo ip link set wlan0 down && sudo iw dev wlan0 set type monitor && sudo ip link set wlan0 up && sudo iw wlan0 set txpower fixed 3737373737373
  ```
  
  You may also uncheck the box "Automatically connect to this network when it is avaiable" in nm-connection-editor. This only works if you have a saved wifi connection.


----------

To start Wifite in Ninja Mode
----------

Excute the below command and it will automatically start to capture and decrypt the password.


```shell
wifite --kill --nodeauths --ignore-locks --keep-ivs -p 1337 -mac -v
```


Wifite is designed to use all known methods for retrieving the password of a wireless access point (router).  These methods include:
1. WPS: The [Offline Pixie-Dust attack](https://en.wikipedia.org/wiki/Wi-Fi_Protected_Setup#Offline_brute-force_attack)
1. WPS: The [Online Brute-Force PIN attack](https://en.wikipedia.org/wiki/Wi-Fi_Protected_Setup#Online_brute-force_attack)
2. WPA: The [WPA Handshake Capture](https://hashcat.net/forum/thread-7717.html) + offline crack.
3. WPA: The [PMKID Hash Capture](https://hashcat.net/forum/thread-7717.html) + offline crack.
4. WEP: Various known attacks against WEP, including *fragmentation*, *chop-chop*, *aireplay*, etc.


Supported Operating Systems
---------------------------
Wifite is designed specifically for the latest version of [**Kali** Linux](https://www.kali.org/). [ParrotSec](https://www.parrotsec.org/). [Ubuntu](http://releases.ubuntu.com/disco/) is also supported.

Other pen-testing distributions (such as BackBox or Ubuntu) have outdated versions of the tools used by Wifite. Do not expect support unless you are using the latest versions of the *Required Tools*, and also [patched wireless drivers that support injection]().

Components that use Wifite
--------------
First and foremost, you will need a wireless card capable of "Monitor Mode" and packet injection (see [this tutorial for checking if your wireless card is compatible](http://www.aircrack-ng.org/doku.php?id=compatible_cards) and also [this guide](https://en.wikipedia.org/wiki/Wi-Fi_Protected_Setup#Offline_brute-force_attack)). There are many cheap wireless cards that plug into USB available from online stores.

Second, only the latest versions of these programs are supported and Wifite needs to work properly:


* `python`: Wifite is compatible with both `python2` and `python3`.
* [`iwconfig`](https://wiki.debian.org/iwconfig): For identifying wireless devices already in Monitor Mode.
* [`ifconfig`](https://en.wikipedia.org/wiki/Ifconfig): For starting/stopping wireless devices.
* [`Aircrack-ng`](http://aircrack-ng.org/) suite, includes:
   * [`airmon-ng`](https://tools.kali.org/wireless-attacks/airmon-ng): For enumerating and enabling Monitor Mode on wireless devices.
   * [`aircrack-ng`](https://tools.kali.org/wireless-attacks/aircrack-ng): For cracking WEP .cap files and WPA handshake captures.
   * [`aireplay-ng`](https://tools.kali.org/wireless-attacks/aireplay-ng): For deauthing access points, replaying capture files, various WEP attacks.
   * [`airodump-ng`](https://tools.kali.org/wireless-attacks/airodump-ng): For target scanning & capture file generation.
   * [`packetforge-ng`](https://tools.kali.org/wireless-attacks/packetforge-ng): For forging capture files.

* [`tshark`](https://www.wireshark.org/docs/man-pages/tshark.html): For detecting WPS networks and inspecting handshake capture files.
* [`reaver`](https://github.com/t6x/reaver-wps-fork-t6x): For WPS Pixie-Dust & brute-force attacks.
   * Note: Reaver's `wash` tool can be used to detect WPS networks if `tshark` is not found.
* [`bully`](https://github.com/aanarchyy/bully): For WPS Pixie-Dust & brute-force attacks.
   * Alternative to Reaver. Specify `--bully` to use Bully instead of Reaver.
   * Bully is also used to fetch PSK if `reaver` cannot after cracking WPS PIN.
* [`coWPAtty`](https://tools.kali.org/wireless-attacks/cowpatty): For detecting handshake captures.
* [`pyrit`](https://github.com/JPaulMora/Pyrit): For detecting handshake captures.
* [`hashcat`](https://hashcat.net/): For cracking PMKID hashes.
   * [`hcxdumptool`](https://github.com/ZerBea/hcxdumptool): For capturing PMKID hashes.
   * [`hcxpcaptool`](https://github.com/ZerBea/hcxtools): For converting PMKID packet captures into `hashcat`'s format.
----------
```
```



Brief Feature List
------------------
* [PMKID hash capture](https://hashcat.net/forum/thread-7717.html) (enabled by-default, force with: `--pmkid`)
* WPS Offline Brute-Force Attack aka "Pixie-Dust". (enabled by-default, force with: `--wps-only --pixie`)
* WPS Online Brute-Force Attack aka "PIN attack". (enabled by-default, force with: `--wps-only --no-pixie`)
* WPA/2 Offline Brute-Force Attack via 4-Way Handshake capture (enabled by-default, force with: `--no-wps`)
* Validates handshakes against `pyrit`, `tshark`, `cowpatty`, and `aircrack-ng` (when available)
* Various WEP attacks (replay, chopchop, fragment, hirte, p0841, caffe-latte)
* Automatically decloaks hidden access points while scanning or attacking.
   * Note: Only works when channel is fixed. Use `-c <channel>`
   * Disable this using `--no-deauths`
* 5Ghz support for some wireless cards (via `-5` switch).
   * Note: Some tools don't play well on 5GHz channels (e.g. `aireplay-ng`)
* Stores cracked passwords and handshakes to the current directory (`--cracked`)
   * Includes information about the cracked access point (Name, BSSID, Date, etc).
* Easy to try to crack handshakes or PMKID hashes against a wordlist (`--crack`)

* **Less bugs**
   * Cleaner process management. Does not leave processes running in the background (the old `wifite` was bad about this).
   * No longer "one monolithic script". Has working unit tests. Pull requests are less-painful!
* **Speed**
   * Target access points are refreshed every second instead of every 5 seconds.
* **Accuracy**
   * Displays realtime Power level of currently-attacked target.
   * Displays more information during an attack (e.g. % during WEP chopchop attacks, Pixie-Dust step index, etc)
* **Educational**
   * The `--verbose` option (expandable to `-vv` or `-vvv`) shows which commands are executed & the output of those commands.
   * This can help debug why Wifite is not working for you. Or so you can learn how these tools are used.
* More-actively developed.
* Python 3 support.
* Sweet new ASCII banner.

What's gone?
------------
* Some command-line arguments (`--wept`, `--wpst`, and other confusing switches).
   * You can still access some of these obscure options, try `wifite -h -v`

**Note:** Uninstalling is [not as easy](https://stackoverflow.com/questions/1550226/python-setup-py-uninstall#1550235). The only way to uninstall is to record the files installed by the above command and *remove* those files:

```bash
sudo python setup.py install --record files.txt \
  && cat files.txt | xargs sudo rm \
  && rm -f files.txt
```

---
[![Solid01](https://thecybersecuritymancom.files.wordpress.com/2018/03/wifite-logo-2.png?w=792)](https://github.com/D3vD3m0n/)