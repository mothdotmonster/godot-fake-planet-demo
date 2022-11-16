// Copied from SpatialMaterial
shader_type spatial;
render_mode async_visible,blend_mix,depth_draw_opaque,cull_back,diffuse_burley,specular_schlick_ggx,world_vertex_coords; // THE LAST ONE IS VERY IMPORTANT!!!
uniform vec4 albedo : hint_color;
uniform sampler2D texture_albedo : hint_albedo;
uniform float specular;
uniform float metallic;
uniform float roughness : hint_range(0,1);
uniform float point_size : hint_range(0,128);
uniform vec3 uv1_scale;
uniform vec3 uv1_offset;
uniform vec3 uv2_scale;
uniform vec3 uv2_offset;

// Bonus scrolling!
uniform vec2 scroll_direction;
uniform float scroll_speed;

uniform vec3 player; // Set this to the player origin
uniform vec2 warp; // Desired "warp" factor, set it as you like, or to 0 for flattening.

void vertex() {
		float height = 0.0; // Initialize variable 
	if (warp.x == 0.0 && warp.y != 0.0) { // Y only warp
		height = -(((VERTEX.z-player.z)*(VERTEX.z-player.z))/warp.y);
	}
	if (warp.y == 0.0 && warp.x != 0.0) { // X only warp
		height = -(((VERTEX.x-player.x)*(VERTEX.x-player.x))/warp.x);
	}
	if (warp.x != 0.0 && warp.y != 0.0) { // Full warp
		height = -(((VERTEX.x-player.x)*(VERTEX.x-player.x))/warp.x)-(((VERTEX.z-player.z)*(VERTEX.z-player.z))/warp.y);
	}
	VERTEX.y += height; // Apply heightmap
	
	UV=UV*uv1_scale.xy+uv1_offset.xy; // Copied from SpatialMaterial
}
// Copied from SpatialMaterial
void fragment() {
	vec2 base_uv = UV + (scroll_direction * TIME * scroll_speed); // Bonus scrolling!
	vec4 albedo_tex = texture(texture_albedo,base_uv);
	ALBEDO = albedo.rgb * albedo_tex.rgb;
	METALLIC = metallic;
	ROUGHNESS = roughness;
	SPECULAR = specular;
}