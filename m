Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFeWl-0005ak-Sh
 for linux-mtd@lists.infradead.org; Fri, 17 Nov 2017 11:09:45 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Han Xu <han.xu@nxp.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd: nand: gpmi-nand: Remove wrong Kconfig help text
Date: Fri, 17 Nov 2017 12:09:12 +0100
Message-Id: <20171117110912.24305-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The GPMI nand Kconfig help texts mentions that the GPMI nand driver
might conflict with SD cards. The only conflict there might really
be is that both controllers use the same pins, but this is resolved
by the pincontroller setup in the device tree. In any way the GPMI
driver can safely be enabled, the text is just wrong. Remove it.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 3f2036f31da4..8f4c288cf9f1 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -373,9 +373,7 @@ config MTD_NAND_GPMI_NAND
 	 Enables NAND Flash support for IMX23, IMX28 or IMX6.
 	 The GPMI controller is very powerful, with the help of BCH
 	 module, it can do the hardware ECC. The GPMI supports several
-	 NAND flashs at the same time. The GPMI may conflicts with other
-	 block, such as SD card. So pay attention to it when you enable
-	 the GPMI.
+	 NAND flashs at the same time.
 
 config MTD_NAND_BRCMNAND
 	tristate "Broadcom STB NAND controller"
-- 
2.11.0
