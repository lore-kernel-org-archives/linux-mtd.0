Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ezQH-0004ko-00
	for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2001 14:42:25 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B34@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	 w:(
Date: Thu, 6 Sep 2001 15:47:25 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Thinks... there's actually no reason at all why the devices 
> registered by 
> your map driver shouldn't overlap - one for the whole chip for 
> reprogramming, and one for the cramfs image.

Great idea, thanks a lot!

> 
> add_mtd_partitions might not like it atm, but we could invent 
> a new flags 
> which tells it to accept the overlap.

It doesn't complain, so we don't have to invent anything.

One thing, though... (there's always one thing:)
I get a few printk's from drivers/block/ll_rw_blk.c:

attempt to access beyond end of device
1f:03: rw=0, want=992, limit=984
attempt to access beyond end of device
1f:03: rw=0, want=1000, limit=984
attempt to access beyond end of device
1f:03: rw=0, want=1008, limit=984
attempt to access beyond end of device
1f:03: rw=0, want=992, limit=984
attempt to access beyond end of device
1f:03: rw=0, want=1000, limit=984
attempt to access beyond end of device
1f:03: rw=0, want=1008, limit=984

limit=984 seems OK, the size of the new "overlapping" partition is
0xf6000 == (984 * 1024). But I cannot figure out what cramfs is doing
trying to access above that limit.

A comment in drivers/block/ll_rw_blk.c says:

/* This may well happen - the kernel calls bread()
   without checking the size of the device, e.g.,
   when mounting a device. */

Everything seems to work, but the printk's are annoying. Any idea?

/Jonas
