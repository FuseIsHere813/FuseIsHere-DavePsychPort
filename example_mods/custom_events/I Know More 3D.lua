function onCreate()
	makeLuaSprite('itstime', 'iknowmore3dthanyoudogenius', 0, 0);
	setLuaSpriteScrollFactor('itstime', 0, 0);
	defaultCamZoom = getProperty('defaultCamZoom') - 0.01;
	setProperty('itstime.scale.x', 1 / defaultCamZoom);
	setProperty('itstime.scale.y', 1 / defaultCamZoom);
	setProperty('itstime.alpha', 0.0001);
	addLuaSprite('itstime', true);
end

-- Event notes hooks
function onEvent(name, value1, value2)
	if name == "I Know More 3D" then
		setProperty('itstime.alpha', 1);
		doTweenAlpha('tweenCutOffAlpha', 'itstime', 0, 0.5, 'linear');
                playSound('I know More 3D than you do genius');
	end
end