Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZeTS-000861-JC
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 10:18:35 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	<linux-omap@vger.kernel.org>
Subject: [PATCH v2 3/5] mtd: nand: omap2: Fix OMAP_BCH option dependency
Date: Fri, 25 Oct 2013 07:17:55 -0300
Message-Id: <1382696277-9063-4-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1382696277-9063-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: marek.belisko@gmail.com,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>,
 Felipe Balbi <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This option does not need to depend in MTD_NAND, for it's enclosed
under it. Also, it's wrong to make it depend in ARCH_OMAP3 only
since the controller is used in a wider range of SoCs.

Instead, just leave the dependency on the OMAP2 driver option.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index d885298..8187466 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -95,7 +95,7 @@ config MTD_NAND_OMAP2
 	  platforms.
 
 config MTD_NAND_OMAP_BCH
-	depends on MTD_NAND && MTD_NAND_OMAP2 && ARCH_OMAP3
+	depends on MTD_NAND_OMAP2
 	tristate "Enable support for hardware BCH error correction"
 	default n
 	select BCH
-- 
1.8.1.5
