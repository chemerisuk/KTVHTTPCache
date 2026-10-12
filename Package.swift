// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "KTVHTTPCache",
            targets: ["KTVHTTPCache"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/robbiehanson/CocoaAsyncSocket.git", from: "7.6.5")
    ],
    targets: [
        .target(
            name: "KTVHTTPCache",
            dependencies: ["CocoaAsyncSocket"],
            path: "Sources/KTVHTTPCache",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        )
    ]
)
