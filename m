Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTk-0001St-Kx
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:58 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so3852593wwb.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:56 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 40/44] mtd: tmio_nand.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:39 +0400
Message-Id: <1307453803-31950-41-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
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
 drivers/mtd/nand/tmio_nand.c |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index b6ffad6..d476857 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -378,8 +378,6 @@ static int tmio_probe(struct platform_device *dev)
 	struct tmio_nand *tmio;
 	struct mtd_info *mtd;
 	struct nand_chip *nand_chip;
-	struct mtd_partition *parts;
-	int nbparts = 0;
 	int retval;
 
 	if (data == NULL)
@@ -458,13 +456,9 @@ static int tmio_probe(struct platform_device *dev)
 		goto err_scan;
 	}
 	/* Register the partitions */
-	nbparts = parse_mtd_partitions(mtd, NULL, &parts, 0);
-	if (nbparts <= 0 && data) {
-		parts = data->partition;
-		nbparts = data->num_partitions;
-	}
-
-	retval = mtd_device_register(mtd, parts, nbparts);
+	retval = mtd_device_register(mtd, NULL, 0,
+			data ? data->partition : NULL,
+			data ? data->num_partitions : 0);
 	if (!retval)
 		return retval;
 
-- 
1.7.4.4
