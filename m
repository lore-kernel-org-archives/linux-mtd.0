Received: from smtp.gentoo.org ([140.211.166.183])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OG5a7-0000wU-5e
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 07:26:43 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/2] mtd: physmap: add physmap_unmapped_area() for no-mmu XIP
Date: Sun, 23 May 2010 03:30:23 -0400
Message-Id: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
Cc: uclinux-dev@uclinux.org, Bernd Schmidt <bernds_cb1@t-online.de>,
	David Howells <dhowells@redhat.com>, Paul Mundt <lethal@linux-sh.org>,
	Greg Ungerer <gerg@uclinux.org>, uclinux-dist-devel@blackfin.uclinux.org,
	David McCullough <davidm@snapgear.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Bernd Schmidt <bernds_cb1@t-online.de>

Currently, romfs XIP doesn't work in flash memory (the kernel crashes
with a null pointer dereference).  The problem is that the mtd physmap
driver isn't setting up a get_unmapped_area pointer for the mtd
partitions it creates.

Signed-off-by: Bernd Schmidt <bernds_cb1@t-online.de>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/maps/physmap.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 09d89ff..370da18 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -72,6 +72,20 @@ static int physmap_flash_remove(struct platform_device *dev)
 	return 0;
 }
 
+/*
+ * Allow NOMMU mmap() to directly map the device (if not NULL)
+ * - return the address to which the offset maps
+ * - return -ENOSYS to indicate refusal to do the mapping
+ */
+static unsigned long physmap_unmapped_area(struct mtd_info *mtd,
+					   unsigned long len,
+					   unsigned long offset,
+					   unsigned long flags)
+{
+	struct map_info *map = mtd->priv;
+	return (unsigned long) map->virt + offset;
+}
+
 static const char *rom_probe_types[] = {
 					"cfi_probe",
 					"jedec_probe",
@@ -149,6 +163,8 @@ static int physmap_flash_probe(struct platform_device *dev)
 		} else {
 			devices_found++;
 		}
+		if (info->mtd[i]->get_unmapped_area == NULL)
+			info->mtd[i]->get_unmapped_area = physmap_unmapped_area;
 		info->mtd[i]->owner = THIS_MODULE;
 		info->mtd[i]->dev.parent = &dev->dev;
 	}
-- 
1.7.1
