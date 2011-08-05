Received: from devils.ext.ti.com ([198.47.26.153])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QpIXL-0005xb-Ra
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2011 11:26:00 +0000
From: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
To: <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Subject: [PATCH] AM3517: NAND: Adding NAND support and specifying NAND
	partitions.
Date: Fri, 5 Aug 2011 16:55:49 +0530
Message-ID: <1312543549-31869-1-git-send-email-hrishikesh.b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the NAND support on AM3517 platform and creates the partitions.
Referred to file: arch/arm/mach-omap2/board-omap3beagle.c

Signed-off-by: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
---
 arch/arm/mach-omap2/board-am3517evm.c |   38 +++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-omap2/board-am3517evm.c b/arch/arm/mach-omap2/board-am3517evm.c
index 63af417..dceb996 100644
--- a/arch/arm/mach-omap2/board-am3517evm.c
+++ b/arch/arm/mach-omap2/board-am3517evm.c
@@ -24,6 +24,8 @@
 #include <linux/i2c/pca953x.h>
 #include <linux/can/platform/ti_hecc.h>
 #include <linux/davinci_emac.h>
+#include <linux/mtd/partitions.h>
+#include <linux/mtd/nand.h>
 
 #include <mach/hardware.h>
 #include <mach/am35xx.h>
@@ -39,6 +41,7 @@
 
 #include "mux.h"
 #include "control.h"
+#include "common-board-devices.h"
 
 #define AM35XX_EVM_MDIO_FREQUENCY	(1000000)
 
@@ -460,6 +463,37 @@ static void am3517_evm_hecc_init(struct ti_hecc_platform_data *pdata)
 static struct omap_board_config_kernel am3517_evm_config[] __initdata = {
 };
 
+static struct mtd_partition am3517_nand_partitions[] = {
+	/* All the partition sizes are listed in terms of NAND block size */
+	{
+		.name		= "X-Loader",
+		.offset		= 0,
+		.size		= 4 * NAND_BLOCK_SIZE,
+		.mask_flags	= MTD_WRITEABLE,	/* force read-only */
+	},
+	{
+		.name		= "U-Boot",
+		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x80000 */
+		.size		= 15 * NAND_BLOCK_SIZE,
+		.mask_flags	= MTD_WRITEABLE,        /* force read-only */
+	},
+	{
+		.name		= "U-Boot Env",
+		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x260000 */
+		.size		= 1 * NAND_BLOCK_SIZE,
+	},
+	{
+		.name		= "Kernel",
+		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x280000 */
+		.size		= 32 * NAND_BLOCK_SIZE,
+	},
+	{
+		.name		= "File System",
+		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x680000 */
+		.size		= MTDPART_SIZ_FULL,
+	},
+};
+
 static void __init am3517_evm_init(void)
 {
 	omap_board_config = am3517_evm_config;
@@ -473,6 +507,10 @@ static void __init am3517_evm_init(void)
 	/* Configure GPIO for EHCI port */
 	omap_mux_init_gpio(57, OMAP_PIN_OUTPUT);
 	usbhs_init(&usbhs_bdata);
+	/*NAND*/
+	omap_nand_flash_init(NAND_BUSWIDTH_16, am3517_nand_partitions,
+				ARRAY_SIZE(am3517_nand_partitions));
+
 	am3517_evm_hecc_init(&am3517_evm_hecc_pdata);
 	/* DSS */
 	am3517_evm_display_init();
-- 
1.6.2.4
This patch has dependency on following patchset :
http://marc.info/?l=linux-omap&m=131247357813228&w=2
