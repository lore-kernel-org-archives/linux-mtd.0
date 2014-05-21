Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmzCN-0005re-22
 for linux-mtd@lists.infradead.org; Wed, 21 May 2014 05:36:20 +0000
Received: by mail-pa0-f51.google.com with SMTP id kq14so1050894pab.38
 for <linux-mtd@lists.infradead.org>; Tue, 20 May 2014 22:35:57 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: fastmap: correct error check
Date: Tue, 20 May 2014 22:35:38 -0700
Message-Id: <1400650538-11234-1-git-send-email-computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The return value from ubi_io_read_ec_hdr() was stored in 'err', not in
'ret'.

This issue was reported by Coverity Scan.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/fastmap.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index c5dad652614d..6de0e10fcea3 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -423,7 +423,7 @@ static int scan_pool(struct ubi_device *ubi, struct ubi_attach_info *ai,
 				pnum, err);
 			ret = err > 0 ? UBI_BAD_FASTMAP : err;
 			goto out;
-		} else if (ret == UBI_IO_BITFLIPS)
+		} else if (err == UBI_IO_BITFLIPS)
 			scrub = 1;
 
 		/*
-- 
1.7.9.5
