#####a#######################################
# Sexy.tcl 0.1                    #30/01/21 #
#############################################
#Author  ComputerTech                       #
#IRC     Irc.DareNet.Org  #ComputerTech     #
#Email   ComputerTech@DareNet.Org           #
#URL     https://darenet.dev/computertech   #
#################################################################################################################################################################
# Start Of Configuration #
##########################

#Set trigger of the commands.

set sexy(trig) "!"


##################
#Set Flag of usage of commands

set sexy(tflag) "-|-"

########################
# End Of Configuration #
#################################################################################################################################################################
bind pub $sexy(tflag) $sexy(trig)jizz sexy:jizz
bind pub $sexy(tflag) $sexy(trig)spank sexy:spank
bind pub $sexy(tflag) $sexy(trig)dare sexy:dare

set var2939 0
set var3492 0

proc throttled {id seconds} {
   global throttle
   if {[info exists throttle($id)]&&$throttle($id)>[clock seconds]} {
      set id 1
   } {
      set throttle($id) [expr {[clock seconds]+$seconds}]
      set id 0
   }
}
bind time - ?0* throttledCleanup
proc throttledCleanup args {
   global throttle
   set now [clock seconds]
   foreach {id time} [array get throttle] {
      if {$time<=$now} {unset throttle($id)}
   }
}
proc throttled {id time} {
   global throttled
   if {[info exists throttled($id)]} {
      return 1
   } {
      set throttled($id) [clock seconds]
      utimer $time [list unset throttled($id)]
      return 0
   }
}
set sayitnow {
	  "Jerks his cock while watching %rando and...."
  	"Watches some Donkey Porn and..."
    "has a wet dream about %rando's Mom and...."
    "Watches some videos from PornHub shared by %rando and....."
    "chokes his chicken while looking at %nick in the eyes and..."
    "spanks %nick's while watching midget porn and..."
    "Takes a dose of blue balls, jerks of and....."
    "See's a Hot Blonde, starts jerking off and....."
    "Whacks his cock off %rando's ass and...."
    "Watches %rando, %rando and %rando jerking off and....."
}
set sayitnow2 {
	"JIZZES!!! over %nick's dad while looking into %nick's mom's eyes"
	"CUMS! and squirts out %squirts times over %nick and %rando"
  "CUMS! and squirts out %squirts times over %nick"
	"Jizz's over %nick's Ass"
	"Ejaculate's into %nick's Pussy"
	"Cumms deep into %nick's dirty brown love hole"
	"CUMMMS!!!! and SQUIRTS %squirts times, giving %nick a creampie"
	""
}
set spankdagurl {
"Spanks %nick with a Roll of toilet roll"
"Spanks and whacks %nick with a smelly fish"
"Beats %nick with a pink nawty cane"
"Spanks %nick with a Windows porn disk"
"Spanks %nick with %rando and some chocolate"
"Spanks %nuck with his dick"
}
set randdare {
 "%nick, Tell %rando to Fuck Off"
 "%nick, PM %rando asking for a blowjob"
 "%nick, Spam for 5 seconds on this channel"
 "%nick, Tell everyone when you first had sex"
 "%nick, Do 7 emoji's in a row"
 "%nick, Cycle this channel 3 times"
 "%nick, PM 3 Users saying cum suck my dick"
 "%nick, CUM 7 times in this channel"
 "%nick, Tell us when you enjoy drinking the most"
 "%nick, Share the most embarrassing time on IRC you have ever experienced"
 "%nick, Ask a OP to Kick you from this channel"
 "%nick, Be a Troll for 10 minutes"
 "%nick, Shout I AM A PRINCESS in this channel loud and clear"
 "%nick, Tell us who your crush is "
 "%nick  Start fapping"
 "%nick, Tell me(the bot) how you feel about me"
 "%nick, Call me a troll"
 "%nick, PM a user you have never spoke to before and tell them I love you"
 "%nick, Tell us a lame joke, because you are a lame fucker"
 "%nick, Go suck someone's cock"
 "%nick, Be a Cunt for 3 minutes"
 
}
if {![info exists last_nick]} {set last_nick $botnick}
proc spin_bunny {nick host hand chan text} {
  global botnick last_nick rep result
 if {![onchan $last_nick $chan]} {set last_nick $botnick}
  set mylist [chanlist $chan]
  set wb [lsearch $mylist $botnick]
  set mylist [lreplace $mylist $wb $wb]
  set wn [lsearch $mylist $nick]
  set mylist [lreplace $mylist $wn $wn]  
 if {$last_nick != $botnick} {
    set wl [lsearch $mylist $last_nick]
    set mylist [lreplace $mylist $wl $wl]
  }  
  set mylength [llength $mylist]
set myindex [rand $mylength]
set result [lindex $mylist $myindex]
}
proc sexy:jizz {nick host hand chan text} {
	global sayitnow var2939 sayitnow2 var3492 result 
    spin_bunny $nick $host $hand $chan $text
  if {[throttled $host,$chan 5]} {;return}
	set squirts [rand 10]
	set var213 [lindex [split $text] 0 ]
	set reply [lindex $sayitnow [rand [llength $sayitnow]]]
	set reply2 [lindex $sayitnow2 [rand [llength $sayitnow2]]]
	incr var2939 +1
	incr var3492 +$squirts
  set line [string map [list %nick $var213 %rando $::result %squirts $var3492] $reply] 
  set line2 [string map [list %nick $var213 %rando $::result %squirts $var3492] $reply2] 
	puthelp "PRIVMSG $chan :\001ACTION $line\001"
	puthelp "PRIVMSG $chan :\001ACTION $line2\001"
	puthelp "PRIVMSG $chan :I have cummed $var2939 times with $var3492 squirts"
}
proc sexy:spank {nick host hand chan text} {
global spankdagurl result
set var219 [lindex [split $text] 0 ]
set replyhottie [lindex $spankdagurl [rand [llength $spankdagurl]]]
set line69 [string map [list %nick $var219 %rando $::result] $replyhottie] 
puthelp "PRIVMSG $chan :\001ACTION $line69\001"
}
proc sexy:dare {nick host hand chan text} {
global rando randdare result
set dareass [lindex $randdare [rand [llength $randdare]]]
set dare22 [string map [list %rando $::result %nick $nick] $dareass] 
putserv "PRIVMSG $chan :$dare22"
}
