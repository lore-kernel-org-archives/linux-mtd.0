Received: from hauke-m.de ([5.39.93.123] helo=mail.hauke-m.de)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cE0bK-00082o-6D
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 21:15:07 +0000
From: Hauke Mehrtens <hauke@hauke-m.de>
To: boris.brezillon@free-electrons.com
Cc: richard@nod.at, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, john@phrozen.org,
 Hauke Mehrtens <hauke@hauke-m.de>, stable@vger.kernel.org
Subject: [PATCH V2 1/2] mtd: nand: xway: disable module support
Date: Mon,  5 Dec 2016 22:14:36 +0100
Message-Id: <20161205211437.29489-1-hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The xway_nand driver accesses the ltq_ebu_membase symbol which is not
exported. This also should not get exported and we should handle the
EBU interface in a better way later. This quick fix just deactivated
support for building as module.

Cc: <stable@vger.kernel.org>
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 7b7a887..b254090 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -537,7 +537,7 @@ config MTD_NAND_FSMC
 	  Flexible Static Memory Controller (FSMC)
 
 config MTD_NAND_XWAY
-	tristate "Support for NAND on Lantiq XWAY SoC"
+	bool "Support for NAND on Lantiq XWAY SoC"
 	depends on LANTIQ && SOC_TYPE_XWAY
 	help
 	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is attached
-- 
2.10.2
