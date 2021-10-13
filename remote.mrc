
on *:LOAD: {
 set %fileloc $finddir(c:\Users,keembot*,1) $+ \

on *:CONNECT: {
 join #keemsrevenge

on *:TEXT:!keemsbot:#: {
 if ($nick isop $chan) {
    describe $chan I'm a custom Twitch Chat Bot Coded by Keem himself!
    halt
  }
  describe $chan bot
}

on *:TEXT:!keemtest:#: {
  describe $chan $finddir(c:\Users,keembot*,1) $+ \
}

on *:TEXT:!keem:#: {
  describe $chan Say hi to me!
}

on *:TEXT:!botsin:#: {
  describe $chan i bhop thru smokes and hit flickshots with awp in csgo. no hacks, just skill LUL
}

on *:TEXT:!coop:#: {
  describe $chan i W key everyone and squad wipe 2 teams then get clapped LUL
}

on *:TEXT:!discord:#: {
  describe $chan Here is the link to my discord server: https://discord.gg/6NPMFnj
}

on *:TEXT:!kari:#: {
  describe $chan i die to bots then steal all of ur loot after u squad wipe 10 teams then revive me LUL
}

on *:TEXT:!rod:#: {
  describe $chan "i swear to god im uninstalling this game" comes back next day LUL
}

on *:TEXT:!vash:#: {
  describe $chan i blow up my teammembers with splodes and suicide bomb with dynamite after i laser with my aimbot LUL
}
/*
on $*:text:/^!commandadd9 !?(\S+)/iS:#:{
  if ($readini(%fileloc $+ pstats.ini,$nick,admin) != 1) {
    describe $chan You're not a keemsBot Admin!
    halt
  }
  if (!$2) {
    describe $chan Syntax: !commandadd (!command) (response)
    halt
  }  
  writeini %fileloc $+ commands.ini commands $regml(1) $$3-
}
*/
/*
on *:text:!commandadd*:#:{
  if ($readini(%fileloc $+ pstats.ini,$nick,admin) != 1) {
    describe $chan You're not a keemsBot Admin!
    halt
  }
  if (!$2) || (!$3) {
    describe $chan Syntax: !commandadd (!command) (response)
    halt
  }
  if ($left($2,1) == $chr(33)) {
    writeini %fileloc $+ commands.ini commands $mid($2,2-) $$3-
    describe $chan The command " $+ $2 $+ " has been added to the custom commands list!
  }
  else {
    describe $chan Syntax Error: All commands must begin with "!"
  }
}

on *:text:!commandremove*:#:{
  if ($readini(%fileloc $+ pstats.ini,$nick,admin) != 1) {
    describe $chan You're not a keemsBot Admin!
    halt
  }
  if (!$2) {
    describe $chan Syntax: !commandremove (!command)
    halt
  }
  if ($left($2,1) == $chr(33)) {
    remini %fileloc $+ commands.ini commands $mid($2,2-)
    describe $chan The command " $+ $2 $+ " has been removed from the custom commands list!
  }
  else {
    describe $chan Syntax Error: All commands must begin with "!"
  }  
}

on $*:text:/^!(\S+)/:#:{
  if ($readini(%fileloc $+ pstats.ini,$nick,admin) != 1) return
  if ($readini(%fileloc $+ commands.ini,n,commands,$regml(1))) msg # $v1
}

alias safe return $!decode( $encode($1,m) ,m)
*/

on *:text:!commandadd*:#:{
  describe $chan this command is currently disabled, under further development 
}

on *:text:!commandremove*:#:{
  describe $chan this command is currently disabled, under further development 
}


on *:TEXT:!toganns:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,admin) != 1) {
    describe $chan You're not a keemsBot Admin!
    halt
  }
  if ($readini(%fileloc $+ keemsBot.ini,settings,togann) != 1) {
    describe $chan You've turned announcements on!
    writeini %fileloc $+ keemsBot.ini settings togann 1
    .timerann 0 300 describe $chan $!read %fileloc $+ anns.txt
  }
  else {
    describe $chan You've turned announcements off!
    writeini %fileloc $+ keemsBot.ini settings togann 0
    .timerann off
  }
}

on *:TEXT:!makeadmin*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,owner) != 1) {
    describe $chan You're not my owner! May the real Keem please stand up!
    halt
  }
  if (!$2) {
    describe $chan Syntax: !makeadmin (user)
    halt
  }
  describe $chan You've made $2 a keemsBot Admin!
  writeini %fileloc $+ pstats.ini $2 admin 1
}

on *:TEXT:!removeadmin*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,owner) != 1) {
    describe $chan You're not my owner! May the real Keem please stand up!
    halt
  }
  if (!$2) {
    describe $chan Syntax: !removeadmin (user)
    halt
  }
  describe $chan You've removed $2 as a keemsBot Admin! Can I get an RIP in the chat? :(
  writeini %fileloc $+ pstats.ini $2 admin 0
}

on *:TEXT:!resetpushups*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,admin) != 1) {
    describe $chan You're not a keemsBot Admin!
    halt
  }
  if (!$2) {
    describe $chan Syntax: !resetpushups (user)
    halt
  }
  describe $chan You've reset $2 $+ 's pushup requests!
  writeini %fileloc $+ pstats.ini $2 pushups 0
}

on *:TEXT:!suggest*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,registered) != 1) {
    describe $chan You must be registered with keemsBot to make a suggestion! Type !register
    halt
  }
  if (!$2) {
    describe $chan Syntax: !suggest (suggestion)
    halt
  }   
  describe $chan Thank you for your suggestion $nick $+ ! It has been documented and Keem has been notified!
  write %fileloc $+ suggestions.txt $nick $+ : $2-
}

on *:TEXT:!cmds*:#: {
  describe $chan  admincmds: !commandadd !commandremove
  describe $chan  usercmds: !register !tips !pstats !dopushups !suggest
  describe $chan  You can also type /me punches or slaps to interact with other chatters!
}
on *:TEXT:!tips*:#: {
  describe $chan  This is a mIRC bot coded by Keem himself. Do !cmds to see a list of commands!
  describe $chan  You can request me to do a set of pushups by typing !dopushups
  describe $chan  Make sure you register so I can keep track of your stats by typing !register
}
on *:TEXT:!register*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,registered) == 1) {
    describe $chan This account has already been registered with keemsBot!
    halt
  }
  describe $chan Your account has officially been registered with keemsBot! Go off homie!
  writeini %fileloc $+ pstats.ini $nick registered 1
  writeini %fileloc $+ pstats.ini $nick bslap 0 
  writeini %fileloc $+ pstats.ini $nick bpunch 0
  writeini %fileloc $+ pstats.ini $nick slap 0
  writeini %fileloc $+ pstats.ini $nick punch 0
  writeini %fileloc $+ pstats.ini $nick pushups 0
}
/*
on *:TEXT:!oldpushhupstext09*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,pushups) == 2) {
    describe $chan Your last pushups request has been sent to Keem! You will be able to request again after 24 hours!
    var %+ = $readini(%fileloc $+ pstats.ini,$nick,pushups)
    inc %+ 1
    writeini %fileloc $+ pstats.ini $nick pushups %+    
    halt
  }
  if ($readini(%fileloc $+ pstats.ini,$nick,pushups) > 2) {
    describe $chan Are you trying to kill Keem!? You already made 3 requests, quit being mean!
    halt
  }  
  var %+ = $readini(%fileloc $+ pstats.ini,$nick,pushups)
  inc %+ 1
  writeini %fileloc $+ pstats.ini $nick pushups %+
  describe $chan Your pushups request has been sent directly to Keem. He will complete a set after he is done with his current game. You currently are on ( $+ $readini(%fileloc $+ pstats.ini,$nick,pushups) $+ /3)
}
*/
on *:TEXT:!dopushups*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,pushups) == 2) {
    describe $chan Your last pushups request has been sent, you will be able to send more requests after 12 hours!
    var %+ = $readini(%fileloc $+ pstats.ini,$nick,pushups)
    inc %+ 1
    writeini %fileloc $+ pstats.ini $nick pushups %+    
    writeini %fileloc $+ pstats.ini $nick pushupstimer $ctime    
    halt
  }
  if ($readini(%fileloc $+ pstats.ini,$nick,pushups) > 2) {
    if ($calc($ctime - $readini(%fileloc $+ pstats.ini,$nick,pushupstimer)) < 43200) {
      describe $chan Are you trying to kill Keem!? Your pushup requests will reset in 12 hours. It has been $int($calc($calc($ctime - $readini(%fileloc $+ pstats.ini,$nick,pushupstimer)) / 3600)) hours since your last request $nick
      halt
    }
    else {
      writeini %fileloc $+ pstats.ini $nick pushups 0    
      var %+ = $readini(%fileloc $+ pstats.ini,$nick,pushups)
      inc %+ 1
      writeini %fileloc $+ pstats.ini $nick pushups %+
      describe $chan Your pushups request has been sent directly to Keem. He will complete a set after he is done with his current game. You currently are on ( $+ $readini(%fileloc $+ pstats.ini,$nick,pushups) $+ /3)      
      halt
    }    
  }  
  var %+ = $readini(%fileloc $+ pstats.ini,$nick,pushups)
  inc %+ 1
  writeini %fileloc $+ pstats.ini $nick pushups %+
  describe $chan Your pushups request has been sent directly to Keem. He will complete a set after he is done with his current game. You currently are on ( $+ $readini(%fileloc $+ pstats.ini,$nick,pushups) $+ /3)
}

on *:action:*slaps*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,registered) == 1) {
    var %+ = $readini(%fileloc $+ pstats.ini,$nick,slap), %++ = $readini(%fileloc $+ pstats.ini,$2,bslap)
    inc %+ 1
    inc %++ 1
    writeini %fileloc $+ pstats.ini $nick slap %+
    writeini %fileloc $+ pstats.ini $2 bslap %++
    describe $chan $nick on his bully ish! Homie slapped $readini(%fileloc $+ pstats.ini,$nick,slap) people and $2 has been slapped $readini(%fileloc $+ pstats.ini,$2,bslap) times! Don't let nobody bully you man!
  }
}
on *:action:*punches*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,registered) == 1) {
    var %+ = $readini(%fileloc $+ pstats.ini,$nick,punch), %++ = $readini(%fileloc $+ pstats.ini,$2,bpunch)
    inc %+ 1
    inc %++ 1
    writeini %fileloc $+ pstats.ini $nick punch %+
    writeini %fileloc $+ pstats.ini $2 bpunch %++
    describe $chan $nick outchea bitching people! He punched $readini(%fileloc $+ pstats.ini,$nick,punch) people and $2 has been punched $readini(%fileloc $+ pstats.ini,$2,bpunch) times! Don't let nobody bully you man!
  }
}
on *:TEXT:!pstats*:#: {
  if ($readini(%fileloc $+ pstats.ini,$nick,registered) != 1) {
    describe $chan This Account has not been registered with keemsBot!
    halt
  }
  if (!$2) {
    describe $chan You've requested Keem to do $readini(%fileloc $+ pstats.ini,$nick,pushups) sets of pushups!
    describe $chan You've been slapped $readini(%fileloc $+ pstats.ini,$nick,bslap) times and punched $readini(%fileloc $+ pstats.ini,$nick,bpunch) times!  
    describe $chan You slapped someone $readini(%fileloc $+ pstats.ini,$nick,slap) times and punched someone $readini(%fileloc $+ pstats.ini,$nick,punch) times!
    halt
  }
  if ($readini(%fileloc $+ pstats.ini,$2,registered) == 0) {
    describe $chan There is no user matching: $2 $+ !
    halt
  }
  describe $chan $2 has requested Keem to do $readini(%fileloc $+ pstats.ini,$2,pushups) sets of pushups!
  describe $chan $2 been slapped $readini(%fileloc $+ pstats.ini,$2,bslap) times and punched $readini(%fileloc $+ pstats.ini,$2,bpunch) times!  
  describe $chan $2 slapped someone $readini(%fileloc $+ pstats.ini,$2,slap) times and punched someone $readini(%fileloc $+ pstats.ini,$2,punch) times!
}
