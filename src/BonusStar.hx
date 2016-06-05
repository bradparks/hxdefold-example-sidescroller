class BonusStar extends defold.support.Script<{}> {
    static var score = 5000;
    static var speed = -240;

    override function update(_, dt:Float) {
        var p = Go.get_position();
        p.x = p.x + speed * dt;
        if (p.x < -32)
            Go.delete();
        Go.set_position(p);
    }

    override function on_message<T>(_, message_id:Message<T>, message:T, sender:Url) {
        if (message_id == hash("collision_response")) {
            Msg.post("main#gui", "add_score", {amount: score});
            Go.delete();
        }
    }
}
