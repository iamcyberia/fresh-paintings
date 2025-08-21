#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec4 lightColor;
in vec2 texCoord0;
in vec2 texCoord1;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
    ivec4 icol = ivec4(round(texelFetch(Sampler0, ivec2(texCoord0 * textureSize(Sampler0, 0)), 0) * 255));

    switch (icol.a) {
        case 252: color.a = 1.0; break;
        default: color *= lightColor * vertexColor; break;
    }
    color *= ColorModulator;

    if (color.a < 0.1) {
        discard;
    }
    fragColor = apply_fog(
        color,
        sphericalVertexDistance,
        cylindricalVertexDistance,
        FogEnvironmentalStart,
        FogEnvironmentalEnd,
        FogRenderDistanceStart,
        FogRenderDistanceEnd,
        FogColor
        );
}
