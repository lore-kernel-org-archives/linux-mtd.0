Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11tyNf-0001dT-00
	for mtd-list@infradead.org; Fri, 03 Dec 1999 19:28:35 +0000
Received: from [209.184.180.169] (helo=bob.faxtel.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11tyNe-0001dM-00
	for mtd@imladris.mvhi.com; Fri, 03 Dec 1999 19:28:34 +0000
Message-ID: <384819EA.5AEB1F19@go2fax.com>
Date: Fri, 03 Dec 1999 13:28:42 -0600
From: Bob Canup <rcanup@go2fax.com>
MIME-Version: 1.0
To: mtd@imladris.mvhi.com
Subject: power down
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

The reason that I said that expecting anything to work during power down
is wishful thinking is this: once the voltage to a digital chip goes
below the minimum specification of the chip, the behavior of the chip
becomes indeterminate.

For example: the old Western Digital 1791 double density disk controller
chip would sometimes glitch in such a way during power down that it
would write to the floppy - you could see the floppy light blink when
this happened.

Unless chips are specifically designed to handle power down conditions
this sort of thing happens.  For example - any competently designed
Flash memory has to refuse to write if the voltage is below spec.

As to flushing the buffers and doing a shutdown when a power fail
condition occurs - I believe that Linux already has code to handle a
power down such as I described. What I have described is very similar to
a UPS signaling the kernel that power is going down. Linux can do an
ordered shutdown when it receives the signal.

Qualifying digital circuitry with a POWER GOOD signal is very similar to
protecting the circuitry with a typical 'SCR over voltage crowbar
circuit': it makes the engineer feel good - but it doesn't actually do
much of anything.

Why doesn't the crowbar work? After all, it is a text book circuit. The
answer is that the SCR is a power device which takes on the order of 10
microseconds to turn on while the delicate chips are destroyed by a few
nanoseconds of over voltage. The result is that the SCR never turns on -
the fuse blows because the weakest digital chip  shorts the power supply
to ground. One could "protect" SCR's with digital chips, but not the
other way around.

Another example of "feel good engineering" is the power on self test
which most computers have. One can only test non critical sections of
the machine: if anything critical is broken the POST won't run - and a
tech will have to figure out what is wrong. It's a bit like asking
yourself "Am I alive?" If you can ask the question the answer is always
"Yes".




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
