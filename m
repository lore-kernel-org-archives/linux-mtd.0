Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SU96L-0005ID-5L
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 04:11:11 +0000
From: <gerg@snapgear.com>
To: <linux-mtd@lists.infradead.org>, <uclinux-dev@uclinux.org>,
 <dedekind1@gmail.com>
Subject: [PATCH] mtd: clean up uclinux.c map driver
Date: Tue, 15 May 2012 14:08:48 +1000
Message-ID: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Greg Ungerer <gerg@uclinux.org>

Perform a number of cleanups on the uclinux.c map driver.
No structural or semantic changes, only minor cleanups.

. insert appropriate prefix into printk() calls
. remove redundant "if" checks in the module exit code
. remove unnecessary includes
. make the struct uclinux_ram_map static
. cast the virtual address calculations to keep them sparse clean

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 drivers/mtd/maps/uclinux.c |   34 +++++++++++++---------------------
 1 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index 6d43c75..d91b5b4 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -12,19 +12,16 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/fs.h>
 #include <linux/mm.h>
-#include <linux/major.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
-#include <asm/io.h>
 
 /****************************************************************************/
 
 extern char _ebss;
 
-struct map_info uclinux_ram_map = {
+static struct map_info uclinux_ram_map = {
 	.name = "RAM",
 	.phys = (unsigned long)&_ebss,
 	.size = 0,
@@ -46,11 +43,11 @@ static int uclinux_point(struct mtd_info *mtd, loff_t from, size_t len,
 	size_t *retlen, void **virt, resource_size_t *phys)
 {
 	struct map_info *map = mtd->priv;
-	*virt = map->virt + from;
+	*virt = (void *) (unsigned long) map->virt + from;
 	if (phys)
 		*phys = map->phys + from;
 	*retlen = len;
-	return(0);
+	return 0;
 }
 
 /****************************************************************************/
@@ -65,22 +62,22 @@ static int __init uclinux_mtd_init(void)
 		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
 	mapp->bankwidth = 4;
 
-	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
+	printk(KERN_NOTICE "uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
 	       	(int) mapp->phys, (int) mapp->size);
 
-	mapp->virt = phys_to_virt(mapp->phys);
+	mapp->virt = (void __iomem *) (unsigned long) phys_to_virt(mapp->phys);
 
-	if (mapp->virt == 0) {
-		printk("uclinux[mtd]: no virtual mapping?\n");
-		return(-EIO);
+	if (mapp->virt == NULL) {
+		printk(KERN_ERR "uclinux[mtd]: no virtual mapping?\n");
+		return -EIO;
 	}
 
 	simple_map_init(mapp);
 
 	mtd = do_map_probe("map_ram", mapp);
 	if (!mtd) {
-		printk("uclinux[mtd]: failed to find a mapping?\n");
-		return(-ENXIO);
+		printk(KERN_ERR "uclinux[mtd]: failed to find a mapping?\n");
+		return -ENXIO;
 	}
 
 	mtd->owner = THIS_MODULE;
@@ -90,20 +87,15 @@ static int __init uclinux_mtd_init(void)
 	uclinux_ram_mtdinfo = mtd;
 	mtd_device_register(mtd, uclinux_romfs, NUM_PARTITIONS);
 
-	return(0);
+	return 0;
 }
 
 /****************************************************************************/
 
 static void __exit uclinux_mtd_cleanup(void)
 {
-	if (uclinux_ram_mtdinfo) {
-		mtd_device_unregister(uclinux_ram_mtdinfo);
-		map_destroy(uclinux_ram_mtdinfo);
-		uclinux_ram_mtdinfo = NULL;
-	}
-	if (uclinux_ram_map.virt)
-		uclinux_ram_map.virt = 0;
+	mtd_device_unregister(uclinux_ram_mtdinfo);
+	map_destroy(uclinux_ram_mtdinfo);
 }
 
 /****************************************************************************/
-- 
1.7.0.4
