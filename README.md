# abash_app

A new Flutter project.

## Trouble Shooting

### リリースビルドできない

```shell
fvm flutter clean
fvm flutter pub get
cd ios
rm Podfile.lock
pod install --repo-update
```
