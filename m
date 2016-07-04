Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKC0w-0003hB-UY
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 22:06:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, Richard Weinberger <richard@nod.at>
Subject: [PATCH 4/5] mtd: Don't unconditionally execute remove notifiers
Date: Tue,  5 Jul 2016 00:06:22 +0200
Message-Id: <1467669983-12105-5-git-send-email-richard@nod.at>
In-Reply-To: <1467669983-12105-1-git-send-email-richard@nod.at>
References: <1467669983-12105-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Only call them when we're really removing the MTD.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/mtdcore.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 36e5fb0..f49e103 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -499,16 +499,16 @@ int del_mtd_device(struct mtd_info *mtd)
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
+			the notifier, since we hold the mtd_table_mutex */
+		list_for_each_entry(not, &mtd_notifiers, list)
+			not->remove(mtd);
+
 		device_unregister(&mtd->dev);
 
 		idr_remove(&mtd_idr, mtd->index);
-- 
2.7.3
