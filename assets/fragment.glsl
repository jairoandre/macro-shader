#version 100

precision lowp float;

varying vec2 uv;

uniform vec4 _Time;

void main() {

  vec3 col =  0.5 + 0.5 * cos(_Time.x+uv.xyx+vec3(0,2,4));

  gl_FragColor = vec4(col, 1.0);

}
