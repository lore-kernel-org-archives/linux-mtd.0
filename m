Received: from sncsmrelay2.nai.com ([67.97.80.206])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSNPA-0007cJ-Ri
 for linux-mtd@lists.infradead.org; Thu, 10 May 2012 07:03:18 +0000
From: <gerg@snapgear.com>
To: <linux-mtd@lists.infradead.org>, <uclinux-dev@uclinux.org>
Subject: [PATCH 1/2] mtd: fix wrong usage of ioremap_nocache() in uclinux.c
 map driver
Date: Thu, 10 May 2012 16:55:28 +1000
Message-ID: <1336632929-26100-1-git-send-email-gerg@snapgear.com>
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
translation of the address.

But if we want to use the uclinux.c mapping driver on real MMU enabled
systems we should be using phys_to_virt() for the translation, since that
is really what we are doing. So change it to do that.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 drivers/mtd/maps/uclinux.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index cfff454..6d43c75 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -68,10 +68,10 @@ static int __init uclinux_mtd_init(void)
 	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
 	       	(int) mapp->phys, (int) mapp->size);
 
-	mapp->virt = ioremap_nocache(mapp->phys, mapp->size);
+	mapp->virt = phys_to_virt(mapp->phys);
 
 	if (mapp->virt == 0) {
-		printk("uclinux[mtd]: ioremap_nocache() failed\n");
+		printk("uclinux[mtd]: no virtual mapping?\n");
 		return(-EIO);
 	}
 
@@ -80,7 +80,6 @@ static int __init uclinux_mtd_init(void)
 	mtd = do_map_probe("map_ram", mapp);
 	if (!mtd) {
 		printk("uclinux[mtd]: failed to find a mapping?\n");
-		iounmap(mapp->virt);
 		return(-ENXIO);
 	}
 
@@ -103,10 +102,8 @@ static void __exit uclinux_mtd_cleanup(void)
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
