package whiplash.phaser;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;
import phaser.Game;

class SpriteNode extends Node<SpriteNode> {
    public var transform:Transform;
    public var sprite:Sprite;
}

class SpriteSystem extends ListIteratingSystem<SpriteNode> {
    private var game:Game;

    public function new(game) {
        super(SpriteNode, updateNode, onNodeAdded, onNodeRemoved);
        this.game = game;
    }

    private function updateNode(node:SpriteNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:SpriteNode) {
        apply(node);
        node.sprite.revive();
    }

    private function onNodeRemoved(node:SpriteNode) {
        node.sprite.kill();
    }

    private inline function apply(node:SpriteNode) {
        var transform = node.transform;
        var position = transform.position;
        var scale = transform.scale;
        var sprite = node.sprite;
        if(sprite.body && untyped !sprite.body.immovable) {
            position.x = sprite.position.x;
            position.y = sprite.position.y;
            scale.x = sprite.scale.x;
            scale.y = sprite.scale.y;
            transform.rotation = sprite.angle;
        } else {
            sprite.position.x = position.x;
            sprite.position.y = position.y;
            sprite.scale.x = scale.x;
            sprite.scale.y = scale.y;
            sprite.angle = transform.rotation;
        }
    }
}
