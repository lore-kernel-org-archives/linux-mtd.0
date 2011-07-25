Received: from bear.ext.ti.com ([192.94.94.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QlKuP-00060b-Ux
	for linux-mtd@lists.infradead.org; Mon, 25 Jul 2011 13:09:23 +0000
From: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
To: <linux-omap@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] OMAP3: Beagle: NAND: Specifying partition offsets directly.
Date: Mon, 25 Jul 2011 18:37:23 +0530
Message-ID: <1311599243-875-1-git-send-email-hrishikesh.b@ti.com>
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

In the nand partition table specifying the offset addresses
directly instead of using the macro MTDPART_OFS_APPEND to gain
runtime efficiency while nand initialization.
MTDPART_OFS_APPEND has the value (-1) ,if assigned to offset,
a runtime calculation of actual offset happens each time nand is
initialized [ Refer: drivers/mtd/mtdpart.c: allocate_partition()].
To avoid this , specify actual offset.

Signed-off-by: Hrishikesh Bhandiwad <hrishikesh.b@ti.com>
---
 arch/arm/mach-omap2/board-omap3beagle.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/board-omap3beagle.c b/arch/arm/mach-omap2/board-omap3beagle.c
index 7f21d24..09f7571 100644
--- a/arch/arm/mach-omap2/board-omap3beagle.c
+++ b/arch/arm/mach-omap2/board-omap3beagle.c
@@ -140,23 +140,23 @@ static struct mtd_partition omap3beagle_nand_partitions[] = {
 	},
 	{
 		.name		= "U-Boot",
-		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x80000 */
+		.offset		= 0x80000
 		.size		= 15 * NAND_BLOCK_SIZE,
 		.mask_flags	= MTD_WRITEABLE,	/* force read-only */
 	},
 	{
 		.name		= "U-Boot Env",
-		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x260000 */
+		.offset		= 0x260000
 		.size		= 1 * NAND_BLOCK_SIZE,
 	},
 	{
 		.name		= "Kernel",
-		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x280000 */
+		.offset		= 0x280000
 		.size		= 32 * NAND_BLOCK_SIZE,
 	},
 	{
 		.name		= "File System",
-		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x680000 */
+		.offset		= 0x680000
 		.size		= MTDPART_SIZ_FULL,
 	},
 };
-- 
1.6.2.4
