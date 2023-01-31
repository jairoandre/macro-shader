#version 100
attribute vec3 position;
attribute vec2 texcoord;

varying highp vec2 uv;

uniform mat4 Model;
uniform mat4 Projection;
uniform float Proportion;
void main() {
  vec4 res = Projection * Model * vec4(position, 1.0);
  uv = vec2(texcoord.x, 1.0 - texcoord.y);
  uv -= 0.5;
  uv.x *= Proportion;
  gl_Position = res;
}