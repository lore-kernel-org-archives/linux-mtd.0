Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8Ey2-0002iw-8q
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 19:36:50 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 15/15] mtd: nand: Allow to build pxa3xx_nand on Orion
 platforms
Date: Sat, 10 Aug 2013 16:35:05 -0300
Message-Id: <1376163305-5591-16-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1376163305-5591-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Armada 370 and Armada XP SoC families, selected by PLAT_ORION,
have a Nand Flash Controller (NFC) IP very similar to the one present
in PXA platforms. Therefore, we want to build this driver on PLAT_ORION.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Tested-by: Daniel Mack <zonque@gmail.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 5ef8f5e..86c135b 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -354,7 +354,7 @@ config MTD_NAND_ATMEL
 
 config MTD_NAND_PXA3xx
 	tristate "Support for NAND flash devices on PXA3xx"
-	depends on PXA3xx || ARCH_MMP
+	depends on PXA3xx || ARCH_MMP || PLAT_ORION
 	help
 	  This enables the driver for the NAND flash device found on
 	  PXA3xx processors
-- 
1.8.1.5
