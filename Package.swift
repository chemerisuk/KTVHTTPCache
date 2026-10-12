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
        // 1. Выделяем внутренний веб-сервер в отдельный таргет
        .target(
            name: "KTVCocoaHTTPServer",
            dependencies: [
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket")
            ],
            path: "Framework",
            publicHeadersPath: "."
        ),
        // 2. Основной таргет KTVHTTPCache, зависящий от сервера
        .target(
            name: "KTVHTTPCache",
            dependencies: [
                "KTVCocoaHTTPServer"
            ],
            path: "KTVHTTPCache",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("../Framework")
            ]
        )
    ]
)
