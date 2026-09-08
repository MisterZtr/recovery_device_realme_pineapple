#  OrangeFox recovery tree for relame devices with qualcomm processor codenamed pineapple

Platforms, included under realme's codename "pineapple", are:
- Qualcomm Snapdragon 8 Gen 3 (SM8650)
- Qualcomm Snapdragon 8s Gen 3 (SM8635)
- Qualcomm Snapdragon 7+ Gen 3 (SM7675)</br>

Devices, that can run and will run this recovery without any sudden and unforseen issues:
- realme GT5 Pro (enzo / RMX3888 / RE5C37)
- realme GT Neo6 (bale / RMX3852 / RE5C46L1)
- realme GT6 Global (bale / RMX3851 / RE5CA6L1)
- realme GT Neo 6SE (bale / RMX3850 / RE5C39L1)
- realme GT6T (bale / RMX3853 / RE606FL1)
- realme GT6 CN (divo / RMX3800 / RE5C4FL1)</br>

## Features

Works:

- ADB
- Display
- Fasbootd
- Flashing
- Sideload
- USB OTG
- Touch
- Flashlight
- Vibrator/Haptic
- OTA/Payload
- User data decryption

Issues:

- Installing OTA updates for Android 17 and above is not supported: the outdated recovery base cannot properly merge snapshots during an update
- OTA updates will not work if you flashed via the standard full mode in Fastboot Firmware Flasher, as using that mode breaks partition groups inside the super partition itself. However, the tool also includes a built-in Super flasher that does not break super, which avoids this issue

# Building

```bash
git clone https://github.com/realme-pineapple-devs/recovery_device_realme_pineapple.git device/realme/pineapple
. build/envsetup.sh
breakfast twrp_pineapple-bp2a-eng
make installclean
mka adbd recoveryimage
```

## To use it:

```
fastboot flash recovery out/target/product/pineapple/recovery.img
```
