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
            path: "Framework",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        // 2. Основной таргет KTVHTTPCache
        .target(
            name: "KTVHTTPCache",
            dependencies: [
                "KTVCocoaHTTPServer"
            ],
            path: "KTVHTTPCache",
            // Исключаем внутренний CocoaHTTPServer, так как он скомпилирован в отдельном таргете выше
            exclude: ["CocoaHTTPServer"],
            // Явно перечисляем папки с исходным кодом, включая KTVHTTPCache.h из корня
            sources: [
                "KTVHTTPCache.h",
                "Classes"
            ],
            // Делаем корень публичным, чтобы заголовок KTVHTTPCache.h был доступен извне
            publicHeadersPath: ".", 
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("Classes"),
                .headerSearchPath("../Framework"),
                // Добавляем поисковые пути для всех вложенных папок, чтобы исправить ошибку с KTVHCPathTool.h
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
