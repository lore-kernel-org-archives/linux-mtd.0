Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P76JO-0001WV-Ca
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 12:56:35 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] cfi_cmdset_0002: code cleanups
Date: Sat, 16 Oct 2010 14:56:22 +0200
Message-Id: <1287233782-21319-1-git-send-email-w.sang@pengutronix.de>
Cc: Guillaume LECERF <glecerf@gmail.com>, yidong zhang <zhangyd6@gmail.com>,
	Wolfram Sang <w.sang@pengutronix.de>,
	David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- remove disabled code (hasn't been touched since the beginning of git
  and should be reimplemented if really needed)
- convert remaining c++-comments to plain c-style

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: yidong zhang <zhangyd6@gmail.com>
Cc: Guillaume LECERF <glecerf@gmail.com>
Cc: David Woodhouse <David.Woodhouse@intel.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   47 ++++++-----------------------------
 1 files changed, 8 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3e6c47b..1934476 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -317,14 +317,14 @@ static void fixup_s29gl032n_sectors(struct mtd_info *mtd, void *param)
 
 /* Used to fix CFI-Tables of chips without Extended Query Tables */
 static struct cfi_fixup cfi_nopri_fixup_table[] = {
-	{ CFI_MFR_SST, 0x234A, fixup_sst39vf, NULL, }, // SST39VF1602
-	{ CFI_MFR_SST, 0x234B, fixup_sst39vf, NULL, }, // SST39VF1601
-	{ CFI_MFR_SST, 0x235A, fixup_sst39vf, NULL, }, // SST39VF3202
-	{ CFI_MFR_SST, 0x235B, fixup_sst39vf, NULL, }, // SST39VF3201
-	{ CFI_MFR_SST, 0x235C, fixup_sst39vf_rev_b, NULL, }, // SST39VF3202B
-	{ CFI_MFR_SST, 0x235D, fixup_sst39vf_rev_b, NULL, }, // SST39VF3201B
-	{ CFI_MFR_SST, 0x236C, fixup_sst39vf_rev_b, NULL, }, // SST39VF6402B
-	{ CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, // SST39VF6401B
+	{ CFI_MFR_SST, 0x234A, fixup_sst39vf, NULL, }, /* SST39VF1602 */
+	{ CFI_MFR_SST, 0x234B, fixup_sst39vf, NULL, }, /* SST39VF1601 */
+	{ CFI_MFR_SST, 0x235A, fixup_sst39vf, NULL, }, /* SST39VF3202 */
+	{ CFI_MFR_SST, 0x235B, fixup_sst39vf, NULL, }, /* SST39VF3201 */
+	{ CFI_MFR_SST, 0x235C, fixup_sst39vf_rev_b, NULL, }, /* SST39VF3202B */
+	{ CFI_MFR_SST, 0x235D, fixup_sst39vf_rev_b, NULL, }, /* SST39VF3201B */
+	{ CFI_MFR_SST, 0x236C, fixup_sst39vf_rev_b, NULL, }, /* SST39VF6402B */
+	{ CFI_MFR_SST, 0x236D, fixup_sst39vf_rev_b, NULL, }, /* SST39VF6401B */
 	{ 0, 0, NULL, NULL }
 };
 
@@ -545,15 +545,6 @@ static struct mtd_info *cfi_amdstd_setup(struct mtd_info *mtd)
 		printk(KERN_WARNING "Sum of regions (%lx) != total size of set of interleaved chips (%lx)\n", offset, devsize);
 		goto setup_err;
 	}
-#if 0
-	// debug
-	for (i=0; i<mtd->numeraseregions;i++){
-		printk("%d: offset=0x%x,size=0x%x,blocks=%d\n",
-		       i,mtd->eraseregions[i].offset,
-		       mtd->eraseregions[i].erasesize,
-		       mtd->eraseregions[i].numblocks);
-	}
-#endif
 
 	__module_get(THIS_MODULE);
 	register_reboot_notifier(&mtd->reboot_notifier);
@@ -1025,9 +1016,6 @@ static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chi
 	mutex_lock(&chip->mutex);
 
 	if (chip->state != FL_READY){
-#if 0
-		printk(KERN_DEBUG "Waiting for chip to read, status = %d\n", chip->state);
-#endif
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		add_wait_queue(&chip->wq, &wait);
 
@@ -1035,10 +1023,6 @@ static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chi
 
 		schedule();
 		remove_wait_queue(&chip->wq, &wait);
-#if 0
-		if(signal_pending(current))
-			return -EINTR;
-#endif
 		timeo = jiffies + HZ;
 
 		goto retry;
@@ -1246,9 +1230,6 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 		mutex_lock(&cfi->chips[chipnum].mutex);
 
 		if (cfi->chips[chipnum].state != FL_READY) {
-#if 0
-			printk(KERN_DEBUG "Waiting for chip to write, status = %d\n", cfi->chips[chipnum].state);
-#endif
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&cfi->chips[chipnum].wq, &wait);
 
@@ -1256,10 +1237,6 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 
 			schedule();
 			remove_wait_queue(&cfi->chips[chipnum].wq, &wait);
-#if 0
-			if(signal_pending(current))
-				return -EINTR;
-#endif
 			goto retry;
 		}
 
@@ -1324,9 +1301,6 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 		mutex_lock(&cfi->chips[chipnum].mutex);
 
 		if (cfi->chips[chipnum].state != FL_READY) {
-#if 0
-			printk(KERN_DEBUG "Waiting for chip to write, status = %d\n", cfi->chips[chipnum].state);
-#endif
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&cfi->chips[chipnum].wq, &wait);
 
@@ -1334,10 +1308,6 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 
 			schedule();
 			remove_wait_queue(&cfi->chips[chipnum].wq, &wait);
-#if 0
-			if(signal_pending(current))
-				return -EINTR;
-#endif
 			goto retry1;
 		}
 
@@ -1396,7 +1366,6 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 
 	/* Write Buffer Load */
 	map_write(map, CMD(0x25), cmd_adr);
-- 
1.7.1
