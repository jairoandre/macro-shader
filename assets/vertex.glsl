#version 100
attribute vec3 position;
attribute vec2 texcoord;

varying lowp vec2 uv;

uniform mat4 Model;
uniform mat4 Projection;
uniform float Proportion;
void main() {
  vec4 res = Projection * Model * vec4(position, 1.0);
  uv = texcoord;
  uv.y *= Proportion;
  uv = vec2(uv.x, 1. - uv.y);
  gl_Position = res;
}