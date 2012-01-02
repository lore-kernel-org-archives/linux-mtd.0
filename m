Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqj-0003RB-Tk
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:46 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 03/17] mtd: do not use mtd->get_unmapped_area directly
Date: Mon,  2 Jan 2012 14:20:33 +0200
Message-Id: <1325506847-23470-4-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Remove direct usage of mtd->get_unmapped_area. Instead, just call
'mtd_get_unmapped_area()' which will return -EOPNOTSUPP if the function
is not implemented and test for this error code.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |   26 +++++++++++---------------
 drivers/mtd/mtdconcat.c |    6 +-----
 include/linux/mtd/mtd.h |    2 ++
 3 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index c501eec..55f0961 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1124,25 +1124,21 @@ static unsigned long mtdchar_get_unmapped_area(struct file *file,
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
+	unsigned long offset;
+	int ret;
 
-	if (mtd->get_unmapped_area) {
-		unsigned long offset;
-
-		if (addr != 0)
-			return (unsigned long) -EINVAL;
-
-		if (len > mtd->size || pgoff >= (mtd->size >> PAGE_SHIFT))
-			return (unsigned long) -EINVAL;
+	if (addr != 0)
+		return (unsigned long) -EINVAL;
 
-		offset = pgoff << PAGE_SHIFT;
-		if (offset > mtd->size - len)
-			return (unsigned long) -EINVAL;
+	if (len > mtd->size || pgoff >= (mtd->size >> PAGE_SHIFT))
+		return (unsigned long) -EINVAL;
 
-		return mtd_get_unmapped_area(mtd, len, offset, flags);
-	}
+	offset = pgoff << PAGE_SHIFT;
+	if (offset > mtd->size - len)
+		return (unsigned long) -EINVAL;
 
-	/* can't map directly */
-	return (unsigned long) -ENOSYS;
+	ret = mtd_get_unmapped_area(mtd, len, offset, flags);
+	return ret == -EOPNOTSUPP ? -ENOSYS : ret;
 }
 #endif
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f694b51..9119f76 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -726,11 +726,7 @@ static unsigned long concat_get_unmapped_area(struct mtd_info *mtd,
 		if (offset + len > subdev->size)
 			return (unsigned long) -EINVAL;
 
-		if (subdev->get_unmapped_area)
-			return mtd_get_unmapped_area(subdev, len, offset,
-						     flags);
-
-		break;
+		return mtd_get_unmapped_area(subdev, len, offset, flags);
 	}
 
 	return (unsigned long) -ENOSYS;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index b355a83..2c2a922 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -280,6 +280,8 @@ static inline unsigned long mtd_get_unmapped_area(struct mtd_info *mtd,
 						  unsigned long offset,
 						  unsigned long flags)
 {
+	if (!mtd->get_unmapped_area)
+		return -EOPNOTSUPP;
 	return mtd->get_unmapped_area(mtd, len, offset, flags);
 }
 
-- 
1.7.7.3
