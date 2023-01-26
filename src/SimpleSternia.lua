--Data
if not SimpleSternia then SimpleSternia = {} end;
--MetaData
SimpleSternia.MetaData = {};
SimpleSternia.MetaData.Version = "0.0.1 - Little Bunny";
SimpleSternia.MetaData.Credits = "L3Pu5 Hare";
SimpleSternia.MetaData.Contact = "lepus@lepus.site";
SimpleSternia.MetaData.GithubRepo = "https://github.com/L3pu5/SimpleSternia";

SimpleSternia.Init = function ()
    SimpleSternia.CleanUp();
    SimpleSternia.CreateUpdateAlias();
    SimpleSternia.CreateAllSkillsets();
    if not SimpleSternia.Config.Quiet or silent then 
        echo("SimpleSternia v" ..SimpleSternia.MetaData.Version.." by "..SimpleSternia.MetaData.Credits.. " is initialised. Thank you for using SimpleSternia.\n");
        echo("For all questions, queries, and concerns, please contact " ..  SimpleSternia.MetaData.Contact .. " or see " .. SimpleSternia.MetaData.GithubRepo.."\n");
    end
end

SimpleSternia.CleanUp = function ()
    if SimpleSternia.TempTriggers then
        for tempTrigger, bool in pairs (SimpleSternia.TempTriggers) do
            killTrigger(tempTrigger)
        end
    end
    SimpleSternia.TempTriggers = {};
end

--Config
SimpleSternia.Config = {};
    --Do not show messages from SimpleSternia on startup, etc
    SimpleSternia.Config.Quiet = false;
    --Show First Person
    SimpleSternia.Config.FirstPerson = true;
    --Show Second Person
    SimpleSternia.Config.SecondPerson = true;
    --Show Third Person
    SimpleSternia.Config.ThirdPerson = true;
    -- FeedTriggers instead of echoing
    SimpleSternia.Config.FeedTriggers = false;
    --Hide Original FlavourText/Delete the original attack line
    SimpleSternia.Config.HideFlavourText = true;
    --Default Format
    -- Note config uses the following context words:
    -- 'ATTACKER'   := The name of the attack user or 'you'
    -- 'USES'       := uses/use as gramatically appropriate
    -- 'VIS'        := is/are as defined by grammar for the victim.
    -- 'AIS'        := is/are as defined by grammar for the attacker.
    -- 'ABILITY'    := The name of the ability used.
    -- 'SKILLSET'   := The skillset the ability belongs to.
    -- 'VICTIM'     := The recipient of the attack or 'you'.
    -- 'LIMB'       := The limb struck by a knighthood attack or ""
    -- 'WOUNDS'     := The wounds when struck by a knighthood attack or ""
    -- All other elements are echo'd literally
    -- this allows you to control colour with <green>ATTACKER<yellow>  to make attacker green and the following yellow.
    -- At this time, SimpleSternia does not intend to gag melds.
    -- Example formats:
    -- ATTACKER USES ABILITY on VICTIM
    -- ATTACKER USES SKILLSET:ABILITY on VICTIM
    -- ATTACKER ABILITY(SKILLET) -> VICTIM
    -- A NEWLINE is not appended by SimpleSternia. You must append this yourself.
    SimpleSternia.Config.DefaultFormat =      "ATTACKER USES ABILITY on VICTIM.\n";
    SimpleSternia.Config.DefaultVerboseFormat = "ATTACKER USES SKILLSET:ABILITY on VICTIM.\n";
    SimpleSternia.Config.DefaultNoVictimFormat =   "ATTACKER USES ABILITY.\n";
    SimpleSternia.Config.DefaultNoAttackerFormat = "VICTIM VIS hit by ABILITY.\n";
    -- CHANGE THESE FOR CUSTOMISATION
    SimpleSternia.Config.Format = SimpleSternia.Config.DefaultFormat;
    SimpleSternia.Config.NoVictimFormat = SimpleSternia.Config.DefaultNoVictimFormat;
    SimpleSternia.Config.NoAttackerFormat = SimpleSternia.Config.DefaultNoAttackerFormat;


--Abilities
SimpleSternia.Abilities = {};

--TempTrigger Dictionary
SimpleSternia.TempTriggers = {};
SimpleSternia.TempAliases = {};

-- Build all the skillsets in the Lines
SimpleSternia.CreateAllSkillsets = function() 
    for skillset, skills in pairs(SimpleSternia.Lines) do
        SimpleSternia.CreateSkillsetAbilities(skillset, skills);
    end
end

SimpleSternia.CreateUpdateAlias = function()
    if SimpleSternia.TempAliases[0] then
        killAlias(SimpleSternia.TempAliases[0]);
        killAlias(SimpleSternia.TempAliases[1]);
    end
    SimpleSternia.TempAliases[0] = tempAlias("^SimpleSterniaInit$", function () SimpleSternia.Init() end )
    SimpleSternia.TempAliases[1] = tempAlias("^SimpleSterniaUpdate$", function () SimpleSternia.UpdateLines() end )
end

SimpleSternia.UpdateLines = function() 
    if not SimpleSternia.Config.Quiet then
        echo("Fetching Lines from " .. SimpleSternia.MetaData.GithubRepo.. ".\n");
    end
    downloadFile(getMudletHomeDir().. "/SimpleSternia/SimpleSterniaLines.lua", "https://raw.githubusercontent.com/L3pu5/SimpleSternia/main/src/SimpleSterniaLines.lua");
    if not SimpleSternia.Config.Quiet then
        echo("Lines have been updated! Re-initalise with 'SimpleSterniaInit'");
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

    if firstPerson ~= nil then
        firstPersonTrigger =    tempRegexTrigger(firstPerson, function() SimpleSternia.ProcessTrigger(skillSet, abilityName, matches) end);
    end
    if secondPerson ~= nil then
        secondPersonTrigger =   tempRegexTrigger(secondPerson, function() SimpleSternia.ProcessTrigger(skillSet, abilityName, matches) end);
    end
    if thirdPerson ~= nil then
        thirdPersonTrigger =    tempRegexTrigger(thirdPerson, function() SimpleSternia.ProcessTrigger(skillSet, abilityName, matches) end);
    end 
    SimpleSternia.TempTriggers[firstPersonTrigger] = true; 
    SimpleSternia.TempTriggers[secondPersonTrigger] = true; 
    SimpleSternia.TempTriggers[thirdPersonTrigger] = true; 
end

SimpleSternia.ProcessTrigger = function(skillSet, abilityName, matches)
    SimpleSternia.BakeAbility(skillSet, abilityName, matches)
end

SimpleSternia.BakeAbility = function(skillsetName, abilityName, matches) 
    template = "";
    -- Use the NOVICTIM Template
    if matches.VICTIM then
        template = SimpleSternia.Config.Format;
        if matches.VICTIM == "you" or matches.VICTIM == "You" or matches.VICTIM == "Your" or matches.VICTIM == "your" then
            template = template:gsub("VICTIM", "you");
            template = template:gsub("VIS", "are")
        elses
            template = template:gsub("VICTIM", matches.VICTIM);
            template = template:gsub("VIS", "is")
        end
    else
        if matches.ATTACKER then
            template = SimpleSternia.Config.NoVictimFormat;
        else
            template = SimpleSternia.Config.NoAttackerFormat;
        end
    end
    if matches.ATTACKER == "You" or matches.ATTACKER == "you" or matches.ATTACKER == "Your" or matches.ATTACKER == "your" then
        template = template:gsub("USES", "use")
        template = template:gsub("AIS", "are")
        template = template:gsub("ATTACKER", "You");
    else
        template = template:gsub("AIS", "is")
        template = template:gsub("USES", "uses")
        template = template:gsub("ATTACKER", matches.ATTACKER);
    end;
    --ABILITY
    if string.find(template, "ABILITY") then
      template = template:gsub("ABILITY", abilityName);
    end
    --LIMB
    if string.find(template, "LIMB") then
        if matches.LIMB then 
            template = template:gsub("LIMB", matches.LIMB);
        else
            template = template:gsub("LIMB", "");
        end
    end
    --SKILLSET
    if string.find(template, "SKILLSET") then
      template = template:gsub("SKILLSET", skillsetName);
    end
    if SimpleSternia.Config.HideFlavourText == true and SimpleSternia.Config.FeedTriggers == false then
        replaceLine(template);
    elseif SimpleSternia.Config.HideFlavourText == true and SimpleSternia.Config.FeedTriggers == true then
        feedTriggers(template);
    else
        echo(template);
    end
end 