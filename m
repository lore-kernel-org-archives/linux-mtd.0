Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCF9-0004RA-0D
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:25:49 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 06/27] mtd: introduce mtd_get_unmapped_area interface
Date: Thu, 29 Dec 2011 11:27:10 +0200
Message-Id: <1325150851-2805-7-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
References: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/mtdchar.c   |    2 +-
 drivers/mtd/mtdconcat.c |    4 ++--
 drivers/mtd/mtdpart.c   |    3 +--
 fs/romfs/mmap-nommu.c   |    2 +-
 include/linux/mtd/mtd.h |   18 +++++++++++++-----
 5 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 41d64ff..c51f04a 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1135,7 +1135,7 @@ static unsigned long mtdchar_get_unmapped_area(struct file *file,
 		if (offset > mtd->size - len)
 			return (unsigned long) -EINVAL;
 
-		return mtd->get_unmapped_area(mtd, len, offset, flags);
+		return mtd_get_unmapped_area(mtd, len, offset, flags);
 	}
 
 	/* can't map directly */
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 76123bd..b3895cf 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -726,8 +726,8 @@ static unsigned long concat_get_unmapped_area(struct mtd_info *mtd,
 			return (unsigned long) -EINVAL;
 
 		if (subdev->get_unmapped_area)
-			return subdev->get_unmapped_area(subdev, len, offset,
-							 flags);
+			return mtd_get_unmapped_area(subdev, len, offset,
+						     flags);
 
 		break;
 	}
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b09624a..55a9cb5 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -108,8 +108,7 @@ static unsigned long part_get_unmapped_area(struct mtd_info *mtd,
 	struct mtd_part *part = PART(mtd);
 
 	offset += part->offset;
-	return part->master->get_unmapped_area(part->master, len, offset,
-					       flags);
+	return mtd_get_unmapped_area(part->master, len, offset, flags);
 }
 
 static int part_read_oob(struct mtd_info *mtd, loff_t from,
diff --git a/fs/romfs/mmap-nommu.c b/fs/romfs/mmap-nommu.c
index eed9942..d5168e8 100644
--- a/fs/romfs/mmap-nommu.c
+++ b/fs/romfs/mmap-nommu.c
@@ -53,7 +53,7 @@ static unsigned long romfs_get_unmapped_area(struct file *file,
 		if (offset > mtd->size - len)
 			return (unsigned long) -EINVAL;
 
-		return mtd->get_unmapped_area(mtd, len, offset, flags);
+		return mtd_get_unmapped_area(mtd, len, offset, flags);
 	}
 
 cant_map_directly:
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index a7d22b7..f38e827 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -178,11 +178,6 @@ struct mtd_info {
 	int (*point) (struct mtd_info *mtd, loff_t from, size_t len,
 		      size_t *retlen, void **virt, resource_size_t *phys);
 	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
-
-	/* Allow NOMMU mmap() to directly map the device (if not NULL)
-	 * - return the address to which the offset maps
-	 * - return -ENOSYS to indicate refusal to do the mapping
-	 */
 	unsigned long (*get_unmapped_area) (struct mtd_info *mtd,
 					    unsigned long len,
 					    unsigned long offset,
@@ -293,6 +288,19 @@ static inline void mtd_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
 	return mtd->unpoint(mtd, from, len);
 }
 
+/*
+ * Allow NOMMU mmap() to directly map the device (if not NULL)
+ * - return the address to which the offset maps
+ * - return -ENOSYS to indicate refusal to do the mapping
+ */
+static inline unsigned long mtd_get_unmapped_area(struct mtd_info *mtd,
+						  unsigned long len,
+						  unsigned long offset,
+						  unsigned long flags)
+{
+	return mtd->get_unmapped_area(mtd, len, offset, flags);
+}
+
 static inline struct mtd_info *dev_to_mtd(struct device *dev)
 {
 	return dev ? dev_get_drvdata(dev) : NULL;
-- 
1.7.7.4
