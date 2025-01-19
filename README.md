# **Toastify Documentation**

## **Overview**

**Toastify** is a lightweight SwiftUI framework designed to display customizable toast messages across the app. It supports persistent toasts that stay visible even when navigating between screens. This framework makes it easy to add non-intrusive, brief notifications that enhance user interaction without disrupting the app's flow.


## **Installation**

### 1. **Using Swift Package Manager**
You can add **Toastify** to your project by using Swift Package Manager:

1. Open your Xcode project.
2. Go to `File > Swift Packages > Add Package Dependency`.
3. Enter the repository URL for **Toastify** (e.g., `https://github.com/vasantp20/Toastify.git`).
4. Follow the prompts to add the package.

### 2. **Manual Installation**
To manually add **Toastify** to your project:
1. Clone the repository.
2. Drag the `Toastify` folder into your Xcode project.
3. Ensure that `Toastify` is listed under the `Link Binary with Libraries` section in your target's settings.

## **Usage**

### **Basic Toast**

You can display a simple toast message with the `showToast` function:

```swift
import Toastify
