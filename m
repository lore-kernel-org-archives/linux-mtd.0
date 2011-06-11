Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QVXM1-00010Q-Kp
	for linux-mtd@lists.infradead.org; Sat, 11 Jun 2011 23:12:34 +0000
Received: by mail-ew0-f49.google.com with SMTP id 3so1527787ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Jun 2011 16:12:33 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/18] mtd: socrates_nand.c: use mtd_device_parse_register
Date: Sun, 12 Jun 2011 03:12:02 +0400
Message-Id: <1307833922-21602-19-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
References: <1307833922-21602-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/socrates_nand.c |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/socrates_nand.c b/drivers/mtd/nand/socrates_nand.c
index f4f79ec..0fb24f9 100644
--- a/drivers/mtd/nand/socrates_nand.c
+++ b/drivers/mtd/nand/socrates_nand.c
@@ -164,8 +164,6 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 	struct mtd_info *mtd;
 	struct nand_chip *nand_chip;
 	int res;
-	struct mtd_partition *partitions = NULL;
-	int num_partitions = 0;
 	struct mtd_part_parser_data ppdata;
 
 	/* Allocate memory for the device structure (and zero it) */
@@ -225,17 +223,10 @@ static int __devinit socrates_nand_probe(struct platform_device *ofdev)
 		goto out;
 	}
 
-	num_partitions = parse_mtd_partitions(mtd, NULL, &partitions, &ppdata);
-	if (num_partitions < 0) {
-		res = num_partitions;
-		goto release;
-	}
-
-	res = mtd_device_register(mtd, partitions, num_partitions);
+	res = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
 	if (!res)
 		return res;
 
-release:
 	nand_release(mtd);
 
 out:
-- 
1.7.5.3
