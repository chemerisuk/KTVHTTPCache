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
        .package(url: "https://github.com", from: "7.6.5")
    ],
    targets: [
        // 1. Внутренний веб-сервер библиотеки
        .target(
            name: "KTVCocoaHTTPServer",
            dependencies: [
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket")
            ],
            path: "Framework",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        // 2. Основной таргет со всеми внутренними путями Objective-C
        .target(
            name: "KTVHTTPCache",
            dependencies: [
                "KTVCocoaHTTPServer"
            ],
            path: "KTVHTTPCache/Classes",
            publicHeadersPath: ".", 
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath(".."),
                .headerSearchPath("../../Framework"),
                // Добавляем пути к подпапкам внутри Classes:
                .headerSearchPath("KTVHCAudio"),
                .headerSearchPath("KTVHCCommon"),
                .headerSearchPath("KTVHCDataStorage"),
                .headerSearchPath("KTVHCLOG"),
                .headerSearchPath("KTVHTTPURLService"),
                .headerSearchPath("KTVHCTools")
            ]
        )
    ]
)
