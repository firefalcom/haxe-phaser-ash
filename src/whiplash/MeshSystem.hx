package whiplash;

import ash.tools.ListIteratingSystem;
import ash.core.Engine;
import ash.core.Node;

class MeshNode extends Node<MeshNode> {
    public var transform:Transform3d;
    public var mesh:Mesh;
}

class MeshSystem extends ListIteratingSystem<MeshNode> {

    public function new() {
        super(MeshNode, updateNode, onNodeAdded, onNodeRemoved);
    }

    private function updateNode(node:MeshNode, dt:Float):Void {
        apply(node);
    }

    private function onNodeAdded(node:MeshNode) {
        apply(node);
    }

    private function onNodeRemoved(node:MeshNode) {
    }

    private inline function apply(node:MeshNode) {
        var o = node.mesh.o;
        if(o != null) {
            var transform = node.transform;
            var position = transform.position;
            var rotation = transform.rotation;
            var scale = transform.scale;
            o.position.x = position.x;
            o.position.y = position.y;
            o.position.z = position.z;
            o.rotation.x = rotation.x;
            o.rotation.y = rotation.y;
            o.rotation.z = rotation.z;
            o.scaling.x = scale.x;
            o.scaling.y = scale.y;
            o.scaling.z = scale.z;
        }
    }
}
