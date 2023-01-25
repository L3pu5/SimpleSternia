--Data
if not SimpleSternia then SimpleSternia = {} end;

--Config
SimpleSternia.Config = {};
    --Show First Person
    SimpleSternia.Config.FirstPerson = true;
    --Show Second Person
    SimpleSternia.Config.SecondPerson = true;
    --Show Third Person
    SimpleSternia.Config.ThirdPerson = true;
    --Hide Original FlavourText/Delete the original attack line
    SimpleSternia.Config.HideFlavourText = true;
    --Default Format
    -- Note config uses the following context words:
    -- 'ATTACKER'   := The name of the attack user or 'you'
    -- 'USES'       := uses/use as gramatically appropriate
    -- 'ABILITY'    := The name of the ability used.
    -- 'SKILLSET'   := The skillset the ability belongs to.
    -- 'VICTIM'     := The recipient of the attack or 'you'.
    -- All other elements are echo'd literally
    -- this allows you to control colour with <green>ATTACKER<yellow>  to make attacker green and the following yellow.
    -- At this time, SimpleSternia does not intend to gag melds.
    -- Example formats:
    -- ATTACKER USES ABILITY on VICTIM
    -- ATTACKER USES SKILLSET:ABILITY on VICTIM
    -- ATTACKER ABILITY(SKILLET) -> VICTIM
    SimpleSternia.Config.DefaultFormat =      "ATTACKER USES ABILITY on VICTIM.";
    SimpleSternia.Config.DefaultVerboseFormat = "ATTACKER USES SKILLSET:ABILITY on VICTIM.";
    SimpleSternia.Config.DefaultNoVictimFormat =   "ATTACKER USES ABILITY.";
    -- CHANGE THESE FOR CUSTOMISATION
    SimpleSternia.Config.Format = SimpleSternia.Config.DefaultFormat;
    SimpleSternia.Config.NoVictimFormat = SimpleSternia.Config.DefaultNoVictimFormat;

--Abilities
SimpleSternia.Abilities = {};

--TempTrigger Dictionary
SimpleSternia.TempTriggers = {};


-- Build all the skillsets in the Lines
SimpleSternia.CreateAllSkillsets = function() 
    for skillset, skills in pairs(SimpleSternia.Lines) do
        SimpleSternia.CreateSkillsetAbilities(skillset, skills);
    end
end
-- Build all the abilities in the class
SimpleSternia.CreateSkillsetAbilities = function(skillSet, skills)
    for index, i in ipairs(skills) do
        SimpleSternia.CreateAbility(skillSet, i[1], i[2], i[3], i[4])
    end
end

-- Build a single ability 
-- This bakes the selected DefaultFormat into the ability.
SimpleSternia.CreateAbility = function(skillSet, abilityName, firstPerson, secondPerson, thirdPerson) 

    
    firstPersonTrigger =    tempRegexTrigger(firstPerson, function() SimpleSternia.ProcessTrigger(skillSet, abilityName, matches) end);
    secondPersonTrigger =   tempRegexTrigger(secondPerson, function() SimpleSternia.ProcessTrigger(skillSet, abilityName, matches) end);
    thirdPersonTrigger =    tempRegexTrigger(thirdPerson, function() SimpleSternia.ProcessTrigger(skillSet, abilityName, matches) end);

    SimpleSternia.TempTriggers[firstPersonTrigger] = true; 
    SimpleSternia.TempTriggers[secondPersonTrigger] = true; 
    SimpleSternia.TempTriggers[thirdPersonTrigger] = true; 
end

SimpleSternia.ProcessTrigger = function(skillSet, abilityName, matches)
    echo("FIRED");
    echo(abilityName);
    if SimpleSternia.Config.HideFlavourText == true then
        deleteLine()
    end
    SimpleSternia.BakeAbility(skillSet, abilityName, matches)
end

SimpleSternia.BakeAbility = function(skillsetName, abilityName, matches) 
    template = "";
    -- Use the NOVICTIM Template
    if matches.VICTIM then
        template = SimpleSternia.Config.Format;
        template = template:gsub("VICTIM", matches.VICTIM);
    else
        template = SimpleSternia.Config.NoVictimFormat;
    end
    template = template:gsub("ATTACKER", matches.ATTACKER);
    if matches.ATTACKER == "You" or matches.ATTACKER == "you" then
        template = template:gsub("USES", "use")
    else
        template = template:gsub("USES", "uses")
    end;
    --ABILITY
    if string.find(template, "ABILITY") then
      template = template:gsub("ABILITY", abilityName);
    end
    --SKILLSET
    if string.find(template, "SKILLSET") then
      template = template:gsub("SKILLSET", skillsetName);
    end
    echo(template);
end 