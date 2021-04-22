local propCube_trigger = script:GetCustomProperty("Cube_trigger"):WaitForObject()
local propCube = script:GetCustomProperty("Cube"):WaitForObject()
local propCube_trigger = script.parent
--local propCube = World.SpawnAsset("Cube", {position = Vector3.New(500, -200, 100)})
local transitionTime = 1


function OnBeginOverlap(whichTrigger, other)
	if other:IsA("Player") then
		print(whichTrigger.name .. ": Begin Trigger Overlap with " .. other.name)
		propCube:SetWorldRotation(propCube:GetWorldRotation() + Rotation.New(0, 0, 90))
	end
end

function OnEndOverlap(whichTrigger, other)
	if other:IsA("Player") then
		print(whichTrigger.name .. ": End Trigger Overlap with " .. other.name)
		propCube:MoveTo(propCube:GetWorldPosition() + Vector3.UP * 10000, transitionTime)
	end
end

function OnInteracted(whichTrigger, other)
	if other:IsA("Player") then
		print(whichTrigger.name .. ": Trigger Interacted " .. other.name)
	end
end

propCube_trigger.beginOverlapEvent:Connect(OnBeginOverlap)
propCube_trigger.endOverlapEvent:Connect(OnEndOverlap)
propCube_trigger.interactedEvent:Connect(OnInteracted)
