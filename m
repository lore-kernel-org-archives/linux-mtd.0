Received: from [212.18.228.76] (helo=mail.linuxgrrls.org ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1TZ-0002Np-GV
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 10:01:01 +0100
Date: Wed, 11 Jun 2003 10:01:29 +0100
Mime-Version: 1.0 (Apple Message framework v552)
To: Pantelis Antoniou <panto@intracom.gr>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <3EE6EBA0.3080508@intracom.gr>
Message-Id: <4A3DE310-9BEB-11D7-B76F-000393AD6294@regolith.co.uk>
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wednesday, Jun 11, 2003, at 09:43 Europe/London, Pantelis Antoniou 
wrote:
[snip]

1)  Where are you going to store this bad block list?

There isn't anywhere on the Flash that can be guaranteed good.
You can't pick a set location for the bad block list, so you must scan
for it-  and once you have found it you must have some way to
check that you are looking at a good copy of it.

If you plan to generate it at mount time, you run the risk that
a block has gone bad while the device has been dormant, and
thus you may generate a block list that does not match the one
the device was written with,  which could render a block
-structured filesystem like cramfs unreadable.

Also, all this scanning takes time, which makes mounting slow.

2)  What about blocks that go bad while the system is in service?

Flash blocks go bad randomly, and often while they are in use.
You must use a strategy to cope with this-  JFFS and YAFFS use
Reed-Solomon forward error correction.

3)  What about wear-levelling?

Flash blocks do not last indefinitely.  Every erase brings the Flash
block you are erasing closer to the end of its lifespan.  Obviously
this is less of a concern on a static filesystem like cramfs.

Why not put a cramfs filesystem into a file on a YAFFS or JFFS2
filesystem and use a loopback to mount it?

-Jas.
