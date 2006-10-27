Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GdQpR-0002k1-Tq
	for linux-mtd@lists.infradead.org; Fri, 27 Oct 2006 13:28:56 +0100
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by krynn.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	k9RCSS2T017442
	for <linux-mtd@lists.infradead.org>; Fri, 27 Oct 2006 14:28:28 +0200
Date: Fri, 27 Oct 2006 14:30:02 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: mtd-utils/flash_erase modifications
Message-ID: <Pine.LNX.4.64.0610261052070.25906@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I have a proposition for some changes to the flash_erase application from=
=20
mtd-utils:

1.
Looking at the mtd-utils/flash_erase application (mtd-utils 1.0.1), and=20
considering its use for nand flashes, there is no bad block management,
i.e. if flash_erase hits a bad block, it exits with an error message.
I would like to see (perhaps governed by an option) that it simply
skips bad blocks.

2.
Furthermore, it would be nice to be able to disable the output of the=20
program. As it stands, it outputs a line for each block/sector it erases.=
=20
I would suggest a --verbose or -v option in order to enable this output.

3.
And finally, by default, the program only erases the first block, unless=20
some options are given. If one wants to erase a whole mtd device or=20
partition, the number of blocks must be known and given to flash_erase. It=
=20
would be nice to have a default behavior, or perhaps using an option for=20
backwards compatibility's sake, to simply erase the whole device.

I don't mind getting to work on this myself, but I would like some=20
comments before I start implementing something that no one thinks is a=20
good idea.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
