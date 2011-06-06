Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvM-00071T-Mr
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:41 +0000
Received: by mail-ww0-f41.google.com with SMTP id 18so1223527wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:40 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 12/32] mtd: edb7312 don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:02 +0400
Message-Id: <1307351782-7456-12-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/edb7312.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/edb7312.c b/drivers/mtd/nand/edb7312.c
index 8400d0f..2f9374b 100644
--- a/drivers/mtd/nand/edb7312.c
+++ b/drivers/mtd/nand/edb7312.c
@@ -98,8 +98,6 @@ static int ep7312_device_ready(struct mtd_info *mtd)
 	return 1;
 }
 
-const char *part_probes[] = { "cmdlinepart", NULL };
-
 /*
  * Main initialization routine
  */
@@ -158,7 +156,7 @@ static int __init ep7312_init(void)
 		return -ENXIO;
 	}
 	ep7312_mtd->name = "edb7312-nand";
-	mtd_parts_nb = parse_mtd_partitions(ep7312_mtd, part_probes, &mtd_parts, 0);
+	mtd_parts_nb = parse_mtd_partitions(ep7312_mtd, NULL, &mtd_parts, 0);
 	if (mtd_parts_nb > 0)
 		part_type = "command line";
 	else
-- 
1.7.4.4
