#version 330 core
out vec4 FragColor;

in vec3 Normal;
in vec3 FragPos;

uniform vec3 viewPos;
uniform vec3 lightPos;
uniform vec3 lightColor;
uniform vec3 objectColor;

void main()
{
	// ambient
	float ambientLevel = 0.1f;
	vec3 ambient = ambientLevel * lightColor;

	// diffuse
	vec3 norm = normalize(Normal);
	vec3 lightDir = normalize(lightPos - FragPos);
	float dp = max(dot(norm, lightDir), 0.0f);
	vec3 diffuse = dp * lightColor;
	
	// specular
	float specularLevel = 0.5f;
	vec3 viewDir = normalize(viewPos - FragPos);
	vec3 reflectDir = reflect(-lightDir, norm);
	float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32);
	vec3 specular = specularLevel * spec * lightColor;

	vec3 light = (ambient + diffuse + specular) * objectColor;
	FragColor = vec4(light, 1.0f);
}