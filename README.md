# Instally iOS SDK

Track clicks, installs, and revenue from every link. Lightweight install tracking for iOS apps.

[instally.io](https://instally.io)

## Installation

### Swift Package Manager

Add the package to your `Package.swift` or via Xcode:

```
https://github.com/Instally-io/instally-ios-sdk
```

## Quick Start

### 1. Configure

Call once in your App init or `AppDelegate.didFinishLaunching`:

```swift
import Instally

Instally.configure(appId: "app_xxx", apiKey: "key_xxx")
```

### 2. Track Installs

Call on every app launch. The SDK automatically ensures it only runs once per install:

```swift
Instally.trackInstall { result in
    print("Matched: \(result.matched)")
}
```

### 3. Link User ID

Connect your user ID (e.g. RevenueCat, Qonversion) so server-side webhooks can attribute purchases:

```swift
Instally.setUserId(Purchases.shared.appUserID)
```

Or with an async provider:

```swift
Instally.setUserId { try await Qonversion.shared().userInfo().qonversionId }
```

### 4. Track Purchases (Optional)

If you're not using a server-side integration (RevenueCat, Stripe, etc.), you can track purchases directly:

```swift
Instally.trackPurchase(
    productId: "premium_monthly",
    revenue: 9.99,
    currency: "USD",
    transactionId: "txn_123"
)
```

## API Reference

| Method | Description |
|--------|-------------|
| `Instally.configure(appId:apiKey:)` | Initialize the SDK |
| `Instally.trackInstall(completion:)` | Track install attribution |
| `Instally.trackPurchase(productId:revenue:currency:transactionId:)` | Track a purchase |
| `Instally.setUserId(_:)` | Link an external user ID |
| `Instally.isAttributed` | Whether this install was attributed to a link |
| `Instally.attributionId` | The attribution ID (nil if not attributed) |

## Requirements

- iOS 14.0+
- Swift 5.9+

## Resources

- [Instally Website](https://instally.io) — Track clicks, installs, and revenue from every link
- [Dashboard](https://app.instally.io) — Real-time analytics for your app installs
- [Documentation](https://docs.instally.io) — Full SDK docs and API reference
- [Pricing](https://instally.io/pricing) — Free tier available, no credit card required
- [Blog](https://instally.io/blog) — Guides on install tracking, IDFA, and more

### Other SDKs

- [Android SDK](https://github.com/Instally-io/instally-android-sdk)
- [Flutter SDK](https://github.com/Instally-io/instally-flutter-sdk)
- [React Native SDK](https://github.com/Instally-io/instally-react-native-sdk)

## License

MIT
