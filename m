Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vRIk-0003uh-00
	for mtd-list@infradead.org; Tue, 07 Dec 1999 20:33:34 +0000
Received: from [205.230.20.89] (helo=kona.xsilogy.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vRIh-0003ub-00
	for mtd@imladris.mvhi.com; Tue, 07 Dec 1999 20:33:32 +0000
Message-ID: <011a01bf40f2$b9660f00$6600160a@isidesign.com>
From: "Jon Burford" <jburford@xsilogy.com>
To: "Vipin Malik" <vmalik@danielind.com>, "MTD" <mtd@imladris.mvhi.com>
References: <384C49A2.CBD3B7CD@danielind.com>
Subject: Re: [Fwd: power down]
Date: Tue, 7 Dec 1999 12:36:21 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

I am actually extremely interested in this issue, although I am not very
qualified to present possible solutions.  I am primarily a systems and
software guy and have been constructing an embedded linux system which boots
off an M-Systems DOC2000 and runs mostly out of ram disk.  The board I am
using has a watchdog timer which could spuriously reset the board (just like
hitting the reset button on your PC).  Power failures are also a reality I
must deal with.  I must at least make an attempt to guarantee that the
system will always come back up (the damaged DOC2000 filesystem will be
repaired by e2fsck upon subsequent boot up).  To give you an idea of
what/when I am doing flash writes, I am running postgres whose db files are
in flash and am doing about a 20-100 byte record insert per minute (on
average).  The log files in /var/log/* are also in flash.  There are no
custom apps which write often to syslog and I am not running mail (although
I am running apache which I could, but haven't yet turned off logging for).
I mount the DOC2000 on /usr, but write only to the logs and db files (I have
'chattr i' on all other files in /usr).  What I would like to get an opinion
on is:

1) What is the probability that e2fsck will not be able to reapair the
filesystem?
2) What is the probability that I will damage the boot sector and lilo will
not be able to being to boot at all?
3) Since I use a pretty standard 5/12 V switching power supply and embedded
PC board (a 40W compact version of a standard PC power supply w/o fan), do I
have any hope in making HW or SW changes to possibly reduce or fix this
problem?

Any suggestions or insight much appreciated.

Regards,
Jon



----- Original Message -----
From: Vipin Malik <vmalik@danielind.com>
To: MTD <mtd@imladris.mvhi.com>
Sent: Monday, December 06, 1999 3:41 PM
Subject: [Fwd: power down]


> Bob Canup wrote:
> >
> > The reason that I said that expecting anything to work during power down
> > is wishful thinking is this: once the voltage to a digital chip goes
> > below the minimum specification of the chip, the behavior of the chip
> > becomes indeterminate.
>
> That's why the stuff you need to protect during a power down (SRAM say),
> has
> its own backup battery and writes to the SRAM are shut off as soon as
> the system voltage falls below the operational threshold.
>
> >
> > For example: the old Western Digital 1791 double density disk controller
> > chip would sometimes glitch in such a way during power down that it
> > would write to the floppy - you could see the floppy light blink when
> > this happened.
>
> Someone's buggy design does not mean that a better way does not exist.
> Obviously the chip was buggy if it exhibited this behavior.
>
>
> >
> > Unless chips are specifically designed to handle power down conditions
> > this sort of thing happens.  For example - any competently designed
> > Flash memory has to refuse to write if the voltage is below spec.
>
> This is true. Flash chips will not initiate a write if power is not
> within specs. So this helps design a system that CAN survive random
> power downs.
>
> >
> > As to flushing the buffers and doing a shutdown when a power fail
> > condition occurs - I believe that Linux already has code to handle a
> > power down such as I described. What I have described is very similar to
> > a UPS signaling the kernel that power is going down. Linux can do an
> > ordered shutdown when it receives the signal.
>
> Unfortunately the times involved are an order of magnitude different. An
> embedded system may not have more than a few hundred milliseconds at
> best. a UPS will provide a few minutes of power at worst. If the lowest
> layers (in this case MTD) cannot guarantee handling of power downs, how
> will the upper layer help?
>
> >
> > Qualifying digital circuitry with a POWER GOOD signal is very similar to
> > protecting the circuitry with a typical 'SCR over voltage crowbar
> > circuit': it makes the engineer feel good - but it doesn't actually do
> > much of anything.
>
> I'm sorry. I do not agree with this one bit. A low voltage detect
> generated reset signal can gate (stop) writes to SRAM within sub 1 nano
> seconds intervals. Don't see how the SCR analogy is relevant here.
>
>
> >
> > Why doesn't the crowbar work? After all, it is a text book circuit. The
> > answer is that the SCR is a power device which takes on the order of 10
> > microseconds to turn on while the delicate chips are destroyed by a few
> > nanoseconds of over voltage. The result is that the SCR never turns on -
> > the fuse blows because the weakest digital chip  shorts the power supply
> > to ground. One could "protect" SCR's with digital chips, but not the
> > other way around.
> >
> > Another example of "feel good engineering" is the power on self test
> > which most computers have. One can only test non critical sections of
> > the machine: if anything critical is broken the POST won't run - and a
> > tech will have to figure out what is wrong. It's a bit like asking
> > yourself "Am I alive?" If you can ask the question the answer is always
> > "Yes".
>
> Actually this can be a very good answer to why we are on this planet! If
> we weren't we would not be asking the question!! Anyway not relevant
> here :)
>
>
> <desperate plea>
> Come on guys (and gals). Am I championing a lost cause here? Have we
> given up on power down reliability of nonvolatile data in embedded
> systems under Linux?
>
> Is anyone interested in this!? Lurkers please respond. How many people
> read this list anyway?
> </desperate plea>
>
>
> >
> > To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>
> Vipin Malik
> Daniel Industries
> vmalik@danielind.com
> All content my views and not my employers etc. etc.
>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
