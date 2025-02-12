shader_type canvas_item;
render_mode unshaded;

uniform vec4 color : source_color; 
uniform float angle : hint_range(0,360); 
uniform float max_dist : hint_range(0,1000) = 100; 
uniform sampler2D gradientTexture;

vec4 get_gradient_color(float position) { 
    return texture(gradientTexture, vec2(position, 0.5)); 
}

void fragment() { 
    float ang_rad = angle * 3.1416 / 180.0;
    vec2 dir = vec2(sin(ang_rad),cos(ang_rad)); 
    vec2 at = screen_uv_to_sdf(SCREEN_UV); 
    float accum = 0.0;
    while(accum < max_dist) {
        float d = texture_sdf(at);
        accum+=d;
        if (d < 0.01) {
            break;
        }
        at += d * dir;
    }
    float alpha = 1.0-min(1.0,accum/max_dist);
    
    // the gradient controls the falloff of the shadow
    alpha = get_gradient_color(alpha).r;
    
    COLOR = vec4(color.rgb,alpha * color.a);
}