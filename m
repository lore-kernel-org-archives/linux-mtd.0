Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHxDS-0008Rv-Qk
 for linux-mtd@lists.infradead.org; Fri, 06 Sep 2013 14:40:55 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC/PATCH] pxa3xx-nand: Removing a stupid customized device detection
Date: Fri,  6 Sep 2013 11:40:27 -0300
Message-Id: <1378478428-25280-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 haojian.zhuang@gmail.com, Daniel Mack <zonque@gmail.com>, b32955@freescale.com,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current pxa3xx-nand driver implements its own device detection, duplicating
a funcionality that the NAND base code provides, through nand_scan_ident() plus
nand_scan_tail().

This is not only ugly, but also wrong for it implements a deprecated (non-ONFI)
device probing method and force the driver to keep its own list of known devices.
In addition, it settles a very bad example for future NAND drivers.

My suggestion is to simply kill the device detection and instead rely fully
on the findings of nand_scan_ident(). After the first nand_scan_iden() the driver
can configure the controller according to the detected device.

However, I'm concerned about the impact of this patch on already deployed systems,
and by the fact that we're removing the built-in "timing parameter" table.
So, I'm wondering:

 * What's others opinion on this?

 * Can I try this cleanup (or a similar one, maybe being more careful)

 * ... or should I just forget about it completely and learn to live it?

I've noticed that the PXA maintainers have remain largely silent on the recent
patches for this pxa3xx-nand driver, but I would definitely appreciate their
point of view this time.

A warning note: this doesn't build on latest l2-mtd, and I'm posting it just
to show the idea and trigger the discussion.

Thanks!

Ezequiel Garcia (1):
  mtd: nand: pxa3xx: Remove redundant device probing

 drivers/mtd/nand/pxa3xx_nand.c | 134 ++---------------------------------------
 1 file changed, 4 insertions(+), 130 deletions(-)

-- 
1.8.1.5
