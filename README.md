# SimpleSternia by L3Pu5 Hare
Simple PVP trigger wrapper for Lusternia for Mudlet.

# Supported MudClients:
Mudlet

# Installation
## Mudlet one-liner
Copy and paste the following code into your mudlet command line

    lua installPackage "https://raw.githubusercontent.com/L3pu5/SimpleSternia/main/SimpleSternia.mpackage"

## mpackage
Download the .mpackage file and drag and drop it into mudlet. You can additionally use the packages menu in the top bar of mudlet to import the .mpackage file.

## Note
This code uses named matches and thus requires mudlet 4.11+.

# Usage

## Installing and Removing
By default the program should just install itself. If you wish to uninstall the package, make sure you first run the following command to make it purge its tempTriggers:

    lua SimpleSternia.CleanUp()

Then you can remove the package via the package manager.

## Initailising
By default, the program will initialise when installed via the improted script file. Major updates must be imported as new packages.

## Updating the Lines
You can call the following two aliases from the command line:

    SimpleSterniaUpdate
    SuperSterniaInit

\* NB: SimpleSterniaUpdate pulls from this github repo's raw to overwrite the SimpleSterniaLines.lua file.

# Configuration
You can change the configuration for SimpleSternia by changing the imported Script asset in mudlet. The toggles should be self-explanatory.

## Format of provided lines
The two configuration variables 'SimpleSternia.Config.Format' and 'SimpleSternia.Config.NoVictimFormat'

     Note config uses the following context words:
     'ATTACKER'   := The name of the attack user or 'you'
     'USES'       := uses/use as gramatically appropriate
     'ABILITY'    := The name of the ability used.
     'SKILLSET'   := The skillset the ability belongs to.
     'VICTIM'     := The recipient of the attack or 'you'.
     All other elements are echo'd literally
     this allows you to control colour with <green>ATTACKER<yellow>  to make attacker green and the following yellow.
     At this time, SimpleSternia does not intend to gag melds.
     Example formats:
     ATTACKER USES ABILITY on VICTIM
     ATTACKER USES SKILLSET:ABILITY on VICTIM
     ATTACKER ABILITY(SKILLET) -> VICTIM
     A NEWLINE is not appended by SimpleSternia. You must append this yourself.

### SimpleSternia.Config.Format
This is the variable for a single person targetting another with an ability. This uses a VICTIM variable.

    ATTACKER USES <SKILLSET>!!ABILITY!! ---> VICTIM\n
    Keegan uses <Aeonics>!!Timewarp!! ---> you.

    ATTACKER USES SKILLSET ABILITY on VICTIM.\n
    Keegan uses Aeonics Timewarp on Alice.

    (ATTACKER[SKILLSET][ABILITY])::VICTIM\n
    (Keegan[Aeonics][Timewarp])::Alice

### SimpleSternia.Config.NoVictimFormat
This is the variable for a single person using an ability without an explicit target. It does not reference a VICTIM variable.

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
    VICTIM      (?<VICTIM>\w+)
    LIMB        (?<LIMB>\w+), (?<LIMB>\w+\s\w+), (?<LIMB>.+)

All other regex patterns will be ignored.

Additionally, even if second and third persons are similar, they MUST not evaluate to the same regex, even if it means separating you/yours from she/he/her/his with mutually exclusive matching groups.

The following CosmicFire has been provided as an example.

    SKILLSET    ABILITY
    Cosmic      CosmicFire

    FIRSTPERSON (you do)
    [[^(?<ATTACKER>\w+) allow an infinitesimally small mote of cosmic fire to manifest and direct it at (?<VICTIM>\w+). Cosmic fire blasts forth, dissolving \w+ flesh in a sparkling current of energy\.$]]

    SECONDPERSON (you receive)
    [[^(?<ATTACKER>\w+) raises a palm which glows with a tiny pinpoint of light. The light turns into a sparkling current of energy that slams into (?<VICTIM>\w+), dissolving *(?his|her)* flesh\.$]]

    THIRD PERSON (you observe)
    [[^(?<ATTACKER>\w+) raises a palm which glows with a tiny pinpoint of light. The light turns into a sparkling current of energy that slams into (?<VICTIM>\w+), dissolving *your* flesh\.$]]

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

### Knighthood and Monks
For abilities which target limbs, please obey the following conventions.
    1. Where possible, embed the limb into the attack with the (?<LIMB>) regex. The LIMB variable should capure 'left leg', 'right arm', 'gut', 'chest', 'head', etc with emphasis on the left|right descriptor. 
    2. Where not possible, create a second ability and specify the limb in the ability name.


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
    