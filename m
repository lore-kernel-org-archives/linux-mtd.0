Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePlmD-0006oM-OV
 for linux-mtd@lists.infradead.org; Fri, 15 Dec 2017 08:55:31 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de
Subject: mtd: nand: mxc: Fix failed/corrected values
Date: Fri, 15 Dec 2017 09:55:01 +0100
Message-Id: <20171215085504.32296-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mxc_nand controller returns bogus corrected/failed values. Fix
this by adding a own read_page function. The other two patches
are cleanups based on the first one. The patches are targeted for
the v2/v3 controller types, we could do the same for v1 controllers
aswell, but I left that out because I don't have any hardware handy
at the moment.

Sascha

----------------------------------------------------------------
Sascha Hauer (3):
      mtd: nand: mxc: Fix failed/corrected values
      mtd: nand: mxc: Add own write_page
      mtd: nand: mxc: Drop now unnecessary correct_data function

 drivers/mtd/nand/mxc_nand.c | 51 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 14 deletions(-)
