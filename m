Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJtF-00041T-MU
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:38:31 +0000
Received: by mail-ww0-f49.google.com with SMTP id 22so452817wwf.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:38:29 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/18] mtd: socrates_nand: use ofpart through generic parsing
Date: Wed, 22 Jun 2011 13:37:43 +0400
Message-Id: <1308735472-32640-10-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
References: <1308735472-32640-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert the driver to use ofpart partitions parsing through the generic
parse_mtd_partitions().

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/socrates_nand.c |   14 +++-----------
 1 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 9023ac8..f4f79ec 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -166,6 +166,7 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 	struct mtd_partition *partitions = NULL;
 	int num_partitions = 0;
+	struct mtd_part_parser_data ppdata;
 
 	/* Allocate memory for the device structure (and zero it) */
 	host = kzalloc(sizeof(struct socrates_nand_host), GFP_KERNEL);
@@ -191,6 +192,7 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 	mtd->name = "socrates_nand";
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &ofdev->dev;
+	ppdata.of_node = ofdev->dev.of_node;
 
 	/*should never be accessed directly */
 	nand_chip->IO_ADDR_R = (void *)0xdeadbeef;
@@ -223,22 +225,12 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 		goto out;
 	}
 
-	num_partitions = parse_mtd_partitions(mtd, NULL, &partitions, 0);
+	num_partitions = parse_mtd_partitions(mtd, NULL, &partitions, &ppdata);
 	if (num_partitions < 0) {
 		res = num_partitions;
 		goto release;
 	}
 
-	if (num_partitions == 0) {
-		num_partitions = of_mtd_parse_partitions(&ofdev->dev,
-							 ofdev->dev.of_node,
-							 &partitions);
-		if (num_partitions < 0) {
-			res = num_partitions;
-			goto release;
-		}
-	}
-
 	res = mtd_device_register(mtd, partitions, num_partitions);
 	if (!res)
 		return res;
-- 
1.7.5.3
