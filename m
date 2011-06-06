Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVv7-000726-QA
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:26 +0000
Received: by wyb28 with SMTP id 28so3682940wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:24 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/32] mtd: h720x-flash don't specify default parsing options
Date: Mon,  6 Jun 2011 13:15:53 +0400
Message-Id: <1307351782-7456-3-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/h720x-flash.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/h720x-flash.c b/drivers/mtd/maps/h720x-flash.c
index 7f03586..f331a2c 100644
--- a/drivers/mtd/maps/h720x-flash.c
+++ b/drivers/mtd/maps/h720x-flash.c
@@ -60,8 +60,6 @@ static struct mtd_partition h720x_partitions[] = {
 
 static int                   nr_mtd_parts;
 static struct mtd_partition *mtd_parts;
-static const char *probes[] = { "cmdlinepart", NULL };
-
 /*
  * Initialize FLASH support
  */
@@ -92,7 +90,7 @@ static int __init h720x_mtd_init(void)
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
 
-		nr_mtd_parts = parse_mtd_partitions(mymtd, probes, &mtd_parts, 0);
+		nr_mtd_parts = parse_mtd_partitions(mymtd, NULL, &mtd_parts, 0);
 		if (nr_mtd_parts > 0)
 			part_type = "command line";
 		if (nr_mtd_parts <= 0) {
-- 
1.7.4.4
