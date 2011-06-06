Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvs-00073I-Vz
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:14 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799739wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:12 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 27/32] mtd: socrates_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:17 +0400
Message-Id: <1307351782-7456-27-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/socrates_nand.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index ca2d055..6ed53e1 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -155,8 +155,6 @@ static int socrates_nand_device_ready(struct mtd_info *mtd)
 	return 1;
 }
 
-static const char *part_probes[] = { "cmdlinepart", NULL };
-
 /*
  * Probe for the NAND device.
  */
@@ -225,14 +223,12 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 		goto out;
 	}
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-	num_partitions = parse_mtd_partitions(mtd, part_probes,
+	num_partitions = parse_mtd_partitions(mtd, NULL,
 					      &partitions, 0);
 	if (num_partitions < 0) {
 		res = num_partitions;
 		goto release;
 	}
-#endif
 
 	if (num_partitions == 0) {
 		num_partitions = of_mtd_parse_partitions(&ofdev->dev,
-- 
1.7.4.4
