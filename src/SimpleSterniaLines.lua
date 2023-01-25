SimpleSternia.Lines = {
    -- Generic
    -- Knighthood
    ["Knighthood"] = {},
    -- Mage
        --Aquamancy
        --Geomancy
        --Pyromancy
        --Aeromancy
    -- Druidry
        -- BlackTalon
        -- Hartstone
    -- Wicca
        -- Night
        -- Moon
    -- Cosmic
    ["Cosmic"] = {
      {"CosmicFire", 
            [[^(?<ATTACKER>\w+) allow an infinitesimally small mote of cosmic fire to manifest and direct it at (?<VICTIM>\w+). Cosmic fire blasts forth, dissolving \w+ flesh in a sparkling current of energy\.$]],
            [[^(?<ATTACKER>\w+) raises a palm which glows with a tiny pinpoint of light. The light turns into a sparkling current of energy that slams into (?<VICTIM>\w+), dissolving your flesh\.$]],
            [[^(?<ATTACKER>\w+) raises a palm which glows with a tiny pinpoint of light. The light turns into a sparkling current of energy that slams into (?<VICTIM>\w+), dissolving (his|her|their) flesh\.$]],
      }
    },
    -- Rituals
    
        -- Sacraments
    ["Sacraments"] = {
        {"HolyBeing",
            [[^You bow your head and begin to chant a prayer to the Holy Supernals, beseeching them to imbue your mortal soul with the radiance of the Light. An indescribable warmth and comfort envelops you as your senses suddenly expand, golden motes of light racing down your skin as you open your eyes, gazing out upon the world with a renewed and sacrosanct presence\.$]],
            nil,
            [[^(?<ATTACKER>\w+) chants a vibrant prayer to the Holy Supernals, beseeching them to heal you of your wounds. Suddenly \w+ eyes go completely white as \w+ is limned in a Holy Light which soon dissipates into a fine mist that rolls down \w+ arms to cover you, bathing you in its curative powers\.$]],
        },
        {"RighteousBlade",
            [[^(?<ATTACKER>\w+) hold your weapon up in the air, calling forth power. A moment later, holy energy shines from within the weapon, piercing the shadows with effulgent light\.$]],
            nil,
            [[^(?<ATTACKER>\w+) holds \w+ weapon up in the air. A moment later, holy energy shines from within the weapon, piercing the shadows with effulgent light.$]],
        },
        {"HallowedGround",
            [[^With a whispered prayer and a delicate twist of your outstretched hand, (?<ATTACKER>\w+) send globes of light flying in each direction\.$]],
            nil,
            [[^Muttering prayers to \w+, (?<ATTACKER>\w+) slowly raises \w+ arms up from \w+ sides towards the heavens, and, as \w+ \w+ so, bright rays of holy light rise up from the ground\.$]],
        },
        {"Heretic",
            [[^(?<ATTACKER>\w+) brand (?<VICTIM>\w+) a heretic for \w+ crimes against the Light\.$]],
            [[^(?<ATTACKER>\w+) brands (?<VICTIM>\w+) a heretic for your crimes against the Light\.$]],
            [[^(?<ATTACKER>\w+) brands (?<VICTIM>\w+) a heretic for (his|her|their) crimes against the Light\.$]],
        },
        {"Infidel",
            [[^Having not learned the lessons of \w+ sins, (?<ATTACKER>\w+) mark the heretic (?<VICTIM>\w+) as an infidel for \w+ utter contempt for the Light\.$]],
            [[^(?<ATTACKER>\w+) marks (?<VICTIM>\w+) as an infidel for your utter contempt for the Light\.]],
            [[^(?<ATTACKER>\w+) marks (?<VICTIM>\w+) as an infidel for (his|her|their) utter contempt for the Light\.]],
        },
        {"Inquisition",
            [[^Having no other option, (?<ATTACKER>\w+) call down an inquisition upon (?<VICTIM>\w+). A pillar of holy fire strikes \w+ from the heavens, leaving \w+ standing there frozen with an expression of terror on \w+ face\.$]],
            [[^(?<ATTACKER>\w+) calls down an inquisition upon (?<VICTIM>\w+), and a pillar of holy fire strikes you from the heavens. A bright pain streaks through your body but you cannot move or even cry out in agony\.$]],
            [[^(?<ATTACKER>\w+) calls down an inquisition upon (?<VICTIM>\w+), and a pillar of holy fire strikes (him|her|them) from the heavens.\.$]], --unsure
        },
        {"TrueHeal",
            [[^(?<ATTACKER>\w+) give yourself wholly unto the Light, and feel a divine presence fill you from brow to feet. As you are lifted off the ground, you turn slowly in utter ecstasy as the presence of the Supernals fill you with power and joy\.$]],
            nil,
            [[^(?<ATTACKER>\w+) stretches \w+ arms out to either side and drops \w+ head back with \w+ eyes closed. A blinding white light strikes \w+ on the forehead and travels to \w+ feet, lifting \w+ off the ground. As \w+ slowly turns, all \w+ wounds heal and a blazing aura pulsates around \w+\.$]],
        },

    },
        -- Aeonics
}