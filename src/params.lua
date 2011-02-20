module('params', package.seeall)

cmd_params = {};
cmd_params["edit"] = {["-"]="e",["--"]="edit",["default"]=false, ["description"]="Edit "};
cmd_params["convert"] = {["-"]="c",["--"]="convert",["default"]=true, ["description"]="Operating mode.  Can be edit or convert"};
cmd_params["template"]={["-"]="t",["--"]="template", ["default"]=nil, ["description"]="Convert template"};
cmd_params["help"]={["-"]="h",["--"]="help", ["description"]="Show help message"};

