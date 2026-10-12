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
        // 1. Исправляем путь к серверу — он находится внутри KTVHTTPCache/CocoaHTTPServer
        .target(
            name: "KTVCocoaHTTPServer",
            dependencies: [
                .product(name: "CocoaAsyncSocket", package: "CocoaAsyncSocket")
            ],
            path: "KTVHTTPCache/CocoaHTTPServer",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        // 2. Исправляем Layout для основного модуля
        .target(
            name: "KTVHTTPCache",
            dependencies: [
                "KTVCocoaHTTPServer"
            ],
            path: "KTVHTTPCache",
            // Исключаем CocoaHTTPServer из компиляции этого таргета, так как он вынесен выше
            exclude: ["CocoaHTTPServer"], 
            // Явно указываем файлы для сборки, чтобы SPM не путал вложенные папки
            sources: ["Classes"],
            // Указываем конкретную точку входа для публичных заголовков
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("Classes"),
                .headerSearchPath("CocoaHTTPServer")
            ]
        )
    ]
)
