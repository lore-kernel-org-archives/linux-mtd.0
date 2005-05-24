Received: from rt-soft-2.moscow.itn.ru ([80.240.96.70] helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DaUGg-0008W9-Uk
	for linux-mtd@lists.infradead.org; Tue, 24 May 2005 03:56:08 -0400
Date: Tue, 24 May 2005 11:56:01 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20050524115601.4c1f12f7.vwool@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: MTD/XIP support for AMD flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
below is the patch against the latest CVS version for the MTD/XIP support on AMD flash.
Known to work on 2 ARM targets.

Comments/additions are welcome.

Vital

Index: drivers/mtd/chips/Kconfig
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/Kconfig,v
retrieving revision 1.14
diff -u -r1.14 Kconfig
--- drivers/mtd/chips/Kconfig	8 Feb 2005 17:11:15 -0000	1.14
+++ drivers/mtd/chips/Kconfig	24 May 2005 07:52:15 -0000
@@ -300,7 +300,7 @@
 
 config MTD_XIP
 	bool "XIP aware MTD support"
-	depends on !SMP && MTD_CFI_INTELEXT && EXPERIMENTAL
+	depends on !SMP && (MTD_CFI_INTELEXT || MTD_CFI_AMDSTD) && EXPERIMENTAL
 	default y if XIP_KERNEL
 	help
 	  This allows MTD support to work with flash memory which is also
Index: drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.115
diff -u -r1.115 cfi_cmdset_0002.c
--- drivers/mtd/chips/cfi_cmdset_0002.c	20 May 2005 03:28:23 -0000	1.115
+++ drivers/mtd/chips/cfi_cmdset_0002.c	24 May 2005 07:52:17 -0000
@@ -4,11 +4,15 @@
  *
  * Copyright (C) 2000 Crossnet Co. <info@crossnet.co.jp>
  * Copyright (C) 2004 Arcom Control Systems Ltd <linux@arcom.com>
+ * Copyright (C) 2005 MontaVista Software Inc. <source@mvista.com>
  *
  * 2_by_8 routines added by Simon Munton
  *
  * 4_by_16 work by Carolyn J. Smith
  *
+ * XIP support hooks by Vitaly Wool (based on code for Intel flash 
+ * by Nicolas Pitre)
+ * 
  * Occasionally maintained by Thayne Harbaugh tharbaugh at lnxi dot com
  *
  * This code is GPL
@@ -34,6 +38,7 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/cfi.h>
+#include <linux/mtd/xip.h>
 
 #define AMD_BOOTLOC_BUG
 #define FORCE_WORD_WRITE 0
@@ -393,7 +398,7 @@
  * correctly and is therefore not done	(particulary with interleaved chips
  * as each chip must be checked independantly of the others).
  */
-static int chip_ready(struct map_info *map, unsigned long addr)
+static int __xipram chip_ready(struct map_info *map, unsigned long addr)
 {
 	map_word d, t;
 
@@ -418,7 +423,7 @@
  * as each chip must be checked independantly of the others).
  *
  */
-static int chip_good(struct map_info *map, unsigned long addr, map_word expected)
+static int __xipram chip_good(struct map_info *map, unsigned long addr, map_word expected)
 {
 	map_word oldd, curd;
 
@@ -448,12 +453,12 @@
 
 			if (time_after(jiffies, timeo)) {
 				printk(KERN_ERR "Waiting for chip to be ready timed out.\n");
-				cfi_spin_unlock(chip->mutex);
+				spin_unlock(chip->mutex);
 				return -EIO;
 			}
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 			cfi_udelay(1);
-			cfi_spin_lock(chip->mutex);
+			spin_lock(chip->mutex);
 			/* Someone else might have been playing with it. */
 			goto retry;
 		}
@@ -501,15 +506,23 @@
 				return -EIO;
 			}
 			
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 			cfi_udelay(1);
-			cfi_spin_lock(chip->mutex);
+			spin_lock(chip->mutex);
 			/* Nobody will touch it while it's in state FL_ERASE_SUSPENDING.
 			   So we can just loop here. */
 		}
 		chip->state = FL_READY;
 		return 0;
 
+	case FL_XIP_WHILE_ERASING:
+		if (mode != FL_READY && mode != FL_POINT &&
+		    (!cfip || !(cfip->EraseSuspend&2)))
+			goto sleep;
+		chip->oldstate = chip->state;
+		chip->state = FL_READY;
+		return 0;
+
 	case FL_POINT:
 		/* Only if there's no operation suspended... */
 		if (mode == FL_READY && chip->oldstate == FL_READY)
@@ -519,10 +532,10 @@
 	sleep:
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		add_wait_queue(&chip->wq, &wait);
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 		schedule();
 		remove_wait_queue(&chip->wq, &wait);
-		cfi_spin_lock(chip->mutex);
+		spin_lock(chip->mutex);
 		goto resettime;
 	}
 }
@@ -540,6 +553,11 @@
 		chip->state = FL_ERASING;
 		break;
 
+	case FL_XIP_WHILE_ERASING:
+		chip->state = chip->oldstate;
+		chip->oldstate = FL_READY;
+		break;
+
 	case FL_READY:
 	case FL_STATUS:
 		/* We should really make set_vpp() count, rather than doing this */
@@ -551,6 +569,198 @@
 	wake_up(&chip->wq);
 }
 
+#ifdef CONFIG_MTD_XIP
+
+/*
+ * No interrupt what so ever can be serviced while the flash isn't in array
+ * mode.  This is ensured by the xip_disable() and xip_enable() functions
+ * enclosing any code path where the flash is known not to be in array mode.
+ * And within a XIP disabled code path, only functions marked with __xipram
+ * may be called and nothing else (it's a good thing to inspect generated
+ * assembly to make sure inline functions were actually inlined and that gcc
+ * didn't emit calls to its own support functions). Also configuring MTD CFI
+ * support to a single buswidth and a single interleave is also recommended.
+ */
+#include <asm/hardware.h>
+static void xip_disable(struct map_info *map, struct flchip *chip,
+			unsigned long adr)
+{
+	/* TODO: chips with no XIP use should ignore and return */
+	(void) map_read(map, adr); /* ensure mmu mapping is up to date */
+	local_irq_disable();
+}
+
+static void __xipram xip_enable(struct map_info *map, struct flchip *chip,
+				unsigned long adr)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+
+	if (chip->state != FL_POINT && chip->state != FL_READY) {
+		map_write(map, CMD(0xf0), adr);
+		chip->state = FL_READY;
+	}
+	(void) map_read(map, adr);
+	asm volatile (".rep 8; nop; .endr"); /* fill instruction prefetch */
+	local_irq_enable();
+}
+
+/*
+ * When a delay is required for the flash operation to complete, the
+ * xip_udelay() function is polling for both the given timeout and pending
+ * (but still masked) hardware interrupts.  Whenever there is an interrupt
+ * pending then the flash erase operation is suspended, array mode restored 
+ * and interrupts unmasked.  Task scheduling might also happen at that
+ * point.  The CPU eventually returns from the interrupt or the call to
+ * schedule() and the suspended flash operation is resumed for the remaining
+ * of the delay period.
+ *
+ * Warning: this function _will_ fool interrupt latency tracing tools.
+ */
+
+static void __xipram xip_udelay(struct map_info *map, struct flchip *chip,
+				unsigned long adr, int usec)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
+	map_word status, OK = CMD(0x80);
+	unsigned long suspended, start = xip_currtime();
+	flstate_t oldstate;
+
+	do {
+		cpu_relax();
+		if (xip_irqpending() && extp &&
+		    ((chip->state == FL_ERASING && (extp->EraseSuspend & 2))) &&
+		    (cfi_interleave_is_1(cfi) || chip->oldstate == FL_READY)) {
+			/*
+			 * Let's suspend the erase operation when supported.  
+			 * Note that we currently don't try to suspend 
+			 * interleaved chips if there is already another 
+			 * operation suspended (imagine what happens
+			 * when one chip was already done with the current
+			 * operation while another chip suspended it, then
+			 * we resume the whole thing at once).  Yes, it
+			 * can happen!
+			 */
+			map_write(map, CMD(0xb0), adr);
+			usec -= xip_elapsed_since(start);
+			suspended = xip_currtime();
+			do {
+				if (xip_elapsed_since(suspended) > 100000) {
+					/*
+					 * The chip doesn't want to suspend
+					 * after waiting for 100 msecs.
+					 * This is a critical error but there
+					 * is not much we can do here.
+					 */
+					return;
+				}
+				status = map_read(map, adr);
+			} while (!map_word_andequal(map, status, OK, OK));
+
+			/* Suspend succeeded */
+			oldstate = chip->state;
+			if (!map_word_bitsset(map, status, CMD(0x40)))
+				break;
+			chip->state = FL_XIP_WHILE_ERASING;
+			chip->erase_suspended = 1;
+			map_write(map, CMD(0xf0), adr);
+			(void) map_read(map, adr);
+			asm volatile (".rep 8; nop; .endr");
+			local_irq_enable();
+			spin_unlock(chip->mutex);
+			asm volatile (".rep 8; nop; .endr");
+			cond_resched();
+
+			/*
+			 * We're back.  However someone else might have
+			 * decided to go write to the chip if we are in
+			 * a suspended erase state.  If so let's wait
+			 * until it's done.
+			 */
+			spin_lock(chip->mutex);
+			while (chip->state != FL_XIP_WHILE_ERASING) {
+				DECLARE_WAITQUEUE(wait, current);
+				set_current_state(TASK_UNINTERRUPTIBLE);
+				add_wait_queue(&chip->wq, &wait);
+				spin_unlock(chip->mutex);
+				schedule();
+				remove_wait_queue(&chip->wq, &wait);
+				spin_lock(chip->mutex);
+			}
+			/* Disallow XIP again */
+			local_irq_disable();
+
+			/* Resume the write or erase operation */
+			map_write(map, CMD(0x30), adr);
+			chip->state = oldstate;
+			start = xip_currtime();
+		} else if (usec >= 1000000/HZ) {
+			/*
+			 * Try to save on CPU power when waiting delay
+			 * is at least a system timer tick period.
+			 * No need to be extremely accurate here.
+			 */
+			xip_cpu_idle();
+		}
+		status = map_read(map, adr);
+	} while (!map_word_andequal(map, status, OK, OK)
+		 && xip_elapsed_since(start) < usec);
+}
+
+#define UDELAY(map, chip, adr, usec)  xip_udelay(map, chip, adr, usec)
+
+/*
+ * The INVALIDATE_CACHED_RANGE() macro is normally used in parallel while
+ * the flash is actively programming or erasing since we have to poll for
+ * the operation to complete anyway.  We can't do that in a generic way with
+ * a XIP setup so do it before the actual flash operation in this case
+ * and stub it out from INVALIDATE_CACHE_UDELAY.
+ */
+#define XIP_INVAL_CACHED_RANGE(map, from, size)  \
+	INVALIDATE_CACHED_RANGE(map, from, size)
+
+#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec)  \
+	UDELAY(map, chip, adr, usec)
+
+/*
+ * Extra notes:
+ *
+ * Activating this XIP support changes the way the code works a bit.  For
+ * example the code to suspend the current process when concurrent access
+ * happens is never executed because xip_udelay() will always return with the
+ * same chip state as it was entered with.  This is why there is no care for
+ * the presence of add_wait_queue() or schedule() calls from within a couple
+ * xip_disable()'d  areas of code, like in do_erase_oneblock for example.
+ * The queueing and scheduling are always happening within xip_udelay().
+ *
+ * Similarly, get_chip() and put_chip() just happen to always be executed
+ * with chip->state set to FL_READY (or FL_XIP_WHILE_*) where flash state
+ * is in array mode, therefore never executing many cases therein and not
+ * causing any problem with XIP.
+ */
+
+#else
+
+#define xip_disable(map, chip, adr)
+#define xip_enable(map, chip, adr)
+#define XIP_INVAL_CACHED_RANGE(x...)
+
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
+#endif
 
 static inline int do_read_onechip(struct map_info *map, struct flchip *chip, loff_t adr, size_t len, u_char *buf)
 {
@@ -563,10 +773,10 @@
 	/* Ensure cmd read/writes are aligned. */ 
 	cmd_addr = adr & ~(map_bankwidth(map)-1); 
 
-	cfi_spin_lock(chip->mutex);
+	spin_lock(chip->mutex);
 	ret = get_chip(map, chip, cmd_addr, FL_READY);
 	if (ret) {
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 		return ret;
 	}
 
@@ -579,7 +789,7 @@
 
 	put_chip(map, chip, cmd_addr);
 
-	cfi_spin_unlock(chip->mutex);
+	spin_unlock(chip->mutex);
 	return 0;
 }
 
@@ -633,7 +843,7 @@
 	struct cfi_private *cfi = map->fldrv_priv;
 
  retry:
-	cfi_spin_lock(chip->mutex);
+	spin_lock(chip->mutex);
 
 	if (chip->state != FL_READY){
 #if 0
@@ -642,7 +852,7 @@
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		add_wait_queue(&chip->wq, &wait);
 		
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 
 		schedule();
 		remove_wait_queue(&chip->wq, &wait);
@@ -671,7 +881,7 @@
 	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	
 	wake_up(&chip->wq);
-	cfi_spin_unlock(chip->mutex);
+	spin_unlock(chip->mutex);
 
 	return 0;
 }
@@ -720,7 +930,7 @@
 }
 
 
-static int do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, map_word datum)
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip, unsigned long adr, map_word datum)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
@@ -740,10 +950,10 @@
 
 	adr += chip->start;
 
-	cfi_spin_lock(chip->mutex);
+	spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_WRITING);
 	if (ret) {
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 		return ret;
 	}
 
@@ -763,7 +973,9 @@
 		goto op_done;
 	}
 
+	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
 	ENABLE_VPP(map);
+	xip_disable(map, chip, adr);
  retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
@@ -771,9 +983,9 @@
 	map_write(map, datum, adr);
 	chip->state = FL_WRITING;
 
-	cfi_spin_unlock(chip->mutex);
-	cfi_udelay(chip->word_write_time);
-	cfi_spin_lock(chip->mutex);
+	INVALIDATE_CACHE_UDELAY(map, chip,
+				adr, map_bankwidth(map),
+				chip->word_write_time);
 
 	/* See comment above for timeout value. */
 	timeo = jiffies + uWriteTimeout; 
@@ -784,11 +996,11 @@
 
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
 			timeo = jiffies + (HZ / 2); /* FIXME */
-			cfi_spin_lock(chip->mutex);
+			spin_lock(chip->mutex);
 			continue;
 		}
 
@@ -796,14 +1008,14 @@
 			break;
 
 		if (time_after(jiffies, timeo)) {
+			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n", __func__);
+			xip_disable(map, chip, adr);
                         break;
 		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
-		cfi_spin_unlock(chip->mutex);
-		cfi_udelay(1);
-		cfi_spin_lock(chip->mutex);
+		UDELAY(map, chip, adr, 1);
 	}
 	/* Did we succeed? */
 	if (!chip_good(map, adr, datum)) {
@@ -816,10 +1028,11 @@
 
 		ret = -EIO;
 	}
+	xip_enable(map, chip, adr);
  op_done:
 	chip->state = FL_READY;
 	put_chip(map, chip, adr);
-	cfi_spin_unlock(chip->mutex);
+	spin_unlock(chip->mutex);
 
 	return ret;
 }
@@ -851,7 +1064,7 @@
 		map_word tmp_buf;
 
  retry:
-		cfi_spin_lock(cfi->chips[chipnum].mutex);
+		spin_lock(cfi->chips[chipnum].mutex);
 
 		if (cfi->chips[chipnum].state != FL_READY) {
 #if 0
@@ -860,7 +1073,7 @@
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&cfi->chips[chipnum].wq, &wait);
 
-			cfi_spin_unlock(cfi->chips[chipnum].mutex);
+			spin_unlock(cfi->chips[chipnum].mutex);
 
 			schedule();
 			remove_wait_queue(&cfi->chips[chipnum].wq, &wait);
@@ -874,7 +1087,7 @@
 		/* Load 'tmp_buf' with old contents of flash */
 		tmp_buf = map_read(map, bus_ofs+chipstart);
 
-		cfi_spin_unlock(cfi->chips[chipnum].mutex);
+		spin_unlock(cfi->chips[chipnum].mutex);
 
 		/* Number of bytes to copy from buffer */
 		n = min_t(int, len, map_bankwidth(map)-i);
@@ -929,7 +1142,7 @@
 		map_word tmp_buf;
 
  retry1:
-		cfi_spin_lock(cfi->chips[chipnum].mutex);
+		spin_lock(cfi->chips[chipnum].mutex);
 
 		if (cfi->chips[chipnum].state != FL_READY) {
 #if 0
@@ -938,7 +1151,7 @@
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&cfi->chips[chipnum].wq, &wait);
 
-			cfi_spin_unlock(cfi->chips[chipnum].mutex);
+			spin_unlock(cfi->chips[chipnum].mutex);
 
 			schedule();
 			remove_wait_queue(&cfi->chips[chipnum].wq, &wait);
@@ -951,7 +1164,7 @@
 
 		tmp_buf = map_read(map, ofs + chipstart);
 
-		cfi_spin_unlock(cfi->chips[chipnum].mutex);
+		spin_unlock(cfi->chips[chipnum].mutex);
 
 		tmp_buf = map_word_load_partial(map, tmp_buf, buf, 0, len);
 	
@@ -970,8 +1183,9 @@
 /*
  * FIXME: interleaved mode not tested, and probably not supported!
  */
-static inline int do_write_buffer(struct map_info *map, struct flchip *chip, 
-				  unsigned long adr, const u_char *buf, int len)
+static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
+				    unsigned long adr, const u_char *buf, 
+				    int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
@@ -985,10 +1199,10 @@
 	adr += chip->start;
 	cmd_adr = adr;
 
-	cfi_spin_lock(chip->mutex);
+	spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_WRITING);
 	if (ret) {
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 		return ret;
 	}
 
@@ -997,7 +1211,10 @@
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
 	       __func__, adr, datum.x[0] );
 
+	XIP_INVAL_CACHED_RANGE(map, adr, len);
 	ENABLE_VPP(map);
+	xip_disable(map, chip, cmd_adr);
+	
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -1027,9 +1244,9 @@
 	map_write(map, CMD(0x29), cmd_adr);
 	chip->state = FL_WRITING;
 
-	cfi_spin_unlock(chip->mutex);
-	cfi_udelay(chip->buffer_write_time);
-	cfi_spin_lock(chip->mutex);
+	INVALIDATE_CACHE_UDELAY(map, chip,
+				adr, map_bankwidth(map),
+				chip->word_write_time);
 
 	timeo = jiffies + uWriteTimeout; 
 		
@@ -1040,38 +1257,39 @@
 
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
 			timeo = jiffies + (HZ / 2); /* FIXME */
-			cfi_spin_lock(chip->mutex);
+			spin_lock(chip->mutex);
 			continue;
 		}
 
-		if (chip_ready(map, adr))
+		if (chip_ready(map, adr)) {
+			xip_enable(map, chip, adr);
 			goto op_done;
+		}
 		    
 		if( time_after(jiffies, timeo))
 			break;
 
 		/* Latency issues. Drop the lock, wait a while and retry */
-		cfi_spin_unlock(chip->mutex);
-		cfi_udelay(1);
-		cfi_spin_lock(chip->mutex);
+		UDELAY(map, chip, adr, 1);
 	}
 
-	printk(KERN_WARNING "MTD %s(): software timeout\n",
-	       __func__ );
-
 	/* reset on all failures. */
 	map_write( map, CMD(0xF0), chip->start );
+	xip_enable(map, chip, adr);
 	/* FIXME - should have reset delay before continuing */
 
+	printk(KERN_WARNING "MTD %s(): software timeout\n",
+	       __func__ );
+
 	ret = -EIO;
  op_done:
 	chip->state = FL_READY;
 	put_chip(map, chip, adr);
-	cfi_spin_unlock(chip->mutex);
+	spin_unlock(chip->mutex);
 
 	return ret;
 }
@@ -1161,7 +1379,7 @@
  * Handle devices with one erase region, that only implement
  * the chip erase command.
  */
-static inline int do_erase_chip(struct map_info *map, struct flchip *chip)
+static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
@@ -1171,17 +1389,20 @@
 
 	adr = cfi->addr_unlock1;
 
-	cfi_spin_lock(chip->mutex);
+	spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_WRITING);
 	if (ret) {
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 		return ret;
 	}
 
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",
 	       __func__, chip->start );
 
+	XIP_INVAL_CACHED_RANGE(map, adr, map->size);
 	ENABLE_VPP(map);
+	xip_disable(map, chip, adr);
+
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -1193,9 +1414,9 @@
 	chip->erase_suspended = 0;
 	chip->in_progress_block_addr = adr;
 
-	cfi_spin_unlock(chip->mutex);
-	msleep(chip->erase_time/2);
-	cfi_spin_lock(chip->mutex);
+	INVALIDATE_CACHE_UDELAY(map, chip,
+				adr, map->size,
+				chip->erase_time*500);
 
 	timeo = jiffies + (HZ*20);
 
@@ -1204,10 +1425,10 @@
 			/* Someone's suspended the erase. Sleep */
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			cfi_spin_lock(chip->mutex);
+			spin_lock(chip->mutex);
 			continue;
 		}
 		if (chip->erase_suspended) {
@@ -1227,10 +1448,7 @@
 		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
-		cfi_spin_unlock(chip->mutex);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(1);
-		cfi_spin_lock(chip->mutex);
+		UDELAY(map, chip, adr, 1000000/HZ);
 	}
 	/* Did we succeed? */
 	if (!chip_good(map, adr, map_word_ff(map))) {
@@ -1242,14 +1460,15 @@
 	}
 
 	chip->state = FL_READY;
+	xip_enable(map, chip, adr);
 	put_chip(map, chip, adr);
-	cfi_spin_unlock(chip->mutex);
+	spin_unlock(chip->mutex);
 
 	return ret;
 }
 
 
-static inline int do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, int len, void *thunk)
+static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr, int len, void *thunk)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
@@ -1258,17 +1477,20 @@
 
 	adr += chip->start;
 
-	cfi_spin_lock(chip->mutex);
+	spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_ERASING);
 	if (ret) {
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 		return ret;
 	}
 
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): ERASE 0x%.8lx\n",
 	       __func__, adr );
 
+	XIP_INVAL_CACHED_RANGE(map, adr, len);
 	ENABLE_VPP(map);
+	xip_disable(map, chip, adr);
+
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -1279,10 +1501,10 @@
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
 	chip->in_progress_block_addr = adr;
-	
-	cfi_spin_unlock(chip->mutex);
-	msleep(chip->erase_time/2);
-	cfi_spin_lock(chip->mutex);
+
+	INVALIDATE_CACHE_UDELAY(map, chip,
+				adr, len,
+				chip->erase_time*500);
 
 	timeo = jiffies + (HZ*20);
 
@@ -1291,10 +1513,10 @@
 			/* Someone's suspended the erase. Sleep */
 			set_current_state(TASK_UNINTERRUPTIBLE);
 			add_wait_queue(&chip->wq, &wait);
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 			schedule();
 			remove_wait_queue(&chip->wq, &wait);
-			cfi_spin_lock(chip->mutex);
+			spin_lock(chip->mutex);
 			continue;
 		}
 		if (chip->erase_suspended) {
@@ -1304,20 +1526,20 @@
 			chip->erase_suspended = 0;
 		}
 
-		if (chip_ready(map, adr))
+		if (chip_ready(map, adr)) {
+			xip_enable(map, chip, adr);
 			break;
+		}
 
 		if (time_after(jiffies, timeo)) {
+			xip_enable(map, chip, adr);
 			printk(KERN_WARNING "MTD %s(): software timeout\n",
 				__func__ );
 			break;
 		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
-		cfi_spin_unlock(chip->mutex);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(1);
-		cfi_spin_lock(chip->mutex);
+		UDELAY(map, chip, adr, 1000000/HZ);
 	}
 	/* Did we succeed? */
 	if (chip_good(map, adr, map_word_ff(map))) {
@@ -1330,7 +1552,7 @@
 
 	chip->state = FL_READY;
 	put_chip(map, chip, adr);
-	cfi_spin_unlock(chip->mutex);
+	spin_unlock(chip->mutex);
 	return ret;
 }
 
@@ -1390,7 +1612,7 @@
 		chip = &cfi->chips[i];
 
 	retry:
-		cfi_spin_lock(chip->mutex);
+		spin_lock(chip->mutex);
 
 		switch(chip->state) {
 		case FL_READY:
@@ -1404,14 +1626,14 @@
 			 * with the chip now anyway.
 			 */
 		case FL_SYNCING:
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 			break;
 
 		default:
 			/* Not an idle state */
 			add_wait_queue(&chip->wq, &wait);
 			
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 
 			schedule();
 
@@ -1426,13 +1648,13 @@
 	for (i--; i >=0; i--) {
 		chip = &cfi->chips[i];
 
-		cfi_spin_lock(chip->mutex);
+		spin_lock(chip->mutex);
 		
 		if (chip->state == FL_SYNCING) {
 			chip->state = chip->oldstate;
 			wake_up(&chip->wq);
 		}
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 	}
 }
 
@@ -1448,7 +1670,7 @@
 	for (i=0; !ret && i<cfi->numchips; i++) {
 		chip = &cfi->chips[i];
 
-		cfi_spin_lock(chip->mutex);
+		spin_lock(chip->mutex);
 
 		switch(chip->state) {
 		case FL_READY:
@@ -1468,7 +1690,7 @@
 			ret = -EAGAIN;
 			break;
 		}
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 	}
 
 	/* Unlock the chips again */
@@ -1477,13 +1699,13 @@
 		for (i--; i >=0; i--) {
 			chip = &cfi->chips[i];
 
-			cfi_spin_lock(chip->mutex);
+			spin_lock(chip->mutex);
 		
 			if (chip->state == FL_PM_SUSPENDED) {
 				chip->state = chip->oldstate;
 				wake_up(&chip->wq);
 			}
-			cfi_spin_unlock(chip->mutex);
+			spin_unlock(chip->mutex);
 		}
 	}
 	
@@ -1502,7 +1724,7 @@
 	
 		chip = &cfi->chips[i];
 
-		cfi_spin_lock(chip->mutex);
+		spin_lock(chip->mutex);
 		
 		if (chip->state == FL_PM_SUSPENDED) {
 			chip->state = FL_READY;
@@ -1512,7 +1734,7 @@
 		else
 			printk(KERN_ERR "Argh. Chip not in PM_SUSPENDED state upon resume()\n");
 
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 	}
 }
 
Index: drivers/mtd/chips/fwh_lock.h
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/fwh_lock.h,v
retrieving revision 1.2
diff -u -r1.2 fwh_lock.h
--- drivers/mtd/chips/fwh_lock.h	17 Sep 2004 11:45:05 -0000	1.2
+++ drivers/mtd/chips/fwh_lock.h	24 May 2005 07:52:17 -0000
@@ -58,10 +58,10 @@
 	 * to flash memory - that means that we don't have to check status
 	 * and timeout.
 	 */
-	cfi_spin_lock(chip->mutex);
+	spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_LOCKING);
 	if (ret) {
-		cfi_spin_unlock(chip->mutex);
+		spin_unlock(chip->mutex);
 		return ret;
 	}
 
@@ -71,7 +71,7 @@
 	/* Done and happy. */
 	chip->state = FL_READY;
 	put_chip(map, chip, adr);
-	cfi_spin_unlock(chip->mutex);
+	spin_unlock(chip->mutex);
 	return 0;
 }
 
Index: drivers/mtd/maps/map_funcs.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/maps/map_funcs.c,v
retrieving revision 1.9
diff -u -r1.9 map_funcs.c
--- drivers/mtd/maps/map_funcs.c	13 Jul 2004 22:33:15 -0000	1.9
+++ drivers/mtd/maps/map_funcs.c	24 May 2005 07:52:17 -0000
@@ -9,23 +9,24 @@
 #include <linux/module.h>
 
 #include <linux/mtd/map.h>
+#include <linux/mtd/xip.h>
 
-static map_word simple_map_read(struct map_info *map, unsigned long ofs)
+static map_word __xipram simple_map_read(struct map_info *map, unsigned long ofs)
 {
 	return inline_map_read(map, ofs);
 }
 
-static void simple_map_write(struct map_info *map, const map_word datum, unsigned long ofs)
+static void __xipram simple_map_write(struct map_info *map, const map_word datum, unsigned long ofs)
 {
 	inline_map_write(map, datum, ofs);
 }
 
-static void simple_map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+static void __xipram simple_map_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {
 	inline_map_copy_from(map, to, from, len);
 }
 
-static void simple_map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+static void __xipram simple_map_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
 {
 	inline_map_copy_to(map, to, from, len);
 }
Index: include/linux/mtd/cfi.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi.h,v
retrieving revision 1.53
diff -u -r1.53 cfi.h
--- include/linux/mtd/cfi.h	15 Mar 2005 19:03:13 -0000	1.53
+++ include/linux/mtd/cfi.h	24 May 2005 07:52:19 -0000
@@ -428,16 +428,6 @@
 	}
 }
 
-static inline void cfi_spin_lock(spinlock_t *mutex)
-{
-	spin_lock_bh(mutex);
-}
-
-static inline void cfi_spin_unlock(spinlock_t *mutex)
-{
-	spin_unlock_bh(mutex);
-}
-
 struct cfi_extquery *cfi_read_pri(struct map_info *map, uint16_t adr, uint16_t size,
 			     const char* name);
 struct cfi_fixup {
