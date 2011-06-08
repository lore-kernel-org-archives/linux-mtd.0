Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHg-0007Bz-Lj
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:07:10 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so531325wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:07:08 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 41/43] mtd: onenand/generic.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:50 +0400
Message-Id: <1307549152-7085-42-git-send-email-dbaryshkov@gmail.com>
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
