Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZJtW-00040t-I3
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 09:38:47 +0000
Received: by mail-wy0-f177.google.com with SMTP id 23so536878wyf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jun 2011 02:38:46 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/18] mtd: fsl_upm.c: use mtd_device_parse_register
Date: Wed, 22 Jun 2011 13:37:49 +0400
Message-Id: <1308735472-32640-16-git-send-email-dbaryshkov@gmail.com>
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

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/fsl_upm.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 714d831..da92fed 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -193,9 +193,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 		goto err;
 
 	ppdata.of_node = flash_np;
-	ret = parse_mtd_partitions(&fun->mtd, NULL, &fun->parts, &ppdata);
-
-	ret = mtd_device_register(&fun->mtd, fun->parts, ret);
+	ret = mtd_device_parse_register(&fun->mtd, NULL, &ppdata, NULL, 0);
 err:
 	of_node_put(flash_np);
 	return ret;
-- 
1.7.5.3
