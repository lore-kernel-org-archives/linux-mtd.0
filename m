Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVw0-000737-7u
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:21 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799709wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:19 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 29/32] mtd: txx9ndfmc don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:19 +0400
Message-Id: <1307351782-7456-29-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/txx9ndfmc.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index bfba4e3..91b05b9 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -287,7 +287,6 @@ static int txx9ndfmc_nand_scan(struct mtd_info *mtd)
 static int __init txx9ndfmc_probe(struct platform_device *dev)
 {
 	struct txx9ndfmc_platform_data *plat = dev->dev.platform_data;
-	static const char *probes[] = { "cmdlinepart", NULL };
 	int hold, spw;
 	int i;
 	struct txx9ndfmc_drvdata *drvdata;
@@ -393,7 +392,7 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		}
 		mtd->name = txx9_priv->mtdname;
 
-		nr_parts = parse_mtd_partitions(mtd, probes,
+		nr_parts = parse_mtd_partitions(mtd, NULL,
 						&drvdata->parts[i], 0);
 		mtd_device_register(mtd, drvdata->parts[i], nr_parts);
 		drvdata->mtds[i] = mtd;
-- 
1.7.4.4
