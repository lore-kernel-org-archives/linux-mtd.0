Received: from heimdall.doit.wisc.edu ([144.92.197.159]
	helo=smtp5.wiscmail.wisc.edu)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGTQI-0001CM-4v
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 02:54:42 +0100
Received: from conversion-daemon.smtp5.wiscmail.wisc.edu by
 smtp5.wiscmail.wisc.edu
 (iPlanet Messaging Server 5.2 HotFix 1.24 (built Dec 19 2003))
 id <0HWJ00G01ULJOI@smtp5.wiscmail.wisc.edu>
 (original mail from jelenz@students.wisc.edu)
 for linux-mtd@lists.infradead.org; Wed, 21 Apr 2004 20:54:38 -0500 (CDT)
Received: from hydra (wuzzeb.resnet.wisc.edu [146.151.47.253])
 by smtp5.wiscmail.wisc.edu
 (iPlanet Messaging Server 5.2 HotFix 1.24 (built Dec 19 2003))
 with ESMTP id <0HWJ008VTUN2YY@smtp5.wiscmail.wisc.edu> for
 linux-mtd@lists.infradead.org; Wed, 21 Apr 2004 20:54:38 -0500 (CDT)
Date: Wed, 21 Apr 2004 20:54:33 -0500
From: John Lenz <jelenz@students.wisc.edu>
To: linux-mtd@lists.infradead.org
Message-id: <20040422015433.GC27217@hydra>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_6UxphsTJTHRYvbghsvEvvw)"
Subject: pre-CFI sharp driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Boundary_(ID_6UxphsTJTHRYvbghsvEvvw)
Content-type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline

The device I am developing for is the Sharp Zaurus SL5500 (which is  
codenamed collie).  I am currently working on porting the kernel used  
for www.openzaurus.org from 2.4 to 2.6.  In 2.4, we used the pre-CFI  
sharp driver.  NOTE: the root filesystem is located on the flash  
device.  I am using the maps/sa1100-flash.c map.

I have tried using the Intel/Sharp flash chips (cfi_cmdset_0001.c) and  
cfi_probe and have had some success.

1) On a stock 2.6.5, doesn't work
2) On a 2.6.5 with the mtd cvs code using the Intel CFI driver and  
using cfi_probe, I am able to mount the root filesystem (jffs2) and am  
able to log in and busybox works and such.  When booting tho, there are  
a bunch of errors like
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00a00000:  
0x8080 instead.
I get around 50-60 of these messages at different addresses.
Note, the address given there is near the end of the flash.

But ignoring those, the root fs is still mounted.

But when I try and write a file, jffs2_flash_writev returns -15.  i.e.  
I get a "Write of x bytes at x failed.  returned -15, retlen 0" error.

The sharp device also starts up completly locked, and I have to add the  
following code to the maps/sa1100-collie.c after cfi_probe has been  
called.
{ int k;
for (k = 0; k < sa[i].mtd->numeraseregions; k++) {
	int retval;
	retval = sa[i].mtd->unlock(sa[i].mtd, sa[i].mtd->eraseregions 
[k].offset,
			sa[i].mtd->eraseregions[k].erasesize);
	if (retval)
		printk(KERN_WARNING "SA1100 flash: Error while  
unlocking region 0x%08x\n",
				sa[i].mtd->eraseregions[k].offset);
} }

It could be possible that since the 0x00a0000 is past the end of the  
last erase block (we create the jffs2 filesystem with the --pad  
option), they are still locked?  but why would that impact the  
scanning?

I am able to mount the root filesystem and write files and everything  
works with the attached patch  I don't even need the mtd cvs code, it  
works with just the stock 2.6.5 kernel.  This is just a forward port of  
the changes we had to sharp.c  note that we have defined AUTOUNLOCK.

This is difficult to debug, because I do not have any specs for the  
device.  The only reference we have is the code that sharp has  
released, which uses the pre-CFI device with the same changes I have  
attached.

John


--Boundary_(ID_6UxphsTJTHRYvbghsvEvvw)
Content-type: text/x-patch; charset=unknown-8bit; NAME=sharp.diff
Content-transfer-encoding: 7BIT
Content-disposition: attachment; filename=sharp.diff

--- linux-2.6.5/drivers/mtd/chips/sharp.c	2004-04-03 21:37:23.000000000 -0600
+++ linux-2.6.5-zaurus/drivers/mtd/chips/sharp.c	2004-04-21 16:47:49.000000000 -0500
@@ -25,6 +25,7 @@
 #include <linux/types.h>
 #include <linux/sched.h>
 #include <linux/errno.h>
+#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
@@ -58,9 +59,12 @@
 
 #define SR_ERRORS (SR_ERROR_ERASE|SR_ERROR_WRITE|SR_VPP|SR_PROTECT)
 
+#define BLOCK_MASK		0xfffe0000
+
 /* Configuration options */
 
-#undef AUTOUNLOCK  /* automatically unlocks blocks before erasing */
+//#undef AUTOUNLOCK  /* automatically unlocks blocks before erasing */
+#define AUTOUNLOCK
 
 struct mtd_info *sharp_probe(struct map_info *);
 
@@ -81,7 +85,7 @@
 static int sharp_erase_oneblock(struct map_info *map, struct flchip *chip,
 	unsigned long adr);
 #ifdef AUTOUNLOCK
-static void sharp_unlock_oneblock(struct map_info *map, struct flchip *chip,
+static inline void sharp_unlock_oneblock(struct map_info *map, struct flchip *chip,
 	unsigned long adr);
 #endif
 
@@ -104,6 +108,13 @@
 	.module		= THIS_MODULE
 };
 
+static void sharp_udelay(unsigned long i) {
+	if (in_interrupt()) {
+		udelay(i);
+	} else {
+		schedule();
+	}
+}
 
 struct mtd_info *sharp_probe(struct map_info *map)
 {
@@ -129,6 +140,7 @@
 		kfree(sharp);
 		return NULL;
 	}
+	//MSC0 = 0xfff8fff8;
 
 	mtd->priv = map;
 	mtd->type = MTD_NORFLASH;
@@ -142,7 +154,8 @@
 	mtd->name = map->name;
 
 	memset(sharp, 0, sizeof(*sharp));
-	sharp->chipshift = 23;
+	//sharp->chipshift = 23;
+	sharp->chipshift = 24;
 	sharp->numchips = 1;
 	sharp->chips[0].start = 0;
 	sharp->chips[0].state = FL_READY;
@@ -171,8 +184,9 @@
 
 	read0=map_read32(map, base+0);
 	read4=map_read32(map, base+4);
-	if(read0 == 0x89898989){
-		printk("Looks like sharp flash\n");
+	//if(read0 == 0x89898989){
+	if (read0 == 0x00b000b0) {
+		//printk("Looks like sharp flash\n");
 		switch(read4){
 		case 0xaaaaaaaa:
 		case 0xa0a0a0a0:
@@ -187,6 +201,11 @@
 			mtd->erasesize = 0x10000 * width;
 			mtd->size = 0x100000 * width;
 			return width;
+		case 0x00b000b0:
+			/* a6 - LH28F640BFHE 8 64k * 2 chip blocks*/
+			mtd->erasesize = 0x10000 * width / 2;
+			mtd->size = 0x800000 * width / 2;
+			return width;
 #if 0
 		case 0x00000000: /* unknown */
 			/* XX - LH28F004SCT 512kx8, 8 64k blocks*/
@@ -213,7 +232,7 @@
 /* This function returns with the chip->mutex lock held. */
 static int sharp_wait(struct map_info *map, struct flchip *chip)
 {
-	__u16 status;
+	__u32 status;
 	unsigned long timeo = jiffies + HZ;
 	DECLARE_WAITQUEUE(wait, current);
 	int adr = 0;
@@ -227,23 +246,35 @@
 		chip->state = FL_STATUS;
 	case FL_STATUS:
 		status = map_read32(map,adr);
+		if ((status & SR_READY) == SR_READY)
+			break;
+		spin_unlock_bh(chip->mutex);
+		if (time_after(jiffies, timeo)) {
+			printk("Waiting for chip to be ready timed out in erase\n");
+			return -EIO;
+		}
+		sharp_udelay(1);
+		goto retry;
 //printk("status=%08x\n",status);
 
-		udelay(100);
-		if((status & SR_READY)!=SR_READY){
+		//udelay(100);
+		//if((status & SR_READY)!=SR_READY){
 //printk(".status=%08x\n",status);
-			udelay(100);
-		}
-		break;
+		//	udelay(100);
+		//}
+		//break;
 	default:
-		printk("Waiting for chip\n");
+		//printk("Waiting for chip\n");
 
 		set_current_state(TASK_INTERRUPTIBLE);
 		add_wait_queue(&chip->wq, &wait);
 
 		spin_unlock_bh(chip->mutex);
 
-		schedule();
+		//schedule();
+		sharp_udelay(1);
+
+		set_current_state(TASK_RUNNING);
 		remove_wait_queue(&chip->wq, &wait);
 
 		if(signal_pending(current))
@@ -348,12 +379,13 @@
 	unsigned long adr, __u32 datum)
 {
 	int ret;
-	int timeo;
 	int try;
 	int i;
-	int status = 0;
+	u32 status = 0;
 
 	ret = sharp_wait(map,chip);
+	if (ret < 0)
+		return ret;
 
 	for(try=0;try<10;try++){
 		map_write32(map,CMD_BYTE_WRITE,adr);
@@ -362,14 +394,21 @@
 
 		chip->state = FL_WRITING;
 
-		timeo = jiffies + (HZ/2);
-
 		map_write32(map,CMD_READ_STATUS,adr);
 		for(i=0;i<100;i++){
 			status = map_read32(map,adr);
 			if((status & SR_READY)==SR_READY)
 				break;
 		}
+#ifdef AUTOUNLOCK
+		if (status & SR_PROTECT) { /* lock block */
+			map_write32(map, CMD_CLEAR_STATUS, adr);
+			sharp_unlock_oneblock(map,chip,adr);
+			map_write32(map, CMD_CLEAR_STATUS, adr);
+			map_write32(map, CMD_RESET, adr);
+			continue;
+		}
+#endif
 		if(i==100){
 			printk("sharp: timed out writing\n");
 		}
@@ -384,8 +423,7 @@
 	map_write32(map,CMD_RESET,adr);
 	chip->state = FL_READY;
 
-	wake_up(&chip->wq);
-	spin_unlock_bh(chip->mutex);
+	sharp_release(chip);
 
 	return 0;
 }
@@ -413,8 +451,13 @@
 		ret = sharp_erase_oneblock(map, &sharp->chips[chipnum], adr);
 		if(ret)return ret;
 
-		adr += mtd->erasesize;
-		len -= mtd->erasesize;
+		if (adr >= 0xfe0000) {
+			adr += mtd->erasesize / 8;
+			len -= mtd->erasesize / 8;
+		} else {
+			adr += mtd->erasesize;
+			len -= mtd->erasesize;
+		}
 		if(adr >> sharp->chipshift){
 			adr = 0;
 			chipnum++;
@@ -430,7 +473,7 @@
 	return 0;
 }
 
-static int sharp_do_wait_for_ready(struct map_info *map, struct flchip *chip,
+static inline int sharp_do_wait_for_ready(struct map_info *map, struct flchip *chip,
 	unsigned long adr)
 {
 	int ret;
@@ -441,7 +484,7 @@
 	map_write32(map,CMD_READ_STATUS,adr);
 	status = map_read32(map,adr);
 
-	timeo = jiffies + HZ;
+	timeo = jiffies + HZ * 10;
 
 	while(time_before(jiffies, timeo)){
 		map_write32(map,CMD_READ_STATUS,adr);
@@ -453,18 +496,22 @@
 		set_current_state(TASK_INTERRUPTIBLE);
 		add_wait_queue(&chip->wq, &wait);
 
-		//spin_unlock_bh(chip->mutex);
+		spin_unlock_bh(chip->mutex);
 
 		schedule_timeout(1);
 		schedule();
-		remove_wait_queue(&chip->wq, &wait);
 
-		//spin_lock_bh(chip->mutex);
+		spin_lock_bh(chip->mutex);
+
+		remove_wait_queue(&chip->wq, &wait);
+		set_current_state(TASK_RUNNING);
 		
+#if 0
 		if (signal_pending(current)){
 			ret = -EINTR;
 			goto out;
 		}
+#endif
 		
 	}
 	ret = -ETIME;
@@ -477,11 +524,15 @@
 {
 	int ret;
 	//int timeo;
-	int status;
+	u32 status;
 	//int i;
 
 //printk("sharp_erase_oneblock()\n");
 
+	ret = sharp_wait(map,chip);
+	if (ret < 0)
+		return ret;
+
 #ifdef AUTOUNLOCK
 	/* This seems like a good place to do an unlock */
 	sharp_unlock_oneblock(map,chip,adr);
@@ -493,7 +544,10 @@
 	chip->state = FL_ERASING;
 
 	ret = sharp_do_wait_for_ready(map,chip,adr);
-	if(ret<0)return ret;
+	if(ret<0) {
+		spin_unlock_bh(chip->mutex);
+		return ret;
+	}
 
 	map_write32(map,CMD_READ_STATUS,adr);
 	status = map_read32(map,adr);
@@ -501,43 +555,30 @@
 	if(!(status&SR_ERRORS)){
 		map_write32(map,CMD_RESET,adr);
 		chip->state = FL_READY;
-		//spin_unlock_bh(chip->mutex);
+		spin_unlock_bh(chip->mutex);
 		return 0;
 	}
 
 	printk("sharp: error erasing block at addr=%08lx status=%08x\n",adr,status);
 	map_write32(map,CMD_CLEAR_STATUS,adr);
 
-	//spin_unlock_bh(chip->mutex);
+	sharp_release(chip);
 
 	return -EIO;
 }
 
 #ifdef AUTOUNLOCK
-static void sharp_unlock_oneblock(struct map_info *map, struct flchip *chip,
+static inline void sharp_unlock_oneblock(struct map_info *map, struct flchip *chip,
 	unsigned long adr)
 {
-	int i;
-	int status;
+	u32 status;
 
-	map_write32(map,CMD_CLEAR_BLOCK_LOCKS_1,adr);
-	map_write32(map,CMD_CLEAR_BLOCK_LOCKS_2,adr);
+	map_write32(map,CMD_CLEAR_BLOCK_LOCKS_1,adr & BLOCK_MASK);
+	map_write32(map,CMD_CLEAR_BLOCK_LOCKS_2,adr & BLOCK_MASK);
 
-	udelay(100);
+	sharp_do_wait_for_ready(map,chip,adr);
 
 	status = map_read32(map,adr);
-	printk("status=%08x\n",status);
-
-	for(i=0;i<1000;i++){
-		//map_write32(map,CMD_READ_STATUS,adr);
-		status = map_read32(map,adr);
-		if((status & SR_READY)==SR_READY)
-			break;
-		udelay(100);
-	}
-	if(i==1000){
-		printk("sharp: timed out unlocking block\n");
-	}
 
 	if(!(status&SR_ERRORS)){
 		map_write32(map,CMD_RESET,adr);
@@ -557,20 +598,55 @@
 
 static int sharp_suspend(struct mtd_info *mtd)
 {
-	printk("sharp_suspend()\n");
-	return -EINVAL;
+	struct map_info *map = mtd->priv;
+	struct sharp_info *sharp = map->fldrv_priv;
+	int i;
+	struct flchip *chip;
+	int ret = 0;
+
+	for (i = 0; !ret && i < sharp->numchips; i++) {
+		chip = &sharp->chips[i];
+		ret = sharp_wait(map,chip);
+
+		if (ret) {
+			ret = -EAGAIN;
+		} else {
+			chip->state = FL_PM_SUSPENDED;
+			spin_unlock_bh(chip->mutex);
+		}
+	}
+	return ret;
 }
 
 static void sharp_resume(struct mtd_info *mtd)
 {
-	printk("sharp_resume()\n");
-	
+	struct map_info *map = mtd->priv;
+	struct sharp_info *sharp = map->fldrv_priv;
+	int i;
+	struct flchip *chip;
+
+	for (i = 0; i < sharp->numchips; i++) {
+		chip = &sharp->chips[i];
+
+		spin_lock_bh(chip->mutex);
+
+		if (chip->state == FL_PM_SUSPENDED) {
+			/* We need to force it back to a known state */
+			map_write32(map, CMD_RESET, chip->start);
+			chip->state = FL_READY;
+			wake_up(&chip->wq);
+		}
+
+		spin_unlock_bh(chip->mutex);
+	}
 }
 
 static void sharp_destroy(struct mtd_info *mtd)
 {
-	printk("sharp_destroy()\n");
+	struct map_info *map = mtd->priv;
+	struct sharp_info *sharp = map->fldrv_priv;
 
+	kfree(sharp);
 }
 
 int __init sharp_probe_init(void)

--Boundary_(ID_6UxphsTJTHRYvbghsvEvvw)--
