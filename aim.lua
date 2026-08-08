local function getTarget()
	local character = player.Character
	local root = character and character:FindFirstChild("HumanoidRootPart")

	if not root then
		return nil
	end

	local closest = nil
	local closestDistance = RANGE

	for _, other in ipairs(Players:GetPlayers()) do
		if other ~= player
			and other.Team ~= player.Team
			and other.Name:lower() ~= "ryryc08" then

			local otherCharacter = other.Character
			local otherRoot = otherCharacter
				and otherCharacter:FindFirstChild("HumanoidRootPart")

			local humanoid = otherCharacter
				and otherCharacter:FindFirstChildOfClass("Humanoid")

			if otherRoot and humanoid and humanoid.Health > 0 then
				local distance =
					(otherRoot.Position - root.Position).Magnitude

				if distance < closestDistance then
					closestDistance = distance
					closest = otherRoot
				end
			end
		end
	end

	return closest
end