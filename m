Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Le9k-0008Py-00
	for mtd-list@infradead.org; Mon, 07 Aug 2000 05:04:52 +0100
Received: from tinuviel.mizi.com ([211.116.76.10])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Le9f-0008PW-00
	for mtd@infradead.org; Mon, 07 Aug 2000 05:04:48 +0100
Received: (from tolkien@localhost)
	by tinuviel.mizi.com (8.9.3/8.9.3) id NAA06581
	for mtd@infradead.org; Mon, 7 Aug 2000 13:04:34 +0900
Date: Mon, 7 Aug 2000 13:04:34 +0900
From: Yong-iL Joh <tolkien@mizi.com>
To: mtd@infradead.org
Subject: MTD lowlevel driver for SCH-M100
Message-ID: <20000807130434.A6519@tinuviel.mizi.com>
Reply-To: tolkien@mizi.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="/04w6evG8XlLl3ft"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii

we are working on SAMSUNG smartphone SCH-M100.
this is low level mtd driver for Intel BootBlock FlashROM (28F160B3)
because SAMSUNG combine two 16bit-wide Flashes in parellel way,
it seems to be 32bit-wide FlashROM.

-- 
Joh, Yong-iL
E-mail: tolkien@nownuri.net tolkien@mizi.com

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mtd.diff"

diff -ruN mtd/kernel/Config.in linux/drivers/mtd/Config.in
--- mtd/kernel/Config.in	Fri Aug  4 01:04:16 2000
+++ linux/drivers/mtd/Config.in	Mon Aug  7 12:20:41 2000
@@ -29,6 +29,7 @@
       int 'Device size in kB' CONFIG_MTDRAM_TOTAL_SIZE 4096
       int 'Size of the erase sectors in kB' CONFIG_MTDRAM_ERASE_SIZE 128
    fi
+   dep_tristate '  Flash chips on SCH-M100' CONFIG_MTD_SCHM100 $CONFIG_MTD
 
 comment 'MTD drivers for mapped chips'
    dep_tristate '  Common Flash Interface (CFI) support' CONFIG_MTD_CFI $CONFIG_MTD
diff -ruN mtd/kernel/Makefile linux/drivers/mtd/Makefile
--- mtd/kernel/Makefile	Tue Aug  1 01:04:11 2000
+++ linux/drivers/mtd/Makefile	Mon Aug  7 12:20:36 2000
@@ -57,6 +57,7 @@
 obj-$(CONFIG_MTD_SLRAM)		+= slram.o
 obj-$(CONFIG_MTD_PMC551)	+= pmc551.o
 obj-$(CONFIG_MTD_MTDRAM)	+= mtdram.o
+obj-$(CONFIG_MTD_SCHM100)	+= schm100.o
 
 # Chip drivers
 obj-$(CONFIG_MTD_JEDEC)		+= jedec.o
diff -ruN mtd/kernel/mtdcore.c linux/drivers/mtd/mtdcore.c
--- mtd/kernel/mtdcore.c	Sat Aug  5 01:04:12 2000
+++ linux/drivers/mtd/mtdcore.c	Mon Aug  7 12:20:33 2000
@@ -1,5 +1,5 @@
 /*
- * $Id: mtdcore.c,v 1.14 2000/08/03 16:16:53 dvrabel Exp $
+ * $Id: mtdcore.c,v 1.7 2000/08/07 02:37:14 tolkien Exp $
  *
  * Core registration and callback routines for MTD 
  * drivers and users.
@@ -65,12 +65,15 @@
 #ifdef CONFIG_MTD_PMC551
 extern int init_pmc551(void);
 #endif
-#ifdef CONFIG_MTD_NORA
-extern int init_nora(void);
+#ifdef CONFIG_MTD_SCHM100
+extern int init_schm100_mtd(void);
 #endif
 #ifdef CONFIG_MTD_SBC_MEDIAGX
 extern int init_sbc_mediagx(void);
 #endif
+#ifdef CONFIG_MTD_NORA
+extern int init_nora(void);
+#endif
 #ifdef CONFIG_FTL
 extern int init_ftl(void);
 #endif
@@ -416,12 +419,15 @@
 #ifdef CONFIG_MTD_PMC551
 	init_pmc551();
 #endif
-#ifdef CONFIG_MTD_NORA
-	init_nora();
+#ifdef CONFIG_MTD_SCHM100
+	init_schm100_mtd();
 #endif
 #ifdef CONFIG_MTD_SBC_MEDIAGX
 	init_sbc_mediagx();
 #endif
+#ifdef CONFIG_MTD_NORA
+	init_nora();
+#endif
 #ifdef CONFIG_MTD_MTDRAM
 	init_mtdram();
 #endif
@@ -495,5 +501,3 @@
 module_init(init_mtd);
 module_exit(cleanup_mtd);
 #endif
-
-
diff -ruN mtd/kernel/schm100.c linux/drivers/mtd/schm100.c
--- mtd/kernel/schm100.c	Thu Jan  1 09:00:00 1970
+++ linux/drivers/mtd/schm100.c	Mon Aug  7 12:41:16 2000
@@ -0,0 +1,667 @@
+/*
+ * $Id: schm100.c,v 1.4 2000/08/07 02:37:14 tolkien Exp $
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
+inline static int schm100_flash_wait(unsigned long addr, struct wait_queue *wait_p,
+				     unsigned long *timeo_p, const char *str) {
+  __u32 status;
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
+#if 0
+  case FL_ERASING:
+  case FL_WRITING:
+    /* Suspend the operation, set state to FL_xxx_SUSPENDED */
+#endif
+  case FL_CFI_QUERY:
+  case FL_JEDEC_QUERY:
+  case FL_READY:
+      __IOW(addr) = FLASH_READ_STATUS;
+      chip->state = FL_STATUS;
+
+  case FL_STATUS:
+    status = __IOW(addr);
+    *timeo_p = jiffies + HZ;
+
+    if (!(status & FLS_WRITE)) {
+      static int z=0;
+      /* Urgh. Chip not yet ready to talk to us. */
+      if (time_after(jiffies, *timeo_p)) {
+	spin_unlock_bh(chip->mutex);
+	printk("waiting for chip to be ready timed out in %s", str);
+	return -EIO;
+      }
+
+      /* Latency issues. Drop the lock, wait a while and retry */
+      spin_unlock_bh(chip->mutex);
+
+      z++;
+      if ( 0 && !(z % 100 )) 
+	printk("chip not ready yet before %s. looping\n", str);
+
+      udelay(1);
+
+      goto retry;
+    }
+    break;
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
+
+    if(signal_pending(current))
+      return -EINTR;
+
+    *timeo_p = jiffies + HZ;
+
+    goto retry;
+  }
+
+  return 0;
+}
+
+inline static int schm100_flash_wait2(unsigned long addr, struct wait_queue *wait_p, \
+				     unsigned long *timeo_p, flstate_t fls, int *z_p) {
+  __u32 status, condition;
+  char *str, *str2;
+
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
+  while ( !( (status = __IOW(addr)) & FLS_WRITE ) ) {
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
+
+      if (signal_pending(current))
+	return -EINTR;
+
+      *timeo_p = jiffies + (HZ*2); /* FIXME */
+      spin_lock_bh(chip->mutex);
+      continue;
+    }
+
+    /* OK Still waiting */
+    if (time_after(jiffies, *timeo_p)) {
+      chip->state = FL_STATUS;
+      spin_unlock_bh(chip->mutex);
+      printk(str2);
+      return -EIO;
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
+  }
+
+  if (status & condition) {
+      __IOW(addr) = FLASH_CLEAR_STATUS;
+      __IOW(addr) = FLASH_READ_STATUS;
+      return status & condition;
+  }
+  return 0;
+}
+
+static int schm100_mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf)
+{
+  unsigned long timeo = jiffies + HZ, addr;
+  DECLARE_WAITQUEUE(wait, current);
+  int ret;
+
+  addr = from + (unsigned long)mtd->priv;
+  if (len > mtd->size - from)	len = mtd->size - from;
+  if (len < 1)	return -EINVAL;
+
+  ret = schm100_flash_wait(addr, &wait, &timeo, "read");
+  if (ret != 0)	return ret;
+
+  __IOW(addr) = FLASH_READ_ARRAY;
+  chip->state = FL_READY;
+
+  // since FlashROM's area is USER domain, we need not to use copy_to_user()
+  memcpy(buf, (void *)addr, len);
+  *retlen = len;
+
+  if (chip->state == FL_ERASE_SUSPENDED || 
+      chip->state == FL_WRITE_SUSPENDED) {
+    printk("Who in hell suspended the pending operation? I didn't write that code yet!\n");
+    /* Restart it and set the state accordingly */
+  }
+
+  wake_up(&chip->wq);
+  spin_unlock_bh(chip->mutex);
+
+  return 0;
+}
+
+static int schm100_erase_oneblock(unsigned long addr)
+{
+  unsigned long timeo = jiffies + HZ;
+  DECLARE_WAITQUEUE(wait, current);
+  int ret, z;
+
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
+  chip->state = FL_STATUS;
+  wake_up(&chip->wq);
+  spin_unlock_bh(chip->mutex);
+
+  return 0;
+}
+
+static int schm100_mtd_erase (struct mtd_info *mtd, struct erase_info *instr)
+{
+  unsigned long adr, len;
+  int ret = 0;
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
+
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
+static int schm100_write_32(unsigned long addr, __u32 datum)
+{
+  unsigned long timeo = jiffies + HZ;
+  DECLARE_WAITQUEUE(wait, current);
+  int ret, z;
+
+#ifdef CONFIG_DEBUG_SCHM100_MTD
+  printk("[%s:%d] addr=%lx, datum=%lx\n", __FILE__, __LINE__, addr, datum);
+#endif
+  ret = schm100_flash_wait(addr, &wait, &timeo, "write");
+  if (ret != 0)	return ret;
+
+  addr &= 0xFFFFFFFC;
+
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
+  chip->state = FL_STATUS;
+  wake_up(&chip->wq);
+  spin_unlock_bh(chip->mutex);
+  
+  //printk("write ret OK at %lx\n", adr);
+  return 0;
+}
+
+static int schm100_mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf)
+{
+  int ret = 0;
+  __u32 tmp;
+  unsigned long addr;
+
+  *retlen = 0;
+  addr = to + (unsigned long)mtd->priv;
+
+  if (len < 1) return -EINVAL;
+  ENABLE_VPP;
+
+#if 0
+  /* If it's not word-aligned, do the first byte write */
+  tmp = 4 - addr & 0x03;
+  switch (tmp) {
+  case 0x01:
+      ret = schm100_write_32(addr, 0xFFFFFF | (*buf << 24));
+      break;
+  case 0x02:
+      ret = schm100_write_32(addr, 0xFFFF | ((*(__u16 *) tmp) << 16));
+      break;
+  case 0x03: tmp = 0xFF | (*buf << 24);
+      buf++;	tmp |= (*buf << 16);
+      buf++;	tmp |= (*buf << 8);
+      ret = schm100_write_32(addr, tmp);
+      break;
+  }
+  if (ret)	return ret;
+
+  tmp = addr & 0x03;
+  buf++;
+  (*retlen) += tmp;
+  len -= tmp;
+  addr += tmp;
+#endif
+
+  while(len > 3) {
+    ret = schm100_write_32(addr, *(__u32 *)buf);
+    if (ret)	return ret;
+
+    addr += 4;
+    buf += 4;
+    (*retlen) += 4;
+    len -= 4;
+  }
+
+#if 0
+  /* Final byte to write */
+  switch (len) {
+  case 0x01:
+      ret = schm100_write_32(addr, 0xFFFFFF00 | (*buf));
+      if (ret)	return ret;
+      break;
+  case 0x02: tmp = 0xFFFF0000 | (*buf);
+      buf++;	tmp |= (*buf << 8);
+      ret = schm100_write_32(addr, tmp);
+      if (ret)	return ret;
+      break;
+  case 0x03: tmp = 0xFF000000 | (*buf);
+      buf++;	tmp |= (*buf << 8);
+      buf++;	tmp |= (*buf << 16);
+      ret = schm100_write_32(addr, tmp);
+      if (ret)	return ret;
+      break;
+  }
+  (*retlen) += len;
+#endif
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
+    spin_unlock_bh(chip->mutex);
+    break;
+
+  default:
+    /* Not an idle state */
+    add_wait_queue(&chip->wq, &wait);
+
+    spin_unlock_bh(chip->mutex);
+    schedule();
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
+#ifdef CONFIG_SCHM100_MTD_4BLOCK
+static struct mtd_info my_mtds[4] = {
+#else
+static struct mtd_info my_mtds[3] = {
+#endif
+  /* MonitorCode, BootBlock, boot/kernel, fs */
+#ifdef CONFIG_SCHM100_MTD_4BLOCK
+  {
+    type: MTD_NORFLASH,
+    flags: MTD_CAP_NORFLASH,
+    size: FLASH_SIZE_1,
+    erasesize: BBFL_BOOT_BLOCK_SIZE,
+    name: "Monitor Code Area",
+    module: THIS_MODULE,
+    erase: NULL,
+    read: schm100_mtd_read,
+    write: NULL,
+    suspend: NULL,
+    resume: NULL,
+    sync: NULL,
+  },
+#endif
+  {
+    type: MTD_NORFLASH,
+    flags: MTD_CAP_NORFLASH,
+    size: FLASH_SIZE_2,
+    erasesize: BBFL_BOOT_BLOCK_SIZE,
+    name: "Boot Block",
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
+    flags: MTD_CAP_NORFLASH,
+    size: FLASH_SIZE_3,
+    erasesize: BBFL_BLOCK_SIZE,
+    name: "boot/Kernel",
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
+};
+
+#if LINUX_VERSION_CODE < 0x20300
+#ifdef MODULE
+#define init_schm100_mtd	init_module
+#define cleanup_schm100_mtd	cleanup_module
+
+static void __exit cleanup_schm100_mtd(void)
+{
+    int i;
+
+#ifdef CONFIG_SCHM100_MTD_4BLOCK
+    del_mtd_device(&my_mtds[2]);
+    del_mtd_device(&my_mtds[1]);
+    del_mtd_device(&my_mtds[0]);
+    del_mtd_device(&my_mtds[3]);
+    for(i=0; i<4; i++)
+	iounmap((void *)my_mtds[i].priv);
+#else
+    del_mtd_device(&my_mtds[1]);
+    del_mtd_device(&my_mtds[0]);
+    del_mtd_device(&my_mtds[2]);
+    for(i=0; i<3; i++)
+	iounmap((void *)my_mtds[i].priv);
+#endif
+    kfree(chip);
+}
+#endif
+#endif
+
+static int get_flash_id(void)
+{
+	volatile unsigned int c1, c2;
+
+	/*
+	 * try to get flash chip ID
+	 */
+	*(unsigned long *) (FLASH_STATUS) = FLASH_READ_ID;
+	udelay(15);
+	c1 = *(unsigned int *) FLASH_BASE;
+	c2 = *(unsigned int *) (FLASH_BASE + 4);
+
+	/*
+	 * set it back to read mode
+	 */
+	*(unsigned long *) (FLASH_STATUS) = FLASH_READ_ARRAY;
+
+	return c2;
+}
+
+#define	KFLASH_ID	0x88918891	// Intel 28F160B3 x 2
+int __init init_schm100_mtd(void)
+{
+  int id;
+
+  id = get_flash_id();
+  if (id != KFLASH_ID) {
+    printk("Flash: incorrect ID 0x%04X.\n", id);
+    return -ENXIO;
+  }
+  printk("Flash: device ID 0x%04X, size 4Mbyte.\n", id);
+
+#ifdef CONFIG_SCHM100_MTD_4BLOCK
+  my_mtds[0].priv = (void *)__ioremap(FLASH_START_1, FLASH_SIZE_1, PTE_AP_READ);
+  my_mtds[1].priv = (void *)__ioremap(FLASH_START_2, FLASH_SIZE_2, PTE_AP_READ);
+  my_mtds[2].priv = (void *)__ioremap(FLASH_START_3, FLASH_SIZE_3, PTE_AP_READ);
+  my_mtds[3].priv = (void *)__ioremap(FLASH_START_4, FLASH_SIZE_4, PTE_AP_READ);
+#else
+  my_mtds[0].priv = (void *)__ioremap(FLASH_START_2, FLASH_SIZE_2, PTE_AP_READ);
+  my_mtds[1].priv = (void *)__ioremap(FLASH_START_3, FLASH_SIZE_3, PTE_AP_READ);
+  my_mtds[2].priv = (void *)__ioremap(FLASH_START_4, FLASH_SIZE_4, PTE_AP_READ);
+#endif
+#ifdef CONFIG_DEBUG_SCHM100_MTD
+  printk("[%s:%d] mtd[0]=%lx,size=%lx,priv=%lx\n", __FILE__, __LINE__, &my_mtds[0], (unsigned long)my_mtds[0].size, (unsigned long)my_mtds[0].priv);
+  printk("[%s:%d] mtd[1]=%lx,size=%lx,priv=%lx\n", __FILE__, __LINE__, &my_mtds[1], (unsigned long)my_mtds[1].size, (unsigned long)my_mtds[1].priv);
+  printk("[%s:%d] mtd[2]=%lx,size=%lx,priv=%lx\n", __FILE__, __LINE__, &my_mtds[2], (unsigned long)my_mtds[2].size, (unsigned long)my_mtds[2].priv);
+#ifdef CONFIG_SCHM100_MTD_4BLOCK
+  printk("[%s:%d] mtd[3]=%lx,size=%lx,priv=%lx\n", __FILE__, __LINE__, &my_mtds[3], (unsigned long)my_mtds[3].size, (unsigned long)my_mtds[3].priv);
+#endif
+#endif
+
+  chip = (struct flchip *)kmalloc(sizeof(struct flchip), GFP_KERNEL);
+  memset(chip, 0, sizeof(struct flchip));
+  init_waitqueue_head(&chip->wq);
+  spin_lock_init(&chip->_spinlock);
+  chip->start = (unsigned long)my_mtds[0].priv;
+  chip->state = FL_READY;
+  chip->mutex = &chip->_spinlock;
+
+  //  mymtd = do_cfi_probe(&schm100_map);
+#ifdef CONFIG_SCHM100_MTD_4BLOCK
+  add_mtd_device(&my_mtds[3]);
+  add_mtd_device(&my_mtds[0]);
+  add_mtd_device(&my_mtds[1]);
+  add_mtd_device(&my_mtds[2]);
+#else
+  add_mtd_device(&my_mtds[2]);
+  add_mtd_device(&my_mtds[0]);
+  add_mtd_device(&my_mtds[1]);
+#endif
+  DISABLE_VPP;
+
+  return 0;
+}
+
diff -ruN mtd/kernel/schm100.h linux/drivers/mtd/schm100.h
--- mtd/kernel/schm100.h	Thu Jan  1 09:00:00 1970
+++ linux/drivers/mtd/schm100.h	Mon Aug  7 12:33:35 2000
@@ -0,0 +1,69 @@
+/*
+ * $Id: schm100.h,v 1.1 2000/08/07 02:37:14 tolkien Exp $
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
+#define FLASH_STATUS	FLASH_BASE + 0x4000
+#define __IOW(x)	(*(volatile __u32 *) (x))
+
+/* Status Register Bit Definition */
+#define FLS_WRITE		0x00800080	/* 1: Ready	0: Busy */
+#define FLS_ERASE_SUSPEND	0x00400040	/* 1: Suspend	0: Erase-Complete */
+#define FLS_ERASE		0x00200020	/* 1: Error	0: Success */
+#define FLS_PROGRAM		0x00100010	/* 1: Error	0: Success */
+#define FLS_VPP			0x00080008	/* 1: Vpp Low	0: Vpp Ok */
+#define FLS_PROG_SUSPEND	0x00040004	/* 1: Suspend	0: Program-Complete */
+#define FLS_LOCK		0x00020002	/* 1: Locked	0: no-Lock */
+
+/* Flash Map info. */
+#ifndef FLASH_ADDRESS_DEFINED
+#define FLASH_ADDRESS_DEFINED
+#  define FLASH_BASE		0x70000000	/* virtual */
+#  ifdef CONFIG_BOOT_FLASH_SCHM100
+#    define FLASH_START		0x00000000	/* physical */
+#  else
+#    define FLASH_START		0x70000000	/* physical */
+#  endif
+#  define FLASH_SIZE		0x00400000	/* size: 4M */
+
+				/* 32k, Monitor Code Area */
+#  define FLASH_START_1		(FLASH_START)
+#  define FLASH_SIZE_1		0x00008000
+				/* 128k - 32k, BootBlock */
+#  define FLASH_START_2		(FLASH_START_1 + FLASH_SIZE_1)
+#  define FLASH_SIZE_2		(0x00020000 - FLASH_SIZE_1)
+				/* 1M - 128k, boot/Kernel, NonBootBlock */
+#  define FLASH_START_3		(FLASH_START_2 + FLASH_SIZE_2)
+#  define FLASH_SIZE_3		(FLASH_START + 0x00100000 - FLASH_START_3)
+				/* 3M, fs Area, NBB */
+#  define FLASH_START_4		(FLASH_START_3 + FLASH_SIZE_3)
+#  define FLASH_SIZE_4		(FLASH_START + FLASH_SIZE - FLASH_START_4)
+#endif

--/04w6evG8XlLl3ft--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
