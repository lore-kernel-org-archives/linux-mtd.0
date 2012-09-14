Received: from mailout-de.gmx.net ([213.165.64.22])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TCeVd-0006JW-D5
 for linux-mtd@lists.infradead.org; Fri, 14 Sep 2012 22:37:14 +0000
From: Peter Huewe <peterhuewe@gmx.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd/nand/docg4: Add missing HAS_IOMEM dependency
Date: Sat, 15 Sep 2012 00:41:09 +0200
Message-Id: <1347662469-1604-1-git-send-email-peterhuewe@gmx.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-kernel@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Peter Huewe <peterhuewe@gmx.de>,
 Shubhrajyoti D <shubhrajyoti@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While building an allyesconfig for UML I received this error message(s):
 drivers/mtd/nand/docg4.c: In function 'probe_docg4':
 drivers/mtd/nand/docg4.c:1272:2: error: implicit declaration of function
 'ioremap' [-Werror=implicit-function-declaration]
 drivers/mtd/nand/docg4.c:1272:10: warning: assignment makes pointer from
 integer without a cast [enabled by default]
 drivers/mtd/nand/docg4.c:1327:2: error: implicit declaration of function
 'iounmap' [-Werror=implicit-function-declaration]

which is caused by the missing implementations on UML.

This patch adds this missing HAS_IOMEM dependency and prevents the driver from
being build on platforms with no HAS_IOMEM

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/mtd/nand/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 8ca4176..3e2f75d 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -356,7 +356,7 @@ config MTD_NAND_DISKONCHIP_BBTWRITE
 
 config MTD_NAND_DOCG4
 	tristate "Support for DiskOnChip G4 (EXPERIMENTAL)"
-	depends on EXPERIMENTAL
+	depends on EXPERIMENTAL && HAS_IOMEM
 	select BCH
 	select BITREVERSE
 	help
-- 
1.7.8.6
