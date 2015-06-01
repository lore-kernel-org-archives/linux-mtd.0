Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzYyA-0007Hv-VA
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 23:18:11 +0000
Received: by pdjm12 with SMTP id m12so35613062pdj.3
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2015 16:17:49 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/4] mtd: diskonchip: remove two-phase partitioning /
 registration
Date: Mon,  1 Jun 2015 16:17:17 -0700
Message-Id: <1433200640-17858-1-git-send-email-computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is a Bad Idea (TM) to call mtd_device_register() or
mtd_device_parse_register() twice on the same master MTD. Among other
things, it makes partition overrides (e.g., cmdlinepart) much more
difficult.

Since commit 727dc612c46b ("mtd: part: Create the master device node
when partitioned"), we now have a config option that accomplishes the
same purpose as the double-registration done in diskonchip.c -- it
forces the master MTD to *always* be registered, while partitions may
optionally show up in addition. Eventually, we might like to make
CONFIG_MTD_PARTITIONED_MASTER into the default, but this could be
disruptive to user-space expectations of MTD numbering, so we'll take
that slowly.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Alexander Shiyan <shc_work@mail.ru>
---
Not tested, as I don't have the hardware

 drivers/mtd/nand/diskonchip.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index e5800146cf33..7da266a53979 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -1301,10 +1301,7 @@ static int __init nftl_scan_bbt(struct mtd_info *mtd)
 	if (ret)
 		return ret;
 
-	mtd_device_register(mtd, NULL, 0);
-	if (!no_autopart)
-		mtd_device_register(mtd, parts, numparts);
-	return 0;
+	return mtd_device_register(mtd, parts, no_autopart ? 0 : numparts);
 }
 
 static int __init inftl_scan_bbt(struct mtd_info *mtd)
@@ -1358,10 +1355,7 @@ static int __init inftl_scan_bbt(struct mtd_info *mtd)
 	   autopartitioning, but I want to give it more thought. */
 	if (!numparts)
 		return -EIO;
-	mtd_device_register(mtd, NULL, 0);
-	if (!no_autopart)
-		mtd_device_register(mtd, parts, numparts);
-	return 0;
+	return mtd_device_register(mtd, parts, no_autopart ? 0 : numparts);
 }
 
 static inline int __init doc2000_init(struct mtd_info *mtd)
-- 
1.9.1
