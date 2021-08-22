#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec4 clipSpace;

void main() {
    vec4 worldPosition = ubo.model * vec4(inPosition, 1.0);

    clipSpace = ubo.proj * ubo.view * worldPosition;
    gl_Position = clipSpace;
}