Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9Fh-0007C8-90
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:52:03 +0000
Received: by wyb28 with SMTP id 28so928720wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:52:00 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 052/104] ts72xx: use MTDPART_OFS_RETAIN for mtd partitioning
Date: Thu,  2 Jun 2011 18:51:30 +0400
Message-Id: <1307026293-8535-18-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Ryan Mallon <ryan@bluewatersys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Instead of specifying a callback for dynamic partitioning, use
MTDPART_OFS_RETAIN for reserving a place near the end of flash for
RedBoot.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Ryan Mallon <ryan@bluewatersys.com>
---
 arch/arm/mach-ep93xx/ts72xx.c |   22 ++++------------------
 1 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/arm/mach-ep93xx/ts72xx.c b/arch/arm/mach-ep93xx/ts72xx.c
index c2d2cf4..68e2849 100644
--- a/arch/arm/mach-ep93xx/ts72xx.c
+++ b/arch/arm/mach-ep93xx/ts72xx.c
@@ -116,8 +116,8 @@ static struct mtd_partition ts72xx_nand_parts[] = {
 		.mask_flags	= MTD_WRITEABLE,	/* force read-only */
 	}, {
 		.name		= "Linux",
-		.offset		= MTDPART_OFS_APPEND,
-		.size		= 0,			/* filled in later */
+		.offset		= MTDPART_OFS_RETAIN,
+		.size		= TS72XX_REDBOOT_PART_SIZE, /* leave so much for last partition */
 	}, {
 		.name		= "RedBoot",
 		.offset		= MTDPART_OFS_APPEND,
@@ -126,28 +126,14 @@ static struct mtd_partition ts72xx_nand_parts[] = {
 	},
 };
 
-static void ts72xx_nand_set_parts(uint64_t size,
-				  struct platform_nand_chip *chip)
-{
-	/* Factory TS-72xx boards only come with 32MiB or 128MiB NAND options */
-	if (size == SZ_32M || size == SZ_128M) {
-		/* Set the "Linux" partition size */
-		ts72xx_nand_parts[1].size = size - TS72XX_REDBOOT_PART_SIZE;
-
-		chip->partitions = ts72xx_nand_parts;
-		chip->nr_partitions = ARRAY_SIZE(ts72xx_nand_parts);
-	} else {
-		pr_warning("Unknown nand disk size:%lluMiB\n", size >> 20);
-	}
-}
-
 static struct platform_nand_data ts72xx_nand_data = {
 	.chip = {
 		.nr_chips	= 1,
 		.chip_offset	= 0,
 		.chip_delay	= 15,
 		.part_probe_types = ts72xx_nand_part_probes,
-		.set_parts	= ts72xx_nand_set_parts,
+		.partitions	= ts72xx_nand_parts,
+		.nr_partitions	= ARRAY_SIZE(ts72xx_nand_parts),
 	},
 	.ctrl = {
 		.cmd_ctrl	= ts72xx_nand_hwcontrol,
-- 
1.7.4.4
