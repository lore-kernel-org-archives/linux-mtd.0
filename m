Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14cTSM-000215-00
	for mtd-list@infradead.org; Mon, 12 Mar 2001 14:37:54 +0000
Received: from prue.eim.surrey.ac.uk ([131.227.76.5] ident=exim)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14cTSK-00020z-00
	for mtd@infradead.org; Mon, 12 Mar 2001 14:37:53 +0000
Received: from kenny.ee.surrey.ac.uk ([131.227.74.2] ident=exim)
	by prue.eim.surrey.ac.uk with esmtp (Exim 3.16 #1)
	id 14cTSG-0000bn-00
	for mtd@infradead.org; Mon, 12 Mar 2001 14:37:48 +0000
Received: from ee71ae (helo=localhost)
	by kenny.ee.surrey.ac.uk with local-esmtp (Exim 2.12 #5)
	id 14cTSF-0001ER-00
	for mtd@infradead.org; Mon, 12 Mar 2001 14:37:47 +0000
Date: Mon, 12 Mar 2001 14:37:47 +0000 (GMT)
From: Andrew Ebling <ee71ae@eim.surrey.ac.uk>
To: mtd@infradead.org
Subject: basic mtd use
Message-ID: <Pine.GSO.4.21.0103121435350.2346-100000@kenny.ee.surrey.ac.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi all,

I have been looking at MTD to use in a project, I have compiled it into
the kernel OK, but despite reading the source (I can't find any other kind
of documentation in the kernel tree ;) I cannot figure out how to put it
to real use.  I've had a good look at the MTD site and not found basic
instructions.

What I want to do is this: limit the kernel to using just 16MB out of
256MB of memory at boot time and then use the remaining memory as a
ramdisk, formatted using a special application specific filesystem I am
writing.  (At the moment I'm looking at the "Use extra onboard memory as
MTD device" option in make config)  I also need to be able to read/write
to given addresses for simulation purposes.

Basically, I need a ramdisk which uses a specified physical address range,
separated from the memory that the kernel is running in and the MTD driver
seems the best way to do this.

My questions are:

- which devices to I need to create under /dev, with which major/minor
numbers?

- what is the minimal set of modules I need to load in order to do the
above?

- can I then use the MTD device just like any normal ramdisk?

- how difficult would it be to give the MTD driver a list of duff memory
locations (perhaps identified by the badram patch at bootup) that must not
be used?

Some misc suggestions:

- any chance of a single bzipped file of the mail archives that can be
downloaded and grepped for info?

- some stuff to go in ~/linux/Documentation to tell mere mortals how to
make basic use of the MTD driver.  (I appreciate this is still
experimental stuff and that it isn't ready for production use etc)  Even
if it is just 5 lines, this would be a great help and would help to cut
noise out of your mailing list! ;)

- a pointer to the above in the help given by make config.

Many Thanks,

Andrew




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
