Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YReEu-00007S-6l
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 10:03:17 +0000
Received: by paceu11 with SMTP id eu11so29182842pac.10
 for <linux-mtd@lists.infradead.org>; Sat, 28 Feb 2015 02:02:55 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/7] mtd: onenand: drop dead code
Date: Sat, 28 Feb 2015 02:02:25 -0800
Message-Id: <1425117750-22298-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

'ret' is always zero, so this is all dead code.

This should quiet Coverity CID #1226739.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/mtd/onenand/onenand_base.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 635ee0027691..43b3392ffee7 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1743,7 +1743,6 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct onenand_chip *this = mtd->priv;
 	int column, subpage;
 	int written = 0;
-	int ret = 0;
 
 	if (this->state == FL_PM_SUSPENDED)
 		return -EBUSY;
@@ -1786,15 +1785,10 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		onenand_panic_wait(mtd);
 
 		/* In partial page write we don't update bufferram */
-		onenand_update_bufferram(mtd, to, !ret && !subpage);
+		onenand_update_bufferram(mtd, to, !subpage);
 		if (ONENAND_IS_2PLANE(this)) {
 			ONENAND_SET_BUFFERRAM1(this);
-			onenand_update_bufferram(mtd, to + this->writesize, !ret && !subpage);
-		}
-
-		if (ret) {
-			printk(KERN_ERR "%s: write failed %d\n", __func__, ret);
-			break;
+			onenand_update_bufferram(mtd, to + this->writesize, !subpage);
 		}
 
 		written += thislen;
@@ -1808,7 +1802,7 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	}
 
 	*retlen = written;
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.1.0
