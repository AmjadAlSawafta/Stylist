# Stylist 🎨

Stylist lets you define UI styles in a hotloadable external yaml or json file

- ✅ **Group styles** in a human readable way
- ✅ Apply styles through code or **Interface Builder**
- ✅ **Hotload** styles to see results immediatly without compiling
- ✅ Built in style properties for all popular **UIKit** classes
- ✅ Reference **variables** for commonly used properties
- ✅ Reference **styles** in other styles for a customizable heirachy
- ✅ Define **custom** properties and custom parsing to set any property you wish

Example style file:

```yaml
variables:
  primaryColor: DB3B3B
  headingFont: Ubuntu
styles:
  primaryButton:
    backgroundImage: buttonBack
    backgroundImage:highlighted: buttonBack-highlighted
    textColor: 55F
    textColor:highlighted: white
    contentEdgeInsets: [10,5]
    font(device:iphone): $headingFont:16
    font(device:ipad): $headingFont:22
  secondaryButton:
    backgroundColor: $primaryColor
    cornerRadius: 10
    textColor: white
    font: 20
    contentEdgeInsets: 6
  sectionHeading:
    font: title 2
    color: darkGray
  themed:
    tintColor: $primaryColor
  mainSection:
    style: [themed]
```

## Style File
A style file has a list of `variables` and a list of `styles` each referenced by name.
Variables can be referenced in styles using `$variableName`.

To set a style on a UIView, simply set it's `style` property:

```
myView.style = "myStyle"
```
A style can also be set in Interface Builder in the property inspector

## Style Properties
Many UIKit views and bar buttons have built in properties that you can set. These can be viewed in [Style Properties](docs/StyleProperties.MD).
Each style can also reference an array other other styles, that will be merged in order

## Custom Properties
Custom properties and parsers can also be added to let you configure anything you wish:

```
Stylist.shared.addProperty("textTransform") { (view: MyView, value: PropertyValue<MyProperty>) in
    view.myProperty = value.value
}
```
`addProperty` takes a style name a simply generic closure that sets your property on your view. This closure can contain any other logic you wish. The view can be NSObject and the property must conform to `StyleValue` which is a simply protocol:

```
public protocol StyleValue {
    associatedtype ParsedType
    static func parse(value: Any) -> ParsedType?
}
```
Many different types of properties are already supported and listed here in [Style Property Types](docs/StyleProperties.MD#types)

The `PropertyValue` that get's passed into the closure will have a `value` property containing your parsed value. It also has a `context` which contains [property query values](docs/StyleProperties.MD#queries) like device type,  UIControlState and UIBarMetrics.

When a style file is loaded or when a style is set on a view, these custom properties will be applied if the view type and property name match.