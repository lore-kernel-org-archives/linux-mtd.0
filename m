Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHZ-0007GE-Oy
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:07:02 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so531513wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:07:01 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 38/43] mtd: sharpsl.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:47 +0400
Message-Id: <1307549152-7085-39-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/sharpsl.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index b3377f8..619d2a5 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -109,8 +109,6 @@ static int sharpsl_nand_calculate_ecc(struct mtd_info *mtd, const u_char * dat,
 static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
-	struct mtd_partition *sharpsl_partition_info;
-	int nr_partitions;
 	struct resource *r;
 	int err = 0;
 	struct sharpsl_nand *sharpsl;
@@ -182,14 +180,9 @@ static int __devinit sharpsl_nand_probe(struct platform_device *pdev)
 
 	/* Register the partitions */
 	sharpsl->mtd.name = "sharpsl-nand";
-	nr_partitions = parse_mtd_partitions(&sharpsl->mtd, NULL, &sharpsl_partition_info, 0);
-	if (nr_partitions <= 0) {
-		nr_partitions = data->nr_partitions;
-		sharpsl_partition_info = data->partitions;
-	}
 
-	err = mtd_device_register(&sharpsl->mtd, sharpsl_partition_info,
-				  nr_partitions);
+	err = mtd_device_parse_register(&sharpsl->mtd, NULL, 0,
+			data->partitions, data->nr_partitions);
 	if (err)
 		goto err_add;
 
-- 
1.7.4.4
