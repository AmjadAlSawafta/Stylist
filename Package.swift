// swift-tools-version: 5.4
import PackageDescription

let package = Package(
    name: "Stylist",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "Stylist", targets: ["Stylist"]),
    ],
    targets: [
        .target(name: "Stylist",
                path: "Stylist",
                exclude: ["Resources/Original",
                          "Resources/README.md",
                          "Resources/update_metadata.sh",
                          "Info.plist"],
                resources: [
                    .process("Resources/PhoneNumberMetadata.json")
                ]),
        .testTarget(name: "Tests",
                    dependencies: ["Stylist"],
                    path: "Tests",
                    exclude: ["Info.plist"])
    ]
)
