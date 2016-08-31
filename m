Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bezxp-0004ph-Qk
 for linux-mtd@lists.infradead.org; Wed, 31 Aug 2016 07:29:40 +0000
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/46] mtd: Don't unconditionally execute remove notifiers
Date: Wed, 31 Aug 2016 09:28:11 +0200
Message-Id: <20160831072853.27822-5-dwalter@sigma-star.at>
In-Reply-To: <20160831072853.27822-1-dwalter@sigma-star.at>
References: <20160831072853.27822-1-dwalter@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

Only call them when we're really removing the MTD.

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtdcore.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 36e5fb0..b8205ec 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -499,16 +499,17 @@ int del_mtd_device(struct mtd_info *mtd)
 		goto out_error;
 	}
 
-	/* No need to get a refcount on the module containing
-		the notifier, since we hold the mtd_table_mutex */
-	list_for_each_entry(not, &mtd_notifiers, list)
-		not->remove(mtd);
-
 	if (mtd->usecount) {
 		printk(KERN_NOTICE "Removing MTD device #%d (%s) with use count %d\n",
 		       mtd->index, mtd->name, mtd->usecount);
 		ret = -EBUSY;
 	} else {
+		/* No need to get a refcount on the module containing
+		 * the notifier, since we hold the mtd_table_mutex
+		 */
+		list_for_each_entry(not, &mtd_notifiers, list)
+			not->remove(mtd);
+
 		device_unregister(&mtd->dev);
 
 		idr_remove(&mtd_idr, mtd->index);
-- 
2.8.3
