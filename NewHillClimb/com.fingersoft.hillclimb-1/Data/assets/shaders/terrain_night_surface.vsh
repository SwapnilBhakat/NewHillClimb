attribute vec4 a_position;
attribute vec3 a_texCoord;

uniform mat4 u_MVPMatrix;
uniform float u_heightOffset;
uniform float u_textureScale;
uniform float u_textureWidthScale;
uniform vec2 u_lightPos;

#ifdef GL_ES
varying mediump vec2 v_texCoord;
varying mediump vec2 v_posDiff;
#else
varying vec2 v_texCoord;
varying vec2 v_posDiff;
#endif

float interpolate(float t, float v1, float v2)
{
  return v1 + t*(v2-v1);
}

void main()
{
    float addY = interpolate(a_position.z, 0.4*u_textureScale, -0.7*u_textureScale);
	
	gl_Position = u_MVPMatrix * vec4(a_position.x, a_position.y + addY + u_heightOffset, 0.0, 1.0);
    v_texCoord.x = a_texCoord.x*u_textureWidthScale/u_textureScale;
	v_texCoord.y = a_position.z;
	
	v_posDiff = vec2(u_lightPos[0]-a_position.x, u_lightPos[1]-a_position.y);
}