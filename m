Received: from smtp2.macqel.be ([109.135.2.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLvF9-0001YG-Si
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 13:55:21 +0000
From: Philippe De Muyter <phdm@macqel.be>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v3] mtd: mtdchar: allow mmap for ram devices in memory address
 space.
Date: Fri,  7 Mar 2014 14:54:39 +0100
Message-Id: <1394200479-17168-1-git-send-email-phdm@macqel.be>
In-Reply-To: <1394189058-12711-1-git-send-email-phdm@macqel.be>
References: <1394189058-12711-1-git-send-email-phdm@macqel.be>
Cc: David Howells <dhowells@redhat.com>, Markus Niebel <Markus.Niebel@tqs.de>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

use mtd_get_unmapped_area, as asked by an ancient comment, to get
the physical address (if any) in memory of the mtd device.

Therefore, mapram_unmapped_area had to be changed to return the physical
address, not the virtual one, For the NOMMU case, that makes no difference,
but for the MMU case, it is needed by mapram_unmapped_area to implement mmap.

Signed-off-by: Philippe De Muyter <phdm@macqel.be>
Cc: David Howells <dhowells@redhat.com>
Cc: Markus Niebel <Markus.Niebel@tqs.de>
Cc: Brian Norris <computersforpeace@gmail.com>
---
v3: avoid duplicating test done by mtd_get_unmapped_area

 drivers/mtd/chips/map_ram.c |    2 +-
 drivers/mtd/mtdchar.c       |   24 ++++++++++--------------
 2 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 991c2a1..e93d147 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -92,7 +92,7 @@ static unsigned long mapram_unmapped_area(struct mtd_info *mtd,
 					  unsigned long flags)
 {
 	struct map_info *map = mtd->priv;
-	return (unsigned long) map->virt + offset;
+	return (unsigned long) map->phys + offset;
 }
 
 static int mapram_read (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 2147e73..5956246 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1112,20 +1112,16 @@ static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
 #ifdef CONFIG_MMU
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
-	struct map_info *map = mtd->priv;
-
-        /* This is broken because it assumes the MTD device is map-based
-	   and that mtd->priv is a valid struct map_info.  It should be
-	   replaced with something that uses the mtd_get_unmapped_area()
-	   operation properly. */
-	if (0 /*mtd->type == MTD_RAM || mtd->type == MTD_ROM*/) {
-#ifdef pgprot_noncached
-		if (file->f_flags & O_DSYNC || map->phys >= __pa(high_memory))
-			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-#endif
-		return vm_iomap_memory(vma, map->phys, map->size);
-	}
-	return -ENODEV;
+	loff_t offset = vma->vm_pgoff << PAGE_SHIFT;
+	loff_t len = vma->vm_end - vma->vm_start;
+	phys_addr_t start;
+
+	start = mtd_get_unmapped_area(mtd, len, offset, vma->vm_flags);
+	if (start == -EOPNOTSUPP)
+		return -ENODEV;
+	if (start == -EINVAL)
+		return -EINVAL;
+	return vm_iomap_memory(vma, start, len);
 #else
 	return vma->vm_flags & VM_SHARED ? 0 : -EACCES;
 #endif
-- 
1.7.5.3
