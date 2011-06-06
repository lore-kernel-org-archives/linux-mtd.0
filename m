Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvG-000737-6n
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:35 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799709wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:33 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/32] mtd: bcm_umi_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:15:58 +0400
Message-Id: <1307351782-7456-8-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
this in every driver, instead pass NULL to force parse_mtd_partitions
to use default.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/bcm_umi_nand.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index 7ac8607..7752d59 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -52,8 +52,6 @@
 static const __devinitconst char gBanner[] = KERN_INFO \
 	"BCM UMI MTD NAND Driver: 1.00\n";
 
-const char *part_probes[] = { "cmdlinepart", NULL };
-
 #if NAND_ECC_BCH
 static uint8_t scan_ff_pattern[] = { 0xff };
 
@@ -497,7 +495,7 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 
 		board_mtd->name = "bcm_umi-nand";
 		nr_partitions =
-		    parse_mtd_partitions(board_mtd, part_probes,
+		    parse_mtd_partitions(board_mtd, NULL,
 					 &partition_info, 0);
 
 		if (nr_partitions <= 0) {
-- 
1.7.4.4
