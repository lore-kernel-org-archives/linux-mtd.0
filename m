Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNt-0002Tm-No
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:11 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359562wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:09 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 33/62] mtd/bcm_umi_nand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:14 +0100
Message-Id: <1306142623-24952-34-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/nand/bcm_umi_nand.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index dfe262c..9ec2807 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -52,9 +52,7 @@
 static const __devinitconst char gBanner[] = KERN_INFO \
 	"BCM UMI MTD NAND Driver: 1.00\n";
 
-#ifdef CONFIG_MTD_PARTITIONS
 const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 #if NAND_ECC_BCH
 static uint8_t scan_ff_pattern[] = { 0xff };
@@ -509,7 +507,7 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 			kfree(board_mtd);
 			return -EIO;
 		}
-		add_mtd_partitions(board_mtd, partition_info, nr_partitions);
+		mtd_device_register(board_mtd, partition_info, nr_partitions);
 	}
 
 	/* Return happy */
-- 
1.7.4.4
