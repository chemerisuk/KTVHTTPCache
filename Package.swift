// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "KTVHTTPCache",
            targets: ["KTVHTTPCache"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KTVHTTPCache",
            dependencies: [],
            path: "KTVHTTPCache",
            // Указываем "." вместо "include", так как заголовки лежат прямо в корне папки
            publicHeadersPath: ".", 
            cSettings: [
                // Добавляем пути для поиска внутренних заголовочных файлов вендоров
                .headerSearchPath("../Framework"),
                .headerSearchPath("../Vendors/CocoaAsyncSocket")
            ]
        )
    ]
)
