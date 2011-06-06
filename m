Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvL-00073I-2J
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:39 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so2799739wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:38 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 11/32] mtd: davinci_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:01 +0400
Message-Id: <1307351782-7456-11-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/davinci_nand.c |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index a4c82b4..0c582ed 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -753,14 +753,7 @@ syndrome_done:
 	if (ret < 0)
 		goto err_scan;
 
-	if (mtd_has_cmdlinepart()) {
-		static const char *probes[] __initconst = {
-			"cmdlinepart", NULL
-		};
-
-		mtd_parts_nb = parse_mtd_partitions(&info->mtd, probes,
-						    &mtd_parts, 0);
-	}
+	mtd_parts_nb = parse_mtd_partitions(&info->mtd, NULL, &mtd_parts, 0);
 
 	if (mtd_parts_nb <= 0) {
 		mtd_parts = pdata->parts;
-- 
1.7.4.4
