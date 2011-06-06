Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVv6-00071T-EU
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:25 +0000
Received: by wwi18 with SMTP id 18so1223527wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:20 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 01/32] mtd: mtd_dataflash don't specify default parsing options
Date: Mon,  6 Jun 2011 13:15:51 +0400
Message-Id: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/devices/mtd_dataflash.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 13749d4..4d4a9cd 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -677,12 +677,7 @@ add_dataflash_otp(struct spi_device *spi, char *name,
 			pagesize, otp_tag);
 	dev_set_drvdata(&spi->dev, priv);
 
-	if (mtd_has_cmdlinepart()) {
-		static const char *part_probes[] = { "cmdlinepart", NULL, };
-
-		nr_parts = parse_mtd_partitions(device, part_probes, &parts,
-						0);
-	}
+	nr_parts = parse_mtd_partitions(device, NULL, &parts, 0);
 
 	if (nr_parts <= 0 && pdata && pdata->parts) {
 		parts = pdata->parts;
-- 
1.7.4.4
