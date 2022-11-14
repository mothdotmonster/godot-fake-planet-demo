shader_type spatial;

uniform vec3 player;
uniform sampler2D tex;
varying vec2 tex_position;

void vertex() {
	tex_position = VERTEX.xz/100.0+0.5;
	float height = (((VERTEX.x-player.x)*(VERTEX.x-player.x))/float(100))+(((VERTEX.z-player.z)*(VERTEX.z-player.z))/float(100));
	VERTEX.y -= height;
}

void fragment() {
	ALBEDO = texture(tex, tex_position).xyz;
}