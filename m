Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DqVZd-0007kd-9r
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2005 08:33:54 -0400
Received: from dsl-082-082-155-079.arcor-ip.net ([82.82.155.79]:3448
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1DqVdC-00043k-8L
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jul 2005 14:37:32 +0200
Received: from konsti by zappa with local (Exim 3.36 #1 (Debian))
	id 1DqVZX-0004E1-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jul 2005 14:33:43 +0200
Date: Thu, 7 Jul 2005 14:33:43 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050707123342.GB13211@zappa>
References: <20050706144545.GA11447@zappa> <42CC0A6E.9090704@mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42CC0A6E.9090704@mvista.com>
Subject: Re: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Todd Poynor <tpoynor@mvista.com> [Wed, Jul 06, 2005 at 09:44:30AM -0700]:

Actually I must be mad. This morning I got it working, now its broken
again and I don't know which file I broke. Damn!

Now the Kernel freezes when I try to write something (touch file), not
before! xip.h still looks reasonable.

Does somebody have tips on how to debug this? Will debug output in sync
over serial line help or sys-req or some sort of that?

> Do you have a diff of drivers/mtd/chips/cfi_cmdset_0001.c between the 
> two versions?  I'll guess a change was made that didn't wrap something 
> in the xip disable/check for pending interrupts stuff.

diff -Nur /usr/src/linux-2.6.11/drivers/mtd/chips/cfi_cmdset_0001.c cfi_cmdset_0001.c
--- /usr/src/linux-2.6.11/drivers/mtd/chips/cfi_cmdset_0001.c	2005-03-02 08:37:52.000000000 +0100
+++ cfi_cmdset_0001.c	2005-07-07 09:48:23.000000000 +0200
@@ -4,7 +4,7 @@
  *
  * (C) 2000 Red Hat. GPL'd
  *
- * $Id: cfi_cmdset_0001.c,v 1.164 2004/11/16 18:29:00 dwmw2 Exp $
+ * $Id: cfi_cmdset_0001.c,v 1.178 2005/05/19 17:05:43 nico Exp $
  *
  * 
  * 10/10/2000	Nicolas Pitre <nico@cam.org>
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/reboot.h>
 #include <linux/mtd/xip.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
@@ -48,16 +49,26 @@
 #define M50LPW080       0x002F
 
 static int cfi_intelext_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
-//static int cfi_intelext_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
-//static int cfi_intelext_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_write_words(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
 static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_intelext_sync (struct mtd_info *);
 static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, size_t len);
 static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, size_t len);
+#ifdef CONFIG_MTD_OTP
+static int cfi_intelext_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_intelext_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_intelext_write_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
+static int cfi_intelext_lock_user_prot_reg (struct mtd_info *, loff_t, size_t);
+static int cfi_intelext_get_fact_prot_info (struct mtd_info *,
+					    struct otp_info *, size_t);
+static int cfi_intelext_get_user_prot_info (struct mtd_info *,
+					    struct otp_info *, size_t);
+#endif
 static int cfi_intelext_suspend (struct mtd_info *);
 static void cfi_intelext_resume (struct mtd_info *);
+static int cfi_intelext_reboot (struct notifier_block *, unsigned long, void *);
+static void cfi_intelext_instantlock_add(struct mtd_info* mtd);
 
 static void cfi_intelext_destroy(struct mtd_info *);
 
@@ -252,7 +263,8 @@
 		int nb_parts, i;
 
 		/* Protection Register info */
-		extra_size += (extp->NumProtectionFields - 1) * (4 + 6);
+		extra_size += (extp->NumProtectionFields - 1) *
+			      sizeof(struct cfi_intelext_otpinfo);
 
 		/* Burst Read info */
 		extra_size += 6;
@@ -324,7 +336,9 @@
 	mtd->resume  = cfi_intelext_resume;
 	mtd->flags   = MTD_CAP_NORFLASH;
 	mtd->name    = map->name;
-	
+
+	mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
+
 	if (cfi->cfi_mode == CFI_MODE_CFI) {
 		/* 
 		 * It's a real CFI chip, not one for which the probe
@@ -377,6 +391,7 @@
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 	unsigned long offset = 0;
 	int i,j;
 	unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
@@ -422,17 +437,25 @@
 		       mtd->eraseregions[i].numblocks);
 	}
 
-#if 0
-	mtd->read_user_prot_reg = cfi_intelext_read_user_prot_reg;
+#ifdef CONFIG_MTD_OTP
 	mtd->read_fact_prot_reg = cfi_intelext_read_fact_prot_reg;
+	mtd->read_user_prot_reg = cfi_intelext_read_user_prot_reg;
+	mtd->write_user_prot_reg = cfi_intelext_write_user_prot_reg;
+	mtd->lock_user_prot_reg = cfi_intelext_lock_user_prot_reg;
+	mtd->get_fact_prot_info = cfi_intelext_get_fact_prot_info;
+	mtd->get_user_prot_info = cfi_intelext_get_user_prot_info;
 #endif
 
+	if (extp && (extp->FeatureSupport & (1 << 5)))
+		mtd->notify_add = cfi_intelext_instantlock_add;
+
 	/* This function has the potential to distort the reality
 	   a bit and therefore should be called last. */
 	if (cfi_intelext_partition_fixup(mtd, &cfi) != 0)
 		goto setup_err;
 
 	__module_get(THIS_MODULE);
+	register_reboot_notifier(&mtd->reboot_notifier);
 	return mtd;
 
  setup_err:
@@ -471,7 +494,8 @@
 		int offs, numregions, numparts, partshift, numvirtchips, i, j;
 
 		/* Protection Register info */
-		offs = (extp->NumProtectionFields - 1) * (4 + 6);
+		offs = (extp->NumProtectionFields - 1) *
+		       sizeof(struct cfi_intelext_otpinfo);
 
 		/* Burst Read info */
 		offs += 6;
@@ -563,7 +587,7 @@
  resettime:
 	timeo = jiffies + HZ;
  retry:
-	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING)) {
+	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING || mode == FL_OTP_WRITE)) {
 		/*
 		 * OK. We have possibility for contension on the write/erase
 		 * operations which are global to the real chip and not per
@@ -807,10 +831,6 @@
  * assembly to make sure inline functions were actually inlined and that gcc
  * didn't emit calls to its own support functions). Also configuring MTD CFI
  * support to a single buswidth and a single interleave is also recommended.
- * Note that not only IRQs are disabled but the preemption count is also
- * increased to prevent other locking primitives (namely spin_unlock) from
- * decrementing the preempt count to zero and scheduling the CPU away while
- * not in array mode.
  */
 
 static void xip_disable(struct map_info *map, struct flchip *chip,
@@ -818,7 +838,6 @@
 {
 	/* TODO: chips with no XIP use should ignore and return */
 	(void) map_read(map, adr); /* ensure mmu mapping is up to date */
-	preempt_disable();
 	local_irq_disable();
 }
 
@@ -833,7 +852,6 @@
 	(void) map_read(map, adr);
 	asm volatile (".rep 8; nop; .endr"); /* fill instruction prefetch */
 	local_irq_enable();
-	preempt_enable();
 }
 
 /*
@@ -909,7 +927,7 @@
 			(void) map_read(map, adr);
 			asm volatile (".rep 8; nop; .endr");
 			local_irq_enable();
-			preempt_enable();
+			spin_unlock(chip->mutex);
 			asm volatile (".rep 8; nop; .endr");
 			cond_resched();
 
@@ -919,15 +937,15 @@
 			 * a suspended erase state.  If so let's wait
 			 * until it's done.
 			 */
-			preempt_disable();
+			spin_lock(chip->mutex);
 			while (chip->state != newstate) {
 				DECLARE_WAITQUEUE(wait, current);
 				set_current_state(TASK_UNINTERRUPTIBLE);
 				add_wait_queue(&chip->wq, &wait);
-				preempt_enable();
+				spin_unlock(chip->mutex);
 				schedule();
 				remove_wait_queue(&chip->wq, &wait);
-				preempt_disable();
+				spin_lock(chip->mutex);
 			}
 			/* Disallow XIP again */
 			local_irq_disable();
@@ -956,12 +974,14 @@
  * The INVALIDATE_CACHED_RANGE() macro is normally used in parallel while
  * the flash is actively programming or erasing since we have to poll for
  * the operation to complete anyway.  We can't do that in a generic way with
- * a XIP setup so do it before the actual flash operation in this case.
+ * a XIP setup so do it before the actual flash operation in this case
+ * and stub it out from INVALIDATE_CACHE_UDELAY.
  */
-#undef INVALIDATE_CACHED_RANGE
-#define INVALIDATE_CACHED_RANGE(x...)
-#define XIP_INVAL_CACHED_RANGE(map, from, size) \
-	do { if(map->inval_cache) map->inval_cache(map, from, size); } while(0)
+#define XIP_INVAL_CACHED_RANGE(map, from, size)  \
+	INVALIDATE_CACHED_RANGE(map, from, size)
+
+#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \
+	UDELAY(map, chip, adr, usec)
 
 /*
  * Extra notes:
@@ -984,11 +1004,23 @@
 
 #define xip_disable(map, chip, adr)
 #define xip_enable(map, chip, adr)
-
-#define UDELAY(map, chip, adr, usec)  cfi_udelay(usec)
-
 #define XIP_INVAL_CACHED_RANGE(x...)
 
+#define UDELAY(map, chip, adr, usec)  \
+do {  \
+	spin_unlock(chip->mutex);  \
+	cfi_udelay(usec);  \
+	spin_lock(chip->mutex);  \
+} while (0)
+
+#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \
+do {  \
+	spin_unlock(chip->mutex);  \
+	INVALIDATE_CACHED_RANGE(map, adr, len);  \
+	cfi_udelay(usec);  \
+	spin_lock(chip->mutex);  \
+} while (0)
+
 #endif
 
 static int do_point_onechip (struct map_info *map, struct flchip *chip, loff_t adr, size_t len)
@@ -1176,111 +1208,11 @@
 	return ret;
 }
 
-#if 0
-static int __xipram cfi_intelext_read_prot_reg (struct mtd_info *mtd,
-						loff_t from, size_t len,
-						size_t *retlen,
-						u_char *buf,
-						int base_offst, int reg_sz)
-{
-	struct map_info *map = mtd->priv;
-	struct cfi_private *cfi = map->fldrv_priv;
-	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
-	struct flchip *chip;
-	int ofs_factor = cfi->interleave * cfi->device_type;
-	int count = len;
-	int chip_num, offst;
-	int ret;
-
-	chip_num = ((unsigned int)from/reg_sz);
-	offst = from - (reg_sz*chip_num)+base_offst;
-
-	while (count) {
-	/* Calculate which chip & protection register offset we need */
-
-		if (chip_num >= cfi->numchips)
-			goto out;
-
-		chip = &cfi->chips[chip_num];
-		
-		spin_lock(chip->mutex);
-		ret = get_chip(map, chip, chip->start, FL_JEDEC_QUERY);
-		if (ret) {
-			spin_unlock(chip->mutex);
-			return (len-count)?:ret;
-		}
-
-		xip_disable(map, chip, chip->start);
-
-		if (chip->state != FL_JEDEC_QUERY) {
-			map_write(map, CMD(0x90), chip->start);
-			chip->state = FL_JEDEC_QUERY;
-		}
-
-		while (count && ((offst-base_offst) < reg_sz)) {
-			*buf = map_read8(map,(chip->start+((extp->ProtRegAddr+1)*ofs_factor)+offst));
-			buf++;
-			offst++;
-			count--;
-		}
-
-		xip_enable(map, chip, chip->start);
-		put_chip(map, chip, chip->start);
-		spin_unlock(chip->mutex);
-
-		/* Move on to the next chip */
-		chip_num++;
-		offst = base_offst;
-	}
-	
- out:	
-	return len-count;
-}
-	
-static int cfi_intelext_read_user_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
-{
-	struct map_info *map = mtd->priv;
-	struct cfi_private *cfi = map->fldrv_priv;
-	struct cfi_pri_intelext *extp=cfi->cmdset_priv;
-	int base_offst,reg_sz;
-	
-	/* Check that we actually have some protection registers */
-	if(!extp || !(extp->FeatureSupport&64)){
-		printk(KERN_WARNING "%s: This flash device has no protection data to read!\n",map->name);
-		return 0;
-	}
-
-	base_offst=(1<<extp->FactProtRegSize);
-	reg_sz=(1<<extp->UserProtRegSize);
-
-	return cfi_intelext_read_prot_reg(mtd, from, len, retlen, buf, base_offst, reg_sz);
-}
-
-static int cfi_intelext_read_fact_prot_reg (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
-{
-	struct map_info *map = mtd->priv;
-	struct cfi_private *cfi = map->fldrv_priv;
-	struct cfi_pri_intelext *extp=cfi->cmdset_priv;
-	int base_offst,reg_sz;
-	
-	/* Check that we actually have some protection registers */
-	if(!extp || !(extp->FeatureSupport&64)){
-		printk(KERN_WARNING "%s: This flash device has no protection data to read!\n",map->name);
-		return 0;
-	}
-
-	base_offst=0;
-	reg_sz=(1<<extp->FactProtRegSize);
-
-	return cfi_intelext_read_prot_reg(mtd, from, len, retlen, buf, base_offst, reg_sz);
-}
-#endif
-
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-				     unsigned long adr, map_word datum)
+				     unsigned long adr, map_word datum, int mode)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	map_word status, status_OK;
+	map_word status, status_OK, write_cmd;
 	unsigned long timeo;
 	int z, ret=0;
 
@@ -1288,9 +1220,14 @@
 
 	/* Let's determine this according to the interleave only once */
 	status_OK = CMD(0x80);
+	switch (mode) {
+	case FL_WRITING:   write_cmd = CMD(0x40); break;
+	case FL_OTP_WRITE: write_cmd = CMD(0xc0); break;
+	default: return -EINVAL;
+	}
 
 	spin_lock(chip->mutex);
-	ret = get_chip(map, chip, adr, FL_WRITING);
+	ret = get_chip(map, chip, adr, mode);
 	if (ret) {
 		spin_unlock(chip->mutex);
 		return ret;
@@ -1299,19 +1236,18 @@
 	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
-	map_write(map, CMD(0x40), adr);
+	map_write(map, write_cmd, adr);
 	map_write(map, datum, adr);
-	chip->state = FL_WRITING;
+	chip->state = mode;
 
-	spin_unlock(chip->mutex);
-	INVALIDATE_CACHED_RANGE(map, adr, map_bankwidth(map));
-	UDELAY(map, chip, adr, chip->word_write_time);
-	spin_lock(chip->mutex);
+	INVALIDATE_CACHE_UDELAY(map, chip,
+				adr, map_bankwidth(map),
+				chip->word_write_time);
 
 	timeo = jiffies + (HZ/2);
 	z = 0;
 	for (;;) {
-		if (chip->state != FL_WRITING) {
+		if (chip->state != mode) {
 			/* Someone's suspended the write. Sleep */
 			DECLARE_WAITQUEUE(wait, current);
 
@@ -1339,10 +1275,8 @@
 		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
-		spin_unlock(chip->mutex);
 		z++;
 		UDELAY(map, chip, adr, 1);
-		spin_lock(chip->mutex);
 	}
 	if (!z) {
 		chip->word_write_time--;
@@ -1399,7 +1333,7 @@
 		datum = map_word_load_partial(map, datum, buf, gap, n);
 
 		ret = do_write_oneword(map, &cfi->chips[chipnum],
-					       bus_ofs, datum);
+					       bus_ofs, datum, FL_WRITING);
 		if (ret) 
 			return ret;
 
@@ -1420,7 +1354,7 @@
 		map_word datum = map_word_load(map, buf);
 
 		ret = do_write_oneword(map, &cfi->chips[chipnum],
-				ofs, datum);
+				       ofs, datum, FL_WRITING);
 		if (ret)
 			return ret;
 
@@ -1444,7 +1378,7 @@
 		datum = map_word_load_partial(map, datum, buf, 0, len);
 
 		ret = do_write_oneword(map, &cfi->chips[chipnum],
-					       ofs, datum);
+				       ofs, datum, FL_WRITING);
 		if (ret) 
 			return ret;
 		
@@ -1506,9 +1440,7 @@
 		if (map_word_andequal(map, status, status_OK, status_OK))
 			break;
 
-		spin_unlock(chip->mutex);
 		UDELAY(map, chip, cmd_adr, 1);
-		spin_lock(chip->mutex);
 
 		if (++z > 20) {
 			/* Argh. Not ready for write to buffer */
@@ -1554,10 +1486,9 @@
 	map_write(map, CMD(0xd0), cmd_adr);
 	chip->state = FL_WRITING;
 
-	spin_unlock(chip->mutex);
-	INVALIDATE_CACHED_RANGE(map, adr, len);
-	UDELAY(map, chip, cmd_adr, chip->buffer_write_time);
-	spin_lock(chip->mutex);
+	INVALIDATE_CACHE_UDELAY(map, chip, 
+				cmd_adr, len,
+				chip->buffer_write_time);
 
 	timeo = jiffies + (HZ/2);
 	z = 0;
@@ -1589,10 +1520,8 @@
 		}
 		
 		/* Latency issues. Drop the lock, wait a while and retry */
-		spin_unlock(chip->mutex);
-		UDELAY(map, chip, cmd_adr, 1);
 		z++;
-		spin_lock(chip->mutex);
+		UDELAY(map, chip, cmd_adr, 1);
 	}
 	if (!z) {
 		chip->buffer_write_time--;
@@ -1720,10 +1649,9 @@
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
 
-	spin_unlock(chip->mutex);
-	INVALIDATE_CACHED_RANGE(map, adr, len);
-	UDELAY(map, chip, adr, chip->erase_time*1000/2);
-	spin_lock(chip->mutex);
+	INVALIDATE_CACHE_UDELAY(map, chip,
+				adr, len,
+				chip->erase_time*1000/2);
 
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
@@ -1768,9 +1696,7 @@
 		}
 		
 		/* Latency issues. Drop the lock, wait a while and retry */
-		spin_unlock(chip->mutex);
 		UDELAY(map, chip, adr, 1000000/HZ);
-		spin_lock(chip->mutex);
 	}
 
 	/* We've broken this before. It doesn't hurt to be safe */
@@ -1780,44 +1706,34 @@
 
 	/* check for lock bit */
 	if (map_word_bitsset(map, status, CMD(0x3a))) {
-		unsigned char chipstatus;
+		unsigned long chipstatus;
 
 		/* Reset the error bits */
 		map_write(map, CMD(0x50), adr);
 		map_write(map, CMD(0x70), adr);
 		xip_enable(map, chip, adr);
 
-		chipstatus = status.x[0];
-		if (!map_word_equal(map, status, CMD(chipstatus))) {
-			int i, w;
-			for (w=0; w<map_words(map); w++) {
-				for (i = 0; i<cfi_interleave(cfi); i++) {
-					chipstatus |= status.x[w] >> (cfi->device_type * 8);
-				}
-			}
-			printk(KERN_WARNING "Status is not identical for all chips: 0x%lx. Merging to give 0x%02x\n",
-			       status.x[0], chipstatus);
-		}
+		chipstatus = MERGESTATUS(status);
 
 		if ((chipstatus & 0x30) == 0x30) {
-			printk(KERN_NOTICE "Chip reports improper command sequence: status 0x%x\n", chipstatus);
+			printk(KERN_NOTICE "Chip reports improper command sequence: status 0x%lx\n", chipstatus);
 			ret = -EIO;
 		} else if (chipstatus & 0x02) {
 			/* Protection bit set */
 			ret = -EROFS;
 		} else if (chipstatus & 0x8) {
 			/* Voltage */
-			printk(KERN_WARNING "Chip reports voltage low on erase: status 0x%x\n", chipstatus);
+			printk(KERN_WARNING "Chip reports voltage low on erase: status 0x%lx\n", chipstatus);
 			ret = -EIO;
 		} else if (chipstatus & 0x20) {
 			if (retries--) {
-				printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%x. Retrying...\n", adr, chipstatus);
+				printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%lx. Retrying...\n", adr, chipstatus);
 				timeo = jiffies + HZ;
 				put_chip(map, chip, adr);
 				spin_unlock(chip->mutex);
 				goto retry;
 			}
-			printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%x\n", adr, chipstatus);
+			printk(KERN_DEBUG "Chip erase failed at 0x%08lx: status 0x%lx\n", adr, chipstatus);
 			ret = -EIO;
 		}
 	} else {
@@ -1882,6 +1798,7 @@
 		
 		if (chip->state == FL_SYNCING) {
 			chip->state = chip->oldstate;
+			chip->oldstate = FL_READY;
 			wake_up(&chip->wq);
 		}
 		spin_unlock(chip->mutex);
@@ -1897,8 +1814,9 @@
 	struct cfi_private *cfi = map->fldrv_priv;
 	int status, ofs_factor = cfi->interleave * cfi->device_type;
 
+	adr += chip->start;
 	xip_disable(map, chip, adr+(2*ofs_factor));
-	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	map_write(map, CMD(0x90), adr+(2*ofs_factor));
 	chip->state = FL_JEDEC_QUERY;
 	status = cfi_read_query(map, adr+(2*ofs_factor));
 	xip_enable(map, chip, 0);
@@ -1915,6 +1833,7 @@
 				       unsigned long adr, int len, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 	map_word status, status_OK;
 	unsigned long timeo = jiffies + HZ;
 	int ret;
@@ -1944,9 +1863,13 @@
 	} else
 		BUG();
 
-	spin_unlock(chip->mutex);
-	UDELAY(map, chip, adr, 1000000/HZ);
-	spin_lock(chip->mutex);
+	/*
+	 * If Instant Individual Block Locking supported then no need
+	 * to delay.
+	 */
+
+	if (!extp || !(extp->FeatureSupport & (1 << 5)))
+		UDELAY(map, chip, adr, 1000000/HZ);
 
 	/* FIXME. Use a timer to check this, and return immediately. */
 	/* Once the state machine's known to be working I'll do that */
@@ -1973,9 +1896,7 @@
 		}
 		
 		/* Latency issues. Drop the lock, wait a while and retry */
-		spin_unlock(chip->mutex);
 		UDELAY(map, chip, adr, 1);
-		spin_lock(chip->mutex);
 	}
 	
 	/* Done and happy. */
@@ -2034,6 +1955,311 @@
 	return ret;
 }
 
+#ifdef CONFIG_MTD_OTP
+
+typedef int (*otp_op_t)(struct map_info *map, struct flchip *chip, 
+			u_long data_offset, u_char *buf, u_int size,
+			u_long prot_offset, u_int groupno, u_int groupsize);
+
+static int __xipram
+do_otp_read(struct map_info *map, struct flchip *chip, u_long offset,
+	    u_char *buf, u_int size, u_long prot, u_int grpno, u_int grpsz)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ret;
+
+	spin_lock(chip->mutex);
+	ret = get_chip(map, chip, chip->start, FL_JEDEC_QUERY);
+	if (ret) {
+		spin_unlock(chip->mutex);
+		return ret;
+	}
+
+	/* let's ensure we're not reading back cached data from array mode */
+	INVALIDATE_CACHED_RANGE(map, chip->start + offset, size);
+
+	xip_disable(map, chip, chip->start);
+	if (chip->state != FL_JEDEC_QUERY) {
+		map_write(map, CMD(0x90), chip->start);
+		chip->state = FL_JEDEC_QUERY;
+	}
+	map_copy_from(map, buf, chip->start + offset, size);
+	xip_enable(map, chip, chip->start);
+
+	/* then ensure we don't keep OTP data in the cache */
+	INVALIDATE_CACHED_RANGE(map, chip->start + offset, size);
+
+	put_chip(map, chip, chip->start);
+	spin_unlock(chip->mutex);
+	return 0;
+}
+
+static int
+do_otp_write(struct map_info *map, struct flchip *chip, u_long offset,
+	     u_char *buf, u_int size, u_long prot, u_int grpno, u_int grpsz)
+{
+	int ret;
+
+	while (size) {
+		unsigned long bus_ofs = offset & ~(map_bankwidth(map)-1);
+		int gap = offset - bus_ofs;
+		int n = min_t(int, size, map_bankwidth(map)-gap);
+		map_word datum = map_word_ff(map);
+
+		datum = map_word_load_partial(map, datum, buf, gap, n);
+		ret = do_write_oneword(map, chip, bus_ofs, datum, FL_OTP_WRITE);
+		if (ret) 
+			return ret;
+
+		offset += n;
+		buf += n;
+		size -= n;
+	}
+
+	return 0;
+}
+
+static int
+do_otp_lock(struct map_info *map, struct flchip *chip, u_long offset,
+	    u_char *buf, u_int size, u_long prot, u_int grpno, u_int grpsz)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	map_word datum;
+
+	/* make sure area matches group boundaries */
+	if (size != grpsz)
+		return -EXDEV;
+
+	datum = map_word_ff(map);
+	datum = map_word_clr(map, datum, CMD(1 << grpno));
+	return do_write_oneword(map, chip, prot, datum, FL_OTP_WRITE);
+}
+
+static int cfi_intelext_otp_walk(struct mtd_info *mtd, loff_t from, size_t len,
+				 size_t *retlen, u_char *buf,
+				 otp_op_t action, int user_regs)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
+	struct flchip *chip;
+	struct cfi_intelext_otpinfo *otp;
+	u_long devsize, reg_prot_offset, data_offset;
+	u_int chip_num, chip_step, field, reg_fact_size, reg_user_size;
+	u_int groups, groupno, groupsize, reg_fact_groups, reg_user_groups;
+	int ret;
+
+	*retlen = 0;
+
+	/* Check that we actually have some OTP registers */
+	if (!extp || !(extp->FeatureSupport & 64) || !extp->NumProtectionFields)
+		return -ENODATA;
+
+	/* we need real chips here not virtual ones */
+	devsize = (1 << cfi->cfiq->DevSize) * cfi->interleave;
+	chip_step = devsize >> cfi->chipshift;
+	chip_num = 0;
+
+	/* Some chips have OTP located in the _top_ partition only.
+	   For example: Intel 28F256L18T (T means top-parameter device) */
+	if (cfi->mfr == MANUFACTURER_INTEL) {
+		switch (cfi->id) {
+		case 0x880b:
+		case 0x880c:
+		case 0x880d:
+			chip_num = chip_step - 1;
+		}
+	}
+
+	for ( ; chip_num < cfi->numchips; chip_num += chip_step) {
+		chip = &cfi->chips[chip_num];
+		otp = (struct cfi_intelext_otpinfo *)&extp->extra[0];
+
+		/* first OTP region */
+		field = 0;
+		reg_prot_offset = extp->ProtRegAddr;
+		reg_fact_groups = 1;
+		reg_fact_size = 1 << extp->FactProtRegSize;
+		reg_user_groups = 1;
+		reg_user_size = 1 << extp->UserProtRegSize;
+
+		while (len > 0) {
+			/* flash geometry fixup */
+			data_offset = reg_prot_offset + 1;
+			data_offset *= cfi->interleave * cfi->device_type;
+			reg_prot_offset *= cfi->interleave * cfi->device_type;
+			reg_fact_size *= cfi->interleave;
+			reg_user_size *= cfi->interleave;
+
+			if (user_regs) {
+				groups = reg_user_groups;
+				groupsize = reg_user_size;
+				/* skip over factory reg area */
+				groupno = reg_fact_groups;
+				data_offset += reg_fact_groups * reg_fact_size;
+			} else {
+				groups = reg_fact_groups;
+				groupsize = reg_fact_size;
+				groupno = 0;
+			}
+
+			while (len > 0 && groups > 0) {
+				if (!action) {
+					/*
+					 * Special case: if action is NULL
+					 * we fill buf with otp_info records.
+					 */
+					struct otp_info *otpinfo;
+					map_word lockword;
+					len -= sizeof(struct otp_info);
+					if (len <= 0)
+						return -ENOSPC;
+					ret = do_otp_read(map, chip,
+							  reg_prot_offset,
+							  (u_char *)&lockword,
+							  map_bankwidth(map),
+							  0, 0,  0);
+					if (ret)
+						return ret;
+					otpinfo = (struct otp_info *)buf;
+					otpinfo->start = from;
+					otpinfo->length = groupsize;
+					otpinfo->locked =
+					   !map_word_bitsset(map, lockword,
+							     CMD(1 << groupno));
+					from += groupsize;
+					buf += sizeof(*otpinfo);
+					*retlen += sizeof(*otpinfo);
+				} else if (from >= groupsize) {
+					from -= groupsize;
+					data_offset += groupsize;
+				} else {
+					int size = groupsize;
+					data_offset += from;
+					size -= from;
+					from = 0;
+					if (size > len)
+						size = len;
+					ret = action(map, chip, data_offset,
+						     buf, size, reg_prot_offset,
+						     groupno, groupsize);
+					if (ret < 0)
+						return ret;
+					buf += size;
+					len -= size;
+					*retlen += size;
+					data_offset += size;
+				}
+				groupno++;
+				groups--;
+			}
+
+			/* next OTP region */
+			if (++field == extp->NumProtectionFields)
+				break;
+			reg_prot_offset = otp->ProtRegAddr;
+			reg_fact_groups = otp->FactGroups;
+			reg_fact_size = 1 << otp->FactProtRegSize;
+			reg_user_groups = otp->UserGroups;
+			reg_user_size = 1 << otp->UserProtRegSize;
+			otp++;
+		}
+	}
+
+	return 0;
+}
+
+static int cfi_intelext_read_fact_prot_reg(struct mtd_info *mtd, loff_t from,
+					   size_t len, size_t *retlen,
+					    u_char *buf)
+{
+	return cfi_intelext_otp_walk(mtd, from, len, retlen,
+				     buf, do_otp_read, 0);
+}
+
+static int cfi_intelext_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+					   size_t len, size_t *retlen,
+					    u_char *buf)
+{
+	return cfi_intelext_otp_walk(mtd, from, len, retlen,
+				     buf, do_otp_read, 1);
+}
+
+static int cfi_intelext_write_user_prot_reg(struct mtd_info *mtd, loff_t from,
+					    size_t len, size_t *retlen,
+					     u_char *buf)
+{
+	return cfi_intelext_otp_walk(mtd, from, len, retlen,
+				     buf, do_otp_write, 1);
+}
+
+static int cfi_intelext_lock_user_prot_reg(struct mtd_info *mtd,
+					   loff_t from, size_t len)
+{
+	size_t retlen;
+	return cfi_intelext_otp_walk(mtd, from, len, &retlen,
+				     NULL, do_otp_lock, 1);
+}
+
+static int cfi_intelext_get_fact_prot_info(struct mtd_info *mtd, 
+					   struct otp_info *buf, size_t len)
+{
+	size_t retlen;
+	int ret;
+
+	ret = cfi_intelext_otp_walk(mtd, 0, len, &retlen, (u_char *)buf, NULL, 0);
+	return ret ? : retlen;
+}
+
+static int cfi_intelext_get_user_prot_info(struct mtd_info *mtd,
+					   struct otp_info *buf, size_t len)
+{
+	size_t retlen;
+	int ret;
+
+	ret = cfi_intelext_otp_walk(mtd, 0, len, &retlen, (u_char *)buf, NULL, 1);
+	return ret ? : retlen;
+}
+
+#endif
+
+static void cfi_intelext_unlockall(struct mtd_info *mtd)
+{
+#if 0
+	int i;
+	for (i = 0; i <= mtd->numeraseregions; i++) {
+		printk("mtd->numeraseregions %x\n", mtd->numeraseregions);
+		int j;
+		printk("rumms\n");
+		printk("mtd->eraseregions[0].numblocks %x\n", 
+				mtd->eraseregions[i].numblocks);
+		printk("bumms\n");
+		for (j = 0; j < mtd->eraseregions[i].numblocks; j++){
+			printk("rumms\n");
+			printk("mtd->eraseregions[i].numblocks %x\n", 
+					mtd->eraseregions[i].numblocks);
+			printk("bumms\n");
+			printk("mtd->eraseregions[i].offset %x\n", 
+					mtd->eraseregions[i].offset);
+			printk("mtd->eraseregions[i].erasesize%x\n", 
+					mtd->eraseregions[i].erasesize);
+			mtd->unlock(mtd, mtd->eraseregions[i].offset +
+				    j * mtd->eraseregions[i].erasesize,
+				    mtd->eraseregions[i].erasesize);
+		}
+	} 
+#endif
+#if 1
+	cfi_intelext_unlock(mtd, 0, mtd->size);
+#endif
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
@@ -2107,6 +2333,7 @@
 	struct cfi_private *cfi = map->fldrv_priv;
 	int i;
 	struct flchip *chip;
+	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
 
 	for (i=0; i<cfi->numchips; i++) {
 	
@@ -2123,12 +2350,53 @@
 
 		spin_unlock(chip->mutex);
 	}
+
+
+	if (extp && (extp->FeatureSupport & (1 << 5)) &&
+	    (mtd->flags & MTD_WRITEABLE))
+		cfi_intelext_unlockall(mtd);	
+}
+
+static int cfi_intelext_reset(struct mtd_info *mtd)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	int i, ret;
+
+	for (i=0; i < cfi->numchips; i++) {
+		struct flchip *chip = &cfi->chips[i];
+
+		/* force the completion of any ongoing operation
+		   and switch to array mode so any bootloader in 
+		   flash is accessible for soft reboot. */
+		spin_lock(chip->mutex);
+		ret = get_chip(map, chip, chip->start, FL_SYNCING);
+		if (!ret) {
+			map_write(map, CMD(0xff), chip->start);
+			chip->state = FL_READY;
+		}
+		spin_unlock(chip->mutex);
+	}
+
+	return 0;
+}
+
+static int cfi_intelext_reboot(struct notifier_block *nb, unsigned long val,
+			       void *v)
+{
+	struct mtd_info *mtd;
+
+	mtd = container_of(nb, struct mtd_info, reboot_notifier);
+	cfi_intelext_reset(mtd);
+	return NOTIFY_DONE;
 }
 
 static void cfi_intelext_destroy(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
 	struct cfi_private *cfi = map->fldrv_priv;
+	cfi_intelext_reset(mtd);
+	unregister_reboot_notifier(&mtd->reboot_notifier);
 	kfree(cfi->cmdset_priv);
 	kfree(cfi->cfiq);
 	kfree(cfi->chips[0].priv);





o_O regards, Konsti
