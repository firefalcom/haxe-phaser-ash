package whiplash.tween;

class FloatTween {
    private var value:Float;
    private var from:Float;
    private var to:Float;
    private var duration:Float;
    private var time:Float;
    private var easing:Easing;

    public function new(from:Float, to:Float, duration:Float, easing:Easing) {
        set(from, to, duration, easing);
    }

    inline public function getValue():Float {
        return value;
    }

    public function isCompleted():Bool {
        return time >= duration;
    }

    public function set(from:Float, to:Float, duration:Float, easing:Easing) {
        time = 0;
        this.duration = duration;
        this.from = from;
        this.to = to;
        this.easing = easing;
        value = from;
    }

    public function reset() {
        time = 0;
        value = from;
    }

    public function update(dt:Float) {
        var f:Float;
        time += dt;

        if(time > duration) {
            f = 1.0;
            time = duration;
        } else {
            f = time / duration;
            f = Ease.get(easing, f);
        }

        value = from + (to - from) * f;
    }

    static public function get(from:Float, to:Float, easing:Easing, advance:Float) {
        var f = advance;

        if(f > 1) { f = 1; }

        f = Ease.get(easing, f);

        return from + (to - from) * f;
    }
}
