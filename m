Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHd-0007LR-AM
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:07:06 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so631181wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:07:05 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 40/43] mtd: txx9ndfmc.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:49 +0400
Message-Id: <1307549152-7085-41-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/txx9ndfmc.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 91b05b9..ace46fd 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -74,7 +74,6 @@ struct txx9ndfmc_drvdata {
 	unsigned char hold;	/* in gbusclock */
 	unsigned char spw;	/* in gbusclock */
 	struct nand_hw_control hw_control;
-	struct mtd_partition *parts[MAX_TXX9NDFMC_DEV];
 };
 
 static struct platform_device *mtd_to_platdev(struct mtd_info *mtd)
@@ -332,7 +331,6 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		struct txx9ndfmc_priv *txx9_priv;
 		struct nand_chip *chip;
 		struct mtd_info *mtd;
-		int nr_parts;
 
 		if (!(plat->ch_mask & (1 << i)))
 			continue;
@@ -392,9 +390,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		nr_parts = parse_mtd_partitions(mtd, NULL,
-						&drvdata->parts[i], 0);
-		mtd_device_register(mtd, drvdata->parts[i], nr_parts);
+		mtd_device_parse_register(mtd, NULL, 0, NULL, 0);
 		drvdata->mtds[i] = mtd;
 	}
 
@@ -420,7 +416,6 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 		txx9_priv = chip->priv;
 
 		nand_release(mtd);
-		kfree(drvdata->parts[i]);
 		kfree(txx9_priv->mtdname);
 		kfree(txx9_priv);
 	}
-- 
1.7.4.4
