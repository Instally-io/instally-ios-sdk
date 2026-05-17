# Instally iOS SDK

Track clicks, installs, and revenue from every link you share. See which links actually drive installs and revenue for your iOS app. Privacy-preserving attribution — no IDFA, no ATT prompt.

![Platform](https://img.shields.io/badge/platform-iOS%2014%2B-black)
![Swift](https://img.shields.io/badge/swift-5.9%2B-orange)
![License](https://img.shields.io/badge/license-MIT-black)

**[Website](https://instally.io)** | **[Documentation](https://docs.instally.io)** | **[Blog](https://instally.io/blog)** | **[Sign Up Free](https://app.instally.io/signup)**

## Features

- 3-line integration — configure, track, done
- No IDFA, no ATT prompt, no special permissions
- Per-link install and revenue tracking
- Real-time dashboard
- Webhook integrations with RevenueCat, Superwall, Adapty, Qonversion, and Stripe
- SwiftUI and UIKit compatible
- Zero third-party dependencies

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
| `Instally.resetForTesting()` | Clear cached attribution state during development testing |
| `Instally.isAttributed` | Whether this install was attributed to a link |
| `Instally.attributionId` | The attribution ID (nil if not attributed) |

## Testing Attribution

Development builds are supported. For the cleanest test, click the tracking link
once on the same physical device you open the app on, then launch the app within
a few minutes.

Avoid repeated clicks before opening the app. Multiple recent unmatched clicks
from the same device or network can be treated as ambiguous and return
`matched=false`.

`trackInstall()` is cached per app install, including `matched=false` results.
When retrying on the same dev build, uninstall/reinstall the app or clear the SDK
cache in development:

```swift
#if DEBUG
Instally.resetForTesting()
#endif
```

## FAQ

### Do I need to show an ATT prompt?

No. The SDK does not request the IDFA, so iOS does not require the ATT prompt.

### Does it work with RevenueCat or Stripe?

Yes. Call `Instally.setUserId(...)` to link your subscription-platform user ID, then configure the Instally webhook in the dashboard. Purchases are automatically attributed to the link that drove the install. See the [RevenueCat integration guide](https://instally.io/blog/revenuecat-instally-integration).

### What's the SDK size?

Under 50 KB. Zero third-party dependencies.

### Where can I see my data?

Real-time dashboard at [app.instally.io](https://app.instally.io) — clicks, installs, revenue, per-link breakdown.

## Requirements

- iOS 14.0+
- Swift 5.9+

## Learn More

- [How to Track App Installs in iOS (Swift)](https://instally.io/blog/how-to-track-app-installs-ios) — full integration walkthrough
- [Instally vs AppsFlyer vs Branch](https://instally.io/blog/instally-vs-appsflyer-vs-branch) — competitor comparison

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
