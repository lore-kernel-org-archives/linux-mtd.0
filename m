Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fdAfp-0005Xk-CC
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2018 08:40:35 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: nand/raw: MTD_NAND_BCM47XXNFLASH needs CONFIG_BCMA
Date: Wed, 11 Jul 2018 10:39:44 +0200
Message-Id: <20180711084010.57950-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We already have a dependency on BCMA_NFLASH, which in turn depends on
BCMA, but since BCMA is a tristate option and BCMA_NFLASH is bool,
we can run into an invalid configuration with MTD_NAND_BCM47XXNFLASH=y
and BCMA=m:

drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.o: In function `bcm47xxnflash_ops_bcm4706_init':
ops_bcm4706.c:(.text+0x790): undefined reference to `bcma_chipco_pll_read'

Adding the dependency here forces MTD_NAND_BCM47XXNFLASH to only be
configured =m here so it can link against the BCMA driver.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/nand/raw/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 230311fa2cc0..b457f92d55d4 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -364,6 +364,7 @@ config MTD_NAND_BRCMNAND
 config MTD_NAND_BCM47XXNFLASH
 	tristate "Support for NAND flash on BCM4706 BCMA bus"
 	depends on BCMA_NFLASH
+	depends on BCMA
 	help
 	  BCMA bus can have various flash memories attached, they are
 	  registered by bcma as platform devices. This enables driver for
-- 
2.9.0
