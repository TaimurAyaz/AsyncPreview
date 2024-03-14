# AsyncPreview

Preview views with asynchronous dependencies, on Xcode canvas.

## Usage

```
#Preview {
    AsyncModel { model in
        SomeView().environment(model)
    } model: {
        try await SomeAsynchronousModel()
    }
}
```
