Received: from mail.phytec.co.uk ([217.6.246.34] helo=root.phytec.de)
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjRCX-0006IL-Vc
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 07:28:18 +0000
From: Jan Weitzel <j.weitzel@phytec.de>
To: linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2] MTD: Nand: use MTD_NAND_OMAP2 for OMAP4
Date: Wed, 20 Jul 2011 09:28:04 +0200
Message-Id: <1311146884-22255-1-git-send-email-j.weitzel@phytec.de>
In-Reply-To: <1311137590.20738.135.camel@sauron>
References: <1311137590.20738.135.camel@sauron>
Cc: Artem.Bityutskiy@nokia.com, vimalsingh@ti.com,
	Jan Weitzel <j.weitzel@phytec.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use MTD_NAND_OMAP2 also for OMAP4 arch.
testes wit omap4430

Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
---
v2: add menuconfig description

 drivers/mtd/nand/Kconfig |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4c34252..2a7d305 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -116,10 +116,11 @@ config MTD_NAND_AMS_DELTA
 	  Support for NAND flash on Amstrad E3 (Delta).
 
 config MTD_NAND_OMAP2
-	tristate "NAND Flash device on OMAP2 and OMAP3"
-	depends on ARM && (ARCH_OMAP2 || ARCH_OMAP3)
+	tristate "NAND Flash device on OMAP2, OMAP3 and OMAP4"
+	depends on ARM && (ARCH_OMAP2 || ARCH_OMAP3 || ARCH_OMAP4)
 	help
-          Support for NAND flash on Texas Instruments OMAP2 and OMAP3 platforms.
+          Support for NAND flash on Texas Instruments OMAP2, OMAP3 and OMAP4
+	  platforms.
 
 config MTD_NAND_IDS
 	tristate
-- 
1.7.0.4
