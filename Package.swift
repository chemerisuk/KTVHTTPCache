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
            path: "KTVHTTPCache",
            // Исключаем демо-файлы, если они есть
            exclude: [],
            // Указываем компилятору собирать код и из Classes, и из CocoaHTTPServer
            sources: [
                "KTVHTTPCache.h",
                "Classes",
                "CocoaHTTPServer"
            ],
            // Делаем корень публичным, чтобы заголовок KTVHTTPCache.h был доступен вашему приложению
            publicHeadersPath: ".",
            cSettings: [
                // Базовые пути поиска заголовков фреймворка
                .headerSearchPath("."),
                .headerSearchPath("Classes"),
                .headerSearchPath("CocoaHTTPServer"),
                // Глубокие пути поиска для внутренних модулей (исправляет ошибку с KTVHCPathTool.h)
                .headerSearchPath("Classes/KTVHCAudio"),
                .headerSearchPath("Classes/KTVHCCommon"),
                .headerSearchPath("Classes/KTVHCDataStorage"),
                .headerSearchPath("Classes/KTVHCLOG"),
                .headerSearchPath("Classes/KTVHTTPURLService"),
                .headerSearchPath("Classes/KTVHCTools")
            ]
        )
    ]
)
