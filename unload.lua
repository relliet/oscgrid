-- oscgrid un-loader
-- run this to unload oscgrid from memory


local grds = {}
local g
local grid_w
local grid_h

function init()
  disconnect()
  get_grid_names()

  --tab.print(grds[1])
  --tab.print(grid.vports[1].device)
  
  screen.aa(0)
  redraw()
end

function get_grid_names()
  -- Get a list of grid devices
  for id,device in pairs(grid.vports) do
    grds[id] = {name = device.name, id = device.id }
    --grds[id].id = device.id
  end
end

function disconnect()
  grid.update_devices()
  g = include('lib/oscgrid')

  g.grid.remove(2)
  g.cleanup()

  arc.update_devices()
  ar = include('lib/oscarc')
  ar.arc.remove(2)
  ar.cleanup()

end

function key(n,z)
  if n==2 and z==1 then
     redraw()
  end
end


function grid_key(x, y, s)
  if s == 1 then
    --print('keyon')
    --g:led(x,y,15)
  else
    --print('keyoff')
    --g:led(x,y,0)
  end
  --print (x .. ' ' .. y .. ' ' .. s)
 end


function redraw()
  screen.clear()
  screen.level(15)
  screen.move (0,10)
  screen.text('oscgrid unloaded')
  
  screen.update()
end