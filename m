Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVwA-000726-EM
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:31 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682940wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:30 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 30/32] mtd: onenand/generic don't specify default parsing
	options
Date: Mon,  6 Jun 2011 13:16:20 +0400
Message-Id: <1307351782-7456-30-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/onenand/generic.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
index 2d70d35..bca1c49 100644
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -30,8 +30,6 @@
  */
 #define DRIVER_NAME	"onenand-flash"
 
-static const char *part_probes[] = { "cmdlinepart", NULL,  };
-
 struct onenand_info {
 	struct mtd_info		mtd;
 	struct mtd_partition	*parts;
@@ -73,7 +71,7 @@ static int __devinit generic_onenand_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
-	err = parse_mtd_partitions(&info->mtd, part_probes, &info->parts, 0);
+	err = parse_mtd_partitions(&info->mtd, NULL, &info->parts, 0);
 	if (err > 0)
 		mtd_device_register(&info->mtd, info->parts, err);
 	else if (err <= 0 && pdata && pdata->parts)
-- 
1.7.4.4
