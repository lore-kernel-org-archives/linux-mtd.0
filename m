Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTJ-0001Ql-7N
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:30 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:28 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 26/44] mtd: cs553x_nand.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:25 +0400
Message-Id: <1307453803-31950-27-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/cs553x_nand.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index b2bdf72..4aac849 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -283,8 +283,6 @@ static int __init cs553x_init(void)
 	int err = -ENXIO;
 	int i;
 	uint64_t val;
-	int mtd_parts_nb = 0;
-	struct mtd_partition *mtd_parts = NULL;
 
 	/* If the CPU isn't a Geode GX or LX, abort */
 	if (!is_geode())
@@ -316,9 +314,8 @@ static int __init cs553x_init(void)
 		if (cs553x_mtd[i]) {
 
 			/* If any devices registered, return success. Else the last error. */
-			mtd_parts_nb = parse_mtd_partitions(cs553x_mtd[i], NULL, &mtd_parts, 0);
-			mtd_device_register(cs553x_mtd[i], mtd_parts,
-					    mtd_parts_nb);
+			mtd_device_parse_register(cs553x_mtd[i], NULL, 0,
+					NULL, 0);
 			err = 0;
 		}
 	}
-- 
1.7.4.4
