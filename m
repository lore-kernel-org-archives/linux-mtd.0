Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DP7Tw-00088B-2J
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2005 19:22:45 -0400
Date: Fri, 22 Apr 2005 16:22:41 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: Nicolas Pitre <nico@cam.org>
Message-ID: <20050422232241.GA10813@slurryseal.ddns.mvista.com>
References: <20050413010315.GA31632@slurryseal.ddns.mvista.com>
	<Pine.LNX.4.62.0504122118560.14514@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.62.0504122118560.14514@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fixup Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 12, 2005 at 09:45:36PM -0400, Nicolas Pitre wrote:

> As for the suspend case then you should probably just preserve the flash 
> lock state before suspending and restore that state upon resume.

Here's a patch which does just that.  The lock bitmap is in the generic
eraseregion data structure to facilitate compact bitmap size based on
erase region size, but could be moved to per mtd cfi private.  Comments
appreciated, thanks. -- Todd

Index: linux-mtd/drivers/mtd/chips/cfi_cmdset_0001.c
===================================================================
--- linux-mtd.orig/drivers/mtd/chips/cfi_cmdset_0001.c	2005-04-21 23:26:08.000000000 +0000
+++ linux-mtd/drivers/mtd/chips/cfi_cmdset_0001.c	2005-04-22 22:48:45.000000000 +0000
@@ -30,6 +30,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/reboot.h>
+#include <linux/bitmap.h>
 #include <linux/mtd/xip.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
@@ -431,6 +432,7 @@
 		       i,mtd->eraseregions[i].offset,
 		       mtd->eraseregions[i].erasesize,
 		       mtd->eraseregions[i].numblocks);
+		mtd->eraseregions[i].lockmap = NULL;
 	}
 
 #ifdef CONFIG_MTD_OTP
@@ -2235,10 +2237,50 @@
 
 #endif
 
+static void cfi_intelext_save_locks(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ofs_factor = cfi->interleave * cfi->device_type;
+	int i;
+
+	for (i = 0; i < mtd->numeraseregions; i++) {
+		struct mtd_erase_region_info *region = &mtd->eraseregions[i];
+		int mapsize = region->numblocks / 8 + 1;
+
+		if (region->lockmap ||
+		    (region->lockmap = kmalloc(mapsize, GFP_KERNEL))) {
+			int block;
+
+			memset(region->lockmap, 0, mapsize);
+
+			for (block = 0; block < region->numblocks; block++){
+				struct flchip *chip;
+				int status, chipnum;
+				unsigned long adr = region->offset +
+					block * region->erasesize;
+
+				chipnum = adr >> cfi->chipshift;
+				chip = &cfi->chips[chipnum];
+				xip_disable(map, chip, adr+(2*ofs_factor));
+				map_write(map, CMD(0x90), adr+(2*ofs_factor));
+				chip->state = FL_JEDEC_QUERY;
+				status = cfi_read_query(map, 
+							adr+(2*ofs_factor));
+				xip_enable(map, chip, 0);
+
+				if (status & 0x1)
+					set_bit(block, region->lockmap);
+			}
+		}
+	}
+}
+
 static int cfi_intelext_suspend(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 	int i;
 	struct flchip *chip;
 	int ret = 0;
@@ -2279,6 +2321,9 @@
 		spin_unlock(chip->mutex);
 	}
 
+	if (! ret && extp && (extp->FeatureSupport & (1 << 5)))
+		cfi_intelext_save_locks(mtd);
+
 	/* Unlock the chips again */
 
 	if (ret) {
@@ -2302,10 +2347,47 @@
 	return ret;
 }
 
+static void cfi_intelext_restore_locks(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ofs_factor = cfi->interleave * cfi->device_type;
+	int i;
+
+	for (i = 0; i < mtd->numeraseregions; i++) {
+		struct mtd_erase_region_info *region = &mtd->eraseregions[i];
+		int block;
+
+		if (! region->lockmap)
+			continue;
+
+		for (block = 0; block < region->numblocks; block++){
+			struct flchip *chip;
+			int status, chipnum;
+			unsigned long adr = region->offset +
+				block * region->erasesize;
+
+			chipnum = adr >> cfi->chipshift;
+			chip = &cfi->chips[chipnum];
+
+			if (! test_bit(block, region->lockmap)) {
+				xip_disable(map, chip, adr+(2*ofs_factor));
+				do_xxlock_oneblock(map, chip,
+						   adr - chip->start,
+						   region->erasesize,
+						   DO_XXLOCK_ONEBLOCK_UNLOCK);
+				xip_enable(map, chip, 0);
+			}
+			
+		}
+	}
+}
+
 static void cfi_intelext_resume(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 	int i;
 	struct flchip *chip;
 
@@ -2324,6 +2406,9 @@
 
 		spin_unlock(chip->mutex);
 	}
+
+	if (extp && (extp->FeatureSupport & (1 << 5)))
+		cfi_intelext_restore_locks(mtd);
 }
 
 static int cfi_intelext_reset(struct mtd_info *mtd)
Index: linux-mtd/include/linux/mtd/mtd.h
===================================================================
--- linux-mtd.orig/include/linux/mtd/mtd.h	2005-04-21 23:26:08.000000000 +0000
+++ linux-mtd/include/linux/mtd/mtd.h	2005-04-21 23:34:52.000000000 +0000
@@ -55,6 +55,7 @@
 	u_int32_t offset;			/* At which this region starts, from the beginning of the MTD */
 	u_int32_t erasesize;		/* For this region */
 	u_int32_t numblocks;		/* Number of blocks of erasesize in this region */
+	unsigned long *lockmap;		/* If keeping bitmap of locks */
 };
 
 struct mtd_info {
