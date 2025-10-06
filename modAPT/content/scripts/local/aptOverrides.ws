@addMethod(CR4Player)
private function aptInit() {
    var igconfig : CInGameConfigWrapper;
    igconfig = theGame.GetInGameConfigWrapper();

    if (
        !igconfig.GetVarValue('APTConfig', 'APTVersion') ||
        StringToFloat(igconfig.GetVarValue('APTConfig', 'APTVersion')) != 2.0f
    ) {
        igconfig.SetVarValue('APTConfig', 'APTEnabled', 2);
        igconfig.SetVarValue('APTConfig', 'APTTargetSelector', 3);
        igconfig.SetVarValue('APTConfig', 'APTIcon', 2);
        igconfig.SetVarValue('APTConfig', 'APTVersion', "2.0");
    }

    AddEffectDefault(EET_APT, NULL, 'modAPT');
}

@wrapMethod(CR4Player)
function OnSpawned( spawnData : SEntitySpawnData ) {
    wrappedMethod(spawnData);
    aptInit();
    LogApt("INITIALIZED");
}

@wrapMethod(W3GameEffectManager)
function HACK_NO_MEMORY_TO_COMPILE_CacheEffect_Part2(effect : EEffectType) : bool {
    var found: bool;

    found = wrappedMethod(effect);
    if(!found) {
        if(effect == EET_APT) {
            effects[effect] = new W3Effect_APT in this;
            found = true;
        }
    }

    return found;
}

@replaceMethod
function HACK_NO_MEMORY_TO_COMPILE_EffectNameToType_Part2(effectName : name, out type : EEffectType, out abilityName : name) {
    var effectType, abilityNameStr : string;

    if(StrSplitFirst(NameToString(effectName),"_",effectType,abilityNameStr))
    {
        abilityName = effectName;	
    }
    else
    {
        effectType = effectName;	
        abilityName = '';
    }

    switch(effectType)
    {
        
        case "Mutagen01Effect" : type = EET_Mutagen01; break;
        case "Mutagen02Effect" : type = EET_Mutagen02; break;
        case "Mutagen03Effect" : type = EET_Mutagen03; break;
        case "Mutagen04Effect" : type = EET_Mutagen04; break;
        case "Mutagen05Effect" : type = EET_Mutagen05; break;
        case "Mutagen06Effect" : type = EET_Mutagen06; break;
        case "Mutagen07Effect" : type = EET_Mutagen07; break;
        case "Mutagen08Effect" : type = EET_Mutagen08; break;
        case "Mutagen09Effect" : type = EET_Mutagen09; break;
        case "Mutagen10Effect" : type = EET_Mutagen10; break;
        case "Mutagen11Effect" : type = EET_Mutagen11; break;
        case "Mutagen12Effect" : type = EET_Mutagen12; break;
        case "Mutagen13Effect" : type = EET_Mutagen13; break;
        case "Mutagen14Effect" : type = EET_Mutagen14; break;
        case "Mutagen15Effect" : type = EET_Mutagen15; break;
        case "Mutagen16Effect" : type = EET_Mutagen16; break;
        case "Mutagen17Effect" : type = EET_Mutagen17; break;
        case "Mutagen18Effect" : type = EET_Mutagen18; break;
        case "Mutagen19Effect" : type = EET_Mutagen19; break;
        case "Mutagen20Effect" : type = EET_Mutagen20; break;
        case "Mutagen21Effect" : type = EET_Mutagen21; break;
        case "Mutagen22Effect" : type = EET_Mutagen22; break;
        case "Mutagen23Effect" : type = EET_Mutagen23; break;
        case "Mutagen24Effect" : type = EET_Mutagen24; break;
        case "Mutagen25Effect" : type = EET_Mutagen25; break;
        case "Mutagen26Effect" : type = EET_Mutagen26; break;
        case "Mutagen27Effect" : type = EET_Mutagen27; break;
        case "Mutagen28Effect" : type = EET_Mutagen28; break;
        
        
        case "AcidEffect" :									type = EET_Acid;						break;
        case "WellRestedEffect" :							type = EET_WellRested;					break;
        case "HorseStableBuffEffect" :						type = EET_HorseStableBuff;				break;
        case "BookshelfBuffEffect" :						type = EET_BookshelfBuff;				break;
        case "PolishedGenitalsEffect" :						type = EET_PolishedGenitals;			break;		
        case "Mutation12CatEffect" :						type = EET_Mutation12Cat;				break;
        case "AerondightEffect" :							type = EET_Aerondight;					break;
        case "POIGorA10Effect" :							type = EET_POIGorA10;					break;

        case "APTEffect" :                                  type = EET_APT;                         break; // modApt

        default : 
            LogAssert(false, "EffectNameToType: Effect with name <<"+effectName+">> is not defined!");
            type = EET_Undefined;
            break;
    }
        
}

@replaceMethod
function EffectTypeToName(effectType : EEffectType) : name {
    switch(effectType)
    {
        case EET_AutoEssenceRegen : 					return 'AutoEssenceRegen';
        case EET_AutoMoraleRegen : 						return 'AutoMoraleRegen';
        case EET_AutoStaminaRegen : 					return 'AutoStaminaRegen';
        case EET_AutoVitalityRegen : 					return 'AutoVitalityRegen';
        case EET_AutoAirRegen : 						return 'AutoAirRegen';
        case EET_AutoPanicRegen : 						return 'AutoPanicRegen';
        case EET_AutoSwimmingStaminaRegen : 			return 'AutoSwimmingStaminaRegen';
        case EET_BoostedEssenceRegen : 					return 'BoostedEssenceRegen';
        case EET_BoostedStaminaRegen : 					return 'BoostedStaminaRegen';
        
        case EET_Blindness : 							return 'BlindnessEffect';
        case EET_WraithBlindness : 						return 'WraithBlindnessEffect';
        case EET_Confusion : 							return 'ConfusionEffect';
        case EET_Frozen : 								return 'FrozenEffect';
        case EET_Tornado : 								return 'TornadoEffect';
        case EET_Trap : 								return 'TrapEffect';
        case EET_HeavyKnockdown : 						return 'HeavyKnockdownEffect';
        case EET_Hypnotized : 							return 'HypnotizedEffect';
        case EET_WitchHypnotized : 						return 'WitchHypnotizedEffect';
        case EET_Immobilized : 							return 'ImmobilizedEffect';
        case EET_Knockdown : 							return 'KnockdownEffect';
        case EET_KnockdownTypeApplicator : 				return 'KnockdownTypeApplicator';
        case EET_LongStagger : 							return 'LongStaggerEffect';
        case EET_Paralyzed : 							return 'ParalyzedEffect';
        case EET_Stagger : 								return 'StaggerEffect';
        case EET_Swarm : 								return 'SwarmEffect';
        case EET_Snowstorm : 							return 'SnowstormEffect';
        case EET_SnowstormQ403 : 						return 'SnowstormEffectQ403';
        case EET_CounterStrikeHit : 					return 'CounterStrikeHitEffect';
        case EET_Ragdoll : 								return 'RagdollEffect';
        
        case EET_Bleeding : 							return 'BleedingEffect';
        
        
        case EET_Bleeding1 : 							return 'BleedingEffect1';
        case EET_Bleeding2 : 							return 'BleedingEffect2';
        case EET_Bleeding3 : 							return 'BleedingEffect3';
        
        
        case EET_BleedingTracking :						return 'BleedingTrackingEffect';
        case EET_Burning : 								return 'BurningEffect';
        case EET_Poison : 								return 'PoisonEffect';
        case EET_PoisonCritical : 						return 'PoisonCriticalEffect';
        case EET_DoTHPRegenReduce : 					return 'DoTHPRegenReduceEffect';
        case EET_Acid :									return 'AcidEffect';
        
        case EET_Toxicity : 							return 'ToxicityEffect';
        case EET_AdrenalineDrain : 						return 'AdrenalineDrainEffect';
        case EET_AirDrain : 							return 'AirDrainEffect';
        case EET_AirDrainDive : 						return 'AirDrainDiveEffect';
        case EET_StaminaDrainSwimming : 				return 'StaminaDrainSwimmingEffect';
        case EET_StaminaDrain : 						return 'StaminaDrainEffect';
        case EET_VitalityDrain : 						return 'VitalityDrainEffect';
        
        case EET_Fact : 								return 'FactPotion';
        
        case EET_BlackBlood : 							return 'BlackBloodEffect';
        case EET_Blizzard : 							return 'BlizzardEffect';
        case EET_Cat : 									return 'CatEffect';
        case EET_Pull : 								return 'PullEffect';
        case EET_Tangled : 								return 'TangledEffect';
        case EET_FullMoon : 							return 'FullMoonEffect';
        case EET_GoldenOriole : 						return 'GoldenOrioleEffect';
        case EET_KillerWhale : 							return 'KillerWhaleEffect';
        case EET_MariborForest : 						return 'MariborForestEffect';
        case EET_PetriPhiltre : 						return 'PetriPhiltreEffect';
        case EET_Swallow : 								return 'SwallowEffect';
        case EET_TawnyOwl : 							return 'TawnyOwlEffect';
        
        
        case EET_ReinaldPhiltre : 						return 'ReinaldPhiltreEffect';
        
        case EET_Thunderbolt : 							return 'ThunderboltEffect';
        case EET_WhiteHoney : 							return 'WhiteHoneyEffect';
        case EET_WhiteRaffardDecoction : 				return 'WhiteRaffardDecoctionEffect';
        case EET_PheromoneNekker : 						return 'PheromoneEffectNekker';
        case EET_PheromoneDrowner : 					return 'PheromoneEffectDrowner';
        case EET_PheromoneBear : 						return 'PheromoneEffectBear';
        
        case EET_AxiiGuardMe : 							return 'AxiiGuardMeEffect';
        case EET_BattleTrance : 						return 'BattleTranceEffect';
        case EET_YrdenHealthDrain : 					return 'YrdenHealthDrainEffect';
        case EET_IgnorePain : 							return 'IgnorePainEffect';
        
        case EET_ShrineAard : 							return 'ShrineAardEffect';
        case EET_ShrineAxii : 							return 'ShrineAxiiEffect';
        case EET_ShrineIgni : 							return 'ShrineIgniEffect';
        case EET_ShrineQuen : 							return 'ShrineQuenEffect';
        case EET_ShrineYrden : 							return 'ShrineYrdenEffect';
        
        case EET_LowHealth : 							return 'LowHealthEffect';
        case EET_Slowdown : 							return 'SlowdownEffect';
        case EET_SlowdownFrost : 						return 'SlowdownFrostEffect';
        case EET_SlowdownAxii : 						return 'SlowdownAxiiEffect';
        case EET_Edible : 								return 'EdibleEffect';
        case EET_AbilityOnLowHealth : 					return 'AbilityOnLowHPEffect';
        case EET_Drowning : 							return 'DrowningEffect';
        case EET_Choking : 								return 'ChokingEffect';
        case EET_OverEncumbered : 						return 'OverEncumberedEffect';
        case EET_SilverDust : 							return 'SilverDustEffect';
        case EET_WeatherBonus : 						return 'WeatherBonusEffect';
        case EET_WellFed : 								return 'WellFedEffect';
        case EET_WellHydrated : 						return 'WellHydratedEffect';
        case EET_AirBoost : 							return 'AirBoostEffect';
        case EET_Drunkenness : 							return 'DrunkennessEffect';
        case EET_EnhancedArmor : 						return 'EnhancedArmorEffect';
        case EET_EnhancedWeapon : 						return 'EnhancedWeaponEffect';
        case EET_WolfHour : 							return 'WolfHourEffect';
        case EET_Weaken : 								return 'WeakenEffect';
        case EET_Runeword8 : 							return 'Runeword8Effect';
        case EET_Oil : 									return 'OilEffect';
        case EET_LynxSetBonus : 						return 'LynxSetBonusEffect';
        case EET_GryphonSetBonus: 						return 'GryphonSetBonusEffect';
        case EET_GryphonSetBonusYrden : 				return 'GryphonSetBonusYrdenEffect';
        case EET_Mutation7Buff : 						return 'Mutation7BuffEffect';
        case EET_Mutation7Debuff : 						return 'Mutation7DebuffEffect';
        case EET_Mutation10 :							return 'Mutation10Effect';
        case EET_Mutation11Buff :						return 'Mutation11BuffEffect';
        case EET_Mutation11Debuff :						return 'Mutation11DebuffEffect';
        case EET_Perk21InternalCooldown :				return 'Perk21InternalCooldownEffect';
        case EET_HorseStableBuff :						return 'HorseStableBuff';
        case EET_Mutation12Cat :						return 'Mutation12CatEffect';
        case EET_Mutation11Immortal :					return 'Mutation11ImmortalEffect';
        case EET_ToxicityVenom :						return 'ToxicityVenomEffect';
        case EET_BasicQuen :							return 'BasicQuenEffect';
        
        
        case EET_StaggerAura : 							return 'StaggerAuraEffect';
        case EET_FireAura : 							return 'FireAuraEffect';
        case EET_WeakeningAura :						return 'WeakeningAuraEffect';
        
        
        case EET_Mutagen01 : 							return 'Mutagen01Effect';
        case EET_Mutagen02 : 							return 'Mutagen02Effect';
        case EET_Mutagen03 : 							return 'Mutagen03Effect';
        case EET_Mutagen04 : 							return 'Mutagen04Effect';
        case EET_Mutagen05 : 							return 'Mutagen05Effect';
        case EET_Mutagen06 : 							return 'Mutagen06Effect';
        case EET_Mutagen07 : 							return 'Mutagen07Effect';
        case EET_Mutagen08 : 							return 'Mutagen08Effect';
        case EET_Mutagen09 : 							return 'Mutagen09Effect';
        case EET_Mutagen10 : 							return 'Mutagen10Effect';
        case EET_Mutagen11 : 							return 'Mutagen11Effect';
        case EET_Mutagen12 : 							return 'Mutagen12Effect';
        case EET_Mutagen13 : 							return 'Mutagen13Effect';
        case EET_Mutagen14 : 							return 'Mutagen14Effect';
        case EET_Mutagen15 : 							return 'Mutagen15Effect';
        case EET_Mutagen16 : 							return 'Mutagen16Effect';
        case EET_Mutagen17 : 							return 'Mutagen17Effect';
        case EET_Mutagen18 : 							return 'Mutagen18Effect';
        case EET_Mutagen19 : 							return 'Mutagen19Effect';
        case EET_Mutagen20 : 							return 'Mutagen20Effect';
        case EET_Mutagen21 : 							return 'Mutagen21Effect';
        case EET_Mutagen22 : 							return 'Mutagen22Effect';
        case EET_Mutagen23 : 							return 'Mutagen23Effect';
        case EET_Mutagen24 : 							return 'Mutagen24Effect';
        case EET_Mutagen25 : 							return 'Mutagen25Effect';
        case EET_Mutagen26 : 							return 'Mutagen26Effect';
        case EET_Mutagen27 : 							return 'Mutagen27Effect';
        case EET_Mutagen28 : 							return 'Mutagen28Effect';
        case EET_WellRested :							return 'WellRestedEffect';
        case EET_BookshelfBuff :						return 'BookshelfBuffEffect';
        case EET_PolishedGenitals :						return 'PolishedGenitalsEffect';
        case EET_Aerondight :							return 'AerondightEffect';
        case EET_POIGorA10 :							return 'POIGorA10Effect';
        case EET_Mutation3 :							return 'Mutation3Effect';
        case EET_Mutation4 :							return 'Mutation4Effect';
        case EET_Mutation5 :							return 'Mutation5Effect';

        case EET_APT :                                  return 'APTEffect';
            
        default : 
            LogAssert(false, "EffectTypeToName: Effect type <<" + effectType + ">> is undefined!");
            return '';
    }
} 

@addMethod(W3GamerProfile)
public final function GetAchievementStatus(achievement: EAchievement): SAPTAchievementStatus {
    var i, j : int;
    var foundFTs: array<SAvailableFastTravelMapPin>;
    var response: SAPTAchievementStatus;

    response.achievement = achievement;
    response.achievementName = AchievementEnumToName(achievement);
    response.complete = theGame.IsAchievementUnlocked(response.achievementName);

    if(achievement == EA_Explorer) {
        foundFTs = theGame.GetCommonMapManager().GetFastTravelPoints(true, false, false, true, true);
        response.progress = foundFTs.Size();
        response.target = 100;
        return response;
    }
    
    for(i=0; i<statistics.Size(); i+=1) {
        for(j=0; j<statistics[i].registeredAchievements.Size(); j+=1) {
            if(statistics[i].registeredAchievements[j].type != achievement) continue;

            response.statName = StatisticEnumToName(statistics[i].statType);
            response.progress = FactsQuerySum(response.statName);
            response.target = CeilF(statistics[i].registeredAchievements[j].requiredValue);
            return response;
        }
    }

    return response;
}

@replaceMethod(CR4HudModuleBuffs)
function OnTick( timeDelta : float ) {
    var effectsSize : int;
    var effectArray : array< CBaseGameplayEffect >;
    var i : int;
    var offset : int;
    var duration : float;
    var extraValue : int;
    var initialDuration : float;
    var hasRunword5 : bool;
    var oilEffect : W3Effect_Oil;
    var aerondightEffect : W3Effect_Aerondight;
    var aptEffect : W3Effect_APT; // modAPT
    var effectType : EEffectType;

    if ( !CanTick( timeDelta ) )
        return true;

    _previousEffects = _currentEffects;
    _currentEffects.Clear();
    
    if( bDisplayBuffs && GetEnabled() )
    {		
        offset = 0;
        
        effectArray = thePlayer.GetCurrentEffects();
        effectsSize = effectArray.Size();
        hasRunword5 = false;
        
        for ( i = 0; i < effectsSize; i += 1 )
        {
            if(effectArray[i].ShowOnHUD() && effectArray[i].GetEffectNameLocalisationKey() != "MISSING_LOCALISATION_KEY_NAME" )
            {	
                
                initialDuration = effectArray[i].GetInitialDurationAfterResists();
                
                if ( (W3RepairObjectEnhancement)effectArray[i] && GetWitcherPlayer().HasRunewordActive('Runeword 5 _Stats') )
                {
                    hasRunword5 = true;
                    
                    if (!m_runword5Applied)
                    {
                        m_runword5Applied = true;
                        UpdateBuffs();
                        break;
                    }
                }

                effectType = effectArray[i].GetEffectType();

                if( initialDuration < 1.0)
                {
                    initialDuration = 1;
                    duration = 1;
                }
                else
                {
                    duration = effectArray[i].GetDurationLeft();
                    if ( thePlayer.CanUseSkill( S_Perk_14 ) &&
                        ( effectType == EET_ShrineAxii || 
                            effectType == EET_ShrineIgni || 
                            effectType == EET_ShrineQuen || 
                            effectType == EET_ShrineYrden || 
                            effectType == EET_ShrineAard
                        )
                        )
                    {
                        
                        duration = effectArray[i].GetInitialDuration() + 1;
                    }
                    else if ( effectType == EET_EnhancedWeapon ||
                                effectType == EET_EnhancedArmor )
                    {
                        if ( GetWitcherPlayer().HasRunewordActive('Runeword 5 _Stats') )
                        {
                            
                            duration = effectArray[i].GetInitialDuration() + 1;
                        }
                    }
                    else
                    {
                        if(duration < 0.f)
                            duration = 0.f;		
                    }
                }
                
                if ( effectType == EET_Oil )
                {
                    oilEffect = (W3Effect_Oil)effectArray[ i ];
                    if ( oilEffect )
                    {
                        
                        if (oilEffect.GetAmmoCurrentCount() > 0 && GetWitcherPlayer().CanUseSkill(S_Alchemy_s06) && GetWitcherPlayer().GetSkillLevel(S_Alchemy_s06) > 2)
                        {
                            initialDuration = oilEffect.GetAmmoMaxCount();
                            duration		= oilEffect.GetAmmoMaxCount();
                        }
                        else
                        {
                            initialDuration = oilEffect.GetAmmoMaxCount();
                            duration		= oilEffect.GetAmmoCurrentCount();
                        }
                    }
                }					
                else if( effectType == EET_Aerondight )
                {
                    aerondightEffect = (W3Effect_Aerondight)effectArray[i];
                    if( aerondightEffect )
                    {
                        initialDuration = aerondightEffect.GetMaxCount();
                        duration		= aerondightEffect.GetCurrentCount();
                    }
                } 
                // modApt >>
                else if( effectType == EET_APT ){ 
                    aptEffect = (W3Effect_APT)effectArray[i];
                    if( aptEffect )
                    {
                        initialDuration = aptEffect.GetMaxCount();
                        duration		= aptEffect.GetCurrentCount();
                    }
                }
                // << modApt
                else if( effectType == EET_BasicQuen )
                {
                    
                    extraValue = ( ( W3Effect_BasicQuen ) effectArray[i] ).GetStacks();
                    
                }
                else if( effectType == EET_Mutation3 )
                {						
                    duration = ( ( W3Effect_Mutation3 ) effectArray[i] ).GetStacks();
                    initialDuration = duration;
                }
                else if( effectType == EET_Mutation4 )
                {						
                    duration = ( ( W3Effect_Mutation4 ) effectArray[i] ).GetStacks();
                    initialDuration = duration;
                }
                else if( effectType == EET_Mutation5 )
                {						
                    duration = ( ( W3Effect_Mutation5 ) effectArray[i] ).GetStacks();
                    initialDuration = ( ( W3Effect_Mutation5 ) effectArray[i] ).GetMaxStacks();
                }
                else if( effectType == EET_Mutation7Buff || effectType == EET_Mutation7Debuff )
                {	
                    
                    extraValue = ( ( W3Mutation7BaseEffect ) effectArray[i] ).GetStacks();
                }
                else if( effectType == EET_Mutation10 )
                {						
                    duration = ( ( W3Effect_Mutation10 ) effectArray[i] ).GetStacks();
                    initialDuration = duration;
                }
                
                if(_currentEffects.Size() < i+1-offset)
                {
                    _currentEffects.PushBack(effectArray[i]);
                    m_fxSetPercentSFF.InvokeSelfFourArgs( FlashArgNumber(i-offset),FlashArgNumber( duration ), FlashArgNumber( initialDuration ), FlashArgInt( extraValue ) );
                }
                else if( effectArray[i].GetEffectType() == _currentEffects[i-offset].GetEffectType() )
                {
                    m_fxSetPercentSFF.InvokeSelfFourArgs( FlashArgNumber(i-offset),FlashArgNumber( duration ), FlashArgNumber( initialDuration ), FlashArgInt( extraValue ) );
                }
                else
                {
                    LogChannel('HUDBuffs',i+" something wrong");
                }
            }
            else
            {
                offset += 1;
                
            }
        }
        
        if (!hasRunword5 && m_runword5Applied)
        {
            m_runword5Applied = false;
            UpdateBuffs();
        }
    }

    
    if ( _currentEffects.Size() == 0 && _previousEffects.Size() == 0 )
        return true;

    
    if ( buffListHasChanged(_currentEffects, _previousEffects) || _forceUpdate )
    {
        _forceUpdate = false;
        UpdateBuffs();
    }

}

@replaceMethod(CR4HudModuleBuffs)
function UpdateBuffs() {
    var l_flashObject			: CScriptedFlashObject;
    var l_flashArray			: CScriptedFlashArray;
    var i 						: int;
    var oilEffect				: W3Effect_Oil;
    var aerondightEffect		: W3Effect_Aerondight;
    var aptEffect               : W3Effect_APT;	// modAPT
    var buffDisplayLimit		: int = 16;
    var mut3Buff 				: W3Effect_Mutation3;
    var mut4Buff 				: W3Effect_Mutation4;
    var mut5Buff 				: W3Effect_Mutation5;
    var effectType				: EEffectType;
    var mut7Buff 				: W3Mutation7BaseEffect;
    var mut10Buff 				: W3Effect_Mutation10;
    var buffState				: int;
    var format					: int;
    var quenBuff 				: W3Effect_BasicQuen;
    
    
    var isOilInfinite : bool;

    l_flashArray = GetModuleFlashValueStorage()().CreateTempFlashArray();
    for(i = 0; i < Min(buffDisplayLimit,_currentEffects.Size()); i += 1) 
    {
        if(_currentEffects[i].ShowOnHUD() && _currentEffects[i].GetEffectNameLocalisationKey() != "MISSING_LOCALISATION_KEY_NAME" )
        {
            if(_currentEffects[i].IsNegative())
            {
                buffState = 0;
            }
            else if ( _currentEffects[i].IsPositive() )
            {
                buffState = 1;
            }
            else if ( _currentEffects[i].IsNeutral() )
            {
                buffState = 2;
            }

            effectType = _currentEffects[i].GetEffectType();

            
            if(thePlayer.IsSkillEquipped( S_Alchemy_s06 ) && GetWitcherPlayer().CanUseSkill(S_Alchemy_s06) && GetWitcherPlayer().GetSkillLevel(S_Alchemy_s06) > 2)
                isOilInfinite = true;
            
            if ( effectType == EET_Oil && isOilInfinite )
            {
                
                format = 0;
            }
            else if ( effectType == EET_Oil || effectType == EET_Aerondight )
            {
                
                format = 1;
            }
            // modApt >>
            else if ( effectType == EET_APT ) { 
                format = 1; 
            }
            // << modApt
            else if ( effectType == EET_Mutation3 || effectType == EET_Mutation4 || effectType == EET_Mutation5 || effectType == EET_Mutation10 )
            {
                
                format = 2;
            }
            else if ( effectType == EET_Mutation7Buff || effectType == EET_Mutation7Debuff || effectType == EET_BasicQuen )
            {
                
                format = 4;
            }
            else
            {
                
                format = 3;
            }
            
            l_flashObject = m_flashValueStorage.CreateTempFlashObject();
            l_flashObject.SetMemberFlashBool("isVisible",_currentEffects[i].ShowOnHUD());
            l_flashObject.SetMemberFlashString("iconName",_currentEffects[i].GetIcon());
            l_flashObject.SetMemberFlashString("title",GetLocStringByKeyExt(_currentEffects[i].GetEffectNameLocalisationKey()));
            l_flashObject.SetMemberFlashBool("IsPotion",_currentEffects[i].IsPotionEffect());
            l_flashObject.SetMemberFlashInt("isPositive", buffState);
            l_flashObject.SetMemberFlashInt("format", format);
            
            if ( effectType == EET_Oil )
            {	
                oilEffect = (W3Effect_Oil)_currentEffects[i];
                if ( oilEffect )
                {
                    
                    if (oilEffect.GetAmmoCurrentCount() > 0 && isOilInfinite)
                    {
                        l_flashObject.SetMemberFlashNumber("duration",        oilEffect.GetAmmoMaxCount() 	  * 1.0 );
                        l_flashObject.SetMemberFlashNumber("initialDuration", oilEffect.GetAmmoMaxCount() 	  * 1.0 );
                        l_flashObject.SetMemberFlashInt("format", 0);
                    }
                    
                    else
                    {
                        l_flashObject.SetMemberFlashNumber("duration",        oilEffect.GetAmmoCurrentCount() * 1.0 );
                        l_flashObject.SetMemberFlashNumber("initialDuration", oilEffect.GetAmmoMaxCount() 	  * 1.0 );
                    }
                }
            }
            else if( effectType == EET_Aerondight )
            {
                aerondightEffect = (W3Effect_Aerondight)_currentEffects[i];
                if( aerondightEffect )
                {
                    l_flashObject.SetMemberFlashNumber("duration",        aerondightEffect.GetCurrentCount() * 1.0 );
                    l_flashObject.SetMemberFlashNumber("initialDuration", aerondightEffect.GetMaxCount()	 * 1.0 );
                }
            }
            // modApt >>
            else if( effectType == EET_APT ) { 
                aptEffect = (W3Effect_APT)_currentEffects[i];
                if( aptEffect )
                {
                    l_flashObject.SetMemberFlashNumber("duration",        aptEffect.GetCurrentCount());
                    l_flashObject.SetMemberFlashNumber("initialDuration", aptEffect.GetMaxCount());
                }
            }
            // << modApt
            else if( effectType == EET_Mutation3 )
            {						
                mut3Buff = ( W3Effect_Mutation3 ) _currentEffects[i];						
                l_flashObject.SetMemberFlashNumber("duration", 			mut3Buff.GetStacks() );
                l_flashObject.SetMemberFlashNumber("initialDuration", 	mut3Buff.GetStacks() );
            }
            else if( effectType == EET_Mutation4 )
            {						
                mut4Buff = ( W3Effect_Mutation4 ) _currentEffects[i];						
                l_flashObject.SetMemberFlashNumber("duration", 			mut4Buff.GetStacks() );
                l_flashObject.SetMemberFlashNumber("initialDuration", 	mut4Buff.GetStacks() );
            }
            else if( effectType == EET_Mutation5 )
            {						
                mut5Buff = ( W3Effect_Mutation5 ) _currentEffects[i];						
                l_flashObject.SetMemberFlashNumber("duration", 			mut5Buff.GetStacks() );
                l_flashObject.SetMemberFlashNumber("initialDuration", 	mut5Buff.GetStacks() );
            }
            
            
            else if( effectType == EET_Mutation10 )
            {						
                mut10Buff = ( W3Effect_Mutation10 ) _currentEffects[i];						
                l_flashObject.SetMemberFlashNumber("duration", 			mut10Buff.GetStacks() );
                l_flashObject.SetMemberFlashNumber("initialDuration", 	mut10Buff.GetStacks() );
            }
            else if ( (W3RepairObjectEnhancement)_currentEffects[i] && GetWitcherPlayer().HasRunewordActive('Runeword 5 _Stats') )
            {
                l_flashObject.SetMemberFlashNumber("duration", -1 );
                l_flashObject.SetMemberFlashNumber("initialDuration", -1 );
            }
            else
            {
                l_flashObject.SetMemberFlashNumber("duration",_currentEffects[i].GetDurationLeft() );
                l_flashObject.SetMemberFlashNumber("initialDuration", _currentEffects[i].GetInitialDurationAfterResists());
            }
            l_flashArray.PushBackFlashObject(l_flashObject);	
        }
    }
    
    m_flashValueStorage.SetFlashArray( "hud.buffs", l_flashArray );
}

@addMethod(CR4HudModuleBuffs)
public function APTUpdateBuffs() { 
    UpdateBuffs(); 
}
