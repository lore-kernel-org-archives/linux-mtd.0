Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JPZF-0004uh-00
	for mtd-list@infradead.org; Tue, 01 Aug 2000 01:05:57 +0100
Received: from mail.transzap.net ([207.239.241.226] helo=tzi.transzap.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13JPZE-0004ub-00
	for mtd@infradead.org; Tue, 01 Aug 2000 01:05:56 +0100
Received: from localhost (phiggins@localhost)
	by phiggins.transzap.com (8.9.3/8.8.7) with ESMTP id SAA01252
	for <mtd@infradead.org>; Mon, 31 Jul 2000 18:10:28 -0600
From: Patrick Higgins <phiggins@transzap.com>
To: mtd@infradead.org
Date: Mon, 31 Jul 2000 18:10:28 -0600 (MDT)
Subject: ECC module?
Message-ID: <Pine.LNX.4.21.0007311726300.1214-100000@phiggins.transzap.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Excuse me for not being a kernel wizard, but what am I going to have to do
to integrate the Disk on Chip ECC code into the 2000 and Millenium
drivers?

I've currently written a separate source file containing the key routines,
only one of which is non-static.  Now, since the 2000 and the Millenium
are separate modules, do I have to make the ECC into a *third* module
which they can both use, or can I just link the ECC object into both of
them?

It seems like it might be simpler to make the docprobe, doc2000, and
doc2001 modules into a single doc module which may or may not have support
for both.

To do either of these, though, I need to learn more about kernel
makefiles.  Anyone know of a good introduction?  From Rules.make, it looks
like you define one O_TARGET and a few O_OBJS and OX_OBJS and these will
get linked to make the O_TARGET.  Would this force a separate subdirectory
to be used for disk on chip if the ECC was not made into a module?


-Patrick


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
