Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YuULw-0000jo-Em
 for linux-mtd@lists.infradead.org; Mon, 18 May 2015 23:21:45 +0000
Received: by pabts4 with SMTP id ts4so171061661pab.3
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2015 16:21:22 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] MIPS: netlogic: remove unnecessary MTD partition probe
 specification
Date: Mon, 18 May 2015 16:21:12 -0700
Message-Id: <1431991272-22200-1-git-send-email-computersforpeace@gmail.com>
Cc: linux-mips@linux-mips.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The cmdlinepart parser is already supported in the default probe.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 arch/mips/netlogic/xlr/platform-flash.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/netlogic/xlr/platform-flash.c b/arch/mips/netlogic/xlr/platform-flash.c
index 6d3c727e0ef8..f03131fec41d 100644
--- a/arch/mips/netlogic/xlr/platform-flash.c
+++ b/arch/mips/netlogic/xlr/platform-flash.c
@@ -78,8 +78,6 @@ static struct platform_device xlr_nor_dev = {
 	.resource	= xlr_nor_res,
 };
 
-const char *xlr_part_probes[] = { "cmdlinepart", NULL };
-
 /*
  * Use "gen_nand" driver for NAND flash
  *
@@ -111,7 +109,6 @@ struct platform_nand_data xlr_nand_data = {
 		.nr_partitions	= ARRAY_SIZE(xlr_nand_parts),
 		.chip_delay	= 50,
 		.partitions	= xlr_nand_parts,
-		.part_probe_types = xlr_part_probes,
 	},
 	.ctrl = {
 		.cmd_ctrl	= xlr_nand_ctrl,
-- 
1.9.1
