precision highp float;

uniform vec2 iResolution;


varying vec4 vertColor;
varying vec4 vertTexCoord;
varying vec4 pos;

int func(vec2 z, int iter){
	vec2 outz = z;
	float buff;
	for (int i = 0; i < iter; i++){
		buff = 1 - abs(outz.y - outz.x);
		outz.y = 1-abs((1-outz.x)-outz.y);
		outz.x = buff;
		if (length(outz) > 1.03){
			return i;
		}
	}
	return iter;
}

void main() {
	float aspectRatio = iResolution.x/iResolution.y;
	float bounds = 1;
	float x0 = pos.x/iResolution.x * 5 + 0.2;
	float y0 = pos.y/iResolution.y * 5 + 0.25;

	vec2 z0 = vec2(x0, y0);
	int iter = 10;
	float i = float(func(z0, iter));
	i = i/iter;
	gl_FragColor = vec4(i, i, i, 1.0);
}
