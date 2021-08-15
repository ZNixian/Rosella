#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inNormal;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec3 surfaceNormal;
layout(location = 1) out vec2 fragTexCoord;
layout(location = 2) out vec3 toLightVector;

void main() {
    vec4 worldPosition = ubo.model * vec4(inPosition, 1.0);
    gl_Position = ubo.proj * ubo.view * worldPosition;
    fragTexCoord = inTexCoord;

    // CONSTANTS
    vec3 lightPosition = vec3(0.0, 1.0, 0.0);

    surfaceNormal = (ubo.model * vec4(inNormal, 0.0)).xyz;
    toLightVector = lightPosition - worldPosition.xyz;
}