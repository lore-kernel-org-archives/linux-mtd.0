Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vnpG-0004to-00
	for mtd-list@infradead.org; Wed, 08 Dec 1999 20:36:38 +0000
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vnpC-0004ti-00
	for mtd@imladris.mvhi.com; Wed, 08 Dec 1999 20:36:35 +0000
Message-ID: <384EC19E.A8771E55@danielind.com>
Date: Wed, 08 Dec 1999 14:37:50 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: [Fwd: [Fwd: power down]]
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Bob Canup wrote:
> 
> Vipin Malik wrote:
> 
> > Bob Canup wrote:
> > >
> 
> I don't think that you understand what we're trying to tell you. There is a
> difference in philosophy.
> 
> If you are running a flash as a normal read - write imitation of a disk there
> are severe time limitations as to how long the flash is going to work because
> of the limit on write cycles which flash technology has. As has been pointed
> out in an earlier post - one write a second will ruin a flash chip in a few
> weeks - which is not a very long for an embedded system to work.

One dosen't have to write to the flash every second, even if logs are
being generated that fast. You can accumulate writes in RAM (even backud
up RAM), and then archive them to FLASH every 5 minutes etc.

This is with RAW flash that does suffer from limited writes. If you have
some level of wear leveling then the # of writes one can do go up by an
order of magnitude.



> 
> Because of this limitation most of the people in this group who do design
> with flash use it in a Write Rarely Read Mostly manner. The only time the
> flash is written to is when there is a firmware upgrade. This is also the
> manner in which flash chips are used on conventional PC motherboards - if you
> lose power during a firmware upgrade - you are in trouble - nor do I see any
> practical method of handling that problem.

PC mother boards are NOT embedded systems. I refuse to accept any
limitation in the PC world to be applicable to the embedded world.


> 
> If you are trying to use the flash in a data - logging application where the
> file system has to be read - write to store data you are very quickly going
> to run into the write cycle limitations of the technology. I don't think that
> flash is the correct technology to use in such an application.


> 
> We use our DOC2000 in read only mode - with things like /var in volatile ram
> disk - we have found this to be a satisfactory way of doing things.

Some applications are ok this way. not all. If we are implementing a
solution general enough for all embedded systems, then this is a very
severe limitation.

> 
> Now - as to the issue of a POWER GOOD signal. The inverse of a POWER GOOD
> signal is *POWER BAD. The reason for sending this signal to a chip is to tell
> it that it won't function properly if it attempts to perform its operation.
> But if the power is bad the chip is not working properly so it can't respond
> properly to the *POWER BAD signal. This is the equivalent of saying to a dead
> man "You're dead". That is true - but it does little good to tell him that.
> 
> That is the reason that there are no POWER GOOD input pins on anybody's
> chips. In addition the analog detectors which generate the *POWER BAD signal
> do not respond in nanoseconds - that is the reason for my analogy to the SCR
> crowbar. By the time that the analog detectors respond you have been
> operating the chips out of spec for a long time by digital standards.

well actually, there is a "power good" pin on *ALL* microprocessors.
It's called RESET!
The system asserts this reset pin, keeping the micro from doing crazy
things till power stabilizes in the system and comes within the spec of
the micro. similarly on the downside, this reset is again asserted as
soon as power goes out of spec. The operation of reset functionality is
guranteed by the micro manufacturer for a range WAY beyond normal
operating voltage range of the chip.

As far as my experience tells me. This works!

> 
> Now because of the Yin and Yang nature of reality there can be some use to a
> properly designed power fail detection circuit - but the way they are mostly
> used is as a placebo.

I dont't agree with this. Lets just leave it at that :)

> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
