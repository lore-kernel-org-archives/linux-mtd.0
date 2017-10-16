Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e424I-0005j4-I1
 for linux-mtd@lists.infradead.org; Mon, 16 Oct 2017 09:52:20 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: mtd: nand: mxc: change debug messages
Date: Mon, 16 Oct 2017 11:51:53 +0200
Message-Id: <20171016095155.29174-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I often get reports from customers containing useless "UnCorrectable RS-ECC Error"
messages. Lower this message to debug level and while at it, use dev_dbg instead
of pr_debug.

Sascha

----------------------------------------------------------------
Sascha Hauer (2):
      mtd: nand: mxc: lower ECC failed message priority to debug level
      mtd: nand: mxc: use dev_dbg to print debug messages

 drivers/mtd/nand/mxc_nand.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
