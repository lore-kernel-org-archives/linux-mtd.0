Received: from smtp-out2.tiscali.nl ([195.241.79.177])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JQQcm-0001GX-Sh
	for linux-mtd@lists.infradead.org; Sat, 16 Feb 2008 17:14:54 +0000
Message-ID: <47B719FB.4020107@tiscali.nl>
Date: Sat, 16 Feb 2008 18:14:35 +0100
From: Roel Kluin <12o3l@tiscali.nl>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
Subject: [PATCH] drivers/mtd/onenand/onenand_base.c unlikely(x) || unlikely(y)
	=> unlikely(x || y)
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Not yet tested.
---
Replace unlikely(x) || unlikely(y) by unlikely(x || y)

Signed-off-by: Roel Kluin <12o3l@tiscali.nl>
---
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 8d7d21b..7334b4a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1336,7 +1336,7 @@ static int onenand_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 	}
 
 	/* Reject writes, which are not page aligned */
-        if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
+        if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) {
                 printk(KERN_ERR "onenand_panic_write: Attempt to write not page aligned data\n");
                 return -EINVAL;
         }
@@ -1466,7 +1466,7 @@ static int onenand_write_ops_nolock(struct mtd_info *mtd, loff_t to,
 	}
 
 	/* Reject writes, which are not page aligned */
-        if (unlikely(NOTALIGNED(to)) || unlikely(NOTALIGNED(len))) {
+        if (unlikely(NOTALIGNED(to) || NOTALIGNED(len))) {
                 printk(KERN_ERR "onenand_write_ops_nolock: Attempt to write not page aligned data\n");
                 return -EINVAL;
         }
