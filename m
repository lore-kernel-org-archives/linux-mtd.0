Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qwH2-0008Jd-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 13:46:17 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: Map drivers....
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 09 Oct 2001 06:55:16 -0600
Message-ID: <m3pu7xc6rv.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--=-=-=


David here is my recent work on getting a series of jedec map drivers
into shape against the most recent work.

Included are assorted improvements and bugfixes to the jedec_probe core,
and cfi_cmdset_0002.c

The 2 changes to cfi_cmdsset_0002.c were
a) The algorithm for waiting on an erase is now much smarter so the
   wait is proportional to the time the erase actually takes.
b) I added a case for doing a flash chip erase when you have exactly
   one erase region, with exacly one block in it.  As some older chips
   don't support anything except erasing the whole chip.  The flash on
   the eepro100 was my test case.

As well as the 5 map drivers I promised you earlier tonight.
BIOS Roms on:
the intel l440gx
the intel ich2 (io controler hub)
the alpha ds10
the amd766 southbridge.
And the boot rom on the eepro100

This isn't the most elegant code I have ever written but it does get
the job done, and provides some real uses of the jedec_probe code.

Tell me what you think.

Eric


--=-=-=
Content-Disposition: attachment; filename=linux-2.4.11-pre4.eb1.diff

diff -uNrX linux-exclude-files linux-2.4.11-pre4/Documentation/Configure.help linux-2.4.11-pre4.eb1/Documentation/Configure.help
--- linux-2.4.11-pre4/Documentation/Configure.help	Fri Oct  5 19:45:08 2001
+++ linux-2.4.11-pre4.eb1/Documentation/Configure.help	Sat Oct  6 00:32:28 2001
@@ -10484,7 +10484,21 @@
   for probing the capabilities of flash devices. If you wish to
   support any device that is CFI-compliant, you need to enable this
   option. Visit (http://www.amd.com/products/nvd/overview/cfi.html)
-  for more information on CFI.
+  for more information on CFI.  Also see JEDEC (http://www.jedec.org/)
+  standards JESD168 and  JEP137-A.  CFI improves over the older JEDEC
+  standard JESD21-C (section 3.5) by allowing whole families of
+  devices to be supported by the same software with no changes.
+
+JEDEC JESD21C Flash Interface Support
+CONFIG_MTD_JESD21C
+  This provides support for the older JEDEC (http://www.jedec.org)
+  standard JESD21-C (section 3.5) that allows for identification of 
+  flash devices, but does not provide for interrogation of their
+  capabilities, as CFI does.  This means a table must be maintained
+  with an entry for every flash device to allow discovery of how
+  to program the flash chip.  As few chips are currently supported
+  if your chip is not recognized you need to add an entry to the
+  table in jedec_probe.c
 
 CFI Advanced configuration options
 CONFIG_MTD_CFI_ADV_OPTIONS
@@ -10594,6 +10608,7 @@
 CONFIG_MTD_ROM
   This option enables basic support for ROM chips accessed through 
   a bus mapping driver.
+ 
 
 CONFIG_MTD_JEDEC
   Enable older older JEDEC flash interface devices for self programming
diff -uNrX linux-exclude-files linux-2.4.11-pre4/Makefile linux-2.4.11-pre4.eb1/Makefile
--- linux-2.4.11-pre4/Makefile	Fri Oct  5 19:45:08 2001
+++ linux-2.4.11-pre4.eb1/Makefile	Mon Oct  8 19:22:27 2001
@@ -1,7 +1,8 @@
 VERSION = 2
 PATCHLEVEL = 4
 SUBLEVEL = 11
-EXTRAVERSION =-pre4
+EXTRAVERSION =-pre4.eb1
+INSTALL_MOD_PATH:=/images/i386-nfs-boot/
 
 KERNELRELEASE=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
 
Binary files linux-2.4.11-pre4/drivers/char/conmakehash and linux-2.4.11-pre4.eb1/drivers/char/conmakehash differ
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/chips/Config.in linux-2.4.11-pre4.eb1/drivers/mtd/chips/Config.in
--- linux-2.4.11-pre4/drivers/mtd/chips/Config.in	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/chips/Config.in	Sat Oct  6 00:24:38 2001
@@ -7,13 +7,12 @@
 comment 'RAM/ROM/Flash chip drivers'
 
 dep_tristate '  Detect flash chips by Common Flash Interface (CFI) probe' CONFIG_MTD_CFI $CONFIG_MTD
-#dep_tristate '  Detect non-CFI Intel-compatible flash chips' CONFIG_MTD_INTELPROBE $CONFIG_MTD
-dep_tristate '  Detect non-CFI AMD/JEDEC-compatible flash chips' CONFIG_MTD_JEDECPROBE $CONFIG_MTD
+dep_tristate '  Detect flash chips by JEDEC probe' CONFIG_MTD_JESD21C $CONFIG_MTD
 
-if [ "$CONFIG_MTD_CFI" = "y" -o "$CONFIG_MTD_INTELPROBE" = "y" -o "$CONFIG_MTD_JEDECPROBE" = "y" ]; then
+if [ "$CONFIG_MTD_CFI" = "y" -o "$CONFIG_MTD_JESD21C" = "y" ]; then
    define_bool CONFIG_MTD_GEN_PROBE y
 else
-   if [ "$CONFIG_MTD_CFI" = "m" -o "$CONFIG_MTD_INTELPROBE" = "m" -o "$CONFIG_MTD_JEDECPROBE" = "m" ]; then
+   if [ "$CONFIG_MTD_CFI" = "m" -o "$CONFIG_MTD_JESD21C" = "m" ]; then
       define_bool CONFIG_MTD_GEN_PROBE m
    else
       define_bool CONFIG_MTD_GEN_PROBE n
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/chips/Makefile linux-2.4.11-pre4.eb1/drivers/mtd/chips/Makefile
--- linux-2.4.11-pre4/drivers/mtd/chips/Makefile	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/chips/Makefile	Mon Oct  8 18:10:20 2001
@@ -20,9 +20,8 @@
 obj-$(CONFIG_MTD_CFI_AMDSTD)	+= cfi_cmdset_0002.o
 obj-$(CONFIG_MTD_CFI_INTELEXT)	+= cfi_cmdset_0001.o
 obj-$(CONFIG_MTD_GEN_PROBE)	+= gen_probe.o
-obj-$(CONFIG_MTD_INTELPROBE)	+= intel_probe.o
 obj-$(CONFIG_MTD_JEDEC)		+= jedec.o
-obj-$(CONFIG_MTD_JEDECPROBE)	+= jedec_probe.o
+obj-$(CONFIG_MTD_JESD21C)	+= jedec_probe.o
 obj-$(CONFIG_MTD_RAM)		+= map_ram.o
 obj-$(CONFIG_MTD_ROM)		+= map_rom.o
 obj-$(CONFIG_MTD_SHARP)		+= sharp.o
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.4.11-pre4.eb1/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.4.11-pre4/drivers/mtd/chips/cfi_cmdset_0001.c	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/chips/cfi_cmdset_0001.c	Mon Oct  8 14:49:09 2001
@@ -6,7 +6,7 @@
  *
  * $Id: cfi_cmdset_0001.c,v 1.87 2001/10/02 15:05:11 dwmw2 Exp $
  *
- * 
+ *
  * 10/10/2000	Nicolas Pitre <nico@cam.org>
  * 	- completely revamped method functions so they are aware and
  * 	  independent of the flash geometry (buswidth, interleave, etc.)
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/chips/cfi_cmdset_0002.c linux-2.4.11-pre4.eb1/drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.4.11-pre4/drivers/mtd/chips/cfi_cmdset_0002.c	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/chips/cfi_cmdset_0002.c	Tue Oct  9 03:08:23 2001
@@ -30,6 +30,7 @@
 
 static int cfi_amdstd_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_amdstd_write(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
+static int cfi_amdstd_erase_chip(struct mtd_info *, struct erase_info *);
 static int cfi_amdstd_erase_onesize(struct mtd_info *, struct erase_info *);
 static int cfi_amdstd_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_amdstd_sync (struct mtd_info *);
@@ -148,7 +149,8 @@
 	unsigned long devsize = (1<<cfi->cfiq->DevSize) * cfi->interleave;
 
 	mtd = kmalloc(sizeof(*mtd), GFP_KERNEL);
-	printk("number of %s chips: %d\n", (cfi->cfi_mode)?"JEDEC":"CFI",cfi->numchips);
+	printk(KERN_INFO "number of %s chips: %d\n", 
+		(cfi->cfi_mode)?"CFI":"JEDEC",cfi->numchips);
 
 	if (!mtd) {
 	  printk("Failed to allocate memory for MTD device\n");
@@ -218,6 +220,11 @@
 			mtd->erase = cfi_amdstd_erase_varsize;
 		else
 #endif
+#if 1
+		if (((cfi->cfiq->EraseRegionInfo[0] & 0xffff) + 1) == 1)
+			mtd->erase = cfi_amdstd_erase_chip;
+		else
+#endif
 			mtd->erase = cfi_amdstd_erase_onesize;
 		mtd->read = cfi_amdstd_read;
 		mtd->write = cfi_amdstd_write;
@@ -541,12 +548,13 @@
 	return 0;
 }
 
-static inline int do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr)
+static inline int do_erase_chip(struct map_info *map, struct flchip *chip)
 {
-	unsigned int status;
+	unsigned int oldstatus, status;
+	unsigned int dq6, dq5;
 	unsigned long timeo = jiffies + HZ;
+	unsigned int adr;
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned int rdy_mask;
 	DECLARE_WAITQUEUE(wait, current);
 
  retry:
@@ -570,30 +578,168 @@
 	}	
 
 	chip->state = FL_ERASING;
-
-	adr += chip->start;
+	
+	/* Handle devices with one erase region, that only implement
+	 * the chip erase command.
+	 */
 	ENABLE_VPP(map);
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_write(map, CMD(0x30), adr);
-	
+	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	timeo = jiffies + (HZ*20);
+	adr = cfi->addr_unlock1;
+
+	/* Wait for the end of programing/erasure by using the toggle method.
+	 * As long as there is a programming procedure going on, bit 6 of the last
+	 * written byte is toggling it's state with each consectuve read.
+	 * The toggling stops as soon as the procedure is completed.
+	 *
+	 * If the process has gone on for too long on the chip bit 5 gets.
+	 * After bit5 is set you can kill the operation by sending a reset
+	 * command to the chip.
+	 */
+	dq6 = CMD(1<<6);
+	dq5 = CMD(1<<5);
+
+	oldstatus = cfi_read(map, adr);
+	status = cfi_read(map, adr);
+	while( ((status & dq6) != (oldstatus & dq6)) && 
+		((status & dq5) != dq5) &&
+		!time_after(jiffies, timeo)) {
+		int wait_reps;
+
+		/* an initial short sleep */
+		cfi_spin_unlock(chip->mutex);
+		schedule_timeout(HZ/100);
+		cfi_spin_lock(chip->mutex);
+		
+		if (chip->state != FL_ERASING) {
+			/* Someone's suspended the erase. Sleep */
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			
+			cfi_spin_unlock(chip->mutex);
+			printk("erase suspended. Sleeping\n");
+			
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+#if 0			
+			if (signal_pending(current))
+				return -EINTR;
+#endif			
+			timeo = jiffies + (HZ*2); /* FIXME */
+			cfi_spin_lock(chip->mutex);
+			continue;
+		}
 
+		/* Busy wait for 1/10 of a milisecond */
+		for(wait_reps = 0;
+		    	(wait_reps < 100) &&
+			((status & dq6) != (oldstatus & dq6)) && 
+			((status & dq5) != dq5);
+			wait_reps++) {
+			
+			/* Latency issues. Drop the lock, wait a while and retry */
+			cfi_spin_unlock(chip->mutex);
+			
+			cfi_udelay(1);
+		
+			cfi_spin_lock(chip->mutex);
+			oldstatus = cfi_read(map, adr);
+			status = cfi_read(map, adr);
+		}
+		oldstatus = cfi_read(map, adr);
+		status = cfi_read(map, adr);
+	}
+	if ((status & dq6) != (oldstatus & dq6)) {
+		/* The erasing didn't stop?? */
+		if ((status & dq5) == dq5) {
+			/* dq5 is active so we can do a reset and stop the erase */
+			cfi_write(map, CMD(0xF0), chip->start);
+		}
+		chip->state = FL_READY;
+		wake_up(&chip->wq);
+		cfi_spin_unlock(chip->mutex);
+		printk("waiting for erase to complete timed out.");
+		DISABLE_VPP(map);
+		return -EIO;
+	}
+	DISABLE_VPP(map);
+	chip->state = FL_READY;
+	wake_up(&chip->wq);
 	cfi_spin_unlock(chip->mutex);
-	schedule_timeout(HZ);
+	return 0;
+	
+}
+
+static inline int do_erase_oneblock(struct map_info *map, struct flchip *chip, unsigned long adr)
+{
+	unsigned int oldstatus, status;
+	unsigned int dq6, dq5;
+	unsigned long timeo = jiffies + HZ;
+	struct cfi_private *cfi = map->fldrv_priv;
+	DECLARE_WAITQUEUE(wait, current);
+	
+ retry:
 	cfi_spin_lock(chip->mutex);
+
+	if (chip->state != FL_READY){
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&chip->wq, &wait);
+                
+		cfi_spin_unlock(chip->mutex);
+
+		schedule();
+		remove_wait_queue(&chip->wq, &wait);
+#if 0
+		if(signal_pending(current))
+			return -EINTR;
+#endif
+		timeo = jiffies + HZ;
+
+		goto retry;
+	}	
+
+	chip->state = FL_ERASING;
 	
-	rdy_mask = CMD(0x80);
+	adr += chip->start;
+	ENABLE_VPP(map);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_write(map, CMD(0x30), adr);
+	
+	timeo = jiffies + (HZ*20);
 
-	/* FIXME. Use a timer to check this, and return immediately. */
-	/* Once the state machine's known to be working I'll do that */
+	/* Wait for the end of programing/erasure by using the toggle method.
+	 * As long as there is a programming procedure going on, bit 6 of the last
+	 * written byte is toggling it's state with each consectuve read.
+	 * The toggling stops as soon as the procedure is completed.
+	 *
+	 * If the process has gone on for too long on the chip bit 5 gets.
+	 * After bit5 is set you can kill the operation by sending a reset
+	 * command to the chip.
+	 */
+	dq6 = CMD(1<<6);
+	dq5 = CMD(1<<5);
 
-	while ( ( (status = cfi_read(map,adr)) & rdy_mask ) != rdy_mask ) {
-		static int z=0;
+	oldstatus = cfi_read(map, adr);
+	status = cfi_read(map, adr);
+	while( ((status & dq6) != (oldstatus & dq6)) && 
+		((status & dq5) != dq5) &&
+		!time_after(jiffies, timeo)) {
+		int wait_reps;
 
+		/* an initial short sleep */
+		cfi_spin_unlock(chip->mutex);
+		schedule_timeout(HZ/100);
+		cfi_spin_lock(chip->mutex);
+		
 		if (chip->state != FL_ERASING) {
 			/* Someone's suspended the erase. Sleep */
 			set_current_state(TASK_UNINTERRUPTIBLE);
@@ -613,29 +759,38 @@
 			continue;
 		}
 
-		/* OK Still waiting */
-		if (time_after(jiffies, timeo)) {
-			chip->state = FL_READY;
+		/* Busy wait for 1/10 of a milisecond */
+		for(wait_reps = 0;
+		    	(wait_reps < 100) &&
+			((status & dq6) != (oldstatus & dq6)) && 
+			((status & dq5) != dq5);
+			wait_reps++) {
+			
+			/* Latency issues. Drop the lock, wait a while and retry */
 			cfi_spin_unlock(chip->mutex);
-			printk("waiting for erase to complete timed out.");
-			DISABLE_VPP(map);
-			return -EIO;
-		}
+			
+			cfi_udelay(1);
 		
-		/* Latency issues. Drop the lock, wait a while and retry */
+			cfi_spin_lock(chip->mutex);
+			oldstatus = cfi_read(map, adr);
+			status = cfi_read(map, adr);
+		}
+		oldstatus = cfi_read(map, adr);
+		status = cfi_read(map, adr);
+	}
+	if ((status & dq6) != (oldstatus & dq6)) {
+		/* The erasing didn't stop?? */
+		if ((status & dq5) == dq5) {
+			/* dq5 is active so we can do a reset and stop the erase */
+			cfi_write(map, CMD(0xF0), chip->start);
+		}
+		chip->state = FL_READY;
+		wake_up(&chip->wq);
 		cfi_spin_unlock(chip->mutex);
-
-		z++;
-		if ( 0 && !(z % 100 )) 
-			printk("chip not ready yet after erase. looping\n");
-
-		cfi_udelay(1);
-		
-		cfi_spin_lock(chip->mutex);
-		continue;
+		printk("waiting for erase to complete timed out.");
+		DISABLE_VPP(map);
+		return -EIO;
 	}
-	
-	/* Done and happy. */
 	DISABLE_VPP(map);
 	chip->state = FL_READY;
 	wake_up(&chip->wq);
@@ -773,6 +928,29 @@
 		}
 	}
 		
+	instr->state = MTD_ERASE_DONE;
+	if (instr->callback)
+		instr->callback(instr);
+	
+	return 0;
+}
+
+static int cfi_amdstd_erase_chip(struct mtd_info *mtd, struct erase_info *instr)
+{
+	struct map_info *map = mtd->priv;
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ret = 0;
+
+	if (instr->addr != 0)
+		return -EINVAL;
+
+	if (instr->len != mtd->size)
+		return -EINVAL;
+
+	ret = do_erase_chip(map, &cfi->chips[0]);
+	if (ret)
+		return ret;
+
 	instr->state = MTD_ERASE_DONE;
 	if (instr->callback)
 		instr->callback(instr);
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/chips/cfi_probe.c linux-2.4.11-pre4.eb1/drivers/mtd/chips/cfi_probe.c
--- linux-2.4.11-pre4/drivers/mtd/chips/cfi_probe.c	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/chips/cfi_probe.c	Tue Oct  9 02:56:04 2001
@@ -24,16 +24,13 @@
 static void print_cfi_ident(struct cfi_ident *);
 #endif
 
-int cfi_jedec_setup(struct cfi_private *p_cfi, int index);
-int cfi_jedec_lookup(int index, int mfr_id, int dev_id);
-
 static int cfi_probe_chip(struct map_info *map, __u32 base,
 			  struct flchip *chips, struct cfi_private *cfi);
 static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
 
 struct mtd_info *cfi_probe(struct map_info *map);
 
-/* check for QRY, or search for jedec id.
+/* check for QRY.
    in: interleave,type,mode
    ret: table index, <0 for error
  */
@@ -55,6 +52,18 @@
 {
 	int i;
 	
+	if ((base + 0) >= map->size) {
+		printk(KERN_NOTICE
+			"Probe at base[0x00](0x%08lx) past the end of the map(0x%08lx)\n",
+			base, map->size -1);
+		return 0;
+	}
+	if ((base + 0xff) >= map->size) {
+		printk(KERN_NOTICE
+			"Probe at base[0x55](0x%08lx) past the end of the map(0x%08lx)\n",
+			base + 0x55, map->size -1);
+		return 0;
+	}
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
 
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/chips/gen_probe.c linux-2.4.11-pre4.eb1/drivers/mtd/chips/gen_probe.c
--- linux-2.4.11-pre4/drivers/mtd/chips/gen_probe.c	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/chips/gen_probe.c	Tue Oct  9 01:50:59 2001
@@ -38,7 +38,7 @@
 	if (mtd)
 		return mtd;
 
-	printk(KERN_WARNING"cfi_probe: No supported Vendor Command Set found\n");
+	printk(KERN_WARNING"gen_probe: No supported Vendor Command Set found\n");
 	
 	kfree(cfi->cfiq);
 	kfree(cfi);
@@ -108,7 +108,7 @@
 	 * chip in read mode.
 	 */
 
-	for (base = (1<<cfi.chipshift); base + (1<<cfi.chipshift) <= map->size;
+	for (base = (1<<cfi.chipshift); base + (1<<cfi.chipshift) < map->size;
 	     base += (1<<cfi.chipshift))
 		cp->probe_chip(map, base, &chip[0], &cfi);
 
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/chips/jedec_probe.c linux-2.4.11-pre4.eb1/drivers/mtd/chips/jedec_probe.c
--- linux-2.4.11-pre4/drivers/mtd/chips/jedec_probe.c	Mon Oct  8 21:18:56 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/chips/jedec_probe.c	Tue Oct  9 05:49:30 2001
@@ -2,6 +2,8 @@
    Common Flash Interface probe code.
    (C) 2000 Red Hat. GPL'd.
    $Id: jedec_probe.c,v 1.3 2001/10/02 15:05:12 dwmw2 Exp $
+   See JEDEC (http://www.jedec.org/) standard JESD21C (section 3.5)
+   for the standard this probe goes back to.
 */
 
 #include <linux/config.h>
@@ -21,12 +23,15 @@
 
 /* Manufacturers */
 #define MANUFACTURER_AMD	0x0001
-#define MANUFACTURER_FUJITSU	0x0004
 #define MANUFACTURER_ATMEL	0x001f
+#define MANUFACTURER_FUJITSU	0x0004
+#define MANUFACTURER_INTEL	0x0089
+#define MANUFACTURER_MACRONIX	0x00C2
 #define MANUFACTURER_ST		0x0020
 #define MANUFACTURER_SST	0x00BF
 #define MANUFACTURER_TOSHIBA	0x0098
 
+
 /* AMD */
 #define AM29F800BB	0x2258
 #define AM29F800BT	0x22D6
@@ -34,8 +39,13 @@
 #define AM29LV800BT	0x22DA
 #define AM29LV160DT	0x22C4
 #define AM29LV160DB	0x2249
+#define AM29F017D	0x003D
+#define AM29F016	0x00AD
+#define AM29F080	0x00D5
+#define AM29F040	0x00A4
 
 /* Atmel */
+#define AT49BV512	0x0003
 #define AT49BV16X4	0x00c0
 #define AT49BV16X4T	0x00c2
 
@@ -43,14 +53,28 @@
 #define MBM29LV160TE	0x22C4
 #define MBM29LV160BE	0x2249
 
+/* Intel */
+#define E28F008S5	0x00a6
+#define N82802AB	0x00ad
+#define N82802AC	0x00ac
+
+
+/* Macronix */
+#define MX29F016	0x00AD
+#define MX29F004T	0x0045
+#define MX29F004B	0x0046
+
 /* ST - www.st.com */
 #define M29W800T	0x00D7
 #define M29W160DT	0x22C4
 #define M29W160DB	0x2249
+#define M29W040B	0x00E3
 
 /* SST */
 #define SST39LF800	0x2781
 #define SST39LF160	0x2782
+#define SST39SF010A	0x00B5
+#define SST39SF020A	0x00B6
 
 /* Toshiba */
 #define TC58FVT160	0x00C2
@@ -61,6 +85,7 @@
 	const __u16 mfr_id;
 	const __u16 dev_id;
 	const char *name;
+	const int P_ID;
 	const int DevSize;
 	const int InterfaceDesc;
 	const int NumEraseRegions;
@@ -69,15 +94,20 @@
 
 #define ERASEINFO(size,blocks) (size<<8)|(blocks-1)
 
-#define SIZE_1MiB 20
-#define SIZE_2MiB 21
-#define SIZE_4MiB 22
+#define SIZE_64KiB  16
+#define SIZE_128KiB 17
+#define SIZE_256KiB 18
+#define SIZE_512KiB 19
+#define SIZE_1MiB   20
+#define SIZE_2MiB   21
+#define SIZE_4MiB   22
 
 static const struct amd_flash_info jedec_table[] = {
 	{
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV160DT,
 		name: "AMD AM29LV160DT",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x10000,31),
@@ -89,6 +119,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV160DB,
 		name: "AMD AM29LV160DB",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x04000,1),
@@ -100,6 +131,7 @@
 		mfr_id: MANUFACTURER_TOSHIBA,
 		dev_id: TC58FVT160,
 		name: "Toshiba TC58FVT160",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x10000,31),
@@ -111,6 +143,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV160TE,
 		name: "Fujitsu MBM29LV160TE",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x10000,31),
@@ -119,9 +152,37 @@
 			  ERASEINFO(0x04000,1)
 		}
 	}, {
+		mfr_id: MANUFACTURER_INTEL,
+		dev_id: E28F008S5,
+		name: "Intel E28F008S5",
+		P_ID: P_ID_INTEL_EXT,
+		DevSize: SIZE_1MiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,16),
+		}
+	}, {
+		mfr_id: MANUFACTURER_INTEL,
+		dev_id: N82802AB,
+		name: "Intel 82802AB",
+		P_ID: P_ID_INTEL_EXT,
+		DevSize: SIZE_512KiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,8),
+		}
+	}, {
+		mfr_id: MANUFACTURER_INTEL,
+		dev_id: N82802AC,
+		name: "Intel 82802AC",
+		P_ID: P_ID_INTEL_EXT,
+		DevSize: SIZE_1MiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,16),
+		}
+	}, {
 		mfr_id: MANUFACTURER_TOSHIBA,
 		dev_id: TC58FVB160,
 		name: "Toshiba TC58FVB160",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x04000,1),
@@ -133,6 +194,7 @@
 		mfr_id: MANUFACTURER_FUJITSU,
 		dev_id: MBM29LV160BE,
 		name: "Fujitsu MBM29LV160BE",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x04000,1),
@@ -144,6 +206,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV800BB,
 		name: "AMD AM29LV800BB",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_1MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x04000,1),
@@ -155,6 +218,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F800BB,
 		name: "AMD AM29F800BB",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_1MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x04000,1),
@@ -166,6 +230,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV800BT,
 		name: "AMD AM29LV800BT",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_1MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x10000,15),
@@ -177,6 +242,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29F800BT,
 		name: "AMD AM29F800BT",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_1MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x10000,15),
@@ -188,6 +254,7 @@
 		mfr_id: MANUFACTURER_AMD,
 		dev_id: AM29LV800BB,
 		name: "AMD AM29LV800BB",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_1MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x10000,15),
@@ -200,6 +267,7 @@
 		dev_id: M29W800T,
 		name: "ST M29W800T",
 		DevSize: SIZE_1MiB,
+		P_ID: P_ID_AMD_STD,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x10000,15),
 			  ERASEINFO(0x08000,1),
@@ -210,6 +278,7 @@
 		mfr_id: MANUFACTURER_ST,
 		dev_id: M29W160DT,
 		name: "ST M29W160DT",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x10000,31),
@@ -221,6 +290,7 @@
 		mfr_id: MANUFACTURER_ST,
 		dev_id: M29W160DB,
 		name: "ST M29W160DB",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 4,
 		regions: {ERASEINFO(0x04000,1),
@@ -230,8 +300,18 @@
 		}
 	}, {
 		mfr_id: MANUFACTURER_ATMEL,
+		dev_id: AT49BV512,
+		name: "Atmel AT49BV512",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_64KiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,1)
+		}
+	}, {
+		mfr_id: MANUFACTURER_ATMEL,
 		dev_id: AT49BV16X4,
 		name: "Atmel AT49BV16X4",
+		P_ID: P_ID_AMD_STD,
 		DevSize: SIZE_2MiB,
 		NumEraseRegions: 3,
 		regions: {ERASEINFO(0x02000,8),
@@ -242,12 +322,118 @@
                 mfr_id: MANUFACTURER_ATMEL,
                 dev_id: AT49BV16X4T,
                 name: "Atmel AT49BV16X4T",
+		P_ID: P_ID_AMD_STD,
                 DevSize: SIZE_2MiB,
                 NumEraseRegions: 3,
                 regions: {ERASEINFO(0x10000,30),
                           ERASEINFO(0x08000,2),
 			  ERASEINFO(0x02000,8)
                 }
+	}, {
+		mfr_id: MANUFACTURER_AMD,
+		dev_id: AM29F017D,
+		name: "AMD AM29F017D",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_2MiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,32),
+		}
+	}, {
+		mfr_id: MANUFACTURER_AMD,
+		dev_id: AM29F016,
+		name: "AMD AM29F016",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_2MiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,32),
+		}
+	}, {
+		mfr_id: MANUFACTURER_AMD,
+		dev_id: AM29F080,
+		name: "AMD AM29F080",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_1MiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,16),
+		}
+	}, {
+		mfr_id: MANUFACTURER_AMD,
+		dev_id: AM29F040,
+		name: "AMD AM29F040",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_512KiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,8),
+		}
+        }, {
+		mfr_id: MANUFACTURER_ST,
+		dev_id: M29W040B,
+		name: "ST M29W040B",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_512KiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,8),
+		}
+	}, {
+		mfr_id: MANUFACTURER_MACRONIX,
+		dev_id: MX29F016,
+		name: "AMD AM29F016",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_2MiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,32),
+		}
+	}, {
+		mfr_id: MANUFACTURER_MACRONIX,
+		dev_id: MX29F016,
+		name: "Macronix MX29F016",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_2MiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x10000,32),
+		}
+        }, {
+		mfr_id: MANUFACTURER_MACRONIX,
+		dev_id: MX29F004T,
+		name: "Macronix MX29F004T",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_512KiB,
+		NumEraseRegions: 4,
+		regions: {ERASEINFO(0x10000,7),
+			  ERASEINFO(0x08000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x04000,1),
+		}
+        }, {
+		mfr_id: MANUFACTURER_MACRONIX,
+		dev_id: MX29F004T,
+		name: "Macronix MX29F004B",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_512KiB,
+		NumEraseRegions: 4,
+		regions: {ERASEINFO(0x04000,1),
+			  ERASEINFO(0x02000,2),
+			  ERASEINFO(0x08000,1),
+			  ERASEINFO(0x10000,7),
+		}
+        }, {
+		mfr_id: MANUFACTURER_SST,
+		dev_id: SST39SF010A,
+		name: "SST 39SF010A",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_128KiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x01000,32),
+		}
+        }, {
+		mfr_id: MANUFACTURER_SST,
+		dev_id: SST39SF020A,
+		name: "SST 39SF020A",
+		P_ID: P_ID_AMD_STD,
+		DevSize: SIZE_256KiB,
+		NumEraseRegions: 1,
+		regions: {ERASEINFO(0x01000,64),
+		}
 	} 
 };
 
@@ -265,7 +451,7 @@
 {
 	int i,num_erase_regions;
 
-	printk(KERN_INFO "Found: %s\n",jedec_table[index].name);
+	printk("Found: %s\n",jedec_table[index].name);
 
 	num_erase_regions = jedec_table[index].NumEraseRegions;
 	
@@ -277,9 +463,10 @@
 
 	memset(p_cfi->cfiq,0,sizeof(struct cfi_ident));	
 	
-	p_cfi->cfiq->P_ID = P_ID_AMD_STD;
+	p_cfi->cfiq->P_ID = jedec_table[index].P_ID;
 	p_cfi->cfiq->NumEraseRegions = jedec_table[index].NumEraseRegions;
 	p_cfi->cfiq->DevSize = jedec_table[index].DevSize;
+	p_cfi->cfi_mode = 0;
 
 	for (i=0; i<num_erase_regions; i++){
 		p_cfi->cfiq->EraseRegionInfo[i] = jedec_table[index].regions[i];
@@ -320,6 +507,29 @@
 	}
 
  retry:
+	/* Make certain we aren't probing past the end of map */
+	if (base >= map->size) {
+		printk(KERN_NOTICE
+			"Probe at base(0x%08lx) past the end of the map(0x%08lx)\n",
+			(unsigned long)base, map->size -1);
+		return 0;
+		
+	}
+	if ((base + cfi->addr_unlock1) >= map->size) {
+		printk(KERN_NOTICE
+			"Probe at addr_unlock1(0x%08lx + 0x%08lx) past the end of the map(0x%08lx)\n",
+			(unsigned long)base, cfi->addr_unlock1, map->size -1);
+
+		return 0;
+	}
+	if ((base + cfi->addr_unlock2) >= map->size) {
+		printk(KERN_NOTICE
+			"Probe at addr_unlock2(0x%08lx + 0x%08lx) past the end of the map(0x%08lx)\n",
+			(unsigned long)base, cfi->addr_unlock2, map->size -1);
+		return 0;
+		
+	}
+
 	/* Reset */
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
 
@@ -335,15 +545,16 @@
 		cfi->mfr = jedec_read_mfr(map, base, osf);
 		cfi->id = jedec_read_id(map, base, osf);
 		
+		printk(KERN_INFO "Search for id:(%02x %02x) interleave(%d) type(%d)\n", 
+			cfi->mfr, cfi->id, cfi->interleave, cfi->device_type);
 		for (i=0; i<sizeof(jedec_table)/sizeof(jedec_table[0]); i++) {
 			if (cfi->mfr == jedec_table[i].mfr_id &&
 			    cfi->id == jedec_table[i].dev_id)
 				return cfi_jedec_setup(cfi, i);
 		}
 		if (!retried++) {
-			/* Deal with whichever strange chips these were */
-			cfi->addr_unlock1 |= cfi->addr_unlock1 << 8;
-			cfi->addr_unlock2 |= cfi->addr_unlock2 << 8;
+			cfi->addr_unlock1 |= cfi->addr_unlock1 << 4;
+			cfi->addr_unlock2 |= cfi->addr_unlock2 << 4;
 			goto retry;
 		}
 		return 0;
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/maps/Config.in linux-2.4.11-pre4.eb1/drivers/mtd/maps/Config.in
--- linux-2.4.11-pre4/drivers/mtd/maps/Config.in	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/maps/Config.in	Tue Oct  9 05:02:35 2001
@@ -6,7 +6,7 @@
 
 comment 'Mapping drivers for chip access'
 
-dep_tristate '  CFI Flash device in physical memory map' CONFIG_MTD_PHYSMAP $CONFIG_MTD_CFI
+dep_tristate '  CFI Flash device in physical memory map' CONFIG_MTD_PHYSMAP $CONFIG_MTD_GEN_PROBE
 if [ "$CONFIG_MTD_PHYSMAP" = "y" -o "$CONFIG_MTD_PHYSMAP" = "m" ]; then
    hex '    Physical start address of flash mapping' CONFIG_MTD_PHYSMAP_START 0x8000000
    hex '    Physical length of flash mapping' CONFIG_MTD_PHYSMAP_LEN 0x4000000
@@ -26,7 +26,9 @@
    dep_tristate '  JEDEC Flash device mapped on Mixcom piggyback card' CONFIG_MTD_MIXMEM $CONFIG_MTD_JEDEC
    dep_tristate '  JEDEC Flash device mapped on Octagon 5066 SBC' CONFIG_MTD_OCTAGON $CONFIG_MTD_JEDEC
    dep_tristate '  JEDEC Flash device mapped on Tempustech VMAX SBC301' CONFIG_MTD_VMAX $CONFIG_MTD_JEDEC
-   dep_tristate '  BIOS flash chip on Intel L440GX boards' CONFIG_MTD_L440GX $CONFIG_I386 $CONFIG_MTD_JEDEC
+   dep_tristate '  BIOS flash chip on Intel L440GX boards' CONFIG_MTD_L440GX $CONFIG_I386 $CONFIG_MTD_JESD21C
+   dep_tristate ' ROM connected to AMD766 southbridge' CONFIG_MTD_AMD766ROM $CONFIG_MTD_GEN_PROBE   
+   dep_tristate ' ROM connected to Intel Hub Controller 2' CONFIG_MTD_ICH2ROM $CONFIG_MTD_GEN_PROBE
 fi
 
 if [ "$CONFIG_PPC" = "y" ]; then
@@ -57,6 +59,10 @@
    dep_tristate '  CFI Flash device mapped on StrongARM SA11x0' CONFIG_MTD_SA1100 $CONFIG_MTD_CFI $CONFIG_ARCH_SA1100 $CONFIG_MTD_PARTITIONS
    dep_tristate '  CFI Flash device mapped on DC21285 Footbridge' CONFIG_MTD_DC21285 $CONFIG_MTD_CFI $CONFIG_ARCH_FOOTBRIDGE $CONFIG_MTD_PARTITIONS
    dep_tristate '  CFI Flash device mapped on the XScale IQ80310 board' CONFIG_MTD_IQ80310 $CONFIG_MTD_CFI $CONFIG_ARCH_IQ80310
+fi
+
+if [ "$CONFIG_ALPHA" = "y" ]; then
+   dep_tristate '  Flash chip mapping on TSUNAMI' CONFIG_MTD_TSUNAMI $CONFIG_MTD_GENPROBE
 fi
 
 endmenu
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/maps/Makefile linux-2.4.11-pre4.eb1/drivers/mtd/maps/Makefile
--- linux-2.4.11-pre4/drivers/mtd/maps/Makefile	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/maps/Makefile	Tue Oct  9 05:01:52 2001
@@ -14,6 +14,9 @@
 obj-$(CONFIG_MTD_ELAN_104NC)    += elan-104nc.o
 obj-$(CONFIG_MTD_IQ80310)	+= iq80310.o
 obj-$(CONFIG_MTD_L440GX)	+= l440gx.o
+obj-$(CONFIG_MTD_AMD766ROM)	+= amd766rom.o
+obj-$(CONFIG_MTD_ICH2ROM)	+= ich2rom.o
+obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_NORA)		+= nora.o
 obj-$(CONFIG_MTD_OCTAGON)	+= octagon-5066.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o 
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/maps/amd766rom.c linux-2.4.11-pre4.eb1/drivers/mtd/maps/amd766rom.c
--- linux-2.4.11-pre4/drivers/mtd/maps/amd766rom.c	Wed Dec 31 17:00:00 1969
+++ linux-2.4.11-pre4.eb1/drivers/mtd/maps/amd766rom.c	Tue Oct  9 05:06:52 2001
@@ -0,0 +1,244 @@
+/*
+ * amd766rom.c
+ *
+ * Normal mappings of chips in physical memory
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <asm/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/config.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+
+
+struct amd766rom_map_info {
+	struct map_info map;
+	struct mtd_info *mtd;
+	unsigned long window_addr;
+	u32 window_start, window_size;
+	struct pci_dev *pdev;
+};
+
+static __u8 amd766rom_read8(struct map_info *map, unsigned long ofs)
+{
+	return __raw_readb(map->map_priv_1 + ofs);
+}
+
+static __u16 amd766rom_read16(struct map_info *map, unsigned long ofs)
+{
+	return __raw_readw(map->map_priv_1 + ofs);
+}
+
+static __u32 amd766rom_read32(struct map_info *map, unsigned long ofs)
+{
+	return __raw_readl(map->map_priv_1 + ofs);
+}
+
+static void amd766rom_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+{
+	memcpy_fromio(to, map->map_priv_1 + from, len);
+}
+
+static void amd766rom_write8(struct map_info *map, __u8 d, unsigned long adr)
+{
+	__raw_writeb(d, map->map_priv_1 + adr);
+	mb();
+}
+
+static void amd766rom_write16(struct map_info *map, __u16 d, unsigned long adr)
+{
+	__raw_writew(d, map->map_priv_1 + adr);
+	mb();
+}
+
+static void amd766rom_write32(struct map_info *map, __u32 d, unsigned long adr)
+{
+	__raw_writel(d, map->map_priv_1 + adr);
+	mb();
+}
+
+static void amd766rom_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+{
+	memcpy_toio(map->map_priv_1 + to, from, len);
+}
+
+static struct amd766rom_map_info amd766rom_map = {
+	map: {
+		name: "AMD766 rom",
+		size: 0,
+		buswidth: 1,
+		read8: amd766rom_read8,
+		read16: amd766rom_read16,
+		read32: amd766rom_read32,
+		copy_from: amd766rom_copy_from,
+		write8: amd766rom_write8,
+		write16: amd766rom_write16,
+		write32: amd766rom_write32,
+		copy_to: amd766rom_copy_to,
+		/* The standard rom socket is for single power supply chips
+		 * that don't have an extra vpp.
+		 */
+	},
+	mtd: 0,
+	window_addr: 0,
+};
+
+static int __devinit amd766rom_init_one (struct pci_dev *pdev,
+	const struct pci_device_id *ent)
+{
+	struct rom_window {
+		u32 start;
+		u32 size;
+		u8 segen_bits;
+	};
+	static struct rom_window rom_window[] = {
+		{ 0xffb00000, 5*1024*1024, (1<<7) | (1<<6), },
+		{ 0xffc00000, 4*1024*1024, (1<<7), },
+		{ 0xffff0000, 64*1024,     0 },
+		{ 0         , 0,           0 },
+	};
+	static const u32 rom_probe_sizes[] = { 
+		5*1024*1024, 4*1024*1024, 2*1024*1024, 1024*1024, 512*1024, 
+		256*1024, 128*1024, 64*1024, 0};
+	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", 0 };
+	u8 byte;
+	struct amd766rom_map_info *info = &amd766rom_map;
+	struct rom_window *window;
+	int i;
+	u32 rom_size;
+
+	window = &rom_window[0];
+	while(window->size) {
+		if (request_mem_region(window->start, window->size, "amd766rom")) {
+			break;
+		}
+		window++;
+	}
+	if (!window->size) {
+		printk(KERN_ERR "amd766rom: cannot reserve rom window");
+		goto err_out_none;
+	}
+
+	/* Enable the selected rom window */
+	pci_read_config_byte(pdev, 0x43, &byte);
+	pci_write_config_byte(pdev, 0x43, byte | window->segen_bits);
+
+	/* Enable writes through the rom window */
+	pci_read_config_byte(pdev, 0x40, &byte);
+	pci_write_config_byte(pdev, 0x40, byte | 1);
+
+	/* FIXME handle registers 0x80 - 0x8C the bios region locks */
+
+	printk(KERN_NOTICE "amd766rom window : %x at %x\n", 
+		window->size, window->start);
+	/* For write accesses caches are useless */
+	info->window_addr = (unsigned long)ioremap_nocache(window->start, window->size);
+
+	if (!info->window_addr) {
+		printk(KERN_ERR "Failed to ioremap\n");
+		goto err_out_free_mmio_region;
+	}
+	info->mtd = 0;
+	for(i = 0; (rom_size = rom_probe_sizes[i]); i++) {
+		char **chip_type;
+		if (rom_size > window->size) {
+			continue;
+		}
+		info->map.map_priv_1 = 
+			info->window_addr + window->size - rom_size;
+		info->map.size = rom_size;
+		chip_type = rom_probe_types;
+		for(; !info->mtd && *chip_type; chip_type++) {
+			info->mtd = do_map_probe(*chip_type, &amd766rom_map.map);
+		}
+		if (info->mtd) {
+			break;
+		}
+	}
+	if (!info->mtd) {
+		goto err_out_iounmap;
+	}
+	printk(KERN_NOTICE "amd766rom chip at offset: %x\n",
+		window->size - rom_size);
+		
+	info->mtd->module = THIS_MODULE;
+	add_mtd_device(info->mtd);
+	info->window_start = window->start;
+	info->window_size = window->size;
+	return 0;
+
+err_out_iounmap:
+	iounmap((void *)(info->window_addr));
+err_out_free_mmio_region:
+	release_mem_region(window->start, window->size);
+err_out_none:
+	return -ENODEV;
+}
+
+
+static void __devexit amd766rom_remove_one (struct pci_dev *pdev)
+{
+	struct amd766rom_map_info *info = &amd766rom_map;
+	u8 byte;
+
+	del_mtd_device(info->mtd);
+	map_destroy(info->mtd);
+	info->mtd = 0;
+	info->map.map_priv_1 = 0;
+
+	iounmap((void *)(info->window_addr));
+	info->window_addr = 0;
+
+	/* Disable writes through the rom window */
+	pci_read_config_byte(pdev, 0x40, &byte);
+	pci_write_config_byte(pdev, 0x40, byte & ~1);
+	
+	release_mem_region(info->window_start, info->window_size);
+}
+
+static struct pci_device_id amd766rom_pci_tbl[] __devinitdata = {
+	{ PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7410, 
+	  PCI_ANY_ID, PCI_ANY_ID, },
+};
+
+MODULE_DEVICE_TABLE(pci, amd766rom_pci_tbl);
+
+#if 0
+static struct pci_driver amd766rom_driver = {
+	name:	  "amd766rom",
+	id_table: amd766rom_pci_tbl,
+	probe:    amd766rom_init_one,
+	remove:   amd766rom_remove_one,
+};
+#endif
+
+int __init init_amd766rom(void)
+{
+	struct pci_dev *pdev;
+	pdev = pci_find_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_VIPER_7410, 0);
+	if (pdev) {
+		amd766rom_map.pdev = pdev;
+		return amd766rom_init_one(pdev, &amd766rom_pci_tbl[0]);
+	}
+	return -ENXIO;
+#if 0
+	return pci_module_init(&amd766rom_driver);
+#endif
+}
+
+static void __exit cleanup_amd766rom(void)
+{
+	amd766rom_remove_one(amd766rom_map.pdev);
+}
+
+module_init(init_amd766rom);
+module_exit(cleanup_amd766rom);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Eric Biederman <ebiederman@lnxi.com>");
+MODULE_DESCRIPTION("MTD map driver for BIOS chips on the AMD766 southbridge");
+
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/maps/ich2rom.c linux-2.4.11-pre4.eb1/drivers/mtd/maps/ich2rom.c
--- linux-2.4.11-pre4/drivers/mtd/maps/ich2rom.c	Wed Dec 31 17:00:00 1969
+++ linux-2.4.11-pre4.eb1/drivers/mtd/maps/ich2rom.c	Tue Oct  9 05:18:39 2001
@@ -0,0 +1,225 @@
+/*
+ * ich2rom.c
+ *
+ * Normal mappings of chips in physical memory
+ */
+
+#include <linux/module.h>
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <asm/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/config.h>
+#include <linux/pci.h>
+#include <linux/pci_ids.h>
+
+#define MAX_ICH2_ROM_SIZE 512*1024
+
+#define RESERVE_MEM_REGION 0
+
+struct ich2rom_map_info {
+	struct map_info map;
+	struct mtd_info *mtd;
+	unsigned long window_addr;
+	u32 window_start, window_size;
+	struct pci_dev *pdev;
+};
+
+static __u8 ich2rom_read8(struct map_info *map, unsigned long ofs)
+{
+	return __raw_readb(map->map_priv_1 + ofs);
+}
+
+static __u16 ich2rom_read16(struct map_info *map, unsigned long ofs)
+{
+	return __raw_readw(map->map_priv_1 + ofs);
+}
+
+static __u32 ich2rom_read32(struct map_info *map, unsigned long ofs)
+{
+	return __raw_readl(map->map_priv_1 + ofs);
+}
+
+static void ich2rom_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+{
+	memcpy_fromio(to, map->map_priv_1 + from, len);
+}
+
+static void ich2rom_write8(struct map_info *map, __u8 d, unsigned long adr)
+{
+	__raw_writeb(d, map->map_priv_1 + adr);
+	mb();
+}
+
+static void ich2rom_write16(struct map_info *map, __u16 d, unsigned long adr)
+{
+	__raw_writew(d, map->map_priv_1 + adr);
+	mb();
+}
+
+static void ich2rom_write32(struct map_info *map, __u32 d, unsigned long adr)
+{
+	__raw_writel(d, map->map_priv_1 + adr);
+	mb();
+}
+
+static void ich2rom_copy_to(struct map_info *map, unsigned long to, const void *from, ssize_t len)
+{
+	memcpy_toio(map->map_priv_1 + to, from, len);
+}
+
+static struct ich2rom_map_info ich2rom_map = {
+	map: {
+		name: "ICH2 rom",
+		size: 0,
+		buswidth: 1,
+		read8: ich2rom_read8,
+		read16: ich2rom_read16,
+		read32: ich2rom_read32,
+		copy_from: ich2rom_copy_from,
+		write8: ich2rom_write8,
+		write16: ich2rom_write16,
+		write32: ich2rom_write32,
+		copy_to: ich2rom_copy_to,
+		/* The standard rom socket is for single power supply chips
+		 * that don't have an extra vpp.
+		 */
+	},
+	mtd: 0,
+	window_addr: 0,
+};
+
+static int __devinit ich2rom_init_one (struct pci_dev *pdev,
+	const struct pci_device_id *ent)
+{
+	struct rom_window {
+		u32 start;
+		u32 size;
+	} rom_window[1];
+	static char *rom_probe_types[] = { "cfi_probe", "jedec_probe", 0 };
+	u16 word;
+	struct ich2rom_map_info *info = &ich2rom_map;
+	struct rom_window *window;
+	char **chip_type;
+
+	window = &rom_window[0];
+	/* For now just hard code the rom window to 512KB... */
+	window->start = 0xfff80000;
+	window->size = MAX_ICH2_ROM_SIZE;
+
+#if RESERVE_MEM_REGION
+	if (!request_mem_region(window->start, window->size, "ich2rom")) {
+		printk(KERN_ERR "ich2rom: cannot reserve rom window\n");
+		goto err_out_none;
+	}
+#endif /* RESERVE_MEM_REGION */
+
+	/* FIXME select the firmware hub and enable a window two it. */
+
+	/* Enable writes through the rom window */
+	/* FIXME If bit 1 is enabled I should just giveup */
+	pci_read_config_word(pdev, 0x4e, &word);
+	pci_write_config_word(pdev, 0x4e, word | 1);
+
+
+	printk(KERN_INFO "ich2rom window : %x at %x\n", 
+		window->size, window->start);
+
+	info->window_addr = (unsigned long)ioremap(window->start, window->size);
+	if (!info->window_addr) {
+		printk(KERN_ERR "Failed to ioremap\n");
+		goto err_out_free_mmio_region;
+	}
+	info->mtd = 0;
+	info->map.map_priv_1 = 	info->window_addr;
+	info->map.size = window->size;
+	chip_type = rom_probe_types;
+	for(; !info->mtd && *chip_type; chip_type++) {
+		info->mtd = do_map_probe(*chip_type, &ich2rom_map.map);
+	}
+	if (!info->mtd) {
+		goto err_out_iounmap;
+	}
+	printk(KERN_INFO "ich2rom chip found\n");
+		
+	info->mtd->module = THIS_MODULE;
+	add_mtd_device(info->mtd);
+	info->window_start = window->start;
+	info->window_size = window->size;
+	return 0;
+
+err_out_iounmap:
+	iounmap((void *)(info->window_addr));
+err_out_free_mmio_region:
+#if RESERVE_MEM_REGION
+	release_mem_region(window->start, window->size);
+#endif
+err_out_none:
+	return -ENODEV;
+}
+
+
+static void __devexit ich2rom_remove_one (struct pci_dev *pdev)
+{
+	struct ich2rom_map_info *info = &ich2rom_map;
+	u16 word;
+
+	del_mtd_device(info->mtd);
+	map_destroy(info->mtd);
+	info->mtd = 0;
+	info->map.map_priv_1 = 0;
+
+	iounmap((void *)(info->window_addr));
+	info->window_addr = 0;
+
+	/* Disable writes through the rom window */
+	pci_read_config_byte(pdev, 0x4e, &word);
+	pci_write_config_byte(pdev, 0x4e, word & ~1);
+
+#if RESERVE_MEM_REGION	
+	release_mem_region(info->window_start, info->window_size);
+#endif
+}
+
+static struct pci_device_id ich2rom_pci_tbl[] __devinitdata = {
+	{ PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0, 
+	  PCI_ANY_ID, PCI_ANY_ID, },
+};
+
+MODULE_DEVICE_TABLE(pci, ich2rom_pci_tbl);
+
+#if 0
+static struct pci_driver ich2rom_driver = {
+	name:	  "ich2rom",
+	id_table: ich2rom_pci_tbl,
+	probe:    ich2rom_init_one,
+	remove:   ich2rom_remove_one,
+};
+#endif
+
+int __init init_ich2rom(void)
+{
+	struct pci_dev *pdev;
+	pdev = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82801BA_0, 0);
+	if (pdev) {
+		ich2rom_map.pdev = pdev;
+		return ich2rom_init_one(pdev, &ich2rom_pci_tbl[0]);
+	}
+	return -ENXIO;
+#if 0
+	return pci_module_init(&ich2rom_driver);
+#endif
+}
+
+static void __exit cleanup_ich2rom(void)
+{
+	ich2rom_remove_one(ich2rom_map.pdev);
+}
+
+module_init(init_ich2rom);
+module_exit(cleanup_ich2rom);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Eric Biederman <ebiederman@lnxi.com>");
+MODULE_DESCRIPTION("MTD map driver for BIOS chips on the ICH2 southbridge");
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/maps/l440gx.c linux-2.4.11-pre4.eb1/drivers/mtd/maps/l440gx.c
--- linux-2.4.11-pre4/drivers/mtd/maps/l440gx.c	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/maps/l440gx.c	Tue Oct  9 06:22:16 2001
@@ -2,6 +2,8 @@
  * $Id: l440gx.c,v 1.7 2001/10/02 15:05:14 dwmw2 Exp $
  *
  * BIOS Flash chip on Intel 440GX board.
+ *
+ * Bugs this currently does not work under linuxBIOS.
  */
 
 #include <linux/module.h>
@@ -12,12 +14,14 @@
 #include <linux/mtd/map.h>
 #include <linux/config.h>
 
+#define PIIXE_IOBASE_RESOURCE	11
 
 #define WINDOW_ADDR 0xfff00000
 #define WINDOW_SIZE 0x00100000
 #define BUSWIDTH 1
 
-#define IOBASE 0xc00
+static u32 iobase;
+#define IOBASE iobase
 #define TRIBUF_PORT (IOBASE+0x37)
 #define VPP_PORT (IOBASE+0x28)
 
@@ -66,12 +70,17 @@
 	memcpy_toio(map->map_priv_1 + to, from, len);
 }
 
+/* Is this really the vpp port? */
 void l440gx_set_vpp(struct map_info *map, int vpp)
 {
 	unsigned long l;
 
 	l = inl(VPP_PORT);
-	l = vpp?(l | 1):(l & ~1);
+	if (vpp) {
+		l |= 1;
+	} else {
+		l &= ~1;
+	}
 	outl(l, VPP_PORT);
 }
 
@@ -87,44 +96,87 @@
 	write16: l440gx_write16,
 	write32: l440gx_write32,
 	copy_to: l440gx_copy_to,
+#if 0
+	/* FIXME verify that this is the 
+	 * appripriate code for vpp enable/disable
+	 */
 	set_vpp: l440gx_set_vpp
+#endif
 };
 
+
 static int __init init_l440gx(void)
 {
-	struct pci_dev *dev;
-	unsigned char b;
-	__u16 w;
+	struct pci_dev *dev, *pm_dev;
+	struct resource *pm_iobase;
+	__u16 word;
+
+	dev = pci_find_device(PCI_VENDOR_ID_INTEL, 
+		PCI_DEVICE_ID_INTEL_82371AB_0, NULL);
 
-	dev = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371AB_0,
-			      NULL);
 
-	if (!dev) {
+	pm_dev = pci_find_device(PCI_VENDOR_ID_INTEL, 
+		PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
+
+	if (!dev || !pm_dev) {
 		printk(KERN_NOTICE "L440GX flash mapping: failed to find PIIX4 ISA bridge, cannot continue\n");
 		return -ENODEV;
 	}
 
 
-	l440gx_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
+	l440gx_map.map_priv_1 = (unsigned long)ioremap_nocache(WINDOW_ADDR, WINDOW_SIZE);
 
 	if (!l440gx_map.map_priv_1) {
-		printk("Failed to ioremap L440GX flash region\n");
+		printk(KERN_WARNING "Failed to ioremap L440GX flash region\n");
 		return -ENOMEM;
 	}
 
+	printk(KERN_NOTICE "window_addr = 0x%08lx\n", (unsigned long)l440gx_map.map_priv_1);
+
+	/* Setup the pm iobase resource 
+	 * This code should move into some kind of generic bridge
+	 * driver but for the moment I'm content with getting the
+	 * allocation correct. 
+	 */
+	pm_iobase = &pm_dev->resource[PIIXE_IOBASE_RESOURCE];
+	if (!(pm_iobase->flags & IORESOURCE_IO)) {
+		pm_iobase->name = "pm iobase";
+		pm_iobase->start = 0;
+		pm_iobase->end = 63;
+		pm_iobase->flags = IORESOURCE_IO;
+
+		/* Put the current value in the resource */
+		pci_read_config_dword(pm_dev, 0x40, &iobase);
+		iobase &= ~1;
+		pm_iobase->start += iobase & ~1;
+		pm_iobase->end += iobase & ~1;
+
+		/* Allocate the resource region */
+		if (pci_assign_resource(pm_dev, PIIXE_IOBASE_RESOURCE) != 0) {
+			printk(KERN_WARNING "Could not allocate pm iobase resource\n");
+			iounmap((void *)l440gx_map.map_priv_1);
+			return -ENXIO;
+		}
+	}
+	/* Set the iobase */
+	iobase = pm_iobase->start;
+	pci_write_config_dword(pm_dev, 0x40, iobase | 1);
+	
+
 	/* Set XBCS# */
-	pci_read_config_word(dev, 0x4e, &w);
-	w |= 0x4;
-        pci_write_config_word(dev, 0x4e, w);
+	pci_read_config_word(dev, 0x4e, &word);
+	word |= 0x4;
+        pci_write_config_word(dev, 0x4e, word);
+
+	/* Supply write voltage to the chip */
+	l440gx_set_vpp(&l440gx_map, 1);
 
 	/* Enable the gate on the WE line */
-	b = inb(TRIBUF_PORT);
-	b |= 1;
-	outb(b, TRIBUF_PORT);
+	outb(inb(TRIBUF_PORT) & ~1, TRIBUF_PORT);
 	
        	printk(KERN_NOTICE "Enabled WE line to L440GX BIOS flash chip.\n");
 
-	mymtd = do_map_probe("jedec", &l440gx_map);
+	mymtd = do_map_probe("jedec_probe", &l440gx_map);
 	if (!mymtd) {
 		printk(KERN_NOTICE "JEDEC probe on BIOS chip failed. Using ROM\n");
 		mymtd = do_map_probe("map_rom", &l440gx_map);
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/maps/physmap.c linux-2.4.11-pre4.eb1/drivers/mtd/maps/physmap.c
--- linux-2.4.11-pre4/drivers/mtd/maps/physmap.c	Fri Oct  5 19:45:20 2001
+++ linux-2.4.11-pre4.eb1/drivers/mtd/maps/physmap.c	Tue Oct  9 00:07:37 2001
@@ -78,6 +78,9 @@
 
 int __init init_physmap(void)
 {
+	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", 0 };
+	char **type;
+
        	printk(KERN_NOTICE "physmap flash device: %x at %x\n", WINDOW_SIZE, WINDOW_ADDR);
 	physmap_map.map_priv_1 = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE);
 
@@ -85,7 +88,12 @@
 		printk("Failed to ioremap\n");
 		return -EIO;
 	}
-	mymtd = do_map_probe("cfi_probe", &physmap_map);
+	
+	mymtd = 0;
+	type = rom_probe_types;
+	for(; !mymtd && *type; type++) {
+		mymtd = do_map_probe(*type, &physmap_map);
+	}
 	if (mymtd) {
 		mymtd->module = THIS_MODULE;
 
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/mtd/maps/tsunami_flash.c linux-2.4.11-pre4.eb1/drivers/mtd/maps/tsunami_flash.c
--- linux-2.4.11-pre4/drivers/mtd/maps/tsunami_flash.c	Wed Dec 31 17:00:00 1969
+++ linux-2.4.11-pre4.eb1/drivers/mtd/maps/tsunami_flash.c	Tue Oct  9 00:07:57 2001
@@ -0,0 +1,104 @@
+#include <asm/io.h>
+#include <asm/core_tsunami.h>
+#include <linux/mtd/map.h>
+
+#define FLASH_ENABLE_PORT 0x00C00001
+#define FLASH_ENABLE_BYTE 0x01
+#define FLASH_DISABLE_BYTE 0x00
+
+#define MAX_TIG_FLASH_SIZE (12*1024*1024)
+static inline  __u8 tsunami_flash_read8(struct map_info *map, unsigned long offset)
+{
+	return tsunami_tig_readb(offset);
+}
+
+static void tsunami_flash_write8(struct map_info *map, __u8 value, unsigned long offset)
+{
+	tsunami_tig_writeb(value, offset);
+}
+
+static void tsunami_flash_copy_from(
+	struct map_info *map, void *addr, unsigned long offset, ssize_t len)
+{
+	unsigned char *dest;
+	dest = addr;
+	while(len && (offset < MAX_TIG_FLASH_SIZE)) {
+		*dest = tsunami_tig_readb(offset);
+		offset++;
+		dest++;
+		len--;
+	}
+}
+
+static void tsunami_flash_copy_to(
+	struct map_info *map, unsigned long offset, 
+	const void *addr, ssize_t len)
+{
+	const unsigned char *src;
+	src = addr;
+	while(len && (offset < MAX_TIG_FLASH_SIZE)) {
+		tsunami_tig_writeb(*src, offset);
+		offset++;
+		src++;
+		len--;
+	}
+}
+
+/*
+ * Deliberately don't provide operations wider than 8 bits.  I don't
+ * have then and it scares me to think how you could mess up if
+ * you tried to use them.   Buswidth is correctly so I'm safe.
+ */
+static struct map_info tsunami_flash_map = {
+	.name = "flash chip on the Tsunami TIG bus",
+	.size = MAX_TIG_FLASH_SIZE,
+	.buswidth = 1,
+	.read8 = tsunami_flash_read8,
+	.read16 = 0,
+	.read32 = 0, 
+	.copy_from = tsunami_flash_copy_from,
+	.write8 = tsunami_flash_write8,
+	.write16 = 0,
+	.write32 = 0,
+	.copy_to = tsunami_flash_copy_to,
+	.set_vpp = 0,
+	.map_priv_1 = 0,
+
+};
+
+static struct mtd_info *tsunami_flash_mtd;
+
+static void __exit  cleanup_tsunami_flash(void)
+{
+	struct mtd_info *mtd;
+	mtd = tsunami_flash_mtd;
+	if (mtd) {
+		del_mtd_device(mtd);
+		map_destroy(mtd);
+	}
+	tsunami_flash_mtd = 0;
+}
+
+
+static int __init init_tsunami_flash(void)
+{
+	static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", "map_rom", 0 };
+	char **type;
+
+	tsunami_tig_writeb(FLASH_ENABLE_BYTE, FLASH_ENABLE_PORT);
+	
+	tsunami_flash_mtd = 0;
+	type = rom_probe_types;
+	for(; !tsunami_flash_mtd && *type; type++) {
+		tsunami_flash_mtd = do_map_probe(*type, &tsunami_flash_map);
+	}
+	if (tsunami_flash_mtd) {
+		tsunami_flash_mtd->module = THIS_MODULE;
+		add_mtd_device(tsunami_flash_mtd);
+		return 0;
+	}
+	return -ENXIO;
+}
+
+module_init(init_tsunami_flash);
+module_exit(cleanup_tsunami_flash);
diff -uNrX linux-exclude-files linux-2.4.11-pre4/drivers/net/eepro100.c linux-2.4.11-pre4.eb1/drivers/net/eepro100.c
--- linux-2.4.11-pre4/drivers/net/eepro100.c	Fri Oct  5 19:45:22 2001
+++ linux-2.4.11-pre4.eb1/drivers/net/eepro100.c	Tue Oct  9 03:09:18 2001
@@ -114,6 +114,11 @@
 #include <linux/skbuff.h>
 #include <linux/delay.h>
 
+#ifdef CONFIG_MTD
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#endif
+
 MODULE_AUTHOR("Maintainer: Andrey V. Savochkin <saw@saw.sw.com.sg>");
 MODULE_DESCRIPTION("Intel i82557/i82558/i82559 PCI EtherExpressPro driver");
 MODULE_LICENSE("GPL");
@@ -284,7 +289,8 @@
 
 */
 
-static int speedo_found1(struct pci_dev *pdev, long ioaddr, int fnd_cnt, int acpi_idle_state);
+static int speedo_found1(struct pci_dev *pdev, long ioaddr, 
+	unsigned long romio_addr, int fnd_cnt, int acpi_idle_state);
 
 enum pci_flags_bit {
 	PCI_USES_IO=1, PCI_USES_MEM=2, PCI_USES_MASTER=4,
@@ -381,6 +387,10 @@
 	PortReset=0, PortSelfTest=1, PortPartialReset=2, PortDump=3,
 };
 
+enum SCBflash_states {
+	FlashDisable=2, FlashEnable=1,
+};
+
 /* The Speedo3 Rx and Tx frame/buffer descriptors. */
 struct descriptor {			    /* A generic descriptor. */
 	s32 cmd_status;				/* All command and status fields. */
@@ -497,6 +507,10 @@
 	unsigned short phy[2];				/* PHY media interfaces available. */
 	unsigned short advertising;			/* Current PHY advertised caps. */
 	unsigned short partner;				/* Link partner caps. */
+#ifdef CONFIG_MTD
+	struct map_info map;
+	struct mtd_info *mtd;
+#endif
 };
 
 /* The parameters for a CmdConfigure operation.
@@ -551,6 +565,14 @@
 static void set_rx_mode(struct net_device *dev);
 static void speedo_show_state(struct net_device *dev);
 
+#ifdef CONFIG_MTD
+static u8 eepro100rom_read8(struct map_info *map, unsigned long ofs);
+static void eepro100rom_copy_from(struct map_info *map, void *to, 
+	unsigned long from, ssize_t len);
+static void eepro100rom_write8(struct map_info *map, u8 data, unsigned long ofs);
+static void eepro100rom_copy_to(struct map_info *map, unsigned long to, 	
+	const void *from, ssize_t len);
+#endif
 

 
 #ifdef honor_default_port
@@ -563,7 +585,7 @@
 static int __devinit eepro100_init_one (struct pci_dev *pdev,
 		const struct pci_device_id *ent)
 {
-	unsigned long ioaddr;
+	unsigned long ioaddr, romio_addr = 0;
 	int irq;
 	int acpi_idle_state = 0, pm;
 	static int cards_found /* = 0 */;
@@ -590,8 +612,8 @@
 		printk("Found Intel i82557 PCI Speedo at I/O %#lx, IRQ %d.\n",
 			   ioaddr, irq);
 #else
-	ioaddr = (unsigned long)ioremap(pci_resource_start(pdev, 0),
-									pci_resource_len(pdev, 0));
+	ioaddr = (unsigned long)ioremap(pci_resource_start(pdev, 0), 
+		pci_resource_len(pdev, 0));
 	if (!ioaddr) {
 		printk (KERN_ERR "eepro100: cannot remap MMIO region %lx @ %lx\n",
 				pci_resource_len(pdev, 0), pci_resource_start(pdev, 0));
@@ -602,6 +624,24 @@
 			   pci_resource_start(pdev, 0), irq);
 #endif
 
+#ifdef CONFIG_MTD
+	if (pci_resource_start(pdev, 2) == 0) {
+		pci_assign_resource(pdev, 2);
+	}
+	if ((pci_resource_start(pdev, 2) != 0) &&
+		(request_mem_region(
+			pci_resource_start(pdev, 2),
+			pci_resource_len(pdev, 2), 
+			"eepro100") != 0)) {
+		romio_addr = (unsigned long)ioremap(
+			pci_resource_start(pdev, 2),
+			pci_resource_len(pdev, 2));
+		printk(KERN_INFO "eepro100 Boot ROM enabled at 0x%08lx mapped at 0x%08lx\n", 
+			pci_resource_start(pdev, 2),
+			romio_addr);
+	}
+#endif
+
 	/* save power state b4 pci_enable_device overwrites it */
 	pm = pci_find_capability(pdev, PCI_CAP_ID_PM);
 	if (pm) {
@@ -611,18 +651,20 @@
 	}
 
 	if (pci_enable_device(pdev))
-		goto err_out_free_mmio_region;
+		goto err_out_iounmap;
 
 	pci_set_master(pdev);
 
-	if (speedo_found1(pdev, ioaddr, cards_found, acpi_idle_state) == 0)
+	if (speedo_found1(pdev, ioaddr, romio_addr, cards_found, acpi_idle_state) == 0)
 		cards_found++;
 	else
 		goto err_out_iounmap;
 
 	return 0;
 
-err_out_iounmap: ;
+err_out_iounmap: 
+	if (romio_addr) 
+		iounmap((void *)romio_addr);
 #ifndef USE_IO
 	iounmap ((void *)ioaddr);
 #endif
@@ -635,7 +677,7 @@
 }
 
 static int speedo_found1(struct pci_dev *pdev,
-		long ioaddr, int card_idx, int acpi_idle_state)
+	long ioaddr, unsigned long romio_addr, int card_idx, int acpi_idle_state)
 {
 	struct net_device *dev;
 	struct speedo_private *sp;
@@ -841,6 +883,34 @@
 	dev->set_multicast_list = &set_rx_mode;
 	dev->do_ioctl = &speedo_ioctl;
 
+#ifdef CONFIG_MTD
+	/* Enable Writes to the flash chpi */
+	outw(FlashEnable, ioaddr + SCBflash);
+
+	/* Now setup the data structures */
+	sp->map.name = "eepro100 rom";
+	sp->map.size = pci_resource_len(pdev, 2);
+	sp->map.buswidth = 1;
+	sp->map.read8 = eepro100rom_read8;
+	sp->map.copy_from = eepro100rom_copy_from;
+	sp->map.write8 = eepro100rom_write8;
+	sp->map.copy_to = eepro100rom_copy_to;
+	sp->map.map_priv_1 = romio_addr;
+	sp->mtd = 0;
+	if (romio_addr) {
+		sp->mtd = do_map_probe("jedec_probe", &sp->map);
+		if (!sp->mtd) {
+			sp->mtd = do_map_probe("map_rom", &sp->map);
+		}
+		if (sp->mtd) {
+			sp->mtd->module = THIS_MODULE;
+			add_mtd_device(sp->mtd);
+			printk(KERN_INFO "eepro100: found flash boot rom\n");
+		}
+	} else {
+		printk(KERN_NOTICE "eepro100: No boot rom address??\n");
+	}
+#endif /* CONFIG_MTD */
 	return 0;
 }
 

@@ -1829,7 +1899,7 @@
 	if (speedo_debug > 3)
 		speedo_show_state(dev);
 
-    /* Free all the skbuffs in the Rx and Tx queues. */
+	/* Free all the skbuffs in the Rx and Tx queues. */
 	for (i = 0; i < RX_RING_SIZE; i++) {
 		struct sk_buff *skb = sp->rx_skbuff[i];
 		sp->rx_skbuff[i] = 0;
@@ -2156,6 +2226,29 @@
 	sp->rx_mode = new_rx_mode;
 }
 

+#ifdef CONFIG_MTD
+static u8 eepro100rom_read8(struct map_info *map, unsigned long ofs)
+{
+	return readb(map->map_priv_1 + ofs);
+}
+
+static void eepro100rom_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
+{
+	memcpy_fromio(to, map->map_priv_1 + from, len);
+}
+
+static void eepro100rom_write8(struct map_info *map, u8 data, unsigned long ofs)
+{
+	writeb(data, map->map_priv_1 + ofs);
+}
+
+static void eepro100rom_copy_to(struct map_info *map, unsigned long to, 
+	const void *from, ssize_t len)
+{
+	memcpy_toio(map->map_priv_1 + to, from, len);
+}
+#endif
+

 #ifdef CONFIG_PM
 static int eepro100_suspend(struct pci_dev *pdev, u32 state)
 {
@@ -2202,11 +2295,27 @@
 {
 	struct net_device *dev = pci_get_drvdata (pdev);
 	struct speedo_private *sp = (struct speedo_private *)dev->priv;
+	long ioaddr = dev->base_addr;
 	
 	unregister_netdev(dev);
 
+#ifdef CONFIG_MTD
+	if (sp->mtd) {
+		del_mtd_device(sp->mtd);
+		map_destroy(sp->mtd);
+		sp->mtd = 0;
+	}
+	/* Disable writes to the flash chip */
+	outw(FlashDisable, ioaddr + SCBflash);
+	release_mem_region(
+		pci_resource_start(pdev, 2), pci_resource_len(pdev, 2));
+	iounmap((void *)sp->map.map_priv_1);
+#endif 
+
+
 	release_region(pci_resource_start(pdev, 1), pci_resource_len(pdev, 1));
 	release_mem_region(pci_resource_start(pdev, 0), pci_resource_len(pdev, 0));
+
 
 #ifndef USE_IO
 	iounmap((char *)dev->base_addr);
Binary files linux-2.4.11-pre4/drivers/net/hamradio/soundmodem/gentbl and linux-2.4.11-pre4.eb1/drivers/net/hamradio/soundmodem/gentbl differ
Binary files linux-2.4.11-pre4/drivers/pci/gen-devlist and linux-2.4.11-pre4.eb1/drivers/pci/gen-devlist differ
diff -uNrX linux-exclude-files linux-2.4.11-pre4/include/asm-alpha/core_tsunami.h linux-2.4.11-pre4.eb1/include/asm-alpha/core_tsunami.h
--- linux-2.4.11-pre4/include/asm-alpha/core_tsunami.h	Thu Oct  4 15:41:19 2001
+++ linux-2.4.11-pre4.eb1/include/asm-alpha/core_tsunami.h	Fri Oct  5 21:29:13 2001
@@ -89,6 +89,7 @@
 #define TSUNAMI_dchip  ((tsunami_dchip *)(IDENT_ADDR+TS_BIAS+0x1B0000800UL))
 #define TSUNAMI_pchip0 ((tsunami_pchip *)(IDENT_ADDR+TS_BIAS+0x180000000UL))
 #define TSUNAMI_pchip1 ((tsunami_pchip *)(IDENT_ADDR+TS_BIAS+0x380000000UL))
+#define TSUNAMI_tig    ((volatile unsigned long *)   (IDENT_ADDR+TS_BIAS+0x100000000UL))
 extern int TSUNAMI_bootcpu;
 
 /*
@@ -408,6 +409,21 @@
 {
 	*(vulp)addr = b;
 }
+
+/*
+ * Tig bus functions.
+ */
+
+__EXTERN_INLINE unsigned long tsunami_tig_readb(unsigned long offset)
+{
+	return TSUNAMI_tig[offset << (6 - 3)] & 0xff;
+}
+
+__EXTERN_INLINE void tsunami_tig_writeb(unsigned char b, unsigned long offset)
+{
+	TSUNAMI_tig[offset << (6 - 3)] = b & 0xff;
+}
+
 
 #undef vucp
 #undef vusp

--=-=-=--
