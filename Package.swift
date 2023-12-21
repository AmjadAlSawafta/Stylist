// swift-tools-version: 5.4
import PackageDescription

let package = Package(
    name: "Stylist",
    platforms: [
        .iOS(.v9)            
    ],
    products: [
        .library(name: "Stylist", targets: ["Stylist"]),
    ],
     dependencies: [
        .package(url: "https://github.com/krzysztofzablocki/KZFileWatchers.git", .branch("master")),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.6")
    ],
    targets: [
        .target(name: "Stylist",
                dependencies: [
                    "KZFileWatchers",
                    "Yams"
                ],
                path: "Stylist",
                exclude: [
                        "Info.plist"
                ],
                resources: [
                ]),
        .testTarget(name: "Tests",
                    dependencies: ["Stylist"],
                    path: "Tests",
                    exclude: ["Info.plist"])
    ]
)
