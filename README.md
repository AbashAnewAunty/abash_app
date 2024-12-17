# abash_app

A new Flutter project.

## Build

### コード生成

```shell
fvm flutter pub run build_runner build --delete-conflicting-outputs   
```

## Trouble Shooting

### リリースビルドできない

```shell
fvm flutter clean
fvm flutter pub get
cd ios
rm Podfile.lock
pod install --repo-update
```
