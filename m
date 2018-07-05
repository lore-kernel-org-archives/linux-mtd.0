Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fb0px-00007w-VF
 for linux-mtd@lists.infradead.org; Thu, 05 Jul 2018 09:46:11 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-wireless@vger.kernel.org
Subject: [PATCH 15/27] mtd: rawnand: sunxi: Allow selection of this driver
 when COMPILE_TEST=y
Date: Thu,  5 Jul 2018 11:45:10 +0200
Message-Id: <20180705094522.12138-16-boris.brezillon@bootlin.com>
In-Reply-To: <20180705094522.12138-1-boris.brezillon@bootlin.com>
References: <20180705094522.12138-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It just makes NAND maintainers' life easier by allowing them to
compile-test this driver without having ARCH_SUNXI enabled.

We also need to add a dependency on HAS_IOMEM to make sure the driver
compiles correctly.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index c3aa1d79781b..a5edd76e29db 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -517,7 +517,8 @@ config MTD_NAND_XWAY
 
 config MTD_NAND_SUNXI
 	tristate "Support for NAND on Allwinner SoCs"
-	depends on ARCH_SUNXI
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  Enables support for NAND Flash chips on Allwinner SoCs.
 
-- 
2.14.1
