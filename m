Received: from mtiwmhc11.worldnet.att.net ([204.127.131.115])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JaLcv-0004ad-Dl
	for linux-mtd@lists.infradead.org; Sat, 15 Mar 2008 01:56:01 +0000
From: Jeff Sutherland <jeffs@fomsystems.com>
To: linux-mtd@lists.infradead.org
Subject: M-Systems (Sandisk) mDOC MD2534 on ARM/Xscale
Date: Fri, 14 Mar 2008 21:54:05 -0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200803142154.06440.jeffs@fomsystems.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I take it this part hasn't been used much on Xscale since there don't appear 
to be any Xscale specific settings for it in drivers/mtd/nand/diskonchip.c in 
the most recent mainline kernels.  How are these devices to work with?  From 
looking at various driver bits in drivers/mtd/nand seems like all I have to 
do is set a base address for the chip and plumb up the BUSY# line with a 
callback, in addition to the usual things needed for regular NAND chips.

BTW yes I've advised the customer that these devices are not recommended for 
new designs and am trying to steer them towards ordinary bare nand flash 
chips.

Regards,
-Jeff
