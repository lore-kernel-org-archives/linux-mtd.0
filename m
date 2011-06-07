Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTo-0001Ql-56
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:38:01 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:59 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 42/44] mtd: onenand/generic.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:41 +0400
Message-Id: <1307453803-31950-43-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/onenand/generic.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index bca1c49..8152a31 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -32,7 +32,6 @@
 
 struct onenand_info {
 	struct mtd_info		mtd;
-	struct mtd_partition	*parts;
 	struct onenand_chip	onenand;
 };
 
@@ -71,13 +70,9 @@ static int __devinit generic_onenand_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
-	err = parse_mtd_partitions(&info->mtd, NULL, &info->parts, 0);
-	if (err > 0)
-		mtd_device_register(&info->mtd, info->parts, err);
-	else if (err <= 0 && pdata && pdata->parts)
-		mtd_device_register(&info->mtd, pdata->parts, pdata->nr_parts);
-	else
-		err = mtd_device_register(&info->mtd, NULL, 0);
+	err = mtd_device_parse_register(&info->mtd, NULL, 0,
+			pdata ? pdata->parts : NULL,
+			pdata ? pdata->nr_parts : 0);
 
 	platform_set_drvdata(pdev, info);
 
-- 
1.7.4.4
