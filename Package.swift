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
            name: "KTVCocoaHTTPServer",
            dependencies: [
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket")
            ],
            path: "Framework",
            // Делаем заголовки доступными извне для основного модуля
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        .target(
            name: "KTVHTTPCache",
            dependencies: [
                "KTVCocoaHTTPServer"
            ],
            path: "KTVHTTPCache",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                // Даем доступ к заголовочным файлам локального веб-сервера
                .headerSearchPath("../Framework")
            ]
        )
    ]
)
