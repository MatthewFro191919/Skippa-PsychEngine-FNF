local crazy = false
function onCreate()
    makeLuaSprite('sunset', 'sun', -300, -100)
    setScrollFactor('sunset', 0, 0)
    addLuaSprite('sunset', false)

    makeLuaSprite('badsunset', 'badsun', -300, -100)
    setScrollFactor('badsunset', 0, 0)
    addLuaSprite('badsunset', false)
    setProperty('badsunset.visible', false)

    makeAnimatedLuaSprite('road', 'Road', -1660, 620)
    addAnimationByPrefix('road', 'idle', 'Road', 24, true)
    setScrollFactor('road', 0, 0)
    addLuaSprite('road')

    makeLuaSprite('tree', 'Tree', -1900, -300)
    setScrollFactor('tree', 1, 0)
    addLuaSprite('tree', false)

    makeAnimatedLuaSprite('jeepskipperBetter', 'Better_Jeep', -1000, 680)
    addAnimationByPrefix('jeepskipperBetter', 'idle', 'Truck', 24, true)
    addLuaSprite('jeepskipperBetter', false)

    makeAnimatedLuaSprite('jeepBetter', 'Better_Jeep_BF', 200, 800)
    addAnimationByPrefix('jeepBetter', 'idle', 'Truck Low Quality', 24, true)
    addLuaSprite('jeepBetter', false)
end

function onBeatHit()
    if curBeat % 12 == 0 then
        setProperty('tree.x', -1900)
        doTweenX('treeTween', 'tree', 1900, 0.3, 'linear')
    end

    if curBeat == 160 or curBeat == 480 then
        crazy = true
        setProperty('badsunset.visible', true)
    end
    if curBeat == 288 or curBeat == 608 then
        crazy = false
        setProperty('badsunset.visible', false)
    end
    if crazy then
        doTweenZoom('camZoom', 'camGame', 1.7, 0.01, 'quadInOut')
    end

    if curBeat == 144 or curBeat == 464 then
        doTweenZoom('camZoom1', 'camGame', 1.4, 3, 'quadInOut')
    end
end

function onUpdate()
    if crazy then
        setProperty('defaultCamZoom', 1.2)
    end
end
