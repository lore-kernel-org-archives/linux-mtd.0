Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exqzd-00060C-BX
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 09:22:30 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: rawnand: makes the Kconfig entry clear when it comes
 to raw NANDs
Date: Mon, 19 Mar 2018 10:21:58 +0100
Message-Id: <20180319092158.11838-1-miquel.raynal@bootlin.com>
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

Raw/Parallel NAND devices have been moved to a "raw" subdirectory to
make the difference with OneNAND and SPI NAND for instance. So adjust
the Kconfig entry to clarify things.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes since v1:
=================
  - s|RawNAND|Raw/Parallel NAND| to avoid a possible confusion with a
    brand name like OneNAND.

 drivers/mtd/nand/raw/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 9b1918af0064..46b29d277804 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -11,12 +11,12 @@ config MTD_NAND_ECC_SMC
 
 
 menuconfig MTD_NAND
-	tristate "NAND Device Support"
+	tristate "Raw/Parallel NAND Device Support"
 	depends on MTD
 	select MTD_NAND_ECC
 	help
-	  This enables support for accessing all type of NAND flash
-	  devices. For further information see
+	  This enables support for accessing all type of raw/parallel
+	  NAND flash devices. For further information see
 	  <http://www.linux-mtd.infradead.org/doc/nand.html>.
 
 if MTD_NAND
-- 
2.14.1
