#pragma once
#include <glad/glad.h>
#include <GLFW/glfw3.h>

// Game holds all game-related state and functionality.
// Combines all game-related data into a single class for
// easy access to each of the components and manageability.
class Game
{
public:
    // Represents the current state of the game
    enum class GameState
    {
        GAME_ACTIVE,
        GAME_MENU,
        GAME_WIN
    };
    // game state
    GameState               State;
    bool                    Keys[1024];
    unsigned int            Width, Height;
    // constructor/destructor
    Game(unsigned int width, unsigned int height);
    ~Game();
    // initialize game state (load all shaders/textures/levels)
    void Init();
    // game loop
    void ProcessInput(float dt);
    void Update(float dt);
    void Render();
};