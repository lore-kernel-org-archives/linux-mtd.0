Received: from dnvwsmailout1.mcafee.com ([161.69.31.173])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrjWi-00063Y-29
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2012 05:43:54 +0000
From: <gerg@snapgear.com>
To: <linux-mtd@lists.infradead.org>, <uclinux-dev@uclinux.org>
Subject: [PATCH v2 1/2] mtd: fix wrong usage of ioremap_nocache() in uclinux.c
 map driver
Date: Thu, 19 Jul 2012 15:42:45 +1000
Message-ID: <1342676566-25651-1-git-send-email-gerg@snapgear.com>
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

The uclinux.c mapping driver uses ioremap_nocache() to map its physical
mapping address to a system virtual address. Problem is that the region
it is mapping is not device memory. It is ordinary system RAM. On most
non-MMU systems this doesn't matter, and the mapping is always a 1:1
translation of the address. On paged memory systems on some architectures
the page table mappings are not compatible between normal RAM and device
memory.

If we want to use the uclinux.c mapping driver on real MMU enabled systems
we should be using the kernel virtual address that the mapping is at. For
architectures that support the traditional initrd they use phys_to_virt or
__va to convert the physical start initrd address to a kernel usable virtual
address. The uclinux filesystem mapping is even more restrictive than the
typical initrd, it always follows the kernels own bss section (so always in
directly mapped memory). Therefore we can use the usual phys_to_virt to
translate the physical start address to a virtual address.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
v2: added comments about use of phys_to_virt

 drivers/mtd/maps/uclinux.c |   15 +++++++++------
 1 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index cfff454..43400b6 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -68,10 +68,16 @@ static int __init uclinux_mtd_init(void)
 	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
 	       	(int) mapp->phys, (int) mapp->size);
 
-	mapp->virt = ioremap_nocache(mapp->phys, mapp->size);
+	/*
+	 * The filesystem is guaranteed to be in direct mapped memory. It is
+	 * directly following the kernels own bss region. Following the same
+	 * mechanism used by architectures setting up traditional initrds we
+	 * use phys_to_virt to get the virtual address of its start.
+	 */
+	mapp->virt = phys_to_virt(mapp->phys);
 
 	if (mapp->virt == 0) {
-		printk("uclinux[mtd]: ioremap_nocache() failed\n");
+		printk("uclinux[mtd]: no virtual mapping?\n");
 		return(-EIO);
 	}
 
@@ -80,7 +86,6 @@ static int __init uclinux_mtd_init(void)
 	mtd = do_map_probe("map_ram", mapp);
 	if (!mtd) {
 		printk("uclinux[mtd]: failed to find a mapping?\n");
-		iounmap(mapp->virt);
 		return(-ENXIO);
 	}
 
@@ -103,10 +108,8 @@ static void __exit uclinux_mtd_cleanup(void)
 		map_destroy(uclinux_ram_mtdinfo);
 		uclinux_ram_mtdinfo = NULL;
 	}
-	if (uclinux_ram_map.virt) {
-		iounmap((void *) uclinux_ram_map.virt);
+	if (uclinux_ram_map.virt)
 		uclinux_ram_map.virt = 0;
-	}
 }
 
 /****************************************************************************/
-- 
1.7.0.4
