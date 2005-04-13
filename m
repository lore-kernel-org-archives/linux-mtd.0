Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DLWHj-0002fL-93
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2005 21:03:16 -0400
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id SAA13973
	for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2005 18:03:15 -0700
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8) with ESMTP id
	j3D13FLV031917
	for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2005 18:03:15 -0700
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.12.8/8.12.8/Submit) id j3D13F9J031915
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2005 18:03:15 -0700
Date: Tue, 12 Apr 2005 18:03:15 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050413010315.GA31632@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Fixup Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Another try at how to handle the longstanding problem of chips that lock
all blocks at power up.  This version handles it in a way that I think
is in accordance with previous suggestions: it checks for whether the
chip has this property (for Intel flash the data sheet for at least one
model implies that those with the Instant Individual Block Locking
feature bit set will also have the property of locking all blocks at
power up); and it rectifies the locks with the map write access flags at
probe time and at resume time.  It adds a chip driver callback when
partitions/devices are added, so that the driver can fix things up
according to the map info.

Any comments on whether this is or is not the way to go appreciated.


diff -ruN mtd/drivers/mtd/chips/cfi_cmdset_0001.c mtd-work/drivers/mtd/chips/cfi_cmdset_0001.c
--- mtd/drivers/mtd/chips/cfi_cmdset_0001.c	2005-04-12 17:53:29.000000000 -0700
+++ mtd-work/drivers/mtd/chips/cfi_cmdset_0001.c	2005-04-12 17:55:45.000000000 -0700
@@ -68,6 +68,7 @@
 static int cfi_intelext_suspend (struct mtd_info *);
 static void cfi_intelext_resume (struct mtd_info *);
 static int cfi_intelext_reboot (struct notifier_block *, unsigned long, void *);
+static void cfi_intelext_instantlock_add(struct mtd_info* mtd);
 
 static void cfi_intelext_destroy(struct mtd_info *);
 
@@ -390,6 +391,7 @@
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 	unsigned long offset = 0;
 	int i,j;
 	unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
@@ -444,6 +446,9 @@
 	mtd->get_user_prot_info = cfi_intelext_get_user_prot_info;
 #endif
 
+	if (extp && (extp->FeatureSupport & (1 << 5)))
+		mtd->notify_add = cfi_intelext_instantlock_add;
+
 	/* This function has the potential to distort the reality
 	   a bit and therefore should be called last. */
 	if (cfi_intelext_partition_fixup(mtd, &cfi) != 0)
@@ -2227,6 +2232,28 @@
 
 #endif
 
+static void cfi_intelext_unlockall(struct mtd_info *mtd)
+{
+	int i;
+
+	for (i = 0; i < mtd->numeraseregions; i++) {
+		int j;
+
+		for (j = 0; j < mtd->eraseregions[i].numblocks; j++){
+			mtd->unlock(mtd, mtd->eraseregions[i].offset +
+				    j * mtd->eraseregions[i].erasesize,
+				    mtd->eraseregions[i].erasesize);
+		}
+	}
+	
+}
+
+static void cfi_intelext_instantlock_add(struct mtd_info *mtd)
+{
+	if (mtd->flags & MTD_WRITEABLE)
+		cfi_intelext_unlockall(mtd);
+}
+
 static int cfi_intelext_suspend(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
@@ -2300,6 +2327,7 @@
 	struct cfi_private *cfi = map->fldrv_priv;
 	int i;
 	struct flchip *chip;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 
 	for (i=0; i<cfi->numchips; i++) {
 	
@@ -2316,6 +2344,11 @@
 
 		spin_unlock(chip->mutex);
 	}
+
+
+	if (extp && (extp->FeatureSupport & (1 << 5)) &&
+	    (mtd->flags & MTD_WRITEABLE))
+		cfi_intelext_unlockall(mtd);	
 }
 
 static int cfi_intelext_reset(struct mtd_info *mtd)
diff -ruN mtd/drivers/mtd/mtdcore.c mtd-work/drivers/mtd/mtdcore.c
--- mtd/drivers/mtd/mtdcore.c	2005-03-28 17:36:04.000000000 -0800
+++ mtd-work/drivers/mtd/mtdcore.c	2005-04-12 17:55:45.000000000 -0700
@@ -60,6 +60,10 @@
 			mtd->usecount = 0;
 
 			DEBUG(0, "mtd: Giving out device %d to %s\n",i, mtd->name);
+
+			if (mtd->notify_add)				
+				mtd->notify_add(mtd);
+
 			/* No need to get a refcount on the module containing
 			   the notifier, since we hold the mtd_table_mutex */
 			list_for_each(this, &mtd_notifiers) {
diff -ruN mtd/drivers/mtd/mtdpart.c mtd-work/drivers/mtd/mtdpart.c
--- mtd/drivers/mtd/mtdpart.c	2005-03-28 17:36:04.000000000 -0800
+++ mtd-work/drivers/mtd/mtdpart.c	2005-04-12 17:55:45.000000000 -0700
@@ -435,6 +435,7 @@
 			slave->mtd.get_user_prot_info = part_get_user_prot_info;
 		if(master->get_fact_prot_info)
 			slave->mtd.get_fact_prot_info = part_get_fact_prot_info;
+		slave->mtd.notify_add = master->notify_add;
 		if (master->sync)
 			slave->mtd.sync = part_sync;
 		if (!i && master->suspend && master->resume) {
diff -ruN mtd/include/linux/mtd/mtd.h mtd-work/include/linux/mtd/mtd.h
--- mtd/include/linux/mtd/mtd.h	2005-04-12 17:53:37.000000000 -0700
+++ mtd-work/include/linux/mtd/mtd.h	2005-04-12 17:55:45.000000000 -0700
@@ -148,6 +148,10 @@
 	int (*block_isbad) (struct mtd_info *mtd, loff_t ofs);
 	int (*block_markbad) (struct mtd_info *mtd, loff_t ofs);
 
+	/* Device/partition add notifier */
+
+	void (*notify_add) (struct mtd_info *mtd);
+
 	struct notifier_block reboot_notifier;  /* default mode before reboot */
 
 	void *priv;
