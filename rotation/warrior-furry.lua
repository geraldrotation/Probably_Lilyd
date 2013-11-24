-- ProbablyEngine Rotation Packager
-- Custom Furry Warrior Rotation
-- Created on 2013-11-12 12:41:25

local function IsSlotHasSepll(slotID)
  return GetItemSpell(GetInventoryItemID('player', slotID))
end

ProbablyEngine.rotation.register_custom(72, 'Lily-d`s Furry Warrior', {
  --Trinket Procs
  --{'#trinket1'},
  --{'#trinket2'},
  
  -- Hotkeys
  {'英勇飞跃', 'modifier.lcontrol', 'ground'},
  {{{'剑刃风暴'}, {'巨龙怒吼'}}, 'modifier.lalt'},
  {'挫志战旗', 'modifier.lshift', 'ground'},
  {'集结呐喊', 'modifier.ralt'},

  -- Interrupts
  {{
    {'拳击'},
    {'瓦解怒吼', {'player.spell(拳击).cooldown < 14', 'target.range <= 10'}},
    {'群体反射', {'player.spell(瓦解怒吼).cooldown < 39', 'player.spell(拳击).cooldown < 13'}},
  }, 'modifier.interrupts'},

  -- Buffs
  {{
    {'乘胜追击'},
    {'战斗怒吼', {'!player.buff(寒冬号角)', '!player.buff(战斗怒吼)'}},
    {'命令怒吼', {'!player.buff(真言术：韧)', '!player.buff(命令怒吼)'}},
  }},

  -- Survival
  {{
    {'胜利在望'},
    {'乘胜追击'},
    {'剑在人在'},
  }, 'player.health < 25'},

  -- Cooldowns
  {{
    {'浴血奋战'},
    {'天神下凡'},
    {'鲁莽'},
    {'颅骨战旗'},
    {'集结呐喊', 'player.health < 15'},
  }, 'modifier.cooldowns'},

  -- AoE
  {{
    {'雷霆一击'},
    {'旋风斩'},
    {'顺劈斩', 'player.rage > 80'},
    {'剑刃风暴', 'player.buff(浴血奋战)'},
  }, 'modifier.multitarget'},

  -- Normal Rotation
  {{

    {{ -- no 巨人打击
      {'巨人打击'},
      {'嗜血'},
      {'怒击', 'player.buff(怒击！).count == 2'},
      {'巨龙怒吼', 'target.range <= 8'},
      {'怒击', 'player.buff(怒击！) = 1'},
      {'狂风打击', 'player.buff(血脉贲张)'},
      {'战斗怒吼', 'player.rage < 80'},
      {'英勇投掷'}, {'乘胜追击'}, {'胜利在望'},
      {'英勇打击', 'player.rage > 50'},
    }, '!target.debuff(巨人打击)'},

    {{ -- has 巨人打击
      {'#gloves', function() return IsSlotHasSepll(10) end},
      {'怒击', 'player.buff(怒击！).count == 2'},
      {'嗜血'},
      {'风暴之锤'},
      {'狂风打击', 'player.buff(血脉贲张)'},
      {'怒击', 'player.buff(怒击！) = 1'},
      {'狂暴之怒'},
      {'英勇投掷'}, {'乘胜追击'}, {'胜利在望'},
      {'狂风打击'},
    }, 'target.debuff(巨人打击)'},

  }, {'!player.buff(鲁莽)', 'target.health > 20'}},

  -- CD Rotation
  {{
    {'#gloves', function() return IsSlotHasSepll(10) end},
    {'巨人打击'},
    {'怒击', 'player.buff(怒击！).count == 2'},
    {'嗜血'},
    {'风暴之锤'},
    {'狂风打击', 'player.buff(血脉贲张)'},
    {'怒击', 'player.buff(怒击！).count == 1'},
    {'狂暴之怒'},
    {'英勇投掷'}, {'乘胜追击'}, {'胜利在望'},
    {'狂风打击'},
  }, {"player.buff(鲁莽)", "target.health > 20" }},

  {{
    {'#gloves', function() return IsSlotHasSepll(10) end},
    {'嗜血', 'player.rage < 120'},
    {'巨人打击'},
    {'怒击', 'player.buff(怒击！).count == 2'},
    {'斩杀', 'player.rage > 80'},
    {'风暴之锤', 'target.debuff(巨人打击)'},
    {'巨龙怒吼', {'!target.debuff(巨人打击)', 'target.range <= 8'}},
    {'怒击', 'player.buff(怒击！).count == 1'},
    {'狂风打击', 'player.buff(血脉贲张)'},
    {'斩杀'},
    {'战斗怒吼'},
    {'狂风打击'},
  }, 'target.health <= 20'},
  
  
})