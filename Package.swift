// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "swift-pixelfed-directory",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "PixelfedDirectoryClient",
            targets: ["PixelfedDirectoryClient"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-openapi-generator",
            from: "1.6.0"
        ),
        .package(
            url: "https://github.com/apple/swift-openapi-runtime",
            from: "1.7.0"
        ),
        .package(
            url: "https://github.com/apple/swift-openapi-urlsession",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/mattpolzin/OpenAPIKit",
            from: "3.4.0"
        ),
        .package(
            url: "https://github.com/jpsim/Yams",
            from: "5.1.3"
        ),
    ],
    targets: [
        .target(
            name: "PixelfedDirectoryClient",
            dependencies: [
                .product(
                    name: "OpenAPIRuntime",
                    package: "swift-openapi-runtime"
                ),
                .product(
                    name: "OpenAPIURLSession",
                    package: "swift-openapi-urlsession"
                ),
            ],
            plugins: [
                .plugin(
                    name: "OpenAPIGenerator",
                    package: "swift-openapi-generator"
                )
            ]
        ),
        .executableTarget(
            name: "PixelfedDirectoryOpenAPIDocument",
            dependencies: [
                .product(
                    name: "OpenAPIKit",
                    package: "OpenAPIKit"
                ),
                .product(
                    name: "Yams",
                    package: "Yams"
                )
            ]
        ),
        .testTarget(
            name: "PixelfedDirectoryClientTests",
            dependencies: ["PixelfedDirectoryClient"]
        ),
    ]
)
