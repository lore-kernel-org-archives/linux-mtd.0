Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKA9L-0002gF-D4
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 20:07:24 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, richard@nod.at,
 dedekind1@gmail.com
Subject: [PATCH 1/2] ubi: gluebi: Fix double refcounting
Date: Mon,  4 Jul 2016 22:06:50 +0200
Message-Id: <1467662811-7463-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There is no need to call get/put on the module
reference in gluebi_get/put_device() callbacks.
Since mtd->owner is the gluebi module itself
mtdcore.c will take care of proper refcounting
in __get/put_mtd_device() before executing the
callbacks.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/gluebi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/ubi/gluebi.c b/drivers/mtd/ubi/gluebi.c
index cb7c075..ea1016f 100644
--- a/drivers/mtd/ubi/gluebi.c
+++ b/drivers/mtd/ubi/gluebi.c
@@ -99,9 +99,6 @@ static int gluebi_get_device(struct mtd_info *mtd)
 	struct gluebi_device *gluebi;
 	int ubi_mode = UBI_READONLY;
 
-	if (!try_module_get(THIS_MODULE))
-		return -ENODEV;
-
 	if (mtd->flags & MTD_WRITEABLE)
 		ubi_mode = UBI_READWRITE;
 
@@ -153,7 +150,6 @@ static void gluebi_put_device(struct mtd_info *mtd)
 	gluebi->refcnt -= 1;
 	if (gluebi->refcnt == 0)
 		ubi_close_volume(gluebi->desc);
-	module_put(THIS_MODULE);
 	mutex_unlock(&devices_mutex);
 }
 
-- 
2.7.3
