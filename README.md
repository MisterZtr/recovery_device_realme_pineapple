#  Recovery tree for Relame devices with qualcomm processor codenamed pineapple

It can be launched on Realme GT6 Global and China, Realme GT Neo 6 and Realme GT5 PRO
It is also possible to run on the Realme GT 6T/Neo 6 SE, and other devices with this series of processors

## Features

Works:

- [X] ADB
- [ ] Decryption with a password
- [ ] Data format works strangely
- [X] Display
- [X] Fasbootd
- [X] Flashing
- [X] MTP
- [X] Sideload
- [X] USB OTG
- [X] SD Card
- [X] Touch
- [X] Flashlight
- [X] Vibrator(Partly)
- [ ] OTA

# Building

## First version of tree made from scratch:
```bash
git clone https://github.com/MisterZtr/recovery_device_realme_pineapple.git device/realme/pineapple -b ver1
source build/envsetup.sh
lunch twrp_pineapple-eng
mka adbd recoveryimage
```

## Second version is based on a tree from Oneplus 12:
```bash
git clone https://github.com/MisterZtr/recovery_device_realme_pineapple.git device/realme/pineapple -b ver2
git clone https://github.com/MisterZtr/recovery_device_realme_sm86xx-common.git device/realme/sm86xx-common
source build/envsetup.sh
lunch twrp_pineapple-eng
mka adbd recoveryimage
```

## To use it:

```
fastboot flash recovery out/target/product/pineapple/recovery.img
```
