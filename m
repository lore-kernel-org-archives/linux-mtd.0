Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRi2O-0002AR-OO
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 10:53:01 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Subject: [PATCH] mtd: xway_nand: add OF dependency
Date: Tue,  8 May 2012 13:53:56 +0300
Message-Id: <1336474436-9755-1-git-send-email-dedekind1@gmail.com>
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

xway_nand.c requires OF support - add dependency in Kconfig.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/nand/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index fd4d064..eacf379 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -569,7 +569,7 @@ config MTD_NAND_FSMC
 
 config MTD_NAND_XWAY
 	tristate "Support for NAND on Lantiq XWAY SoC"
-	depends on LANTIQ && SOC_TYPE_XWAY
+	depends on LANTIQ && SOC_TYPE_XWAY && OF
 	select MTD_NAND_PLATFORM
 	help
 	  Enables support for NAND Flash chips on Lantiq XWAY SoCs. NAND is attached
-- 
1.7.9.1
