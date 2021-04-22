local propTrigger_ball = script:GetCustomProperty("Trigger_ball"):WaitForObject()
local propVolleyball = script:GetCustomProperty("Volleyball"):WaitForObject()
local propTrigger_ball = script.parent


function OnBeginOverlap(whichTrigger, other)
	if other:IsA("Player") then
		print(whichTrigger.name .. ": Begin Trigger Overlap with " .. other.name)
		propVolleyball:SetWorldRotation(propVolleyball:GetWorldRotation() + Rotation.New(0, 0, 90))
	end
end

function OnEndOverlap(whichTrigger, other)
	if other:IsA("Player") then
		print(whichTrigger.name .. ": End Trigger Overlap with " .. other.name)
		propVolleyball:SetWorldRotation(propVolleyball:GetWorldRotation() + Rotation.New(0, 90, 0))
	end
end

function OnInteracted(whichTrigger, other)
	if other:IsA("Player") then
		print(whichTrigger.name .. ": Trigger Interacted " .. other.name)
	end
end

propTrigger_ball.beginOverlapEvent:Connect(OnBeginOverlap)
propTrigger_ball.endOverlapEvent:Connect(OnEndOverlap)
propTrigger_ball.interactedEvent:Connect(OnInteracted)