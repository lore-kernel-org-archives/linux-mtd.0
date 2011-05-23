Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROl-0002TB-No
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:05 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:26:03 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 56/62] mtd/txx9ndfmc: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:37 +0100
Message-Id: <1306142623-24952-57-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/nand/txx9ndfmc.c |   14 +-------------
 1 files changed, 1 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index ca270a4..bfba4e3 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -74,9 +74,7 @@ struct txx9ndfmc_drvdata {
 	unsigned char hold;	/* in gbusclock */
 	unsigned char spw;	/* in gbusclock */
 	struct nand_hw_control hw_control;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts[MAX_TXX9NDFMC_DEV];
-#endif
 };
 
 static struct platform_device *mtd_to_platdev(struct mtd_info *mtd)
@@ -289,9 +287,7 @@ static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
 static int __init txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev->dev.platform_data;
-#ifdef CONFIG_MTD_PARTITIONS
 	static const char *probes[] = { "cmdlinepart", NULL };
-#endif
 	int hold, spw;
 	int i;
 	struct txx9ndfmc_drvdata *drvdata;
@@ -337,9 +333,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		struct txx9ndfmc_priv *txx9_priv;
 		struct nand_chip *chip;
 		struct mtd_info *mtd;
-#ifdef CONFIG_MTD_PARTITIONS
 		int nr_parts;
-#endif
 
 		if (!(plat->ch_mask & (1 << i)))
 			continue;
@@ -399,13 +393,9 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-#ifdef CONFIG_MTD_PARTITIONS
 		nr_parts = parse_mtd_partitions(mtd, probes,
 						&drvdata->parts[i], 0);
-		if (nr_parts > 0)
-			add_mtd_partitions(mtd, drvdata->parts[i], nr_parts);
-#endif
-		add_mtd_device(mtd);
+		mtd_device_register(mtd, drvdata->parts[i], nr_parts);
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -431,9 +421,7 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 		txx9_priv = chip->priv;
 
 		nand_release(mtd);
-#ifdef CONFIG_MTD_PARTITIONS
 		kfree(drvdata->parts[i]);
-#endif
 		kfree(txx9_priv->mtdname);
 		kfree(txx9_priv);
 	}
-- 
1.7.4.4
