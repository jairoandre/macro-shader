#version 100

precision lowp float;

varying vec2 uv;

uniform vec4 _Time;

void main() {

  vec3 col = vec3(0);

  col.rg = uv;

  col.b = sqrt(length(uv));

  gl_FragColor = vec4(col, 1.0);

}
