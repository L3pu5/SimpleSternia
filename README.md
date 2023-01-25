# SimpleSternia
Simple PVP trigger wrapper for Lusternia for Mudlet

# Supported MudClients:
Mudlet

# Installation
## Note
This code uses named matches and thus requires mudlet 4.11+.
Mudlet: Drag and drop the SimpleSternia package into mudlet or run lua installPackage"http://"

# Contributing lines

## General Format
All lines must follow the following format in the lines.lua file:
{SKILLSET, ABILITY, FIRSTPERSON, SECONDPERSON, THIRDPERSON}

## Skillset Conventions
For overlapping skills, the skillset should be an intermediate. For instance, all mages should use the same staffcast. This should belong to the 'Mage' class. Meanwhile, the attacks specific to aquamancy, etc should belong to their specific skillsets. 

If the afflictions given by an ability innately (without modifications such as cloudberry) they should be placed in different skillsets. For instance, the mage-specific boulderblast-type abilities give different afflictions, and should be sorted to their affliction families.

    SKILLSET    ABILITY
    Mage        PointStaff
    Geomancy    BoulderBlast
    Aquamancy   HailStorm

Abilities that are functionally the same but have different regex can be created with the same ability name. For instance, the deathsong abilities for the six bard songs should follow the names*:

    SKILLSET    ABILITY
    Bard        DeathSong
    Bard        DeathSong
    Bard        DeathSong
    Bard        DeathSong
    Bard        DeathSong
    Bard        DeathSong

\* NB: DeathSong should be broken up into StartDeathSong and ContinueDeathSong as explained further below. 

## Regex Format
The FIRSTPERSON, SECONDPERSON, and THIRDPERSON lines must be regex and escaped. The mudlet specific targets are as follows: 
    
    Label       REGEX
    ATTACKER    (?<ATTACKER>\w+)
    VICTIM      (?<VICTIM>\+w)

All other regex patterns will be ignored.

The following TarotLust has been provided as an example.

    SKILLSET    ABILITY
    Tarot       Lust

    FIRSTPERSON (you do)
    ^<?<ATTACKER>\\w+>

    SECONDPERSON (you receive)
    ^<?<ATTACKER>\\w+> quickly flings a tarot card at you, and you feel unreasonable lust for (?:him|her)\.$

    THIRD PERSON (you observe)

## Ability Naming Convention
Where appropriate, keep the skillset name true to the original AB. Some skills will need to be broken up to be distinguished from one another. For instance, in the case of Tarot Soulless, it should be broken into...

    SKILLSET    ABILITY
    Tarot       RubSoulless
    Tarot       FlingSoulless

Where this is necessary, please try to follow the VerbNoun format. 

For ease of reading, abilities with a channeled instakil and a mid-way indicator should have another 'Ability' added to reflect the midway message and a final message for EndDecapitate. An example might be Knighthood Decapitate

    SKILLSET    ABILITY
    Knighthood  StartDecapitate
    Knighthood  ContinueDecapitate
    Knighthood  EndDecapitate

## Lines Format
Finally, in the file the entry should be representated as the following dataclass:

>   *Inside of the lines.lua file.*

    {
        ...
        --Tarot
        ["Tarot"] ={
            {"Lust",}
        }
        ...
    }
    