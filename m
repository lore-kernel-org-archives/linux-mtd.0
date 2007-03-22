Received: from 81-174-11-161.f5.ngi.it ([81.174.11.161] helo=mail.enneenne.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HUJgj-0007C4-Gv
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 05:34:32 -0400
Received: from zaigor.enneenne.com ([192.168.32.1])
	by mail.enneenne.com with esmtp (Exim 4.50) id 1HUJgS-000288-LG
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 10:34:15 +0100
Received: from giometti by zaigor.enneenne.com with local (Exim 4.63)
	(envelope-from <giometti@enneenne.com>) id 1HUJhM-0003aD-DE
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 10:35:08 +0100
Date: Thu, 22 Mar 2007 10:35:08 +0100
From: Rodolfo Giometti <giometti@enneenne.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20070322093508.GB4880@enneenne.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
Subject: [PATCH 1/1] MTD: support for auto locking flash on power up
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Auto unlock sectors on resume for auto locking flash on power up.

Signed-off-by: Rodolfo Giometti <giometti@enneenne.com>

--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch-flash-unlock-on-resume

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index f69184a..8a4395e 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -15,6 +15,8 @@
  *	- optimized write buffer method
  * 02/05/2002	Christopher Hoover <ch@hpl.hp.com>/<ch@murgatroid.com>
  *	- reworked lock/unlock/erase support for var size flash
+ * 21/03/2007   Rodolfo Giometti <giometti@linux.it>
+ * 	- auto unlock sectors on resume for auto locking flash on power up
  */
 
 #include <linux/module.h>
@@ -30,6 +32,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/reboot.h>
+#include <linux/bitmap.h>
 #include <linux/mtd/xip.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
@@ -220,6 +223,15 @@ static void fixup_use_write_buffers(struct mtd_info *mtd, void *param)
 	}
 }
 
+/*
+ * Some chips power-up with all sectors locked by default.
+ */
+static void fixup_use_powerup_lock(struct mtd_info *mtd, void *param)
+{
+	printk(KERN_INFO "Using auto-unlock on power-up/resume\n" );
+	mtd->flags |= MTD_STUPID_LOCK;
+}
+
 static struct cfi_fixup cfi_fixup_table[] = {
 #ifdef CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE
 	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_intel_strataflash, NULL },
@@ -232,6 +244,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
 #endif
 	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
 	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },
+	{ MANUFACTURER_INTEL, 0x891c,	      fixup_use_powerup_lock, NULL, },
 	{ 0, 0, NULL, NULL }
 };
 
@@ -446,6 +459,7 @@ static struct mtd_info *cfi_intelext_setup(struct mtd_info *mtd)
 			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].offset = (j*devsize)+offset;
 			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].erasesize = ersize;
 			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].numblocks = ernum;
+			mtd->eraseregions[(j*cfi->cfiq->NumEraseRegions)+i].lockmap = kmalloc(ernum / 8 + 1, GFP_KERNEL);
 		}
 		offset += (ersize * ernum);
 	}
@@ -1813,8 +1827,7 @@ static void cfi_intelext_sync (struct mtd_info *mtd)
 	}
 }
 
-#ifdef DEBUG_LOCK_BITS
-static int __xipram do_printlockstatus_oneblock(struct map_info *map,
+static int __xipram do_getlockstatus_oneblock(struct map_info *map,
 						struct flchip *chip,
 						unsigned long adr,
 						int len, void *thunk)
@@ -1828,8 +1841,17 @@ static int __xipram do_printlockstatus_oneblock(struct map_info *map,
 	chip->state = FL_JEDEC_QUERY;
 	status = cfi_read_query(map, adr+(2*ofs_factor));
 	xip_enable(map, chip, 0);
+	return status;
+}
+
+#ifdef DEBUG_LOCK_BITS
+static int __xipram do_printlockstatus_oneblock(struct map_info *map,
+						struct flchip *chip,
+						unsigned long adr,
+						int len, void *thunk)
+{
 	printk(KERN_DEBUG "block status register for 0x%08lx is %x\n",
-	       adr, status);
+	       adr, do_getlockstatus_oneblock(map, chip, adr, len, thunk));
 	return 0;
 }
 #endif
@@ -2204,14 +2226,45 @@ static int cfi_intelext_get_user_prot_info(struct mtd_info *mtd,
 
 #endif
 
+static void cfi_intelext_save_locks(struct mtd_info *mtd)
+{
+	struct mtd_erase_region_info *region;
+	int block, status, i;
+	unsigned long adr;
+	size_t len;
+
+	for (i = 0; i < mtd->numeraseregions; i++) {
+		region = &mtd->eraseregions[i];
+		if (!region->lockmap)
+			continue;
+
+		for (block = 0; block < region->numblocks; block++){
+			len = region->erasesize;
+			adr = region->offset + block * len;
+
+			status = cfi_varsize_frob(mtd,
+					do_getlockstatus_oneblock, adr, len, 0);
+			if (status)
+				set_bit(block, region->lockmap);
+			else
+				clear_bit(block, region->lockmap);
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
 
+	if ((mtd->flags & MTD_STUPID_LOCK)
+	    && extp && (extp->FeatureSupport & (1 << 5)))
+		cfi_intelext_save_locks(mtd);
+
 	for (i=0; !ret && i<cfi->numchips; i++) {
 		chip = &cfi->chips[i];
 
@@ -2273,10 +2326,33 @@ static int cfi_intelext_suspend(struct mtd_info *mtd)
 	return ret;
 }
 
+static void cfi_intelext_restore_locks(struct mtd_info *mtd)
+{
+	struct mtd_erase_region_info *region;
+	int block, i;
+	unsigned long adr;
+	size_t len;
+
+	for (i = 0; i < mtd->numeraseregions; i++) {
+		region = &mtd->eraseregions[i];
+		if (!region->lockmap)
+			continue;
+
+		for (block = 0; block < region->numblocks; block++) {
+			len = region->erasesize;
+			adr = region->offset + block * len;
+
+			if (!test_bit(block, region->lockmap))
+				cfi_intelext_unlock(mtd, adr, len);
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
 
@@ -2295,6 +2371,10 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
 
 		spin_unlock(chip->mutex);
 	}
+
+	if ((mtd->flags & MTD_STUPID_LOCK)
+	    && extp && (extp->FeatureSupport & (1 << 5)))
+		cfi_intelext_restore_locks(mtd);
 }
 
 static int cfi_intelext_reset(struct mtd_info *mtd)
@@ -2335,12 +2415,19 @@ static void cfi_intelext_destroy(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct mtd_erase_region_info *region;
+	int i;
 	cfi_intelext_reset(mtd);
 	unregister_reboot_notifier(&mtd->reboot_notifier);
 	kfree(cfi->cmdset_priv);
 	kfree(cfi->cfiq);
 	kfree(cfi->chips[0].priv);
 	kfree(cfi);
+	for (i = 0; i < mtd->numeraseregions; i++) {
+		region = &mtd->eraseregions[i];
+		if (region->lockmap)
+			kfree(region->lockmap);
+	}
 	kfree(mtd->eraseregions);
 }
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index d644e57..276b570 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -53,6 +53,7 @@ struct mtd_erase_region_info {
 	u_int32_t offset;			/* At which this region starts, from the beginning of the MTD */
 	u_int32_t erasesize;		/* For this region */
 	u_int32_t numblocks;		/* Number of blocks of erasesize in this region */
+	unsigned long *lockmap;		/* If keeping bitmap of locks */
 };
 
 /*

--nVMJ2NtxeReIH9PS--
