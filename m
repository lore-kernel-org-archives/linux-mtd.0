Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13kzXm-00031N-00
	for mtd-list@infradead.org; Mon, 16 Oct 2000 02:58:26 +0100
Received: from tinuviel.mizi.com ([203.239.30.10])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13kzXX-00031H-00
	for mtd@infradead.org; Mon, 16 Oct 2000 02:58:12 +0100
Received: (from tolkien@localhost)
	by tinuviel.mizi.com (8.9.3/8.9.3) id KAA31271
	for mtd@infradead.org; Mon, 16 Oct 2000 10:57:47 +0900
Date: Mon, 16 Oct 2000 10:57:47 +0900
From: Yong-iL Joh <tolkien@mizi.com>
To: mtd@infradead.org
Subject: Re: MTD lowlevel driver for SCH-M100
Message-ID: <20001016105747.A31237@tinuviel.mizi.com>
Reply-To: tolkien@mizi.com
References: <20000807130434.A6519@tinuviel.mizi.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="opJtzjQTFsWo+cga"
In-Reply-To: <20000807130434.A6519@tinuviel.mizi.com>; from tolkien@mizi.com on Mon, Aug 07, 2000 at 01:04:34PM +0900
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii

On Mon, Aug 07, 2000 at 01:04:34PM +0900, Yong-iL Joh wrote:
> we are working on SAMSUNG smartphone SCH-M100.
> this is low level mtd driver for Intel BootBlock FlashROM (28F160B3)
> because SAMSUNG combine two 16bit-wide Flashes in parellel way,
> it seems to be 32bit-wide FlashROM.

plus, there is some add for kernel XIP
(run kernel core in FlashROM without loading RAM)

-- 
Joh, Yong-iL
E-mail: tolkien@nownuri.net tolkien@mizi.com

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mtd.diff"

diff --exclude=CVS -ruN mtd/kernel/Config.in linux/drivers/mtd/Config.in
--- mtd/kernel/Config.in	Sun Oct 15 01:04:07 2000
+++ linux/drivers/mtd/Config.in	Mon Oct 16 10:09:08 2000
@@ -12,6 +12,7 @@
 fi
 
 if [ "$CONFIG_MTD" != "n" ]; then
+   dep_tristate 'Flash chips on SCH-M100' CONFIG_MTD_SCHM100 $CONFIG_MTD
 comment 'Disk-On-Chip Device Drivers'
    dep_tristate '  M-Systems Disk-On-Chip 1000' CONFIG_MTD_DOC1000 $CONFIG_MTD
    dep_tristate '  M-Systems Disk-On-Chip 2000' CONFIG_MTD_DOC2000 $CONFIG_MTD
diff --exclude=CVS -ruN mtd/kernel/Makefile linux/drivers/mtd/Makefile
--- mtd/kernel/Makefile	Mon Oct 16 01:04:07 2000
+++ linux/drivers/mtd/Makefile	Mon Oct 16 10:09:08 2000
@@ -60,6 +60,11 @@
 obj-$(CONFIG_MTD_NAND)		+= nand.o
 obj-$(CONFIG_MTD_NAND_SPIA)	+= spia.o
 obj-$(CONFIG_MTD_NAND_ECC)	+= nand_ecc.o
+ifdef CONFIG_XIP_ROM
+obj-$(CONFIG_MTD_SCHM100)	+= schm100_xip.o
+else
+obj-$(CONFIG_MTD_SCHM100)	+= schm100.o
+endif
 
 # Chip drivers
 obj-$(CONFIG_MTD_JEDEC)		+= jedec.o
diff --exclude=CVS -ruN mtd/kernel/mtdcore.c linux/drivers/mtd/mtdcore.c
--- mtd/kernel/mtdcore.c	Fri Oct 13 01:04:07 2000
+++ linux/drivers/mtd/mtdcore.c	Fri Oct  6 14:54:22 2000
@@ -58,6 +58,9 @@
 #ifdef CONFIG_MTD_NORA
 extern int init_nora(void);
 #endif
+#ifdef CONFIG_MTD_SCHM100
+extern int init_schm100_mtd(void);
+#endif
 #ifdef CONFIG_MTD_SBC_MEDIAGX
 extern int init_sbc_mediagx(void);
 #endif
@@ -419,6 +422,9 @@
 #ifdef CONFIG_MTD_NORA
 	init_nora();
 #endif
+#ifdef CONFIG_MTD_SCHM100
+	init_schm100_mtd();
+#endif
 #ifdef CONFIG_MTD_SBC_MEDIAGX
 	init_sbc_mediagx();
 #endif
@@ -456,7 +462,6 @@
 {
 	int i;
 
-	printk(KERN_INFO "Initializing MTD Layer\n");
 	for (i=0; i<MAX_MTD_DEVICES; i++)
 		mtd_table[i]=NULL;
 
diff --exclude=CVS -ruN mtd/kernel/schm100.c linux/drivers/mtd/schm100.c
--- mtd/kernel/schm100.c	Thu Jan  1 09:00:00 1970
+++ linux/drivers/mtd/schm100.c	Mon Oct 16 10:46:44 2000
@@ -0,0 +1,758 @@
+/*
+ * $Id: schm100.c,v 1.24 2000/10/16 01:46:44 tolkien Exp $
+ *
+ * Intel 3 volt Advanced Boot Block Flash Memory Device
+ * based in drivers/mtd/nora.c, drivers/mtd/cfi_cmd_0001.c
+ *
+ * Author:
+ *       Yong-iL Joh <tolkien@mizi.com>
+ *       Copyright 2000 Mizi Research
+ *
+ * License: 
+ *	 As part of this driver was derrived from the slram.c driver it falls
+ *	 under the same license, which is GNU General Public License v2
+ *
+ * Description: 
+ *	 This driver is intended to support the Boot Block Flash device from
+ *	 Intel Inc. in SAMSUNG SmartPhone SCH-M100. There are two Intel NOR
+ *	 16bit-wide FlashROMs, but assembled in parallel, so we must use them
+ *	 as single 32bit-wide NOR FlashROMs. Therefore there is no
+ *	 consideration to multi-chips.
+ *
+ */
+
+#define USE_2_BLOCK	1
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+
+#include <linux/malloc.h>
+#include <linux/delay.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/flashchip.h>
+#include <asm/arch/hardware.h>
+#include <asm/io.h>
+
+#include "schm100.h"
+
+/* FlashChip Info. */
+static struct flchip *chip;
+#define set_current_state(x) current->state = (x);
+
+int schm100_mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+    unsigned long status;
+    unsigned long timeo = jiffies + HZ, addr, cmd_addr;
+    DECLARE_WAITQUEUE(wait, current);
+    int suspendedstate = 0;
+
+    addr = from + (unsigned long)mtd->priv;
+    if (len > mtd->size - from)	len = mtd->size - from;
+    if (len < 1)	return -EINVAL;
+
+    cmd_addr = addr & 0xFFFFFFFC;
+ retry:
+    spin_lock_bh(chip->mutex);
+
+    /* Check that the chip's ready to talk to us.
+     * If it's in FL_ERASING state, suspend it and make it talk now.
+     */
+    switch (chip->state) {
+    case FL_ERASING:
+	__IOW(cmd_addr) = FLASH_SUSPEND;
+	chip->oldstate = FL_ERASING;
+	chip->state = FL_ERASE_SUSPENDING;
+	timeo = jiffies + HZ;
+
+	status = __IOW(cmd_addr);
+	while (((status = __IOW(cmd_addr)) & FLS_READY) == 0) {
+	    if (time_after(jiffies, timeo)) {
+		__IOW(cmd_addr) = FLASH_RESUME;
+		chip->state = FL_ERASING;
+		spin_unlock_bh(chip->mutex);
+		printk("Chip not ready after erase suspended\n");
+		return -EIO;
+	    }
+	    spin_unlock_bh(chip->mutex);
+	    udelay(1);
+	    spin_lock_bh(chip->mutex);
+	}
+	chip->state = FL_ERASE_SUSPENDED;
+	/* Remember the status so we know whether to restart
+	   the erase later */
+	suspendedstate = status;
+	break;
+#if 0
+    case FL_WRITING:
+	/* Not quite yet */
+#endif
+    case FL_CFI_QUERY:
+    case FL_JEDEC_QUERY:
+    case FL_READY:
+	__IOW(cmd_addr) = FLASH_READ_STATUS;
+	chip->state = FL_STATUS;
+
+    case FL_STATUS:
+	status = __IOW(cmd_addr);
+
+	if (!(status & FLS_READY)) {
+	    static int z=0;
+	    /* Urgh. Chip not yet ready to talk to us. */
+	    if (time_after(jiffies, timeo)) {
+		spin_unlock_bh(chip->mutex);
+		printk("waiting for chip to be ready timed out in read");
+		return -EIO;
+	    }
+
+	    /* Latency issues. Drop the lock, wait a while and retry */
+	    spin_unlock_bh(chip->mutex);
+
+	    z++;
+	    if ( 0 && !(z % 100 )) 
+		printk("chip not ready yet before read. looping\n");
+
+	    udelay(1);
+
+	    goto retry;
+	}
+	break;
+
+    default:
+	printk("Waiting for chip, status = %d\n", chip->state);
+
+	/* Stick ourselves on a wait queue to be woken when
+	   someone changes the status */
+
+	set_current_state(TASK_INTERRUPTIBLE);
+	add_wait_queue(&chip->wq, &wait);
+
+	spin_unlock_bh(chip->mutex);
+
+	schedule();
+	remove_wait_queue(&chip->wq, &wait);
+
+	timeo = jiffies + HZ;
+
+	goto retry;
+    }
+
+    __IOW(cmd_addr) = FLASH_READ_ARRAY;
+    chip->state = FL_READY;
+
+    // since FlashROM's area is USER domain, we need not to use copy_to_user()
+    memcpy(buf, (void *)addr, len);
+    *retlen = len;
+
+    if (suspendedstate) {
+	chip->state = chip->oldstate;
+	/* Resume if it hadn't already completed. */
+	if (suspendedstate & FLS_ERASE_SUSPEND) 
+	    __IOW(cmd_addr) = FLASH_RESUME;
+    }
+
+    wake_up(&chip->wq);
+    spin_unlock_bh(chip->mutex);
+
+    return 0;
+}
+
+int schm100_flash_wait(unsigned long addr, struct wait_queue *wait_p,
+				     unsigned long *timeo_p, const char *str) {
+  unsigned long status;
+
+  addr &= 0xFFFFFFFC;
+
+ retry:
+  spin_lock_bh(chip->mutex);
+
+  /* Check that the chip's ready to talk to us.
+   * Later, we can actually think about interrupting it
+   * if it's in FL_ERASING or FL_WRITING state.
+   * Not just yet, though.
+   */
+  switch (chip->state) {
+  case FL_CFI_QUERY:
+  case FL_JEDEC_QUERY:
+  case FL_READY:
+      __IOW(addr) = FLASH_READ_STATUS;
+      chip->state = FL_STATUS;
+
+  case FL_STATUS:
+      status = __IOW(addr);
+      *timeo_p = jiffies + HZ;
+
+      if (!(status & FLS_READY)) {
+	  static int z=0;
+	  /* Urgh. Chip not yet ready to talk to us. */
+	  if (time_after(jiffies, *timeo_p)) {
+	      spin_unlock_bh(chip->mutex);
+	      printk("waiting for chip to be ready timed out in %s", str);
+	      return -EIO;
+	  }
+
+	  /* Latency issues. Drop the lock, wait a while and retry */
+	  spin_unlock_bh(chip->mutex);
+
+	  z++;
+	  if ( 0 && !(z % 100 )) 
+	      printk("chip not ready yet before %s. looping\n", str);
+
+	  udelay(1);
+
+	  goto retry;
+      }
+      break;
+
+  default:
+    printk("Waiting for chip, status = %d\n", chip->state);
+
+    /* Stick ourselves on a wait queue to be woken when
+       someone changes the status */
+
+    set_current_state(TASK_INTERRUPTIBLE);
+    add_wait_queue(&chip->wq, wait_p);
+
+    spin_unlock_bh(chip->mutex);
+
+    schedule();
+    remove_wait_queue(&chip->wq, wait_p);
+#if 0
+    if(signal_pending(current))
+      return -EINTR;
+#endif
+    *timeo_p = jiffies + HZ;
+
+    goto retry;
+  }
+
+  return 0;
+}
+
+int schm100_flash_wait2(unsigned long addr, struct wait_queue *wait_p, \
+				     unsigned long *timeo_p, flstate_t fls, int *z_p) {
+  unsigned long status, condition;
+  char *str, *str2;
+
+  addr &= 0xFFFFFFFC;
+  switch (fls) {
+  case FL_ERASING:
+    str = "erase";
+    str2 = "waiting for erase to complete timed out.";
+    condition = (FLS_VPP | FLS_ERASE | FLS_PROGRAM | FLS_LOCK);
+    break;
+  case FL_WRITING:
+    str = "program";
+    str2 = "waiting for chip to be ready timed out in read";
+    condition = (FLS_VPP | FLS_PROGRAM | FLS_LOCK);
+    break;
+  default:
+    str = "unknown";
+    str2 = "what else?";
+    condition = 0;
+  }
+
+  /* FIXME. Use a timer to check this, and return immediately. */
+  /* Once the state machine's known to be working I'll do that */
+
+  *z_p = 0;
+  while ( !( (status = __IOW(addr)) & FLS_READY ) ) {
+
+    if (chip->state != fls) {
+      /* Someone's suspended the erase/write. Sleep */
+      set_current_state(TASK_INTERRUPTIBLE);
+      add_wait_queue(&chip->wq, wait_p);
+
+      spin_unlock_bh(chip->mutex);
+      printk("%s suspended. Sleeping\n", str);
+
+      schedule();
+      remove_wait_queue(&chip->wq, wait_p);
+#if 0
+      if (signal_pending(current))
+	return -EINTR;
+#endif
+      *timeo_p = jiffies + (HZ*2); /* FIXME */
+      spin_lock_bh(chip->mutex);
+      continue;
+    }
+
+    /* OK Still waiting */
+    if (time_after(jiffies, *timeo_p)) {
+	chip->state = FL_STATUS;
+	spin_unlock_bh(chip->mutex);
+	printk(str2);
+	return -EIO;
+    }
+
+    /* Latency issues. Drop the lock, wait a while and retry */
+    spin_unlock_bh(chip->mutex);
+
+    (*z_p)++;
+    if ( 0 && !((*z_p) % 100 )) 
+      printk("chip not ready yet after %s. looping\n", str);
+
+    udelay(1);
+
+    spin_lock_bh(chip->mutex);
+    continue;
+  }	// while
+
+  if (status & condition) {
+      __IOW(addr) = FLASH_CLEAR_STATUS;
+      return status & condition;
+  }
+  return 0;
+}
+
+int schm100_erase_oneblock(unsigned long addr)
+{
+  unsigned long timeo = jiffies + HZ;
+  DECLARE_WAITQUEUE(wait, current);
+  int ret, z;
+
+  addr &= 0xFFFFFFFC;
+  ret = schm100_flash_wait(addr, &wait, &timeo, "erase");
+  if (ret != 0)	return ret;
+
+  __IOW(addr) = FLASH_ERASE;
+  __IOW(addr) = FLASH_ERASE_CONFIRM;
+
+  chip->state = FL_ERASING;
+  timeo = jiffies + (HZ*2);
+
+  spin_unlock_bh(chip->mutex);
+  schedule_timeout(HZ);
+  spin_lock_bh(chip->mutex);
+
+  ret = schm100_flash_wait2(addr, &wait, &timeo, FL_ERASING, &z);
+  if (ret != 0)	return ret;
+	
+  /* Done and happy. */
+  __IOW(addr) = FLASH_READ_ARRAY;
+  chip->state = FL_READY;
+
+  wake_up(&chip->wq);
+  spin_unlock_bh(chip->mutex);
+
+  return 0;
+}
+
+int schm100_write_32(unsigned long addr, unsigned long datum)
+{
+  unsigned long timeo = jiffies + HZ;
+  DECLARE_WAITQUEUE(wait, current);
+  int ret, z;
+
+  DEBUG(MTD_DEBUG_LEVEL3, "[%s:%d] addr=%lx, datum=%lx\n", __FILE__, __LINE__, addr, datum);
+  ret = schm100_flash_wait(addr, &wait, &timeo, "write");
+  if (ret != 0)	return ret;
+
+  addr &= 0xFFFFFFFC;
+  __IOW(addr) = FLASH_WRITE;
+  __IOW(addr) = datum;
+
+  chip->state = FL_WRITING;
+  timeo = jiffies + (HZ/2);
+
+  spin_unlock_bh(chip->mutex);
+  udelay(chip->word_write_time);
+  spin_lock_bh(chip->mutex);
+
+  ret = schm100_flash_wait2(addr, &wait, &timeo, FL_WRITING, &z);
+  if (ret != 0)	return ret;
+  if (!z) {
+    chip->word_write_time--;
+    if (!chip->word_write_time)
+      chip->word_write_time++;
+  }
+  if (z > 1) 
+    chip->word_write_time++;
+
+  /* Done and happy. */
+  __IOW(addr) = FLASH_READ_ARRAY;
+  chip->state = FL_READY;
+
+  wake_up(&chip->wq);
+  spin_unlock_bh(chip->mutex);
+
+  return 0;
+}
+
+static int schm100_mtd_erase (struct mtd_info *mtd, struct erase_info *instr)
+{
+  int ret = 0;
+  unsigned long adr, len;
+
+  if (instr->addr & (mtd->erasesize - 1))
+    return -EINVAL;
+
+  if (instr->len & (mtd->erasesize - 1))
+    return -EINVAL;
+
+  if ((instr->len + instr->addr) > mtd->size)
+    return -EINVAL;
+
+  ENABLE_VPP;
+
+  adr = instr->addr + (unsigned long)mtd->priv;
+  len = instr->len;
+
+  while(len) {
+    ret = schm100_erase_oneblock(adr);
+    if (ret)	return ret;
+
+    adr += mtd->erasesize;
+    len -= mtd->erasesize;
+  }
+
+  if (instr->callback)
+    instr->callback(instr);
+
+  DISABLE_VPP;
+  return 0;
+}
+
+static int schm100_mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
+{
+  int ret = 0;
+  unsigned long tmp, addr;
+#if 0	// hacked by tolkien, memory dump. :)
+  int i,j,k;
+  u_char *str, *chr;
+#endif
+
+  *retlen = 0;
+  addr = to + (unsigned long)mtd->priv;
+
+#if 0	// hacked by tolkien, memory dump. :)
+#define	ONE_LINE	16
+  str = chr = buf;
+  printk("\n WRITE");
+  printk("\n[0x%08lx]:", addr);
+  for(i=0, k=0; i < len; i++, str++) {
+      if ((i != 0) && ((i % ONE_LINE) == 0)) {
+	  printk("\t");
+	  for(j=0; j < ONE_LINE; j++, chr++) {
+	      if ((*chr >= 0x20) && (*chr <= 0x7E)) {
+		  printk("%c", *chr);
+	      } else {
+		  printk(".");
+	      }
+	  }
+	  printk("\n[0x%08lx]:", addr + i);
+	  k += ONE_LINE;
+      }
+      printk("%02x ", *str);
+  }
+  printk("\t");
+  for(j=0; j < (i - k); j++, chr++) {
+      if ((*chr >= 0x20) && (*chr <= 0x7E)) {
+	  printk("%c", *chr);
+      } else {
+	  printk(".");
+      }
+  }
+  printk("\n");
+#endif
+
+  if (len < 1) return -EINVAL;
+  ENABLE_VPP;
+
+  /* If it's not word-aligned, do the first byte write */
+  tmp = addr & 0x03;
+  if (tmp) {
+      switch (tmp) {
+      case 0x01: tmp = 0xFF | ((*buf) << 8) | ((*(buf + 1)) << 16) | ((*(buf + 2)) << 24);
+	  break;
+      case 0x02: tmp = 0xFFFF | ((*buf) << 16) | ((*(buf + 1)) << 24);
+	  break;
+      case 0x03: tmp = 0xFFFFFF | ((*buf) << 24);
+	  break;
+      }
+      ret = schm100_write_32(addr, tmp);
+      if (ret)	return ret;
+
+      tmp = 4 - (addr & 0x03);
+      buf += tmp;
+      (*retlen) += tmp;
+      len -= tmp;
+      addr += tmp;
+  }
+
+  while(len > 3) {
+    ret = schm100_write_32(addr, *(unsigned long *)buf);
+    if (ret)	return ret;
+
+    addr += 4;
+    buf += 4;
+    (*retlen) += 4;
+    len -= 4;
+  }
+
+  /* Final byte to write */
+  if (len > 0) {
+      switch (len) {
+      case 0x01: tmp = 0xFFFFFF00 | (*buf);
+	  break;
+      case 0x02: tmp = 0xFFFF0000 | (*buf) | ((*(buf + 1)) << 8);
+	  break;
+      case 0x03: tmp = 0xFF000000 | (*buf) | ((*(buf + 1)) << 8) | ((*(buf + 2)) << 16);
+	  break;
+      }
+      ret = schm100_write_32(addr, tmp);
+      if (ret)	return ret;
+      (*retlen) += len;
+  }
+
+  DISABLE_VPP;
+  return 0;
+}
+
+static void schm100_mtd_sync (struct mtd_info *mtd)
+{
+  DECLARE_WAITQUEUE(wait, current);
+
+ retry:
+  spin_lock_bh(chip->mutex);
+
+  switch(chip->state) {
+  case FL_READY:
+  case FL_STATUS:
+  case FL_CFI_QUERY:
+  case FL_JEDEC_QUERY:
+    chip->oldstate = chip->state;
+    chip->state = FL_SYNCING;
+    /* No need to wake_up() on this state change - 
+     * as the whole point is that nobody can do anything
+     * with the chip now anyway.
+     */
+  case FL_SYNCING:
+    spin_unlock_bh(chip->mutex);
+    break;
+
+  default:
+    /* Not an idle state */
+    add_wait_queue(&chip->wq, &wait);
+
+    spin_unlock_bh(chip->mutex);
+    schedule();
+    remove_wait_queue(&chip->wq, &wait);
+
+    goto retry;
+  }
+
+  /* Unlock the chips again */
+  spin_lock_bh(chip->mutex);
+
+  if (chip->state == FL_SYNCING) {
+    chip->state = chip->oldstate;
+    wake_up(&chip->wq);
+  }
+  spin_unlock_bh(chip->mutex);
+}
+
+static int schm100_mtd_suspend (struct mtd_info *mtd)
+{
+  int ret = 0;
+
+  spin_lock_bh(chip->mutex);
+
+  switch(chip->state) {
+  case FL_READY:
+  case FL_STATUS:
+  case FL_CFI_QUERY:
+  case FL_JEDEC_QUERY:
+    chip->oldstate = chip->state;
+    chip->state = FL_PM_SUSPENDED;
+    /* No need to wake_up() on this state change - 
+     * as the whole point is that nobody can do anything
+     * with the chip now anyway.
+     */
+  case FL_PM_SUSPENDED:
+    spin_unlock_bh(chip->mutex);
+    break;
+
+  default:
+    ret = -EAGAIN;
+    break;
+  }
+
+  /* Unlock the chips again */
+  spin_lock_bh(chip->mutex);
+
+  if (chip->state == FL_PM_SUSPENDED) {
+    chip->state = chip->oldstate;
+    wake_up(&chip->wq);
+  }
+  spin_unlock_bh(chip->mutex);
+	
+  return ret;
+}
+
+static void schm100_mtd_resume (struct mtd_info *mtd)
+{
+  spin_lock_bh(chip->mutex);
+
+  if (chip->state == FL_PM_SUSPENDED) {
+    chip->state = chip->oldstate;
+    wake_up(&chip->wq);
+  }
+  else
+    printk("Argh. Chip not in PM_SUSPENDED state upon resume()\n");
+
+  spin_unlock_bh(chip->mutex);
+}
+
+#define BBFL_BOOT_BLOCK_SIZE	0x004000
+#define BBFL_BLOCK_SIZE		0x020000
+#ifdef USE_2_BLOCK
+#  define SCHM100_MTD_BLOCK_NO	1
+#else
+#  define SCHM100_MTD_BLOCK_NO	2
+#endif
+
+static struct mtd_info my_mtds[SCHM100_MTD_BLOCK_NO] = {
+#ifndef USE_2_BLOCK
+  {
+    type: MTD_NORFLASH,
+    flags: MTD_CAP_NORFLASH,
+    size: FLASH_SIZE_4,
+    erasesize: BBFL_BLOCK_SIZE,
+    name: "FileSystem",
+    module: THIS_MODULE,
+    erase: schm100_mtd_erase,
+    read: schm100_mtd_read,
+    write: schm100_mtd_write,
+    suspend: schm100_mtd_suspend,
+    resume: schm100_mtd_resume,
+    sync: schm100_mtd_sync,
+  }
+#else
+  {
+    type: MTD_NORFLASH,
+    flags: MTD_CAP_NORFLASH,
+    size: FLASH_SIZE_4 - XIP_SIZE,
+    erasesize: BBFL_BLOCK_SIZE,
+    name: "FileSystem",
+    module: THIS_MODULE,
+    erase: schm100_mtd_erase,
+    read: schm100_mtd_read,
+    write: schm100_mtd_write,
+    suspend: schm100_mtd_suspend,
+    resume: schm100_mtd_resume,
+    sync: schm100_mtd_sync,
+  },
+  {
+    type: MTD_NORFLASH,
+    flags: MTD_CAP_NORFLASH | MTD_XIP,
+    size: XIP_SIZE,
+    erasesize: BBFL_BLOCK_SIZE,
+    name: "ROM disk",
+    module: THIS_MODULE,
+    erase: schm100_mtd_erase,
+    read: schm100_mtd_read,
+    write: schm100_mtd_write,
+    suspend: schm100_mtd_suspend,
+    resume: schm100_mtd_resume,
+    sync: schm100_mtd_sync,
+  }
+#endif
+};
+
+#if LINUX_VERSION_CODE < 0x20300
+#ifdef MODULE
+#define init_schm100_mtd	init_module
+#define cleanup_schm100_mtd	cleanup_module
+
+static void __exit cleanup_schm100_mtd(void)
+{
+    del_mtd_device(&my_mtds[0]);
+    iounmap((void *)my_mtds[0].priv);
+#ifndef USE_2_BLOCK
+    del_mtd_device(&my_mtds[1]);
+    iounmap((void *)my_mtds[1].priv);
+#endif
+    kfree(chip);
+}
+#endif
+#endif
+
+int get_flash_id(void)
+{
+    volatile unsigned int c1, c2;
+
+    /*
+     * try to get flash chip ID
+     */
+    __IOW(FLASH_BASE) = FLASH_READ_ID;
+    udelay(15);
+    c1 = __IOW(FLASH_BASE);
+    c2 = __IOW(FLASH_BASE + 4);
+
+    /*
+     * set it back to read mode
+     */
+    __IOW(FLASH_BASE) = FLASH_READ_ARRAY;
+
+    return c2;
+}
+
+#define	KFLASH_ID	0x88918891	// Intel 28F160B3 x 2
+int __init init_schm100_mtd(void)
+{
+  int id;
+  unsigned long tmp;
+
+  id = get_flash_id();
+  if (id != KFLASH_ID) {
+    printk("Flash: incorrect ID 0x%04X.\n", id);
+    return -ENXIO;
+  }
+  printk("Flash: device ID 0x%04X, size 4Mbyte.\n", id);
+
+  /* set 32bit wide, Memory Configuration Register 1 - NCS0 */
+  tmp = IO_SYSFLG1 & BOOTBIT;
+  switch (tmp) {
+  case BOOTBIT_32:
+      IO_MEMCFG1 |= CS_BW_BUS32_E0;
+      break;
+  case BOOTBIT_8:
+      IO_MEMCFG1 |= CS_BW_BUS32_E1;
+      break;
+  case BOOTBIT_16:
+      IO_MEMCFG1 |= CS_BW_BUS32_E2;
+      break;
+  }
+
+#ifndef USE_2_BLOCK
+  my_mtds[0].priv = (void *)__ioremap(FLASH_START_4, FLASH_SIZE_4, PTE_AP_READ);
+#else
+  my_mtds[0].priv = (void *)__ioremap(FLASH_START_4, FLASH_SIZE_4 - XIP_SIZE, PTE_AP_READ);
+  my_mtds[1].priv = (void *)__ioremap(FLASH_START_4 + FLASH_SIZE_4 - XIP_SIZE, XIP_SIZE, PTE_AP_READ);
+#endif
+  DEBUG(MTD_DEBUG_LEVEL1, "[%s:%d] mtd[0]=%lx,size=%lx,priv=%lx\n", __FILE__, __LINE__, &my_mtds[0], (unsigned long)my_mtds[0].size, (unsigned long)my_mtds[0].priv);
+#ifdef USE_2_BLOCK
+  DEBUG(MTD_DEBUG_LEVEL1, "[%s:%d] mtd[1]=%lx,size=%lx,priv=%lx\n", __FILE__, __LINE__, &my_mtds[1], (unsigned long)my_mtds[1].size, (unsigned long)my_mtds[1].priv);
+#endif
+
+  chip = (struct flchip *)kmalloc(sizeof(struct flchip), GFP_KERNEL);
+  memset(chip, 0, sizeof(struct flchip));
+  init_waitqueue_head(&chip->wq);
+  spin_lock_init(&chip->_spinlock);
+  chip->start = (unsigned long)my_mtds[0].priv;
+#if 0	// hacked by tolkien
+  chip->state = FL_STATUS;
+#else
+  __IOW(chip->start) = FLASH_READ_ARRAY;
+  chip->state = FL_READY;
+#endif
+  chip->mutex = &chip->_spinlock;
+
+  add_mtd_device(&my_mtds[0]);
+#ifdef USE_2_BLOCK
+  add_mtd_device(&my_mtds[1]);
+#endif
+  DISABLE_VPP;
+
+  return 0;
+}
diff --exclude=CVS -ruN mtd/kernel/schm100.h linux/drivers/mtd/schm100.h
--- mtd/kernel/schm100.h	Thu Jan  1 09:00:00 1970
+++ linux/drivers/mtd/schm100.h	Mon Oct 16 10:46:44 2000
@@ -0,0 +1,76 @@
+/*
+ * $Id: schm100.h,v 1.6 2000/10/16 01:46:44 tolkien Exp $
+ *
+ * Intel 3 volt Advanced Boot Block Flash Memory Device
+ * based in drivers/mtd/nora.c, drivers/mtd/cfi_cmd_0001.c
+ *
+ * Author:
+ *       Yong-iL Joh <tolkien@mizi.com>
+ *       Copyright 2000 Mizi Research
+ *
+ * License: 
+ *	 As part of this driver was derrived from the slram.c driver it falls
+ *	 under the same license, which is GNU General Public License v2
+ *
+ */
+
+/* Flash Device Operation */
+#define	FLASH_READ_ARRAY	0x00FF00FF
+#define	FLASH_WRITE		0x00400040
+#define	FLASH_ERASE		0x00200020
+#define	FLASH_ERASE_CONFIRM	0x00D000D0
+#define	FLASH_RESUME		0x00D000D0
+#define	FLASH_SUSPEND		0x00B000B0
+#define	FLASH_READ_STATUS	0x00700070
+#define	FLASH_CLEAR_STATUS	0x00500050
+#define	FLASH_READ_ID		0x00900090
+
+/* if 6 bit is set in DATA port A, Vpp pin's status is changed (High),
+   so FlashROM is read-only */
+#define VPP_MASK	0x40
+#define VPP_CLEAR_MASK	0xBF
+#define ENABLE_VPP	{ IO_PADDR |= 0x40; IO_PADR &= VPP_CLEAR_MASK; }
+#define DISABLE_VPP	IO_PADR |= VPP_MASK
+#define __IOW(x)	(*(volatile unsigned long *) (x))
+
+/* Status Register Bit Definition */
+#define FLS_READY		0x00800080	/* 1: Ready	0: Busy */
+#define FLS_ERASE_SUSPEND	0x00400040	/* 1: Suspend	0: Erase-Complete */
+#define FLS_ERASE		0x00200020	/* 1: Error	0: Success */
+#define FLS_PROGRAM		0x00100010	/* 1: Error	0: Success */
+#define FLS_VPP			0x00080008	/* 1: Vpp Low	0: Vpp Ok */
+#define FLS_PROG_SUSPEND	0x00040004	/* 1: Suspend	0: Program-Complete */
+#define FLS_LOCK		0x00020002	/* 1: Locked	0: no-Lock */
+
+#define	__move2RAM	__attribute__ ((__section__ (".text.xip_ram")))
+
+#if 0	// it's a code in include/asm-arm/arch-clps7111/hardware.h
+#define FLASH_BASE		0x70000000
+
+#ifdef CONFIG_BOOT_FLASH_SCHM100
+#define FLASH_START		0x00000000
+#else
+#define FLASH_START		0x70000000
+#endif
+						/* size */
+#define FLASH_SIZE		0x00400000	/*  4M */
+
+/* Flash Map info. */
+				/* 32k, Monitor Code Area */
+#define FLASH_START_1		(FLASH_START)
+#define FLASH_SIZE_1		0x00008000
+				/* 128k - 32k, BootBlock */
+#define FLASH_START_2		(FLASH_START_1 + FLASH_SIZE_1)
+#define FLASH_SIZE_2		(0x00020000 - FLASH_SIZE_1)
+				/* 1M - 128k, boot/Kernel, NonBootBlock */
+#define FLASH_START_3		(FLASH_START_2 + FLASH_SIZE_2)
+#define FLASH_SIZE_3		(FLASH_START + 0x00100000 - FLASH_START_3)
+				/* 3M, fs Area, NBB */
+#define FLASH_START_4		(FLASH_START_3 + FLASH_SIZE_3)
+#define FLASH_SIZE_4		(FLASH_START + FLASH_SIZE - FLASH_START_4)
+
+#ifdef USE_2_BLOCK		/* reserved area for appl. XIP */
+# define XIP_SIZE		0x00100000
+# define XIP_BASE		FLASH_START + FLASH_SIZE - XIP_SIZE
+#endif
+#endif	// #if 0
diff --exclude=CVS -ruN mtd/kernel/schm100_xip.c linux/drivers/mtd/schm100_xip.c
--- mtd/kernel/schm100_xip.c	Thu Jan  1 09:00:00 1970
+++ linux/drivers/mtd/schm100_xip.c	Mon Oct 16 10:50:00 2000
@@ -0,0 +1,570 @@
+/*
+ * $Id: schm100_xip.c,v 1.3 2000/10/16 01:50:00 tolkien Exp $
+ *
+ * Intel 3 volt Advanced Boot Block Flash Memory Device
+ * based in drivers/mtd/nora.c, drivers/mtd/cfi_cmd_0001.c
+ * when kernel XIP.
+ *
+ * Author:
+ *       Yong-iL Joh <tolkien@mizi.com>
+ *       Copyright 2000 Mizi Research
+ *
+ * License: 
+ *	 As part of this driver was derrived from the slram.c driver it falls
+ *	 under the same license, which is GNU General Public License v2
+ *
+ * Description: 
+ *	 This driver is intended to support the Boot Block Flash device from
+ *	 Intel Inc. in SAMSUNG SmartPhone SCH-M100. There are two Intel NOR
+ *	 16bit-wide FlashROMs, but assembled in parallel, so we must use them
+ *	 as single 32bit-wide NOR FlashROMs. Therefore there is no
+ *	 consideration to multi-chips.
+ *
+ */
+
+#define USE_2_BLOCK		1
+#define DO_NOT_PERMIT_INTERRUPT	1
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+
+#include <linux/malloc.h>
+#include <linux/delay.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/flashchip.h>
+#include <asm/arch/hardware.h>
+#include <asm/io.h>
+
+#include "schm100.h"
+
+/* FlashChip Info. */
+static struct flchip *chip;
+#define set_current_state(x) current->state = (x);
+#define	UDELAY_N	1000
+
+__move2RAM
+int schm100_mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+    unsigned long addr;
+
+    addr = from + (unsigned long)mtd->priv;
+    if (len > mtd->size - from)	len = mtd->size - from;
+    if (len < 1)	return -EINVAL;
+
+    spin_lock_bh(chip->mutex);
+    __IOW(addr & 0xFFFFFFFC) = FLASH_READ_ARRAY;
+    spin_unlock_bh(chip->mutex);
+    // since FlashROM's area is USER domain, we need not to use copy_to_user()
+    memcpy(buf, (void *)addr, len);
+    *retlen = len;
+    return 0;
+}
+
+__move2RAM
+int schm100_erase_oneblock(unsigned long addr) {
+    int ret;
+    unsigned long status;
+
+    addr &= 0xFFFFFFFC;
+    __IOW(addr) = FLASH_CLEAR_STATUS;
+    __IOW(addr) = FLASH_ERASE;
+    __IOW(addr) = FLASH_ERASE_CONFIRM;
+    __IOW(addr) = FLASH_READ_STATUS;
+
+    while ((__IOW(addr) & FLS_READY) != FLS_READY) {}
+
+    status = __IOW(addr);
+    if ((status & FLS_VPP) != FLS_VPP) {
+	if ((status & (FLS_ERASE | FLS_PROGRAM)) != (FLS_ERASE | FLS_PROGRAM)) {
+	    if ((status & FLS_ERASE) != FLS_ERASE) {
+		if ((status & FLS_LOCK) != FLS_LOCK) {
+		    ret = 0;		// successful
+		} else {
+		    ret = -EWOULDBLOCK;	// access a locked block
+		}
+	    } else {
+		ret = -EIO;		// Error
+	    }
+	} else {
+	    ret = -EINVAL;		// Command Sequence Error
+	}
+    } else {
+	ret = -EIO;			// Vpp range Error
+    }
+    __IOW(addr) = FLASH_CLEAR_STATUS;
+    __IOW(addr) = FLASH_READ_ARRAY;
+
+    return ret;
+}
+
+__move2RAM
+int schm100_write_32(unsigned long addr, unsigned long datum) {
+    int ret;
+    unsigned long status;
+
+    addr &= 0xFFFFFFFC;
+    __IOW(addr) = FLASH_CLEAR_STATUS;
+    __IOW(addr) = FLASH_WRITE;
+    __IOW(addr) = datum;
+    __IOW(addr) = FLASH_READ_STATUS;
+
+    while ((__IOW(addr) & FLS_READY) != FLS_READY) {}
+
+    status = __IOW(addr);
+    if ((status & FLS_VPP) != FLS_VPP) {
+	if ((status & FLS_PROGRAM) != FLS_PROGRAM) {
+	    if ((status & FLS_LOCK) != FLS_LOCK) {
+		ret = 0;		// successful
+	    } else {
+		ret = -EWOULDBLOCK;	// access a locked block
+	    }
+	} else {
+	    ret = -EINVAL;		// Command Sequence Error
+	}
+    } else {
+	ret = -EIO;			// Vpp range Error
+    }
+    __IOW(addr) = FLASH_CLEAR_STATUS;
+    __IOW(addr) = FLASH_READ_ARRAY;
+
+    return ret;
+}
+
+static int schm100_mtd_erase (struct mtd_info *mtd, struct erase_info *instr)
+{
+  int ret = 0;
+  unsigned long adr, len;
+  unsigned long old_policy, old_rt_priority;
+#define RT_ERASE(addr)	{	\
+		spin_lock_irq(&runqueue_lock);	\
+		read_lock(&tasklist_lock);	\
+		old_policy = current->policy;	\
+		old_rt_priority = current->rt_priority;	\
+		current->policy = SCHED_OTHER;	\
+		current->rt_priority = 0;	\
+		current->need_resched = 1;	\
+		ret = schm100_erase_oneblock(addr);	\
+		current->policy = old_policy;	\
+		current->rt_priority = old_rt_priority;	\
+		current->need_resched = 1;	\
+		read_unlock(&tasklist_lock);	\
+		spin_unlock_irq(&runqueue_lock);	\
+		if (ret)	return ret;	\
+		}
+
+  if (instr->addr & (mtd->erasesize - 1))
+    return -EINVAL;
+
+  if (instr->len & (mtd->erasesize - 1))
+    return -EINVAL;
+
+  if ((instr->len + instr->addr) > mtd->size)
+    return -EINVAL;
+
+  ENABLE_VPP;
+
+  adr = instr->addr + (unsigned long)mtd->priv;
+  len = instr->len;
+
+  while(len) {
+    RT_ERASE(adr);
+
+    adr += mtd->erasesize;
+    len -= mtd->erasesize;
+  }
+
+  if (instr->callback)
+    instr->callback(instr);
+
+  DISABLE_VPP;
+  return 0;
+}
+
+static int schm100_mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
+{
+  int ret = 0;
+  unsigned long tmp, addr;
+  unsigned long old_policy, old_rt_priority;
+#if 0	// hacked by tolkien, memory dump. :)
+  int i,j,k;
+  u_char *str, *chr;
+#endif
+
+#define RT_WRITE(addr, datum)	{	\
+		spin_lock_irq(&runqueue_lock);	\
+		read_lock(&tasklist_lock);	\
+		old_policy = current->policy;	\
+		old_rt_priority = current->rt_priority;	\
+		current->policy = SCHED_OTHER;	\
+		current->rt_priority = 0;	\
+		current->need_resched = 1;	\
+		ret = schm100_write_32((addr), (datum));	\
+		current->policy = old_policy;	\
+		current->rt_priority = old_rt_priority;	\
+		current->need_resched = 1;	\
+		read_unlock(&tasklist_lock);	\
+		spin_unlock_irq(&runqueue_lock);	\
+		if (ret)	return ret;	\
+		}
+ 
+  *retlen = 0;
+  addr = to + (unsigned long)mtd->priv;
+
+#if 0	// hacked by tolkien, memory dump. :)
+#define	ONE_LINE	16
+  str = chr = buf;
+  printk("\n WRITE");
+  printk("\n[0x%08lx]:", addr);
+  for(i=0, k=0; i < len; i++, str++) {
+      if ((i != 0) && ((i % ONE_LINE) == 0)) {
+	  printk("\t");
+	  for(j=0; j < ONE_LINE; j++, chr++) {
+	      if ((*chr >= 0x20) && (*chr <= 0x7E)) {
+		  printk("%c", *chr);
+	      } else {
+		  printk(".");
+	      }
+	  }
+	  printk("\n[0x%08lx]:", addr + i);
+	  k += ONE_LINE;
+      }
+      printk("%02x ", *str);
+  }
+  printk("\t");
+  for(j=0; j < (i - k); j++, chr++) {
+      if ((*chr >= 0x20) && (*chr <= 0x7E)) {
+	  printk("%c", *chr);
+      } else {
+	  printk(".");
+      }
+  }
+  printk("\n");
+#endif
+
+  if (len < 1) return -EINVAL;
+  ENABLE_VPP;
+
+  /* If it's not word-aligned, do the first byte write */
+  tmp = addr & 0x03;
+  if (tmp) {
+      switch (tmp) {
+      case 0x01: tmp = 0xFF | ((*buf) << 8) | ((*(buf + 1)) << 16) | ((*(buf + 2)) << 24);
+	  break;
+      case 0x02: tmp = 0xFFFF | ((*buf) << 16) | ((*(buf + 1)) << 24);
+	  break;
+      case 0x03: tmp = 0xFFFFFF | ((*buf) << 24);
+	  break;
+      }
+      RT_WRITE(addr, tmp);
+
+      tmp = 4 - (addr & 0x03);
+      buf += tmp;
+      (*retlen) += tmp;
+      len -= tmp;
+      addr += tmp;
+  }
+
+  while(len > 3) {
+    RT_WRITE(addr, *(unsigned long *)buf);
+
+    addr += 4;
+    buf += 4;
+    (*retlen) += 4;
+    len -= 4;
+  }
+
+  /* Final byte to write */
+  if (len > 0) {
+      switch (len) {
+      case 0x01: tmp = 0xFFFFFF00 | (*buf);
+	  break;
+      case 0x02: tmp = 0xFFFF0000 | (*buf) | ((*(buf + 1)) << 8);
+	  break;
+      case 0x03: tmp = 0xFF000000 | (*buf) | ((*(buf + 1)) << 8) | ((*(buf + 2)) << 16);
+	  break;
+      }
+      RT_WRITE(addr, tmp);
+      (*retlen) += len;
+  }
+
+  DISABLE_VPP;
+  return 0;
+}
+
+#ifndef DO_NOT_PERMIT_INTERRUPT
+static void schm100_mtd_sync (struct mtd_info *mtd)
+{
+  DECLARE_WAITQUEUE(wait, current);
+
+ retry:
+  spin_lock_bh(chip->mutex);
+
+  switch(chip->state) {
+  case FL_READY:
+  case FL_STATUS:
+  case FL_CFI_QUERY:
+  case FL_JEDEC_QUERY:
+    chip->oldstate = chip->state;
+    chip->state = FL_SYNCING;
+    /* No need to wake_up() on this state change - 
+     * as the whole point is that nobody can do anything
+     * with the chip now anyway.
+     */
+  case FL_SYNCING:
+    spin_unlock_bh(chip->mutex);
+    break;
+
+  default:
+    /* Not an idle state */
+    add_wait_queue(&chip->wq, &wait);
+
+    spin_unlock_bh(chip->mutex);
+    schedule();
+    remove_wait_queue(&chip->wq, &wait);
+
+    goto retry;
+  }
+
+  /* Unlock the chips again */
+  spin_lock_bh(chip->mutex);
+
+  if (chip->state == FL_SYNCING) {
+    chip->state = chip->oldstate;
+    wake_up(&chip->wq);
+  }
+  spin_unlock_bh(chip->mutex);
+}
+
+static int schm100_mtd_suspend (struct mtd_info *mtd)
+{
+  int ret = 0;
+
+  spin_lock_bh(chip->mutex);
+
+  switch(chip->state) {
+  case FL_READY:
+  case FL_STATUS:
+  case FL_CFI_QUERY:
+  case FL_JEDEC_QUERY:
+    chip->oldstate = chip->state;
+    chip->state = FL_PM_SUSPENDED;
+    /* No need to wake_up() on this state change - 
+     * as the whole point is that nobody can do anything
+     * with the chip now anyway.
+     */
+  case FL_PM_SUSPENDED:
+    spin_unlock_bh(chip->mutex);
+    break;
+
+  default:
+    ret = -EAGAIN;
+    break;
+  }
+
+  /* Unlock the chips again */
+  spin_lock_bh(chip->mutex);
+
+  if (chip->state == FL_PM_SUSPENDED) {
+    chip->state = chip->oldstate;
+    wake_up(&chip->wq);
+  }
+  spin_unlock_bh(chip->mutex);
+	
+  return ret;
+}
+
+static void schm100_mtd_resume (struct mtd_info *mtd)
+{
+  spin_lock_bh(chip->mutex);
+
+  if (chip->state == FL_PM_SUSPENDED) {
+    chip->state = chip->oldstate;
+    wake_up(&chip->wq);
+  }
+  else
+    printk("Argh. Chip not in PM_SUSPENDED state upon resume()\n");
+
+  spin_unlock_bh(chip->mutex);
+}
+#endif
+
+#define BBFL_BOOT_BLOCK_SIZE	0x004000
+#define BBFL_BLOCK_SIZE		0x020000
+#ifdef USE_2_BLOCK
+#  define SCHM100_MTD_BLOCK_NO	1
+#else
+#  define SCHM100_MTD_BLOCK_NO	2
+#endif
+
+static struct mtd_info my_mtds[SCHM100_MTD_BLOCK_NO] = {
+#ifndef USE_2_BLOCK
+  {
+    type: MTD_NORFLASH,
+    flags: MTD_CAP_NORFLASH,
+    size: FLASH_SIZE_4,
+    erasesize: BBFL_BLOCK_SIZE,
+    name: "FileSystem",
+    module: THIS_MODULE,
+    erase: schm100_mtd_erase,
+    read: schm100_mtd_read,
+    write: schm100_mtd_write,
+    suspend: schm100_mtd_suspend,
+    resume: schm100_mtd_resume,
+    sync: schm100_mtd_sync,
+  }
+#else
+  {
+    type: MTD_NORFLASH,
+    flags: MTD_CAP_NORFLASH,
+    size: FLASH_SIZE_4 - XIP_SIZE,
+    erasesize: BBFL_BLOCK_SIZE,
+    name: "FileSystem",
+    module: THIS_MODULE,
+    erase: schm100_mtd_erase,
+    read: schm100_mtd_read,
+    write: schm100_mtd_write,
+#ifndef DO_NOT_PERMIT_INTERRUPT
+    suspend: schm100_mtd_suspend,
+    resume: schm100_mtd_resume,
+    sync: schm100_mtd_sync,
+#else
+    suspend: NULL,
+    resume: NULL,
+    sync: NULL,
+#endif
+  },
+  {
+    type: MTD_NORFLASH,
+    flags: MTD_CAP_NORFLASH | MTD_XIP,
+    size: XIP_SIZE,
+    erasesize: BBFL_BLOCK_SIZE,
+    name: "ROM disk",
+    module: THIS_MODULE,
+    erase: schm100_mtd_erase,
+    read: schm100_mtd_read,
+    write: schm100_mtd_write,
+#ifndef DO_NOT_PERMIT_INTERRUPT
+    suspend: schm100_mtd_suspend,
+    resume: schm100_mtd_resume,
+    sync: schm100_mtd_sync,
+#else
+    suspend: NULL,
+    resume: NULL,
+    sync: NULL,
+#endif
+  }
+#endif
+};
+
+#if LINUX_VERSION_CODE < 0x20300
+#ifdef MODULE
+#define init_schm100_mtd	init_module
+#define cleanup_schm100_mtd	cleanup_module
+
+static void __exit cleanup_schm100_mtd(void)
+{
+    del_mtd_device(&my_mtds[0]);
+    iounmap((void *)my_mtds[0].priv);
+#ifndef USE_2_BLOCK
+    del_mtd_device(&my_mtds[1]);
+    iounmap((void *)my_mtds[1].priv);
+#endif
+    kfree(chip);
+}
+#endif
+#endif
+
+__move2RAM
+int get_flash_id(void)
+{
+    volatile unsigned int c1, c2;
+    int i;
+
+    /*
+     * try to get flash chip ID
+     */
+    __IOW(FLASH_BASE) = FLASH_READ_ID;
+    for(i=0; i < 15 * UDELAY_N; i++) i = i;
+    c1 = __IOW(FLASH_BASE);
+    c2 = __IOW(FLASH_BASE + 4);
+
+    /*
+     * set it back to read mode
+     */
+    __IOW(FLASH_BASE) = FLASH_READ_ARRAY;
+
+    return c2;
+}
+
+#define	KFLASH_ID	0x88918891	// Intel 28F160B3 x 2
+int __init init_schm100_mtd(void)
+{
+  int id;
+  unsigned long tmp;
+
+  id = get_flash_id();
+  if (id != KFLASH_ID) {
+    printk("Flash: incorrect ID 0x%04X.\n", id);
+    return -ENXIO;
+  }
+  printk("Flash: device ID 0x%04X, size 4Mbyte.\n", id);
+
+  /* set 32bit wide, Memory Configuration Register 1 - NCS0 */
+  tmp = IO_SYSFLG1 & BOOTBIT;
+  switch (tmp) {
+  case BOOTBIT_32:
+      IO_MEMCFG1 |= CS_BW_BUS32_E0;
+      break;
+  case BOOTBIT_8:
+      IO_MEMCFG1 |= CS_BW_BUS32_E1;
+      break;
+  case BOOTBIT_16:
+      IO_MEMCFG1 |= CS_BW_BUS32_E2;
+      break;
+  }
+
+#ifndef USE_2_BLOCK
+  my_mtds[0].priv = (void *)__ioremap(FLASH_START_4, FLASH_SIZE_4, PTE_AP_READ);
+#else
+  my_mtds[0].priv = (void *)__ioremap(FLASH_START_4, FLASH_SIZE_4 - XIP_SIZE, PTE_AP_READ);
+  my_mtds[1].priv = (void *)__ioremap(FLASH_START_4 + FLASH_SIZE_4 - XIP_SIZE, XIP_SIZE, PTE_AP_READ);
+#endif
+  DEBUG(MTD_DEBUG_LEVEL1, "[%s:%d] mtd[0]=%lx,size=%lx,priv=%lx\n", __FILE__, __LINE__, &my_mtds[0], (unsigned long)my_mtds[0].size, (unsigned long)my_mtds[0].priv);
+#ifdef USE_2_BLOCK
+  DEBUG(MTD_DEBUG_LEVEL1, "[%s:%d] mtd[1]=%lx,size=%lx,priv=%lx\n", __FILE__, __LINE__, &my_mtds[1], (unsigned long)my_mtds[1].size, (unsigned long)my_mtds[1].priv);
+#endif
+
+  chip = (struct flchip *)kmalloc(sizeof(struct flchip), GFP_KERNEL);
+  memset(chip, 0, sizeof(struct flchip));
+  init_waitqueue_head(&chip->wq);
+  spin_lock_init(&chip->_spinlock);
+  chip->start = (unsigned long)my_mtds[0].priv;
+#if 0	// hacked by tolkien
+  chip->state = FL_STATUS;
+#else
+  __IOW(chip->start) = FLASH_READ_ARRAY;
+  chip->state = FL_READY;
+#endif
+  chip->mutex = &chip->_spinlock;
+
+  add_mtd_device(&my_mtds[0]);
+#ifdef USE_2_BLOCK
+  add_mtd_device(&my_mtds[1]);
+#endif
+  DISABLE_VPP;
+
+  return 0;
+}
+
+/*
+ | $Id: schm100_xip.c,v 1.3 2000/10/16 01:50:00 tolkien Exp $
+ |
+ | Local Variables:
+ | mode: c
+ | mode: font-lock
+ | version-control: t
+ | delete-old-versions: t
+ | End:
+ |
+ | -*- End-Of-File -*-
+ */

--opJtzjQTFsWo+cga--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
