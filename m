Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2ng4-0000vu-3x
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2010 15:41:57 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtdchar: allow mmap() on MTD RAM/ROM char devices
Date: Fri, 16 Apr 2010 17:41:47 +0200
Message-Id: <1271432507-4280-1-git-send-email-agust@denx.de>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Anatolij Gustschin <agust@denx.de>, David Woodhouse <dwmw2@infradead.org>,
	Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 drivers/mtd/mtdchar.c |   29 ++++++++++++++++++++++++++++-
 1 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index c355491..416f6eb 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -17,6 +17,7 @@
 #include <linux/compat.h>
 
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
 #include <linux/mtd/compatmac.h>
 
 #include <asm/uaccess.h>
@@ -925,9 +926,35 @@ static int mtd_mmap(struct file *file, struct vm_area_struct *vma)
 #ifdef CONFIG_MMU
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
+	struct map_info *map = mtd->priv;
+	unsigned long start;
+	unsigned long off;
+	u32 len;
+
+	if (mtd->type == MTD_RAM || mtd->type == MTD_ROM) {
+		if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
+			return -EINVAL;
+		off = vma->vm_pgoff << PAGE_SHIFT;
+		start = map->phys;
+		len = PAGE_ALIGN((start & ~PAGE_MASK) + map->size);
+		start &= PAGE_MASK;
+		if ((vma->vm_end - vma->vm_start + off) > len)
+			return -EINVAL;
+
+		off += start;
+		vma->vm_pgoff = off >> PAGE_SHIFT;
+		vma->vm_flags |= VM_IO | VM_RESERVED;
+		vma->vm_page_prot =
+			phys_mem_access_prot(file, off >> PAGE_SHIFT,
+					     vma->vm_end - vma->vm_start,
+					     vma->vm_page_prot);
+		if (io_remap_pfn_range(vma, vma->vm_start, off >> PAGE_SHIFT,
+				       vma->vm_end - vma->vm_start,
+				       vma->vm_page_prot))
+			return -EAGAIN;
 
-	if (mtd->type == MTD_RAM || mtd->type == MTD_ROM)
 		return 0;
+	}
 	return -ENOSYS;
 #else
 	return vma->vm_flags & VM_SHARED ? 0 : -ENOSYS;
-- 
1.6.3.3
