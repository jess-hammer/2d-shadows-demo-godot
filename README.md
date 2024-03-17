# 2d-shadows-demo-godot
 This project is a demo of how to use a shader to create 2D directional shadows! You can customise the color, length, angle and softness of the shadows. The shader uses Signed Distance Fields provided by the Godot engine.

> Built with Godot 4.1.2

### With soft shadows:
<img width="1438" alt="Screenshot of shadows demo" src="https://github.com/jess-hammer/2d-shadows-demo-godot/assets/59108399/4a3cc525-f1d5-42e9-b82b-cd1dcfe6b7cb">

### With hard shadows:
(Adjust the gradient in the shader params to acheive this)

<img width="600" alt="Screenshot 2024-02-05 at 5 29 47 pm" src="https://github.com/jess-hammer/2d-shadows-demo-godot/assets/59108399/00e5a4f5-17c1-406b-9bae-51605aa08110" align="center">

### SDF performance and quality
On my M1 Macbook Pro, I found that this shader ran fine. However, I noticed some framerate issues when the resolution is particularly large, for example on an ultra-wide monitor. Thankfully Godot provides some project settings that helps us combat this:
- `Oversize` controls how much of the original viewport size should be covered by the 2D signed distance field.
- `Scale` is the resolution scale to use for the 2D signed distance field. Higher values lead to a more precise and more stable signed distance field as the camera moves, at the cost of performance. The default value (50%) renders at half the resolution of the viewport size on each axis, which means the SDF is generated with 25% of the viewport's pixel count.

![Screenshot 2024-03-17 at 11 50 12 AM](https://github.com/jess-hammer/2d-shadows-demo-godot/assets/59108399/566d4229-1570-4263-998c-f1d8d68c8562)


### References:
Pixel art assets are from https://cupnooble.itch.io/sprout-lands-asset-pack

Shader code heavily based from https://godotengine.org/article/godots-2d-engine-gets-several-improvements-upcoming-40/
