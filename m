Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11vMpl-0003kJ-00
	for mtd-list@infradead.org; Tue, 07 Dec 1999 15:47:21 +0000
Received: from [209.184.180.169] (helo=bob.faxtel.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11vMpj-0003kD-00
	for mtd@imladris.mvhi.com; Tue, 07 Dec 1999 15:47:19 +0000
Message-ID: <384D2C2D.6A6F4CE6@go2fax.com>
Date: Tue, 07 Dec 1999 09:47:57 -0600
From: Bob Canup <rcanup@go2fax.com>
MIME-Version: 1.0
To: MTD <mtd@imladris.mvhi.com>
Subject: Re: [Fwd: power down]
References: <384C49A2.CBD3B7CD@danielind.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Vipin Malik wrote:

> Bob Canup wrote:
> >

I don't think that you understand what we're trying to tell you. There is a
difference in philosophy.

If you are running a flash as a normal read - write imitation of a disk there
are severe time limitations as to how long the flash is going to work because
of the limit on write cycles which flash technology has. As has been pointed
out in an earlier post - one write a second will ruin a flash chip in a few
weeks - which is not a very long for an embedded system to work.

Because of this limitation most of the people in this group who do design
with flash use it in a Write Rarely Read Mostly manner. The only time the
flash is written to is when there is a firmware upgrade. This is also the
manner in which flash chips are used on conventional PC motherboards - if you
lose power during a firmware upgrade - you are in trouble - nor do I see any
practical method of handling that problem.

If you are trying to use the flash in a data - logging application where the
file system has to be read - write to store data you are very quickly going
to run into the write cycle limitations of the technology. I don't think that
flash is the correct technology to use in such an application.

We use our DOC2000 in read only mode - with things like /var in volatile ram
disk - we have found this to be a satisfactory way of doing things.

Now - as to the issue of a POWER GOOD signal. The inverse of a POWER GOOD
signal is *POWER BAD. The reason for sending this signal to a chip is to tell
it that it won't function properly if it attempts to perform its operation.
But if the power is bad the chip is not working properly so it can't respond
properly to the *POWER BAD signal. This is the equivalent of saying to a dead
man "You're dead". That is true - but it does little good to tell him that.

That is the reason that there are no POWER GOOD input pins on anybody's
chips. In addition the analog detectors which generate the *POWER BAD signal
do not respond in nanoseconds - that is the reason for my analogy to the SCR
crowbar. By the time that the analog detectors respond you have been
operating the chips out of spec for a long time by digital standards.

Now because of the Yin and Yang nature of reality there can be some use to a
properly designed power fail detection circuit - but the way they are mostly
used is as a placebo.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
