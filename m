Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11v7iu-0003Ie-00
	for mtd-list@infradead.org; Mon, 06 Dec 1999 23:39:16 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11v7iq-0003IY-00
	for mtd@imladris.mvhi.com; Mon, 06 Dec 1999 23:39:13 +0000
Message-ID: <384C49A2.CBD3B7CD@danielind.com>
Date: Mon, 06 Dec 1999 17:41:22 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: power down]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Bob Canup wrote:
> 
> The reason that I said that expecting anything to work during power down
> is wishful thinking is this: once the voltage to a digital chip goes
> below the minimum specification of the chip, the behavior of the chip
> becomes indeterminate.

That's why the stuff you need to protect during a power down (SRAM say),
has
its own backup battery and writes to the SRAM are shut off as soon as
the system voltage falls below the operational threshold.

> 
> For example: the old Western Digital 1791 double density disk controller
> chip would sometimes glitch in such a way during power down that it
> would write to the floppy - you could see the floppy light blink when
> this happened.

Someone's buggy design does not mean that a better way does not exist.
Obviously the chip was buggy if it exhibited this behavior.


> 
> Unless chips are specifically designed to handle power down conditions
> this sort of thing happens.  For example - any competently designed
> Flash memory has to refuse to write if the voltage is below spec.

This is true. Flash chips will not initiate a write if power is not
within specs. So this helps design a system that CAN survive random
power downs.

> 
> As to flushing the buffers and doing a shutdown when a power fail
> condition occurs - I believe that Linux already has code to handle a
> power down such as I described. What I have described is very similar to
> a UPS signaling the kernel that power is going down. Linux can do an
> ordered shutdown when it receives the signal.

Unfortunately the times involved are an order of magnitude different. An
embedded system may not have more than a few hundred milliseconds at
best. a UPS will provide a few minutes of power at worst. If the lowest
layers (in this case MTD) cannot guarantee handling of power downs, how
will the upper layer help?

> 
> Qualifying digital circuitry with a POWER GOOD signal is very similar to
> protecting the circuitry with a typical 'SCR over voltage crowbar
> circuit': it makes the engineer feel good - but it doesn't actually do
> much of anything.

I'm sorry. I do not agree with this one bit. A low voltage detect
generated reset signal can gate (stop) writes to SRAM within sub 1 nano
seconds intervals. Don't see how the SCR analogy is relevant here.


> 
> Why doesn't the crowbar work? After all, it is a text book circuit. The
> answer is that the SCR is a power device which takes on the order of 10
> microseconds to turn on while the delicate chips are destroyed by a few
> nanoseconds of over voltage. The result is that the SCR never turns on -
> the fuse blows because the weakest digital chip  shorts the power supply
> to ground. One could "protect" SCR's with digital chips, but not the
> other way around.
> 
> Another example of "feel good engineering" is the power on self test
> which most computers have. One can only test non critical sections of
> the machine: if anything critical is broken the POST won't run - and a
> tech will have to figure out what is wrong. It's a bit like asking
> yourself "Am I alive?" If you can ask the question the answer is always
> "Yes".

Actually this can be a very good answer to why we are on this planet! If
we weren't we would not be asking the question!! Anyway not relevant
here :)


<desperate plea>
Come on guys (and gals). Am I championing a lost cause here? Have we
given up on power down reliability of nonvolatile data in embedded
systems under Linux?

Is anyone interested in this!? Lurkers please respond. How many people
read this list anyway?
</desperate plea>


> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Vipin Malik
Daniel Industries
vmalik@danielind.com
All content my views and not my employers etc. etc.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
