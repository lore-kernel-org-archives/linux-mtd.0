Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg8o-0007Vd-Iq
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:23 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so1555625wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:22 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 08/17] mtd: socrates_nand: use ofpart through generic parsing
Date: Thu,  9 Jun 2011 18:22:57 +0400
Message-Id: <1307629388-24769-9-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
References: <1307629388-24769-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
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
 drivers/mtd/nand/socrates_nand.c |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index 9023ac8..b256491 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -191,6 +191,7 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 	mtd->name = "socrates_nand";
 	mtd->owner = THIS_MODULE;
 	mtd->dev.parent = &ofdev->dev;
+	mtd->node = ofdev->dev.of_node;
 
 	/*should never be accessed directly */
 	nand_chip->IO_ADDR_R = (void *)0xdeadbeef;
@@ -229,16 +230,6 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
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
