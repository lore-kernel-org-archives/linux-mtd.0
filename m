Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QS9FK-00074g-HB
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 14:51:39 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so758040wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 02 Jun 2011 07:51:38 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 007/104] mtd: m25p80 don't specify default parsing options
Date: Thu,  2 Jun 2011 18:51:17 +0400
Message-Id: <1307026293-8535-5-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/devices/m25p80.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 35180e4..70d5fca 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -968,13 +968,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 	/* partitions should match sector boundaries; and it may be good to
 	 * use readonly partitions for writeprotected sectors (BP2..BP0).
 	 */
-	if (mtd_has_cmdlinepart()) {
-		static const char *part_probes[]
-			= { "cmdlinepart", NULL, };
-
-		nr_parts = parse_mtd_partitions(&flash->mtd,
-						part_probes, &parts, 0);
-	}
+	nr_parts = parse_mtd_partitions(&flash->mtd, NULL, &parts, 0);
 
 	if (nr_parts <= 0 && data && data->parts) {
 		parts = data->parts;
-- 
1.7.4.4
