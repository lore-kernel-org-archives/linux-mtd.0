Received: from mail-out.m-online.net ([212.18.0.10])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ONWUk-0000er-GS
	for linux-mtd@lists.infradead.org; Sat, 12 Jun 2010 19:35:55 +0000
From: Anatolij Gustschin <agust@denx.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtdchar: fix mmap() for MTD RAM/ROM char devices
Date: Sat, 12 Jun 2010 21:35:38 +0200
Message-Id: <1276371338-14253-1-git-send-email-agust@denx.de>
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

For no-mmu systems mmap() on RAM/ROM devices already works
but for systems with mmu it probably was not tested and
currently doesn't work.

This patch allows using mmap() on MTD RAM/ROM devices on systems
with MMU. It has been tested on mpc5121e based platform with
MR0A16A MRAM device attached over LocalBus.

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
Changes since patch v2:
 - improved commit message and patch description
 - rebased to apply cleanly on current mtd-2.6 tree

 drivers/mtd/mtdchar.c |   30 +++++++++++++++++++++++++++++-
 1 files changed, 29 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8b223c0..f3b848e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -18,6 +18,7 @@
 #include <linux/mount.h>
 
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
 #include <linux/mtd/compatmac.h>
 
 #include <asm/uaccess.h>
@@ -941,9 +942,36 @@ static int mtd_mmap(struct file *file, struct vm_area_struct *vma)
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
+
+#ifdef pgprot_noncached
+		if (file->f_flags & O_DSYNC || off >= __pa(high_memory))
+			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+#endif
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
1.7.0.4
