
module('getopt', package.seeall)


params = {};
params["mode"] = {["-"]="m",["--"]="mode",["default"]="convert", ["require"]=true, ["help"]="Operating mode.  Can be edit or convert"};
params["template"]={["-"]="t",["--"]="template", ["default"]=nil, ["require"]=true, ["help"]="Convert template"};
params["help"]={["-"]="h",["--"]="help", ["help"]="Show help message"};


options="";

for i,j in pairs(params) do
    options = options .. j["-"];
end


function hparam (param)
    result="";
    for  tmp,key in pairs {"-","--"} do
	if (param[key] ~= nil) then
	    result = string.format("%s %s%s",result,key,param[key]);
	end
    end

    if (param["help"] ~= nil) then
	result = string.format("%-15s - %s",result,param["help"]);
    end

    return result;

end
    

function usage ()
    print (string.format ("Usage %s options file.mp4 file.out", arg[0]));
    for i,j in pairs (params) do
	print (hparam(j));
    end
end



function getopt( arg)
  local tab = {}
  for k, v in ipairs(arg) do
    if string.sub( v, 1, 2) == "--" then
      local x = string.find( v, "=", 1, true )
      if x then tab[ string.sub( v, 3, x-1 ) ] = string.sub( v, x+1 )
      else      tab[ string.sub( v, 3 ) ] = true
      end
    elseif string.sub( v, 1, 1 ) == "-" then
      local y = 2
      local l = string.len(v)
      local jopt
      while ( y <= l ) do
        jopt = string.sub( v, y, y )
        if string.find( options, jopt, 1, true ) then
          if y < l then
            tab[ jopt ] = string.sub( v, y+1 )
            y = l
          else
            tab[ jopt ] = arg[ k + 1 ]
          end
        else
          tab[ jopt ] = true
        end
        y = y + 1
      end
    end
  end
  return tab
end


