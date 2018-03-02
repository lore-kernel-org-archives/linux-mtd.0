Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlrp-0008Oe-PK
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:41:43 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: rawnand: makes the Kconfig entry clear when it comes to
 raw NANDs
Date: Fri,  2 Mar 2018 15:40:36 +0100
Message-Id: <20180302144036.3341-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Files have been moved in the NAND subsystem to reflect the different
flavors of NAND devices.

Raw NAND devices have been moved to a "raw" subdirectory to make the
difference with OneNAND and SPI NAND for instance. So adjust the Kconfig
entry to clarify things.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index e6b8c59f2c0d..3a592461a87e 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -11,11 +11,11 @@ config MTD_NAND_ECC_SMC
 
 
 menuconfig MTD_NAND
-	tristate "NAND Device Support"
+	tristate "RawNAND Device Support"
 	depends on MTD
 	select MTD_NAND_ECC
 	help
-	  This enables support for accessing all type of NAND flash
+	  This enables support for accessing all type of raw NAND flash
 	  devices. For further information see
 	  <http://www.linux-mtd.infradead.org/doc/nand.html>.
 
-- 
2.14.1
