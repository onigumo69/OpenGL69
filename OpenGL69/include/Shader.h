#pragma once
#include <glad/glad.h>
#include <string>
#include <fstream>
#include <sstream>
#include <iostream>

class Shader
{
public:
	// the program ID
	unsigned int ID;

	// reads and builds the shader
	Shader(const char* vertexPath, const char* fragmentPath);
	// activate the shader
	void Use() const;
	// set uniforms
	void SetBool(const std::string& name, bool value) const;
	void SetInt(const std::string& name, int value) const;
	void SetFloat(const std::string& name, float value) const;

private:
	void CheckCompileErrors(unsigned int shader, std::string type);
};