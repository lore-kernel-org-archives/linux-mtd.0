Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVv6-00071b-DD
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:25 +0000
Received: by wyb28 with SMTP id 28so3682911wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:22 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 02/32] mtd: sst25l don't specify default parsing options
Date: Mon,  6 Jun 2011 13:15:52 +0400
Message-Id: <1307351782-7456-2-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/devices/sst25l.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index 1e2c430..cd095af 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -423,13 +423,7 @@ static int __devinit sst25l_probe(struct spi_device *spi)
 	      flash->mtd.numeraseregions);
 
 
-	if (mtd_has_cmdlinepart()) {
-		static const char *part_probes[] = {"cmdlinepart", NULL};
-
-		nr_parts = parse_mtd_partitions(&flash->mtd,
-						part_probes,
-						&parts, 0);
-	}
+	nr_parts = parse_mtd_partitions(&flash->mtd, NULL, &parts, 0);
 
 	if (nr_parts <= 0 && data && data->parts) {
 		parts = data->parts;
-- 
1.7.4.4
