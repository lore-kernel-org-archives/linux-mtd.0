From: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
To: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] OMAP3: NAND: Adding NAND support and specifying NAND
	partitions.
Date: Mon, 25 Jul 2011 19:10:53 +0530
Message-ID: <1311601253-2933-1-git-send-email-hrishikesh.b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>, Sanjeev Premi <premi@ti.com>,
	Vaibhav Hiremath <hvaibhav@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the NAND support on OMAP3EVM board and also allocates
five partitions  on NAND.
Referred to file: arch/arm/mach-omap2/board-omap3beagle.c

Signed-off-by: Vaibhav Hiremath <hvaibhav@ti.com>
Signed-off-by: Sanjeev Premi <premi@ti.com>
Signed-off-by: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
---
 arch/arm/mach-omap2/board-omap3evm.c |   40 ++++++++++++++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-omap2/board-omap3evm.c b/arch/arm/mach-omap2/board-omap3evm.c
index b4d4346..be45b63 100644
--- a/arch/arm/mach-omap2/board-omap3evm.c
+++ b/arch/arm/mach-omap2/board-omap3evm.c
@@ -30,6 +30,10 @@
 #include <linux/usb/otg.h>
 #include <linux/smsc911x.h>
 
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/nand.h>
+
 #include <linux/wl12xx.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
@@ -46,6 +50,8 @@
 #include <plat/mcspi.h>
 #include <video/omapdss.h>
 #include <video/omap-panel-generic-dpi.h>
+#include <plat/gpmc.h>
+#include <plat/nand.h>
 
 #include "mux.h"
 #include "sdram-micron-mt46h32m32lf-6.h"
@@ -101,6 +107,37 @@ static void __init omap3_evm_get_revision(void)
 	}
 }
 
+static struct mtd_partition omap3evm_nand_partitions[] = {
+	/* All the partition sizes are listed in terms of NAND block size */
+	{
+		.name		= "X-Loader",
+		.offset		= 0,
+		.size		= 4 * NAND_BLOCK_SIZE,
+		.mask_flags	= MTD_WRITEABLE,	/* force read-only */
+	},
+	{
+		.name		= "U-Boot",
+		.offset         = 0x80000
+		.size           = 15 * NAND_BLOCK_SIZE,
+		.mask_flags	= MTD_WRITEABLE,	/* force read-only */
+	},
+	{
+		.name		= "U-Boot Env",
+		.offset		= 0x260000
+		.size		= 1 * NAND_BLOCK_SIZE,
+	},
+	{
+		.name		= "Kernel",
+		.offset		= 0x280000
+		.size		= 32 * NAND_BLOCK_SIZE,
+	},
+	{
+		.name		= "File System",
+		.offset		= 0x680000
+		.size		= MTDPART_SIZ_FULL,
+	},
+};
+
 #if defined(CONFIG_SMSC911X) || defined(CONFIG_SMSC911X_MODULE)
 #include <plat/gpmc-smsc911x.h>
 
@@ -696,6 +733,9 @@ static void __init omap3_evm_init(void)
 
 	omap_serial_init();
 
+	omap_nand_flash_init(NAND_BUSWIDTH_16, omap3evm_nand_partitions,
+			ARRAY_SIZE(omap3evm_nand_partitions));
+
 	/* OMAP3EVM uses ISP1504 phy and so register nop transceiver */
 	usb_nop_xceiv_register();
 
-- 
1.6.2.4
