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
            dependencies: [
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket")
            ],
            path: ".",
            sources: [
                "KTVHTTPCache",
                "Framework"
            ],
            publicHeadersPath: "KTVHTTPCache",
            cSettings: [
                .headerSearchPath("KTVHTTPCache"),
                .headerSearchPath("Framework")
            ]
        )
    ]
)
