Received: from mail.fh-wedel.de ([213.39.232.194])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BquP2-0003xV-1V
	for linux-mtd@lists.infradead.org; Sat, 31 Jul 2004 10:00:02 -0400
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [213.39.233.138])
	by mail.fh-wedel.de (8.12.11/8.12.9/Debian-1) with ESMTP id
	i6VDxote022954
	for <linux-mtd@lists.infradead.org>; Sat, 31 Jul 2004 15:59:50 +0200
Received: from joern by wohnheim.fh-wedel.de with local (Exim 3.35 #1 (Debian))
	id 1BquOx-0005B6-00
	for <linux-mtd@lists.infradead.org>; Sat, 31 Jul 2004 15:59:55 +0200
Date: Sat, 31 Jul 2004 15:59:55 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20040731135955.GA10803@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [RFC] Volatile data device vor jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is still just a whacky idea but might fit well into other
unfinished plans for jffs2.


1. With flash storage, life time depends on the total amount of data
written to it.  Usual calculation is this:

              erase cycles * flash size
write speed = -------------------------
              lifetime

Depending on flash size, necessary lifetime and guaranteed erase
cycles of the flash, we operate somewhere in the area of 10kB/s.  Not
much.


2. Application developers have a hard time not to exceed such a limit.


Combine 1 and 2 and you have a problem.  Usual solution is to make
life harder on the application developers, but they have a natural
resistance and controlling them is Not Fun.  So here is another
approach.


a) Jffs2 has two erase blocks open for writing.  One is used
exclusively for garbage collection, the other exclusively for writing
new data.  This is an old idea.

b) Jffs2 has simultaneous access to two devices, one of which is used
exclusively for writing new data.  I call that one the "volatile"
device.

c) The volatile device is either ram based or nvram based.

With a ram based volatile device, there is danger of data loss, so
garbage collection would have to be forced from time to time, similar
to the current wbuf approach for nand.

Either way, a script like the one below will not kill your flash in a
few days:

while true; do echo foo > foo; rm foo; done


Anticipated question:  Why is this a good idea?  Shouldn't application
developers be taught, never to do this in the first place?

Sometimes code similar to the script above is needed.  Think of a
trace where you're only interested in the last 1k or so of data.  With
such a requirement, application developers would have to seperate
their data between flash and nvram devices.  This adds complexity.

If highly volatile and mostly static data (and anything in between)
can be treated the same, application code is nicely abstracted from
hardware details that should be left to the kernel.


Comments?

Jörn

-- 
Simplicity is prerequisite for reliability.
-- Edsger W. Dijkstra
