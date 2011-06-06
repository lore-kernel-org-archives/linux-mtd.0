Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvq-000737-QD
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:12 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799709wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:10 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 26/32] mtd: sharpsl don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:16 +0400
Message-Id: <1307351782-7456-26-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/sharpsl.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 19e24ed..b3377f8 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -103,8 +103,6 @@ static int sharpsl_nand_calculate_ecc(struct mtd_info *mtd, const u_char * dat,
 	return readb(sharpsl->io + ECCCNTR) != 0;
 }
 
-static const char *part_probes[] = { "cmdlinepart", NULL };
-
 /*
  * Main initialization routine
  */
@@ -184,7 +182,7 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 
 	/* Register the partitions */
 	sharpsl->mtd.name = "sharpsl-nand";
-	nr_partitions = parse_mtd_partitions(&sharpsl->mtd, part_probes, &sharpsl_partition_info, 0);
+	nr_partitions = parse_mtd_partitions(&sharpsl->mtd, NULL, &sharpsl_partition_info, 0);
 	if (nr_partitions <= 0) {
 		nr_partitions = data->nr_partitions;
 		sharpsl_partition_info = data->partitions;
-- 
1.7.4.4
