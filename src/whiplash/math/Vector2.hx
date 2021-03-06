package whiplash.math;

#if babylonjs
private typedef Base = BABYLON.Vector2;
#elseif phaser
private typedef Base = phaser.math.Vector2;
#end

@:forward
@:forwardStatics
abstract Vector2(Base) to Base from Base {
    @:selfCall
    inline public function new(x:Float = 0.0, y:Float = 0.0) {
        this = new Base(x, y);
    }

    @:op(A * B)
    @:commutative
    inline static public function mul(a:Vector2, b:Float) {
        return new Vector2(a.x * b, a.y * b);
    }

    @:op(A / B)
    @:commutative
    inline static public function div(a:Vector2, b:Float) {
        return new Vector2(a.x / b, a.y / b);
    }

    @:op(A + B)

    inline static public function add(a:Vector2, b:Vector2) {
        return new Vector2(a.x + b.x, a.y + b.y);
    }

    @:op(A - B)
    inline static public function min(a:Vector2, b:Vector2) {
        return new Vector2(a.x - b.x, a.y - b.y);
    }

    public function getDistance(other : Vector2):Float{
        var delta = (this - other);
        return Math.sqrt(delta.x * delta.x + delta.y * delta.y);
    }

    public function getAngle() : Float{
        return Math.atan2(this.y, this.x);
    }

    public function getLength() : Float{
        return Math.sqrt(this.x * this.x + this.y * this.y);
    }

    public function getSquareLength() : Float{
        return this.x * this.x + this.y * this.y;
    }

    public function copyFrom(other:Vector2) {
        this.x = other.x;
        this.y = other.y;
    }

    public function getNormalized():Vector2 {
        var result = new Vector2(this.x, this.y);
        result.normalize();
        return result;
    }

    static public function getRotatedVector(vector:Vector2, angle:Float):Vector2 {
        var cosinus = Math.cos(angle);
        var sinus = Math.sin(angle);

        return new Vector2(vector.x * cosinus - vector.y * sinus, vector.x * sinus + vector.y * cosinus);
    }

    static public function getSquareDistance(a:Vector2, b:Vector2):Float {
        var delta = b - a;
        return delta.getSquareLength();
    }

    static public function getDotProduct(a:Vector2, b:Vector2):Float {
        return a.x * b.x + a.y * b.y;
    }

#if babylonjs
    public function setTo(x, y) {
        this.x = x;
        this.y = y;
    }
#end
}
