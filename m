Received: from smtp2.macqel.be ([109.135.2.61])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGtWI-000251-Be
 for linux-mtd@lists.infradead.org; Fri, 21 Feb 2014 17:04:15 +0000
From: phdm@macq.eu
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: allow mmap for ram devices in memory address space.
Date: Fri, 21 Feb 2014 18:03:09 +0100
Message-Id: <1393002189-6293-1-git-send-email-phdm@macq.eu>
Cc: David Howells <dhowells@redhat.com>, Markus Niebel <list-09@tqsc.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Philippe De Muyter <phdm@macqel.be>

use mtd->_get_unmapped_area, as asked by an ancient comment, to get
the physical address (if any) in memory of the mtd device.

Therefore, mapram_unmapped_area had to be changed to return the physical
address, not the virtual one, For the NOMMU case, that makes no difference,
but for the MMU case, it is needed by mapram_unmapped_area to implement mmap.

Signed-off-by: Philippe De Muyter <phdm@macqel.be>
Cc: David Howells <dhowells@redhat.com>
Cc: Markus Niebel <list-09@tqsc.de>
---
 drivers/mtd/chips/map_ram.c |    2 +-
 drivers/mtd/mtdchar.c       |   12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

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
index 2147e73..00eac7a 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1112,13 +1112,23 @@ static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
 #ifdef CONFIG_MMU
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
-	struct map_info *map = mtd->priv;
+	loff_t offset = vma->vm_pgoff << PAGE_SHIFT;
+	loff_t len = vma->vm_end - vma->vm_start;
 
+	if (offset > mtd->size - len)
+		return (unsigned long) -EINVAL;
+	if (mtd->_get_unmapped_area) {
+		phys_addr_t start;
+
+		start = mtd->_get_unmapped_area(mtd, len, offset, vma->vm_flags);
+		return vm_iomap_memory(vma, start, len);
+	}
         /* This is broken because it assumes the MTD device is map-based
 	   and that mtd->priv is a valid struct map_info.  It should be
 	   replaced with something that uses the mtd_get_unmapped_area()
 	   operation properly. */
 	if (0 /*mtd->type == MTD_RAM || mtd->type == MTD_ROM*/) {
+		struct map_info *map = mtd->priv;
 #ifdef pgprot_noncached
 		if (file->f_flags & O_DSYNC || map->phys >= __pa(high_memory))
 			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-- 
1.7.5.3
