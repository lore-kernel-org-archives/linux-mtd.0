Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROe-0002TB-JX
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:25:58 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:25:56 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 53/62] mtd/sharpsl: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:34 +0100
Message-Id: <1306142623-24952-54-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/sharpsl.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 54ec754..19e24ed 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -103,9 +103,7 @@ static int sharpsl_nand_calculate_ecc(struct mtd_info *mtd, const u_char * dat,
 	return readb(sharpsl->io + ECCCNTR) != 0;
 }
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 /*
  * Main initialization routine
@@ -113,10 +111,8 @@ static const char *part_probes[] = { "cmdlinepart", NULL };
 static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *sharpsl_partition_info;
 	int nr_partitions;
-#endif
 	struct resource *r;
 	int err = 0;
 	struct sharpsl_nand *sharpsl;
@@ -188,18 +184,14 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 
 	/* Register the partitions */
 	sharpsl->mtd.name = "sharpsl-nand";
-#ifdef CONFIG_MTD_PARTITIONS
 	nr_partitions = parse_mtd_partitions(&sharpsl->mtd, part_probes, &sharpsl_partition_info, 0);
 	if (nr_partitions <= 0) {
 		nr_partitions = data->nr_partitions;
 		sharpsl_partition_info = data->partitions;
 	}
 
-	if (nr_partitions > 0)
-		err = add_mtd_partitions(&sharpsl->mtd, sharpsl_partition_info, nr_partitions);
-	else
-#endif
-	err = add_mtd_device(&sharpsl->mtd);
+	err = mtd_device_register(&sharpsl->mtd, sharpsl_partition_info,
+				  nr_partitions);
 	if (err)
 		goto err_add;
 
-- 
1.7.4.4
