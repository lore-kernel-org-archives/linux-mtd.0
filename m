Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14soEO-0003Hh-00
	for mtd-list@infradead.org; Thu, 26 Apr 2001 17:03:00 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14soEN-0003Hb-00
	for mtd@infradead.org; Thu, 26 Apr 2001 17:02:59 +0100
Message-ID: <30724FF712DFD2119E6200104B24489201197483@mail1>
From: Vipin Malik <Vipin.Malik@daniel.com>
To: 'Chris Read ' <chris.read@activesilicon.co.uk>,
	"''mtd@infradead.org' '" <mtd@infradead.org>
Subject: RE: Power blackouts and brownouts
Date: Thu, 26 Apr 2001 10:55:01 -0500
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Well, I haven't seen any flash chips without a reset line, not to say that
they aren't out there.

With a flash chip *with* a reset line, and one which is connected to the
system reset, and assuming that the reset gets asserted in a power down, up,
and brown condition, then everything is ok.

JFFS(2) are designed for this situation and will (are supposed to)
successfully recover on the next power up and all your writes that got
written with CRC will be there. Any write that did not get completed will
not be there at all. If you were overwriting a portion of an existing file,
then the original portion will (should) be still there.

The case of the *no flash chip reset* line is more complicated and you can
have the following situations, particularly in brownouts:

1. Flash chip gets reset as internal VCC monitoring threshold is
(numerically) greater than the system (CPU) reset threshold. In this case,
your flash chip state machine will get reset. In this case there are 2
conditions:
  a. If the flash chip was not being written to or read from, there is no
effect
  b. If the flash chip was being written to, it's state m/c will get reset
and most likely it's generate a fatal error in the JFFS or MTD write code.
You are unlikely to recover from this as the code is not written to retry
"fatal" errors like the state m/c getting reset in the middle of an
operation (AFAIK).

2. The processor gets reset in a brown out, but not the flash chip. Again
you have 2 conditions:
  a. If the flash chip was in the "default" read state, no problem as the
processor will expect and find it readable. Life is good.
  b. If the flash was in some other state (erasing or write), depending on
how fast the processor comes back up and tries to access the flash, the
flash may or may not respond to a read request. You are then hosed.

In summary, if your hardware is designed "right" you do not (read: should
not) have to worry about file system inconsistency problems as any data
corruption issues are taken care of by JFFS(2) design.

What type of flash chips do not have a hardware reset line? Any examples?

Vipin
P.S. All this is IMHO (In my humble opinion) of course. And that opinion has
been known to be fallable and wrong in more than one occasion in the past!
 

-----Original Message-----
From: Chris Read
To: 'mtd@infradead.org'
Sent: 4/26/01 8:06 AM
Subject: Power blackouts and brownouts

Does anyone know what actually happens to a flash chip when the power 
starts to fail during an erase or a write cycle? We are all trying to
write 
code which can recover when abruptly halted at any point, but can all
the 
devices which we are using claim the same?

I have noticed that several flash devices have a power on reset line;
most 
however do not. Whilst I appreciate that flash devices are not fully
static 
like SRAM or EPROM, and therefore must have some way of initialising in
a 
known state at power up; most devices appear to not need this external 
signal. My hypothesis is therefore that this line may be more for
abruptly 
stopping any internal state machine during the first stages of a
brown-out 
whilst there is still sufficient power available to do so.

Any thoughts?

Chris Read




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
