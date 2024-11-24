
-- LegacyOutlines
-- @teamkrash, 2023-2024
-- this was painful to make and is still incomplete


-- HOW TO USE

-- put inside StarterGui, in a ScreenGui that has ResetOnSpawn set to false

-- TODO

-- distance culling (because for some reason roblox doesnt automatically do that with wireframehandleadornments)
-- make the lines go invisible when ur head is inside the part
-- maybe figure out some solution for roblox's terrible transparency handling causing lines to overlap bubble chat
-- possibly convert this to a module?


-- CONFIG

local outline = true
local colour = true
local surface = false



local surfaceTextures = {
	"rbxassetid://0", 				-- smooth
	"rbxassetid://11117827300", 	-- glue
	"rbxassetid://11117822737",		-- weld
	"rbxassetid://11117815023",		-- studs
	"rbxassetid://11117833990",		-- inlet
	"rbxassetid://11117841232",		-- universal
	"rbxassetid://0",				-- hinge
	"rbxassetid://0",				-- motor
	"rbxassetid://0",				-- steppingmotor
	"rbxassetid://0"				-- smoothnooutlines
}



-- IGNORED PARTS
-- note: R15 parts are already ignored due to being meshparts

local bodyParts = {"Head", "Left Arm", "Right Arm", "Torso", "Left Leg", "Right Leg"}

-- THE MAGIC

local lineTemp = Instance.new("WireframeHandleAdornment")
lineTemp.Color3 = Color3.new(0,0,0)
lineTemp.ZIndex = 0

function ColourBrick(a)
	a.Color = Color3.fromRGB(math.clamp(math.random(255*a.Color.r-1,255*a.Color.r+1),0,255),math.clamp(math.random(255*a.Color.g-1,255*a.Color.g+1),0,255),math.clamp(math.random(255*a.Color.b-1,255*a.Color.b+1),0,255))
end

function ResetLines(a, line)
	if a and not a.Parent:IsA("Accoutrement") and a:FindFirstChildWhichIsA("WireframeHandleAdornment") and a.Transparency < 0.95 and not a.Parent:FindFirstChildWhichIsA("Humanoid") and not a:FindFirstChildWhichIsA("SpecialMesh") and not a:FindFirstChildWhichIsA("BevelMesh") then
		line:Clear()
		
-- block part
		
		if (a:IsA("Part") or a:IsA("SpawnLocation")) and a.Shape == Enum.PartType.Block then
			line.Adornee = a
			line.Transparency = 0.9 + (0.1 * a.Transparency)

			line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,a.Size.Y/2, a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, -a.Size.Z/2), Vector3.new(a.Size.X/2,a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,-a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))

			line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(-a.Size.X/2,a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,-a.Size.Y/2, a.Size.Z/2), Vector3.new(-a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(a.Size.X/2,-a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))

			line:AddLine(Vector3.new(a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, a.Size.Z/2))
			line:AddLine(Vector3.new(a.Size.X/2,a.Size.Y/2, -a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(-a.Size.X/2,-a.Size.Y/2, a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, -a.Size.Z/2), Vector3.new(-a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))

-- wedge part
			
		elseif ((a:IsA("Part") or a:IsA("SpawnLocation")) and a.Shape == Enum.PartType.Wedge) or a:IsA("WedgePart") then
			
			line.Adornee = a
			line.Transparency = .9 + (0.1 * a.Transparency)
			
			line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,a.Size.Y/2, a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))
			--line:AddLine(Vector3.new(-a.Size.X/2,-a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))

			line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(-a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,-a.Size.Y/2, a.Size.Z/2), Vector3.new(-a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(a.Size.X/2,-a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))

			line:AddLine(Vector3.new(a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, a.Size.Z/2))
			--line:AddLine(Vector3.new(a.Size.X/2,a.Size.Y/2, -a.Size.Z/2), Vector3.new(a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))
			line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, a.Size.Z/2), Vector3.new(-a.Size.X/2,-a.Size.Y/2, a.Size.Z/2))
			--line:AddLine(Vector3.new(-a.Size.X/2,a.Size.Y/2, -a.Size.Z/2), Vector3.new(-a.Size.X/2,-a.Size.Y/2, -a.Size.Z/2))

			line.Parent = a
			
-- cylinder parts
-- my soul left my body while doing this part
			
		elseif ((a:IsA("Part") or a:IsA("SpawnLocation")) and a.Shape == Enum.PartType.Cylinder) then
			line.Adornee = a
			line.Transparency = 0.9 + (0.1 * a.Transparency)
			
			--face 1
			--q1
			line:AddLine(
				Vector3.new(a.Size.X*0.5,a.Size.Y*0.5, 0), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(45)), (a.Size.Z*0.5)*-math.sin(math.rad(45)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(45)), (a.Size.Z*0.5)*-math.sin(math.rad(45))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33))),
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5))),
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(90)), (a.Size.Z*0.5)*-math.sin(math.rad(90)))
			)
			--q2
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(90)), (a.Size.Z*0.5)*-math.sin(math.rad(90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90))),
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90))),
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90)))
			)
			--q3
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90+90))),
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90+90))),
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90+90)))
			)
			--q4
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90+90+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90+90+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90+90+90))), 
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90+90+90))),
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90+90+90))),
				Vector3.new(a.Size.X*0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90+90+90)))
			)

			--face 2
			--q1
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,a.Size.Y*0.5, 0), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(45)), (a.Size.Z*0.5)*-math.sin(math.rad(45)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(45)), (a.Size.Z*0.5)*-math.sin(math.rad(45))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33))),
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5))),
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(90)), (a.Size.Z*0.5)*-math.sin(math.rad(90)))
			)
			--q2
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(90)), (a.Size.Z*0.5)*-math.sin(math.rad(90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90))),
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90))),
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90)))
			)
			--q3
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90+90))),
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90+90))),
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90+90)))
			)
			--q4
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(18.5+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(18.5+90+90+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(33.67+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(33.67+90+90+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(45+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(45+90+90+90))), 
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(56.33+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(56.33+90+90+90))),
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90+90+90)))
			)
			line:AddLine(
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(71.5+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(71.5+90+90+90))),
				Vector3.new(a.Size.X*-0.5,(a.Size.Y*0.5)*math.cos(math.rad(90+90+90+90)), (a.Size.Z*0.5)*-math.sin(math.rad(90+90+90+90)))
			)
		end

	elseif a and a:FindFirstChildWhichIsA("WireframeHandleAdornment") then
		line:Destroy()
	end
end

function OutlineBrick(a)
	if a and not a.Parent:IsA("Accoutrement") and not a:FindFirstChildWhichIsA("WireframeHandleAdornment") then
		if (a:IsA("Part") or a:IsA("WedgePart")) and not a.Parent:FindFirstChildWhichIsA("Humanoid") and not a:FindFirstChildWhichIsA("SpecialMesh") and not a:FindFirstChildWhichIsA("BevelMesh") then
			local line = lineTemp:Clone()
			
			
			
			local connection = a.Destroying:Connect(function(a)
				line:Destroy()
			end)
			local connection2 = a.Changed:Connect(function(prop)
				if prop == "Transparency" then
					if a.Transparency > 0.95 then
						line.Visible = false
					else
						ResetLines(a,line)
						line.Visible = true
					end
				end
			end)
			local connection3 = a.DescendantAdded:Connect(function(d)
				if d:IsA("SpecialMesh") or d:IsA("BevelMesh") then
					ResetLines(a,line)
				end
			end)
			
			line.Parent = a
			
			if a.Parent ~= workspace then
				if table.find(bodyParts,a.Name) then
					if a.Parent:WaitForChild("Humanoid", 5) then
						connection:Disconnect()
						connection2:Disconnect()
						connection3:Disconnect()
						line:Destroy()
					end
				end
			end
			
			ResetLines(a,line)
		end
	end
end

function SurfaceBrick(a)
	if a:IsA("Part") or a:IsA("SpawnLocation") or a:IsA("Seat") or a:IsA("VehicleSeat") or a:IsA("SkateboardPlatform") and not a.Parent:FindFirstChildWhichIsA("Humanoid") and not a:FindFirstChildWhichIsA("SpecialMesh") and not a:FindFirstChildWhichIsA("BevelMesh") then
		local tex = Instance.new("Texture")
		tex.StudsPerTileU = 2
		tex.StudsPerTileV = 2
		tex.Transparency = a.Transparency
		tex.ZIndex = -9999
		
		local rttex = tex:Clone()
		if surfaceTextures[a.RightSurface.Value+1] ~= nil then
			rttex.Texture = surfaceTextures[a.RightSurface.Value+1]
			rttex.Face = 0
			rttex.Parent = a
		end
		
		local tptex = tex:Clone()
		if surfaceTextures[a.TopSurface.Value+1] ~= nil then
			tptex.Texture = surfaceTextures[a.TopSurface.Value+1]
			tptex.Face = 1
			tptex.Parent = a
		end
		
		local bktex = tex:Clone()
		if surfaceTextures[a.BackSurface.Value+1] ~= nil then
			bktex.Texture = surfaceTextures[a.BackSurface.Value+1]
			bktex.Face = 2
			bktex.Parent = a
		end
		
		local lftex = tex:Clone()
		if surfaceTextures[a.LeftSurface.Value+1] ~= nil then
			lftex.Texture = surfaceTextures[a.LeftSurface.Value+1]
			lftex.Face = 3
			lftex.Parent = a
		end
		
		local bttex = tex:Clone()
		if surfaceTextures[a.BottomSurface.Value+1] ~= nil then
			bttex.Texture = surfaceTextures[a.BottomSurface.Value+1]
			bttex.Face = 4
			bttex.Parent = a
		end
		
		local frtex = tex:Clone()
		if surfaceTextures[a.FrontSurface.Value+1] ~= nil then
			frtex.Texture = surfaceTextures[a.FrontSurface.Value+1]
			frtex.Face = 5
			frtex.Parent = a
		end	
		
		if a.Parent ~= workspace then
			if table.find(bodyParts,a.Name) then
				if a.Parent:WaitForChild("Humanoid", 20):WaitForChild("HumanoidDescription", 20) then
					rttex:Destroy()
					tptex:Destroy()
					bktex:Destroy()
					lftex:Destroy()
					bttex:Destroy()
					frtex:Destroy()
				end
			end
		end
		local connection = a.Changed:Connect(function(prop)
			if prop == "Transparency" then
				rttex.Transparency = a.Transparency
				tptex.Transparency = a.Transparency
				bktex.Transparency = a.Transparency
				lftex.Transparency = a.Transparency
				bttex.Transparency = a.Transparency
				frtex.Transparency = a.Transparency
			end
		end)
		
		a.Destroying:Connect(function()
			connection:Disconnect()
		end)
	end
end

-- search for bricks
local parts = workspace:GetDescendants()

for i = 1, #parts do
	local inst = parts[i]
	if inst:IsA("BasePart") and inst.Material ~= Enum.Material.Neon and inst.Material ~= Enum.Material.ForceField and not inst:FindFirstChildWhichIsA("SpecialMesh") and not inst.Parent:FindFirstChildWhichIsA("Humanoid") then
		if colour == true then
			ColourBrick(inst)
		end
		if outline == true then
			OutlineBrick(inst)
		end
		if surface == true and inst.Material == Enum.Material.Plastic then
			SurfaceBrick(inst)
		end
	end
end

workspace.DescendantAdded:Connect(function(inst)
	if inst:IsA("BasePart") and inst.Material ~= Enum.Material.Neon and inst.Material ~= Enum.Material.ForceField and not inst:FindFirstChildWhichIsA("SpecialMesh") and not inst.Parent:FindFirstChildWhichIsA("Humanoid") then
		if colour == true then
			ColourBrick(inst)
		end
		if outline == true then
			OutlineBrick(inst)
		end
		if surface == true and inst.Material == Enum.Material.Plastic then
			SurfaceBrick(inst)
		end
	end
end)
