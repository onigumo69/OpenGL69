#version 330 core

struct Light
{
	vec3 position;
	vec3 ambient;
	vec3 diffuse;
	vec3 specular;
};
struct Material
{
	vec3 ambient;
	vec3 diffuse;
	vec3 specular;
	float shiniess;
};

uniform Light light;
uniform Material material;

out vec4 FragColor;

in vec3 Normal;
in vec3 FragPos;

uniform vec3 viewPos;
uniform vec3 lightPos;

void main()
{
	// ambient
	vec3 ambient = light.ambient * material.ambient;

	// diffuse
	vec3 norm = normalize(Normal);
	vec3 lightDir = normalize(lightPos - FragPos);
	float dp = max(dot(norm, lightDir), 0.0f);
	vec3 diffuse = light.diffuse * (dp * material.diffuse);
	
	// specular
	vec3 viewDir = normalize(viewPos - FragPos);
	vec3 reflectDir = reflect(-lightDir, norm);
	float spec = pow(max(dot(viewDir, reflectDir), 0.0), 32);
	vec3 specular = light.specular * (spec * material.specular);

	vec3 light = ambient + diffuse + specular;
	FragColor = vec4(light, 1.0f);
}