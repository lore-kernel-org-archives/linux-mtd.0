Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUg91-0007V4-DW
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 14:23:36 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so1305393wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 07:23:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/17] mtd: fsl_upm.c: use mtd_device_parse_register
Date: Thu,  9 Jun 2011 18:23:05 +0400
Message-Id: <1307629388-24769-17-git-send-email-dbaryshkov@gmail.com>
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

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/fsl_upm.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/fsl_upm.c b/drivers/mtd/nand/fsl_upm.c
index 253b8ff..04be80a 100644
--- a/drivers/mtd/nand/fsl_upm.c
+++ b/drivers/mtd/nand/fsl_upm.c
@@ -192,9 +192,7 @@ static int __devinit fun_chip_init(struct fsl_upm_nand *fun,
 	if (ret)
 		goto err;
 
-	ret = parse_mtd_partitions(&fun->mtd, NULL, &fun->parts, 0);
-
-	ret = mtd_device_register(&fun->mtd, fun->parts, ret);
+	ret = mtd_device_parse_register(&fun->mtd, NULL, 0, NULL, 0);
 err:
 	of_node_put(flash_np);
 	return ret;
-- 
1.7.5.3
