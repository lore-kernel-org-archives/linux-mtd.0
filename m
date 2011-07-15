Received: from mail.phytec.co.uk ([217.6.246.34] helo=root.phytec.de)
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qhg0x-0005Ot-Sd
	for linux-mtd@lists.infradead.org; Fri, 15 Jul 2011 10:53:04 +0000
From: Jan Weitzel <j.weitzel@phytec.de>
To: linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: Nand: use MTD_NAND_OMAP2 for OMAP4
Date: Fri, 15 Jul 2011 12:52:54 +0200
Message-Id: <1310727174-8183-1-git-send-email-j.weitzel@phytec.de>
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
 drivers/mtd/nand/Kconfig |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 4c34252..40e64b8 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -117,9 +117,10 @@ config MTD_NAND_AMS_DELTA
 
 config MTD_NAND_OMAP2
 	tristate "NAND Flash device on OMAP2 and OMAP3"
-	depends on ARM && (ARCH_OMAP2 || ARCH_OMAP3)
+	depends on ARM && (ARCH_OMAP2 || ARCH_OMAP3 || ARCH_OMAP4)
 	help
-          Support for NAND flash on Texas Instruments OMAP2 and OMAP3 platforms.
+          Support for NAND flash on Texas Instruments OMAP2, OMAP3 and OMAP4
+	  platforms.
 
 config MTD_NAND_IDS
 	tristate
-- 
1.7.0.4
