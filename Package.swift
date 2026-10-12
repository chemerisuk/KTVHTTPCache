// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "KTVHTTPCache",
    platforms: [.iOS(.v12), .macOS(.v10_14)],
    products: [
        .library(name: "KTVHTTPCache", targets: ["KTVHTTPCache"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KTVHTTPCache",
            dependencies: [],
            path: "KTVHTTPCache", // Укажите путь к папке с исходным кодом библиотеки
            publicHeadersPath: "include"
        )
    ]
)
