package hpa;

import phaser.Game;

class Lib
{
    static public var game:Game;

    static public function init(_game:Game, engine:ash.core.Engine)
    {
        game = _game;
        engine.addSystem(new SpriteSystem(game), 1);
    }
}