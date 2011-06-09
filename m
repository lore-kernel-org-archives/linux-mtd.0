Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUct0-0004lu-Ah
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 10:54:51 +0000
Received: by wyb28 with SMTP id 28so1365020wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 03:54:47 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: edb7312: correctly pass MTD name to parsers
Date: Thu,  9 Jun 2011 14:54:41 +0400
Message-Id: <1307616881-13941-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cmdline partitions parser expects MTD name at mtd->name, instead of
origin, while edb7312 passes MTDID as origin. Fix that.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/maps/edb7312.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/edb7312.c b/drivers/mtd/maps/edb7312.c
index fe42a21..b07acd6 100644
--- a/drivers/mtd/maps/edb7312.c
+++ b/drivers/mtd/maps/edb7312.c
@@ -88,8 +88,9 @@ static int __init init_edb7312nor(void)
 	}
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
+		mymtd->name = MTDID;
 
-		mtd_parts_nb = parse_mtd_partitions(mymtd, probes, &mtd_parts, MTDID);
+		mtd_parts_nb = parse_mtd_partitions(mymtd, probes, &mtd_parts, 0);
 		if (mtd_parts_nb > 0)
 			part_type = "detected";
 
-- 
1.7.5.3
