#############################################
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
set var2939 0
set var3492 0

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
    "Watches %rando jerking off and....."
}
set sayitnow2 {
	"JIZZES!!! over %nick's dad while looking into %nick's mom's eyes"
	"CUMS! and squirts out %squirts times over %nick and %rando"
    "CUMS! and squirts out %squirts times over %nick"
	"Jizz's over %nick's Ass"
	"Ejaculate's into %nick's Pussy"
	"Cumms deep into %nick's dirty brown love hole"
	"CUMMMS!!!! and SQUIRTS %squirts times, giving %nick a creampie"
}
proc sexy:jizz {nick host hand chan text} {
	global sayitnow var2939 sayitnow2 var3492
    if {[throttled $host,$chan 60]} {
    return 
   }
    set nicks [chanlist $chan]
    set randnick [lindex $nicks [rand [llength $nicks]]]
	set squirts [rand 10]
	set var213 [lindex [split $text] 0 ]
    if {[onchan $var213 $chan]} {
	set reply [lindex $sayitnow [rand [llength $sayitnow]]]
	set reply2 [lindex $sayitnow2 [rand [llength $sayitnow2]]]
	incr var2939 +1
	incr var3492 +$squirts
  set line [string map [list %nick $var213 %rando $randnick %squirts $squirts] $reply] 
  set line2 [string map [list %nick $var213 %rando $randnick %squirts $squirts] $reply2] 
	puthelp "PRIVMSG $chan :\001ACTION $line\001"
	puthelp "PRIVMSG $chan :\001ACTION $line2\001"
	puthelp "PRIVMSG $chan :I have cummed $var2939 times with $var3492 squirts"
  }
 }
#################################################################################################################################################################
