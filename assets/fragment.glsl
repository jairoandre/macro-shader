#version 100

precision lowp float;

varying vec2 uv;

uniform vec4 _Time;

vec2 N22(vec2 p) {
  vec3 a = fract(p.xyx*vec3(123.34, 234.34, 345.65));
  a += dot(a, a+34.45);
  return fract(vec2(a.x*a.y, a.y*a.z));
}

void main(){
  
  //vec3 col =  0.5 + 0.5 * cos(_Time.x+uv.xyx+vec3(0,2,4));
  float t = _Time.x * 0.5;

  float m = 0.0;

  float minDist = 100.;
  float cellIndex = 0.;

  vec3 col = vec3(0);

  if (false) {
    for (float i=0.; i < 50.; i++) {
      vec2 n = N22(vec2(i));
      vec2 p = sin(n*t);

      float d = length(uv - p);
      m += smoothstep(0.02, 0.01, d);
      if (d<minDist) {
        minDist = d;
        cellIndex = i;
      }
    }
  } else {
      vec2 _uv = 15. * uv;
      vec2 gv =  fract(_uv) - 0.5;
      vec2 id = floor(_uv);
      vec2 cid = vec2(0);

      for (float y = -1.; y<=1.; y++) {
        for (float x = -1.; x<=1.; x++) {
          vec2 offs = vec2(x, y);

          vec2 n = N22(id + offs);
          vec2 p = offs + sin(n*t) * .5;
          float d = length(gv - p);
          if (d<minDist) {
            minDist = d;
            cid = id + offs;
          }
        }
      }
      col = vec3(minDist);
      col.rg = cid*.1;

  }

  gl_FragColor=vec4(col,1.);
  
}
