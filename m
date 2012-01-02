Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqv-0003Sw-6Z
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:59 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/17] mtd: do not use mtd->lock, unlock and is_locked directly
Date: Mon,  2 Jan 2012 14:20:43 +0200
Message-Id: <1325506847-23470-14-git-send-email-dedekind1@gmail.com>
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

Instead, call the corresponding MTD API function which will return
'-EOPNOTSUPP' if the operation is not supported.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/maps/scb2_flash.c |    3 +--
 drivers/mtd/mtdchar.c         |   15 +++------------
 drivers/mtd/mtdconcat.c       |   18 ++++++------------
 drivers/mtd/mtdcore.c         |    6 +++---
 include/linux/mtd/mtd.h       |    6 ++++++
 5 files changed, 19 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/maps/scb2_flash.c b/drivers/mtd/maps/scb2_flash.c
index 01af347..934a72c 100644
--- a/drivers/mtd/maps/scb2_flash.c
+++ b/drivers/mtd/maps/scb2_flash.c
@@ -204,8 +204,7 @@ scb2_flash_remove(struct pci_dev *dev)
 		return;
 
 	/* disable flash writes */
-	if (scb2_mtd->lock)
-		mtd_lock(scb2_mtd, 0, scb2_mtd->size);
+	mtd_lock(scb2_mtd, 0, scb2_mtd->size);
 
 	mtd_device_unregister(scb2_mtd);
 	map_destroy(scb2_mtd);
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 23a5110..92da621 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -814,10 +814,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&einfo, argp, sizeof(einfo)))
 			return -EFAULT;
 
-		if (!mtd->lock)
-			ret = -EOPNOTSUPP;
-		else
-			ret = mtd_lock(mtd, einfo.start, einfo.length);
+		ret = mtd_lock(mtd, einfo.start, einfo.length);
 		break;
 	}
 
@@ -828,10 +825,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&einfo, argp, sizeof(einfo)))
 			return -EFAULT;
 
-		if (!mtd->unlock)
-			ret = -EOPNOTSUPP;
-		else
-			ret = mtd_unlock(mtd, einfo.start, einfo.length);
+		ret = mtd_unlock(mtd, einfo.start, einfo.length);
 		break;
 	}
 
@@ -842,10 +836,7 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 		if (copy_from_user(&einfo, argp, sizeof(einfo)))
 			return -EFAULT;
 
-		if (!mtd->is_locked)
-			ret = -EOPNOTSUPP;
-		else
-			ret = mtd_is_locked(mtd, einfo.start, einfo.length);
+		ret = mtd_is_locked(mtd, einfo.start, einfo.length);
 		break;
 	}
 
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 9119f76..aaafb5e 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -555,12 +555,9 @@ static int concat_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		else
 			size = len;
 
-		if (subdev->lock) {
-			err = mtd_lock(subdev, ofs, size);
-			if (err)
-				break;
-		} else
-			err = -EOPNOTSUPP;
+		err = mtd_lock(subdev, ofs, size);
+		if (err)
+			break;
 
 		len -= size;
 		if (len == 0)
@@ -595,12 +592,9 @@ static int concat_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 		else
 			size = len;
 
-		if (subdev->unlock) {
-			err = mtd_unlock(subdev, ofs, size);
-			if (err)
-				break;
-		} else
-			err = -EOPNOTSUPP;
+		err = mtd_unlock(subdev, ofs, size);
+		if (err)
+			break;
 
 		len -= size;
 		if (len == 0)
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 4d0f3e5..66494ee 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -339,9 +339,9 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->writesize_mask = (1 << mtd->writesize_shift) - 1;
 
 	/* Some chips always power up locked. Unlock them now */
-	if ((mtd->flags & MTD_WRITEABLE)
-	    && (mtd->flags & MTD_POWERUP_LOCK) && mtd->unlock) {
-		if (mtd_unlock(mtd, 0, mtd->size))
+	if ((mtd->flags & MTD_WRITEABLE) && (mtd->flags & MTD_POWERUP_LOCK)) {
+		error = mtd_unlock(mtd, 0, mtd->size);
+		if (error && error != -EOPNOTSUPP)
 			printk(KERN_WARNING
 			       "%s: unlock failed, writes may not work\n",
 			       mtd->name);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 305f12b..6c91ba5 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -406,16 +406,22 @@ static inline void mtd_sync(struct mtd_info *mtd)
 /* Chip-supported device locking */
 static inline int mtd_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
+	if (!mtd->lock)
+		return -EOPNOTSUPP;
 	return mtd->lock(mtd, ofs, len);
 }
 
 static inline int mtd_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
+	if (!mtd->unlock)
+		return -EOPNOTSUPP;
 	return mtd->unlock(mtd, ofs, len);
 }
 
 static inline int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 {
+	if (!mtd->is_locked)
+		return -EOPNOTSUPP;
 	return mtd->is_locked(mtd, ofs, len);
 }
 
-- 
1.7.7.3
