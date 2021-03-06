import defold.support.Script;

class Main extends Script<{}> {
    override function init(_) {
        // set blue background
        Msg.post("@render:", RenderMessages.ClearColor, {color: Vmath.vector4(0.52, 0.80, 1, 0)});
        Msg.post(".", GoMessages.AcquireInputFocus);
    }

    override function on_input(_, action_id:Hash, action:ScriptOnInputAction) {
        if (action_id == hash("ok") && action.pressed) {
            lua.Lua.print('OK');
        } else if (action_id == hash("profiler_toggle") && action.pressed) {
            Msg.post("@system:", defold.Sys.SysMessages.ToggleProfile);
            return true;
        }
        return false;
    }
}
