Received: from dsl-62-3-66-203.zen.co.uk
	([62.3.66.203] helo=crown.nexus.co.uk ident=foobar)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlRL7-00055O-I3
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 11:25:05 +0000
From: John Stirling <js@reciva.com>
To: Armin Schindler <armin@melware.de>
In-Reply-To: <Pine.LNX.4.31.0401261520320.32301-100000@phoenix.one.melware.de>
References: 
	 <Pine.LNX.4.31.0401261520320.32301-100000@phoenix.one.melware.de>
Content-Type: text/plain
Message-Id: <1075202627.20473.113.camel@dobblers.nexus.co.uk>
Mime-Version: 1.0
Date: 27 Jan 2004 11:23:47 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: fix jffs2 data errors ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I get the same problems with a CVS snapshot about 4 weeks old. The
errors/warnings are reported on boot up which is disconcerting, but it
does seem to be working ok if you ignore the errors.


On Mon, 2004-01-26 at 14:26, Armin Schindler wrote:
> Hi,
> 
> together with latest CVS of jffs2 (one week old), I try to use
> my rootfs on a jffs2 NAND-Flash partition.
> 
> It seems to work pretty good, but when I have e.g. reset/power-down,
> on the next boot/rootfs-mount I get messages like:
> 
>  jffs2_scan_dirent_node(): Name CRC failed on node at 0x001b89dc: Read 0xffffffff,
>  calculated 0xc04c39e5
>  Empty flash at 0x001b8a10 ends at 0x001b8c00
>  Empty flash at 0x001b93f8 ends at 0x001b9400
> 
> I thought, that such errors will be fixed, but every time I mount the partition,
> these errors still exist.
> 
> Is the filesystem now unfixable or am I doing something wrong?
> 
> Thanks for any hint,
> Armin
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
