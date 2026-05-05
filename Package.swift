// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "sonar-store-migration-kit",
    products: [.executable(name: "sonar-store-migration-kit", targets: ["App"])],
    targets: [.executableTarget(name: "App", path: "src")]
)
