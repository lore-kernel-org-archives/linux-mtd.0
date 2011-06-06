Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvw-00071b-9O
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:17 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682911wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:15 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 28/32] mtd: tmio_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:18 +0400
Message-Id: <1307351782-7456-28-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/tmio_nand.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index 11e8371..b6ffad6 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -121,9 +121,6 @@ struct tmio_nand {
 
 #define mtd_to_tmio(m)			container_of(m, struct tmio_nand, mtd)
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-static const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 /*--------------------------------------------------------------------------*/
 
@@ -461,9 +458,7 @@ static int tmio_probe(struct platform_device *dev)
 		goto err_scan;
 	}
 	/* Register the partitions */
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-	nbparts = parse_mtd_partitions(mtd, part_probes, &parts, 0);
-#endif
+	nbparts = parse_mtd_partitions(mtd, NULL, &parts, 0);
 	if (nbparts <= 0 && data) {
 		parts = data->partition;
 		nbparts = data->num_partitions;
-- 
1.7.4.4
