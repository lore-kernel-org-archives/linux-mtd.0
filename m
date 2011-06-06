Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVv8-00071b-ES
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:27 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682911wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:26 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/32] mtd: impa7 don't specify default parsing options
Date: Mon,  6 Jun 2011 13:15:54 +0400
Message-Id: <1307351782-7456-4-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/impa7.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/impa7.c b/drivers/mtd/maps/impa7.c
index 404a50c..2d45a48 100644
--- a/drivers/mtd/maps/impa7.c
+++ b/drivers/mtd/maps/impa7.c
@@ -61,7 +61,6 @@ static struct mtd_partition static_partitions[] =
 static int mtd_parts_nb[NUM_FLASHBANKS];
 static struct mtd_partition *mtd_parts[NUM_FLASHBANKS];
 
-static const char *probes[] = { "cmdlinepart", NULL };
 
 static int __init init_impa7(void)
 {
@@ -98,7 +97,7 @@ static int __init init_impa7(void)
 			impa7_mtd[i]->owner = THIS_MODULE;
 			devicesfound++;
 			mtd_parts_nb[i] = parse_mtd_partitions(impa7_mtd[i],
-							       probes,
+							       NULL,
 							       &mtd_parts[i],
 							       0);
 			if (mtd_parts_nb[i] > 0) {
-- 
1.7.4.4
