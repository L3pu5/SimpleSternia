SimpleSternia.Lines = {
    -- Generic
    -- Knighthood
    ["Knighthood"] = {
        {"Strike",
            [[^Focusing on \w+ (?<LIMB>.+), (?<ATTACKER>\w+) strike at (?<VICTIM>\w+) with .+\.$]],
            [[^With a focused look, (?<ATTACKER>\w+) strikes at (?<VICTIM>\w+) (?<LIMB>.+) with .+\.$]],
            nil,
        },
        {"Raze(Speed)",
            [[^(?<ATTACKER>\w+) raze (?<VICTIM>\w+)'s speed defence with .+\.$]],
            [[^(?<ATTACKER>\w+) razes (?<VICTIM>\w+) speed defence with .+\.$]],
            nil,
        }
        {"Raze(Shield)",
            [[^(?<ATTACKER>\w+) raze (?<VICTIM>\w+)'s magical shield with .+\.$]],
            [[^(?<ATTACKER>\w+) razes (?<VICTIM>\w+) magical shield with .+\.]],
            nil,
        }
        {"Raze",
            [[^(?<ATTACKER>\w+) whip .+ through the air in front of (?<VICTIM>\w+), to no effect\.$]],
            [[]],
            [[]],
        }
    },
    ["Axelord"] = {
        {"Swing",
            [[^(?<ATTACKER>\w+) hack into (?<VICTIM>\w+) with your axe, spraying blood as you shear \w+ (?<LIMB>.+)\.$]],
            [[^(?<ATTACKER>\w+) hacks into (?<VICTIM>\w+) with \w+ axe, spraying blood as \w+ shears your (?<LIMB>.+), leaving it (?<WOUNDS>.+)\.$]],
            nil,
        },
        {"Sliceforehead",
            [[^(?<ATTACKER>\w+) slash across (?<VICTIM>\w+)'s forehead leaving a long furrow that weeps blood onto \w+ face.$]],
            [[^A slash across (?<VICTIM>\w+) forehead leaves a long furrow that weeps blood onto your face\.$]],
            nil,
        },
        {"Severphrenic",
            [[^(?<ATTACKER>\w+) hack through (?<VICTIM>\w+)'s midriff, drawing your blade out in a spray of crimson blood as \w+ wheezes to breathe\.$]],
            [[^(?<ATTACKER>\w+) hacks through (?<VICTIM>\w+) midriff, drawing \w+ blade out in a spray of crimson blood as your lungs wheeze to breathe\.$]],
            nil,
        },
        {"Upsetstomach",
            [[^(?<ATTACKER>\w+) heave your axe into (?<VICTIM>\w+)'s gut which causes \w+ to spit up bloody bile\.$]],
            [[^(?<ATTACKER>\w+) heaves \w+ axe into your gut, causing (?<VICTIM>\w+) to spit up bloody bile\.$]],
            nil,
        },
        {"Breakarm",
            [[^(?<ATTACKER>\w+) strike into (?<VICTIM>\w+)'s (?<LIMB>left arm|right arm), which breaks with a loud crack\.$]],
            [[^(?<ATTACKER>\w+) strikes into (?<VICTIM>\w+) (?<LIMB>left arm|right arm), breaking it with a loud crack\.$]],
            nil,
        },
        {"Knockdown",
            [[^With an elegant stroke, (?<ATTACKER>\w+) sweep (?<VICTIM>\w+)'s leg out from under \w+, knocking \w+ to the ground\.$]],
            [[^With an elegant stroke,  (?<ATTACKER>\w+) sweeps your legs out from under (?<VICTIM>\w+), knocking you to the ground\.$]],
            nil,
        },
        {"Sweep",
            [[^Sweeping your axe through the air, (?<ATTACKER>\w+) send it whooshing straight into (?<VICTIM>\w+)'s (?<LIMB>.+)\.$]],
            [[^Sweeping \w+ axe through the air, (?<ATTACKER>\w+) sends it whooshing straight into (?<VICTIM>\w+) (?<LIMB>.+), leaving it (?<WOUNDS>.+)\.$]],
            nil,
        },
        {"Slitthroat"
            [[^(?<VICTIM>\w+) hack into (?<ATTACKER>\w+)'s neck and blood fountains out in a thick spray\.$]],
            [[^(?<VICTIM>\w+) hacks into (?<ATTACKER>\w+) neck and blood fountains out in a thick spray\.$]],
            nil,
        },
        {"Gashchest",
            [[^(?<ATTACKER>\w+) slash through (?<VICTIM>\w+)'s chest, gashing apart layers of skin to reveal \w+ bloody ribcage\.$]],
            [[^(?<VICTIM>\w+) slashes through (?<ATTACKER>\w+) chest, gashing apart layers of skin to reveal your bloody ribcage\.$]],
            nil,
        },
        {"Disembowel",
            [[^(?<ATTACKER>\w+) blade burrows into (?<VICTIM>\w+)'s gut and coils of bloody intestines spill out in a grotesque mass\.$]],
            [[^(?<ATTACKER>\w+)'s blade burrows into (?<VICTIM>\w+) gut and coils of bloody intestines spill out in a grotesque mass.$]],
            nil,
        },
        {"Whack",
            [[^(?<ATTACKER>\w+) turn .+ to the side and slam it into (?<VICTIM>\w+)'s head, leaving \w+ stunned and confused\.$]],
            [[^(?<ATTACKER>\w+) turns .+ to the side and slams it into your head, leaving (?<VICTIM>\w+) stunned and confused\.$]],
            nil,
        },
        {"Legtendon"
            [[^(?<ATTACKER>\w+) hack the tendon above (?<VICTIM>\w+)'s (?<LIMB>left|right) heel, making \w+ scream as it is completely severed\.$]],
            [[^(?<ATTACKER>\w+) hacks the tendon above (?<VICTIM>\w+) (?<LIMB>left|right) heel and you scream in agony as it is completely severed\.$]],
            nil,
        },
        {"Amputatearm"
            [[^(?<VICTIM>\w+)'s (?<LIMB>left arm|right arm) is completely cut through, flying through the air as blood splurts out in a fountain at the severed shoulder joint\.$]],
            [[^(?<ATTACKER>\w+) cuts completely through (?<VICTIM>\w+) (?<LIMB>left arm|right arm), which flies through the air as blood splurts out in a fountain at the severed shoulder joint\.$]],
            nil,
        },

    },
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
      {"Cosmicfire", 
            [[^(?<ATTACKER>\w+) allow an infinitesimally small mote of cosmic fire to manifest and direct it at (?<VICTIM>\w+). Cosmic fire blasts forth, dissolving \w+ flesh in a sparkling current of energy\.$]],
            [[^(?<ATTACKER>\w+) raises a palm which glows with a tiny pinpoint of light. The light turns into a sparkling current of energy that slams into (?<VICTIM>\w+), dissolving your flesh\.$]],
            [[^(?<ATTACKER>\w+) raises a palm which glows with a tiny pinpoint of light. The light turns into a sparkling current of energy that slams into (?<VICTIM>\w+), dissolving (his|her|their) flesh\.$]],
      }
    },
    -- Rituals
    
        -- Sacraments
    ["Sacraments"] = {
        {"Holybeing",
            [[^You bow your head and begin to chant a prayer to the Holy Supernals, beseeching them to imbue your mortal soul with the radiance of the Light. An indescribable warmth and comfort envelops you as your senses suddenly expand, golden motes of light racing down your skin as you open your eyes, gazing out upon the world with a renewed and sacrosanct presence\.$]],
            nil,
            [[^(?<ATTACKER>\w+) chants a vibrant prayer to the Holy Supernals, beseeching them to heal you of your wounds. Suddenly \w+ eyes go completely white as \w+ is limned in a Holy Light which soon dissipates into a fine mist that rolls down \w+ arms to cover you, bathing you in its curative powers\.$]],
        },
        {"Righteousblade",
            [[^(?<ATTACKER>\w+) hold your weapon up in the air, calling forth power. A moment later, holy energy shines from within the weapon, piercing the shadows with effulgent light\.$]],
            nil,
            [[^(?<ATTACKER>\w+) holds \w+ weapon up in the air. A moment later, holy energy shines from within the weapon, piercing the shadows with effulgent light.$]],
        },
        {"ProcRighteousblade",
            [[^As (?<ATTACKER>\w+) strike (?<VICTIM>\w+), \w+ \w+ briefly illuminated and struck by a bolt of blue lightning\.$]],
            [[^As (?<VICTIM>\w+) are struck, you see the vision of an angel who quickly strikes you with a bolt of blue lightning\.$]],
            nil,
        },
        {"Hallowedground",
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
        {"Trueheal",
            [[^(?<ATTACKER>\w+) give yourself wholly unto the Light, and feel a divine presence fill you from brow to feet. As you are lifted off the ground, you turn slowly in utter ecstasy as the presence of the Supernals fill you with power and joy\.$]],
            nil,
            [[^(?<ATTACKER>\w+) stretches \w+ arms out to either side and drops \w+ head back with \w+ eyes closed. A blinding white light strikes \w+ on the forehead and travels to \w+ feet, lifting \w+ off the ground. As \w+ slowly turns, all \w+ wounds heal and a blazing aura pulsates around \w+\.$]],
        },

    },
        -- Aeonics
}