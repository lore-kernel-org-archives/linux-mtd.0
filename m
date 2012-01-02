Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgql-0003Qp-31
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:48 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 04/17] romfs: do not use mtd->get_unmapped_area directly
Date: Mon,  2 Jan 2012 14:20:34 +0200
Message-Id: <1325506847-23470-5-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
References: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
Cc: linux-fsdevel@vger.kernel.org
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
is not implemented, and then test for this code.

We also translate -EOPNOTSUPP to -ENOSYS because this return code is
probably part of the kernel ABI which we do not want to break.

Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/romfs/mmap-nommu.c |   28 +++++++++++++---------------
 1 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/romfs/mmap-nommu.c b/fs/romfs/mmap-nommu.c
index d5168e8..e1a7779 100644
--- a/fs/romfs/mmap-nommu.c
+++ b/fs/romfs/mmap-nommu.c
@@ -28,9 +28,10 @@ static unsigned long romfs_get_unmapped_area(struct file *file,
 	struct inode *inode = file->f_mapping->host;
 	struct mtd_info *mtd = inode->i_sb->s_mtd;
 	unsigned long isize, offset, maxpages, lpages;
+	int ret;
 
 	if (!mtd)
-		goto cant_map_directly;
+		return (unsigned long) -ENOSYS;
 
 	/* the mapping mustn't extend beyond the EOF */
 	lpages = (len + PAGE_SIZE - 1) >> PAGE_SHIFT;
@@ -41,23 +42,20 @@ static unsigned long romfs_get_unmapped_area(struct file *file,
 	if ((pgoff >= maxpages) || (maxpages - pgoff < lpages))
 		return (unsigned long) -EINVAL;
 
-	/* we need to call down to the MTD layer to do the actual mapping */
-	if (mtd->get_unmapped_area) {
-		if (addr != 0)
-			return (unsigned long) -EINVAL;
-
-		if (len > mtd->size || pgoff >= (mtd->size >> PAGE_SHIFT))
-			return (unsigned long) -EINVAL;
+	if (addr != 0)
+		return (unsigned long) -EINVAL;
 
-		offset += ROMFS_I(inode)->i_dataoffset;
-		if (offset > mtd->size - len)
-			return (unsigned long) -EINVAL;
+	if (len > mtd->size || pgoff >= (mtd->size >> PAGE_SHIFT))
+		return (unsigned long) -EINVAL;
 
-		return mtd_get_unmapped_area(mtd, len, offset, flags);
-	}
+	offset += ROMFS_I(inode)->i_dataoffset;
+	if (offset > mtd->size - len)
+		return (unsigned long) -EINVAL;
 
-cant_map_directly:
-	return (unsigned long) -ENOSYS;
+	ret = mtd_get_unmapped_area(mtd, len, offset, flags);
+	if (ret == -EOPNOTSUPP)
+		ret = -ENOSYS;
+	return (unsigned long) ret;
 }
 
 /*
-- 
1.7.7.3
