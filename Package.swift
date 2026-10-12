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
        // 1. Внутренний веб-сервер библиотеки
        .target(
            name: "KTVCocoaHTTPServer",
            dependencies: [
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket")
            ],
            path: "KTVHTTPCache/CocoaHTTPServer",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                // Прописываем путь к заголовкам CocoaAsyncSocket в папке сборки SPM
                .headerSearchPath("../../../CocoaAsyncSocket/Source")
            ]
        ),
        // 2. Основной модуль KTVHTTPCache со всеми поисковыми путями для подпапок
        .target(
            name: "KTVHTTPCache",
            dependencies: [
                "KTVCocoaHTTPServer"
            ],
            path: "KTVHTTPCache/Classes",
            publicHeadersPath: ".", 
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath(".."), // Для доступа к зонтичному KTVHTTPCache.h
                .headerSearchPath("../CocoaHTTPServer"), // Для доступа к соседнему серверу
                // Добавляем все внутренние папки Classes, чтобы не сыпались ошибки вроде KTVHCPathTool.h
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
