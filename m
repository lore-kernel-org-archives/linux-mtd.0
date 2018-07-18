Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffiGs-00082a-FY
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 08:57:21 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 1/4] mtd: rawnand: s3c2410: Allow selection of this driver
 when COMPILE_TEST=y
Date: Wed, 18 Jul 2018 10:56:49 +0200
Message-Id: <20180718085652.30391-2-boris.brezillon@bootlin.com>
In-Reply-To: <20180718085652.30391-1-boris.brezillon@bootlin.com>
References: <20180718085652.30391-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It just makes NAND maintainers' life easier by allowing them to
compile-test this driver without having ARCH_S3C24XX or ARCH_S3C64XX
enabled.

We add a dependency on HAS_IOMEM to make sure the driver compiles
correctly.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index b6738ece16f1..03314ab8cd4d 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -119,7 +119,8 @@ config MTD_NAND_AU1550
 
 config MTD_NAND_S3C2410
 	tristate "NAND Flash support for Samsung S3C SoCs"
-	depends on ARCH_S3C24XX || ARCH_S3C64XX
+	depends on ARCH_S3C24XX || ARCH_S3C64XX || COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  This enables the NAND flash controller on the S3C24xx and S3C64xx
 	  SoCs
-- 
2.14.1
