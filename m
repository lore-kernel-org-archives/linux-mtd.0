Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bi9m4-0002M3-9P
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 06:35:37 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: "Thomas W. Nelson" <twn@dot4.com>
In-Reply-To: <40EB0D28.60309@dot4.com>
References: <40EB0D28.60309@dot4.com>
Content-Type: text/plain
Date: Wed, 07 Jul 2004 11:32:30 +0100
Message-Id: <1089196350.5577.22.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD support on Motorola Hawk ASIC-based boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-06 at 16:35 -0400, Thomas W. Nelson wrote:
> The basic configuration is nothing out of the ordinary: 4 AMD 29LV160BT 
> (2 MB) devices in x16 mode, arranged in two 32-bit wide even/odd address 
> banks.  The one major quirk in the design is that the Hawk memory 
> controller ASIC only permits 32-bit wide aligned writes to this array 
> (any other type of write -> /dev/null, reads are unconstrained). 

Our code doesn't currently handle the case where you have more chips
than you can address in a single bus cycle, and there are different sets
of chips at different bus addresses.

I've just encountered a board slightly more pathological than this --
the Dy-4 SVME/DMV-182 seems to have eight 32-bit chips, arranged
interleaved so that the word at 0x0000 is the first chip, as is the word
at 0x0020... You then find your CFI 'Q' at 0x200, 'R' at 0x220, etc...

There's a hack in the TimeSys kernel which was never discussed or shown
here, which makes the code handle the concept that the repetition
interval (the address at which you start talking to chip 0 again) may be
a _multiple_ of the buswidth. They call this multiple
'extra_interleave'.

When I first looked at it I thought it was a horrifically ugly hack, but
having looked for alternative approaches I don't think it's their fault
--  _all_ the CFI code gives me the same kind of skullache.

Alternative suggestions for handling this are most definitely welcome.

A simple alternative in your case might be to say your buswidth is 64,
and hack your write64 to do it in 2 32-bit accesses. But we need to
address this properly anyway.

The patch is against an old snapshot of MTD code but should serve to
illustrate the concept. The CVS Ids of the files it's based on are
present in the diff.

Index: include/linux/mtd/cfi.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi.h,v
retrieving revision 1.38
diff -u -p -w -r1.38 cfi.h
--- include/linux/mtd/cfi.h	8 Nov 2003 00:51:21 -0000	1.38
+++ include/linux/mtd/cfi.h	29 Jun 2004 15:11:02 -0000
@@ -104,58 +104,32 @@ typedef __u32 cfi_word;
  * out of range.
  */
 
-#ifdef CFIDEV_INTERLEAVE_1
-# ifdef CFIDEV_INTERLEAVE
-#  undef CFIDEV_INTERLEAVE
 #  define CFIDEV_INTERLEAVE (cfi->interleave)
-# else
-#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_1
-# endif
-# define cfi_interleave_is_1() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_1)
+
+#ifdef CFIDEV_INTERLEAVE_1
+# define cfi_interleave_is_1() (cfi->subword_interleave == CFIDEV_INTERLEAVE_1)
 #else
 # define cfi_interleave_is_1() (0)
 #endif
 
 #ifdef CFIDEV_INTERLEAVE_2
-# ifdef CFIDEV_INTERLEAVE
-#  undef CFIDEV_INTERLEAVE
-#  define CFIDEV_INTERLEAVE (cfi->interleave)
-# else
-#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_2
-# endif
-# define cfi_interleave_is_2() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_2)
+# define cfi_interleave_is_2() (cfi->subword_interleave == CFIDEV_INTERLEAVE_2)
 #else
 # define cfi_interleave_is_2() (0)
 #endif
 
 #ifdef CFIDEV_INTERLEAVE_4
-# ifdef CFIDEV_INTERLEAVE
-#  undef CFIDEV_INTERLEAVE
-#  define CFIDEV_INTERLEAVE (cfi->interleave)
-# else
-#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_4
-# endif
-# define cfi_interleave_is_4() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_4)
+# define cfi_interleave_is_4() (cfi->subword_interleave == CFIDEV_INTERLEAVE_4)
 #else
 # define cfi_interleave_is_4() (0)
 #endif
 
 #ifdef CFIDEV_INTERLEAVE_8
-# ifdef CFIDEV_INTERLEAVE
-#  undef CFIDEV_INTERLEAVE
-#  define CFIDEV_INTERLEAVE (cfi->interleave)
-# else
-#  define CFIDEV_INTERLEAVE CFIDEV_INTERLEAVE_8
-# endif
-# define cfi_interleave_is_8() (CFIDEV_INTERLEAVE == CFIDEV_INTERLEAVE_8)
+# define cfi_interleave_is_8() (cfi->subword_interleave == CFIDEV_INTERLEAVE_8)
 #else
 # define cfi_interleave_is_8() (0)
 #endif
 
-#ifndef CFIDEV_INTERLEAVE
-#error You must define at least one interleave to support!
-#endif
-
 #ifdef CFIDEV_BUSWIDTH_1
 # ifdef CFIDEV_BUSWIDTH
 #  undef CFIDEV_BUSWIDTH
@@ -320,6 +294,8 @@ struct cfi_private {
 	__u16 cmdset;
 	void *cmdset_priv;
 	int interleave;
+	int subword_interleave; /* interleave before extra interleave is applied */
+	int extra_interleave_step; /* log2(subword_interleave * device_type) */
 	int device_type;
 	int cfi_mode;		/* Are we a JEDEC device pretending to be CFI? */
 	int addr_unlock1;
@@ -436,18 +412,23 @@ static inline void cfi_write(struct map_
 }
 
 /*
- * Sends a CFI command to a bank of flash for the given geometry.
+ * Sends a CFI command to a specific chip of a bank of flash for the
+ * given geometry.  Note that this only refers to chips specified
+ * using extra_interleave; sub-word and tightly connected interleaves
+ * always act as if cfi_send_gen_cmd_all was called.
  *
  * Returns the offset in flash where the command was written.
  * If prev_val is non-null, it will be set to the value at the command address,
  * before the command was written.
  */
-static inline __u32 cfi_send_gen_cmd(u_char cmd, __u32 cmd_addr, __u32 base,
-				struct map_info *map, struct cfi_private *cfi,
+static inline __u32 cfi_send_gen_cmd_chip(u_char cmd, __u32 cmd_addr, int chip,
+                                          __u32 base, struct map_info *map,
+                                          struct cfi_private *cfi,
 				int type, cfi_word *prev_val)
 {
 	cfi_word val;
 	__u32 addr = base + cfi_build_cmd_addr(cmd_addr, CFIDEV_INTERLEAVE, type);
+	addr += chip << cfi->extra_interleave_step;
 
 	val = cfi_build_cmd(cmd, map, cfi);
 
@@ -459,6 +440,51 @@ static inline __u32 cfi_send_gen_cmd(u_c
 	return addr - base;
 }
 
+/*
+ * Sends a CFI command to a bank of flash for the given geometry.
+ * If extra_interleave is 1, this is the same as cfi_send_gen_cmd_all.
+ * Otherwise, it sends a command only to the first chip (or group
+ * of subword-interleaved chips).  This is generally only desired
+ * for things like queries, when one may want to use prev_val.
+ *
+ * Returns the offset in flash where the command was written.
+ * If prev_val is non-null, it will be set to the value at the command address,
+ * before the command was written.
+ */
+static inline __u32 cfi_send_gen_cmd(u_char cmd, __u32 cmd_addr, __u32 base,
+                                     struct map_info *map,
+                                     struct cfi_private *cfi,
+                                     int type, cfi_word *prev_val)
+{
+	return cfi_send_gen_cmd_chip(cmd, cmd_addr, 0, base,
+	                             map, cfi, type, prev_val);
+}
+
+/*
+ * Sends a CFI command to all chips of a bank of flash for the given geometry.
+ *
+ * Returns the offset in flash where the command was written.
+ * If prev_val is non-null, it will be set to the value at the command address,
+ * before the command was written.
+ */
+static inline __u32 cfi_send_gen_cmd_all(u_char cmd, __u32 cmd_addr,
+                                         __u32 base,
+                                         struct map_info *map,
+                                         struct cfi_private *cfi,
+                                         int type)
+{
+	cfi_word val;
+	__u32 addr = base + cfi_build_cmd_addr(cmd_addr, CFIDEV_INTERLEAVE, type);
+	int i;
+
+	val = cfi_build_cmd(cmd, map, cfi);
+	
+	for (i = 0; i < map->extra_interleave; i++)
+		cfi_write(map, val, addr + (i << cfi->extra_interleave_step));
+
+	return addr - base;
+}
+
 static inline __u8 cfi_read_query(struct map_info *map, __u32 addr)
 {
 	if (cfi_buswidth_is_1()) {
Index: include/linux/mtd/map.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/map.h,v
retrieving revision 1.34
diff -u -p -w -r1.34 map.h
--- include/linux/mtd/map.h	28 May 2003 12:42:22 -0000	1.34
+++ include/linux/mtd/map.h	29 Jun 2004 15:11:02 -0000
@@ -38,7 +38,6 @@ struct map_info {
 
 	int buswidth; /* in octets */
 
-#ifdef CONFIG_MTD_COMPLEX_MAPPINGS
 	u8 (*read8)(struct map_info *, unsigned long);
 	u16 (*read16)(struct map_info *, unsigned long);
 	u32 (*read32)(struct map_info *, unsigned long);  
@@ -57,7 +56,7 @@ struct map_info {
 
 	/* We can perhaps put in 'point' and 'unpoint' methods, if we really
 	   want to enable XIP for non-linear mappings. Not yet though. */
-#endif
+
 	/* set_vpp() must handle being reentered -- enable, enable, disable 
 	   must leave it enabled. */
 	void (*set_vpp)(struct map_info *, int);
@@ -66,6 +65,18 @@ struct map_info {
 	unsigned long map_priv_2;
 	void *fldrv_priv;
 	struct mtd_chip_driver *fldrv;
+	
+	/* Interleave between loosely connected chips -- only use this
+	   when a command sent to one chip will not be received by all
+	   chips in the interleave.  Do not count sub-word interleaves, as
+	   in that case all chips can be simultaneously programmed even if
+	   the chips are loosely connected.  A value of zero will be
+	   converted into a default of one.
+	   
+	   This is currently supported only for CFI cmdset 0002
+	   (AMD/Fujitsu). */
+	   
+	unsigned int extra_interleave;
 };
 
 struct mtd_chip_driver {
Index: drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.94
diff -u -p -w -r1.94 cfi_cmdset_0002.c
--- drivers/mtd/chips/cfi_cmdset_0002.c	27 Jan 2004 10:16:20 -0000	1.94
+++ drivers/mtd/chips/cfi_cmdset_0002.c	29 Jun 2004 15:11:02 -0000
@@ -247,8 +247,8 @@ struct mtd_info *cfi_cmdset_0002(struct 
 				}
 				break;
 			case CFI_DEVICETYPE_X32:
-				cfi->addr_unlock1 = 0x1555; 
-				cfi->addr_unlock2 = 0xaaa; 
+				cfi->addr_unlock1 = 0x1554; 
+				cfi->addr_unlock2 = 0xaa8;
 				break;
 			default:
 				printk(KERN_WARNING
@@ -451,10 +451,10 @@ static inline void handle_wacky_state(co
 		       );
 
 		printk(KERN_WARNING
-		       "MTD %s(): 0x%.8lx(0x%.8x): 0x%.8x 0x%.8x 0x%.8x 0x%.8x\n",
-		       func, adr, datum,
-		       prev_oldstatus, prev_status,
-		       oldstatus, status);
+		       "MTD %s(): 0x%.8lx(0x%.8lx): 0x%.8lx 0x%.8lx 0x%.8lx 0x%.8lx\n",
+		       func, adr, (unsigned long)datum,
+		       (unsigned long)prev_oldstatus, (unsigned long)prev_status,
+		       (unsigned long)oldstatus, (unsigned long)status);
 #ifdef CONFIG_MTD_CFI_AMDSTD_RETRY
 	}
 #endif
@@ -470,6 +470,7 @@ static int get_chip(struct map_info *map
 	cfi_word dq2 = CMD(1<<2);
 	unsigned long timeo;
 	struct cfi_pri_amdstd *cfip = (struct cfi_pri_amdstd *)cfi->cmdset_priv;
+	int i, done;
 
  resettime:
 	timeo = jiffies + HZ;
@@ -510,33 +511,54 @@ static int get_chip(struct map_info *map
 		      || (mode == FL_WRITING && (cfip->EraseSuspend & 0x1))))
 			goto sleep;
 
-                oldstatus = cfi_read(map, adr);
-                status = cfi_read(map, adr);
+		for (i = 0; i < map->extra_interleave; i++) {
+			oldstatus = cfi_read(map, adr + (i << cfi->extra_interleave_step));
+			status = cfi_read(map, adr + (i << cfi->extra_interleave_step));
+
                 if ((oldstatus ^ status) & dq2) {
                         printk(KERN_ERR "Can't suspend erase -- block in progress\n");
                         goto sleep;
                 }
+		}
 
 		/* Erase suspend */
 		/* FIXME - is there a way to verify suspend? */
-		cfi_write(map, CMD(0xB0), chip->in_progress_block_addr);
+		for (i = 0; i < map->extra_interleave; i++)
+			cfi_write(map, 0xB0, chip->in_progress_block_addr + 
+			                     (i << cfi->extra_interleave_step));
+
 		chip->oldstate = FL_ERASING;
 		chip->state = FL_ERASE_SUSPENDING;
 		chip->erase_suspended = 1;
 		for (;;) {
-			oldstatus = cfi_read(map, chip->in_progress_block_addr);
-			status = cfi_read(map, chip->in_progress_block_addr);
-			if (((oldstatus ^ status) & dq6) == 0)
+			done = 1;
+		
+			for (i = 0; i < map->extra_interleave; i++) {
+				oldstatus = cfi_read(map, chip->in_progress_block_addr +
+				                          (i << cfi->extra_interleave_step));
+				status = cfi_read(map, chip->in_progress_block_addr +
+				                       (i << cfi->extra_interleave_step));
+				if ((oldstatus ^ status) & dq6) {
+					done = 0;
+					break;
+				}
+			}
+			
+			if (done)
 			        break;
 
 			if (time_after(jiffies, timeo)) {
 				/* Urgh. Resume and pretend we weren't here. */
 				/* FIXME - is there a way to verify resume? */
-				cfi_write(map, CMD(0x30), chip->in_progress_block_addr);
+
+				for (i = 0; i < map->extra_interleave; i++)
+					cfi_write(map, 0x30, chip->in_progress_block_addr + 
+					                     (i << cfi->extra_interleave_step));
+
 				chip->state = FL_ERASING;
 				chip->oldstate = FL_READY;
 				printk(KERN_ERR "Chip not ready after erase "
-				       "suspended: status = 0x%x\n", status);
+				       "suspended: status = 0x%lx\n", (unsigned long)status);
 				return -EIO;
 			}
 
@@ -570,11 +592,14 @@ static int get_chip(struct map_info *map
 static void put_chip(struct map_info *map, struct flchip *chip, unsigned long adr)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
+	int i;
 
 	switch(chip->oldstate) {
 	case FL_ERASING:
 		chip->state = chip->oldstate;
-		cfi_write(map, CMD(0x30), chip->in_progress_block_addr);
+		for (i = 0; i < map->extra_interleave; i++)
+			cfi_write(map, 0x30, chip->in_progress_block_addr + 
+			                     (i << cfi->extra_interleave_step));
 		chip->oldstate = FL_READY;
 		chip->state = FL_ERASING;
 		break;
@@ -596,6 +621,7 @@ static inline int do_read_onechip(struct
 	unsigned long cmd_addr;
 	struct cfi_private *cfi = map->fldrv_priv;
 	int ret;
+	int i;
 
 	adr += chip->start;
 
@@ -610,7 +636,8 @@ static inline int do_read_onechip(struct
 	}
 
 	if (chip->state != FL_POINT && chip->state != FL_READY) {
-		cfi_write(map, CMD(0xf0), cmd_addr);
+		for (i = 0; i < map->extra_interleave; i++)
+			cfi_write(map, 0xf0, cmd_addr + (i << cfi->extra_interleave_step));
 		chip->state = FL_READY;
 	}
 
@@ -699,17 +726,17 @@ static inline int do_read_secsi_onechip(
 	chip->state = FL_READY;
 
 	/* should these be CFI_DEVICETYPE_X8 instead of cfi->device_type? */
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type);
+	cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type);
+	cfi_send_gen_cmd_all(0x88, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type);
 	
 	map_copy_from(map, buf, adr, len);
 
 	/* should these be CFI_DEVICETYPE_X8 instead of cfi->device_type? */
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type);
+	cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type);
+	cfi_send_gen_cmd_all(0x90, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type);
+	cfi_send_gen_cmd_all(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type);
 	
 	wake_up(&chip->wq);
 	cfi_spin_unlock(chip->mutex);
@@ -771,7 +798,7 @@ static int do_write_oneword(struct map_i
 	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
 	 * have a max write time of a few hundreds usec). However, we should
 	 * use the maximum timeout value given by the chip at probe time
-	 * instead.  Unfortunately, struct flchip does have a field for
+	 * instead.  Unfortunately, struct flchip doesn't have a field for
 	 * maximum timeout, only for typical which can be far too short
 	 * depending of the conditions.  The ' + 1' is to avoid having a
 	 * timeout of 0 jiffies if HZ is smaller than 1000.
@@ -780,8 +807,11 @@ static int do_write_oneword(struct map_i
 	int ret = 0;
 	int ta = 0;
 	DECLARE_RETRY_CMD_CNT();
+	int ex_ileave_off;
 
 	adr += chip->start;
+	ex_ileave_off = adr >> cfi->extra_interleave_step;
+	ex_ileave_off &= map->extra_interleave - 1;
 
 	cfi_spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_WRITING);
@@ -809,19 +839,29 @@ static int do_write_oneword(struct map_i
 
 	ENABLE_VPP(map);
 	if (fast) { /* Unlock bypass */
-		cfi_send_gen_cmd(0xA0, 0, chip->start, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd_chip(0xA0, 0, ex_ileave_off, chip->start, map,
+		                      cfi, cfi->device_type, NULL);
 	} else {
 		/*
 		 * The CFI_DEVICETYPE_X8 argument is needed even when
 		 * cfi->device_type != CFI_DEVICETYPE_X8.  The addresses for
 		 * command sequences don't scale even when the device is
-		 * wider.  This is the case for many of the cfi_send_gen_cmd()
+		 * wider.  This is the case for many of the cfi_send_gen_cmd_all()
 		 * below.  I'm not sure, however, why some use
 		 * cfi->device_type.
+		 *
+		 * SAW: They do scale; however, the scaling was already
+		 * applied when the unlock addresses were computed.
 		 */
-		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd_chip(0xAA, cfi->addr_unlock1, ex_ileave_off, 
+		                      chip->start, map, cfi,
+		                      CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd_chip(0x55, cfi->addr_unlock2, ex_ileave_off,
+		                      chip->start, map, cfi,
+		                      CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd_chip(0xA0, cfi->addr_unlock1, ex_ileave_off,
+		                      chip->start, map, cfi,
+		                      CFI_DEVICETYPE_X8, NULL);
 	}
 	cfi_write(map, datum, adr);
 	chip->state = FL_WRITING;
@@ -941,9 +981,10 @@ static int do_write_oneword(struct map_i
 		if ( status & dq5mask ) {
 			/* dq5 asserted - decode interleave chips */
 			printk( KERN_WARNING
-				"MTD %s(): FLASH internal timeout: 0x%.8x 0x%.8x 0x%8x\n",
+				"MTD %s(): FLASH internal timeout: 0x%.8lx 0x%.8lx 0x%8lx\n",
 				__func__,
-				status & dq5mask, status, datum );
+				(unsigned long)(status & dq5mask),
+				(unsigned long)status, (unsigned long)datum );
 		} else {
 			printk( KERN_WARNING
 				"MTD %s(): Software timed out during write.\n",
@@ -1076,9 +1117,9 @@ static int cfi_amdstd_write_words(struct
 	
 	if (cfi->fast_prog) {
 		/* Go into unlock bypass mode */
-		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
-		cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8);
+		cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEVICETYPE_X8);
+		cfi_send_gen_cmd_all(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8);
 	}
 
 	/* We are now aligned, write as much as possible */
@@ -1105,8 +1146,8 @@ static int cfi_amdstd_write_words(struct
 		if (ret) {
 			if (cfi->fast_prog){
 				/* Get out of unlock bypass mode */
-				cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL);
-				cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL);
+				cfi_send_gen_cmd_all(0x90, 0, chipstart, map, cfi, cfi->device_type);
+				cfi_send_gen_cmd_all(0x00, 0, chipstart, map, cfi, cfi->device_type);
 			}
 			return ret;
 		}
@@ -1119,8 +1160,8 @@ static int cfi_amdstd_write_words(struct
 		if (ofs >> cfi->chipshift) {
 			if (cfi->fast_prog){
 				/* Get out of unlock bypass mode */
-				cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL);
-				cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL);
+				cfi_send_gen_cmd_all(0x90, 0, chipstart, map, cfi, cfi->device_type);
+				cfi_send_gen_cmd_all(0x00, 0, chipstart, map, cfi, cfi->device_type);
 			}
 
 			chipnum ++; 
@@ -1130,17 +1171,17 @@ static int cfi_amdstd_write_words(struct
 			chipstart = cfi->chips[chipnum].start;
 			if (cfi->fast_prog){
 				/* Go into unlock bypass mode for next set of chips */
-				cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
-				cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
-				cfi_send_gen_cmd(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8, NULL);
+				cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8);
+				cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chipstart, map, cfi, CFI_DEVICETYPE_X8);
+				cfi_send_gen_cmd_all(0x20, cfi->addr_unlock1, chipstart, map, cfi, CFI_DEVICETYPE_X8);
 			}
 		}
 	}
 
 	if (cfi->fast_prog){
 		/* Get out of unlock bypass mode */
-		cfi_send_gen_cmd(0x90, 0, chipstart, map, cfi, cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x00, 0, chipstart, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd_all(0x90, 0, chipstart, map, cfi, cfi->device_type);
+		cfi_send_gen_cmd_all(0x00, 0, chipstart, map, cfi, cfi->device_type);
 	}
 
 	/* Write the trailing bytes if any */
@@ -1253,9 +1294,9 @@ static inline int do_write_buffer(struct
 	       __func__, adr, datum );
 
 	ENABLE_VPP(map);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	//cfi_send_gen_cmd_all(0xA0, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
 
 	/* Write Buffer Load */
 	cfi_write(map, CMD(0x25), cmd_adr);
@@ -1383,9 +1424,10 @@ static inline int do_write_buffer(struct
 		if ( status & dq5mask ) {
 			/* dq5 asserted - decode interleave chips */
 			printk( KERN_WARNING
-				"MTD %s(): FLASH internal timeout: 0x%.8x 0x%.8x 0x%8x\n",
+				"MTD %s(): FLASH internal timeout: 0x%.8lx 0x%.8lx 0x%8lx\n",
 				__func__,
-				status & dq5mask, status, datum );
+				(unsigned long)(status & dq5mask),
+				(unsigned long)status, (unsigned long)datum );
 		} else {
 			printk( KERN_WARNING
 				"MTD %s(): Software timed out during write.\n",
@@ -1495,6 +1537,7 @@ static inline int do_erase_chip(struct m
 	int ta = 0;
 	cfi_word datum = 0;
 	DECLARE_RETRY_CMD_CNT();
+	int done, i;
 
 	adr = cfi->addr_unlock1;
 
@@ -1510,12 +1553,12 @@ static inline int do_erase_chip(struct m
 	       __func__, chip->start );
 
 	ENABLE_VPP(map);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0x10, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
@@ -1546,12 +1589,21 @@ static inline int do_erase_chip(struct m
 			chip->erase_suspended = 0;
 		}
 
-		oldstatus = cfi_read(map, adr);
-		status = cfi_read(map, adr);
+		done = 1;
+
+		for (i = 0; i < map->extra_interleave; i++) {
+			oldstatus = cfi_read(map, adr + (i << cfi->extra_interleave_step));
+			status = cfi_read(map, adr + (i << cfi->extra_interleave_step));
 		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
 		       __func__, oldstatus, status );
-		if ( (((status ^ oldstatus) & dq6) == 0)
-		     || ( ta = time_after(jiffies, timeo)) )
+
+			if ((status ^ oldstatus) & dq6) {
+				done = 0;
+				break;
+			}
+		}
+		
+		if (done || (ta = time_after(jiffies, timeo)))
 			break;
 		
 		/* Latency issues. Drop the lock, wait a while and retry */
@@ -1561,10 +1613,15 @@ static inline int do_erase_chip(struct m
 		cfi_spin_lock(chip->mutex);
 	}
 
+	// This may not make sense with extra_interleave...
 	prev_oldstatus = oldstatus;
 	prev_status = status;
-	oldstatus = cfi_read(map, adr);
-	status = cfi_read(map, adr);
+
+	done = 1;
+
+	for (i = 0; i < map->extra_interleave; i++) {
+		oldstatus = cfi_read(map, adr + (i << cfi->extra_interleave_step));
+		status = cfi_read(map, adr + (i << cfi->extra_interleave_step));
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
 	       __func__, oldstatus, status );
 
@@ -1584,33 +1641,40 @@ static inline int do_erase_chip(struct m
 		goto op_failed;
 	}
 
-	if ( oldstatus == datum && status == datum ) {
-		/* success - do nothing */
-		goto op_done;
-	}
+		if (oldstatus != datum || status != datum) {
+			done = 0;
 
 	if ( ta ) {
 		/* Only check dq5 on the chips that are still toggling. */
 		cfi_word dq5mask = ( ( status ^ oldstatus ) & dq6 ) >> 1;
-		if ( status & dq5mask ) {
+
+				if ( oldstatus & dq5mask ) {
 			/* dq5 asserted - decode interleave chips */
 			printk( KERN_WARNING
-				"MTD %s(): FLASH internal timeout: 0x%.8x\n",
+						"MTD %s(): FLASH internal timeout: 0x%.8lx, chip %d\n",
 				__func__,
-				status & dq5mask );
+						(unsigned long)(status & dq5mask), i);
 		} else {
 			printk( KERN_WARNING
-				"MTD %s(): Software timed out during write.\n",
-				__func__ );
+						"MTD %s(): Software timed out during write, chip %d.\n",
+						__func__, i);
 		}
+				
 		goto op_failed;
 	}
 
+			break;
+		}
+	}
+	
+	if (done)
+		goto op_done;
+
 	HANDLE_WACKY_STATE();
 
  op_failed:
 	/* reset on all failures. */
-	cfi_write( map, CMD(0xF0), chip->start );
+	cfi_send_gen_cmd_all(0xF0, 0, chip->start, map, cfi, cfi->device_type);
 	/* FIXME - should have reset delay before continuing */
 	CHECK_RETRIES();
 	ret = -EIO;
@@ -1728,9 +1792,14 @@ static inline int do_erase_oneblock(stru
 	int ta = 0;
 	cfi_word datum = 0;
 	DECLARE_RETRY_CMD_CNT();
+	int i;
+	int done;
 
 	adr += chip->start;
 
+	// adr must be interleave-aligned.
+	adr &= ~(map->extra_interleave - 1);
+
 	cfi_spin_lock(chip->mutex);
 	ret = get_chip(map, chip, adr, FL_ERASING);
 	if (ret) {
@@ -1743,12 +1812,14 @@ static inline int do_erase_oneblock(stru
 	       __func__, adr );
 
 	ENABLE_VPP(map);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
-	cfi_write(map, CMD(0x30), adr);
+	cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+	cfi_send_gen_cmd_all(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8);
+
+	for (i = 0; i < map->extra_interleave; i++)
+		cfi_write(map, 0x30, adr + (i << cfi->extra_interleave_step));
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
@@ -1790,12 +1861,21 @@ static inline int do_erase_oneblock(stru
 			chip->erase_suspended = 0;
 		}
 
-		oldstatus = cfi_read(map, adr);
-		status = cfi_read(map, adr);
+		done = 1;
+
+		for (i = 0; i < map->extra_interleave; i++) {
+			oldstatus = cfi_read(map, adr + (i << cfi->extra_interleave_step));
+			status = cfi_read(map, adr + (i << cfi->extra_interleave_step));
 		DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
 		       __func__, oldstatus, status );
-		if ( (((status ^ oldstatus) & dq6) == 0)
-		     || ( ta = time_after(jiffies, timeo)) )
+ 
+			if ((status ^ oldstatus) & dq6) {
+				done = 0;
+				break;
+			}
+		}
+		
+		if (done || (ta = time_after(jiffies, timeo)))
 			break;
 		
 		/* Latency issues. Drop the lock, wait a while and retry */
@@ -1805,10 +1885,15 @@ static inline int do_erase_oneblock(stru
 		cfi_spin_lock(chip->mutex);
 	}
 
+	// This may not make sense with extra_interleave...
 	prev_oldstatus = oldstatus;
 	prev_status = status;
-	oldstatus = cfi_read(map, adr);
-	status = cfi_read(map, adr);
+
+	done = 1;
+
+	for (i = 0; i < map->extra_interleave; i++) {
+		oldstatus = cfi_read(map, adr + (i << cfi->extra_interleave_step));
+		status = cfi_read(map, adr + (i << cfi->extra_interleave_step));
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check 0x%.8x 0x%.8x\n",
 	       __func__, oldstatus, status );
 
@@ -1828,33 +1913,40 @@ static inline int do_erase_oneblock(stru
 		goto op_failed;
 	}
 
-	if ( oldstatus == datum && status == datum ) {
-		/* success - do nothing */
-		goto op_done;
-	}
+		if (oldstatus != datum || status != datum) {
+			done = 0;
 
 	if ( ta ) {
 		/* Only check dq5 on the chips that are still toggling. */
 		cfi_word dq5mask = ( ( status ^ oldstatus ) & dq6 ) >> 1;
-		if ( status & dq5mask ) {
+
+				if ( oldstatus & dq5mask ) {
 			/* dq5 asserted - decode interleave chips */
 			printk( KERN_WARNING
-				"MTD %s(): FLASH internal timeout: 0x%.8x\n",
+						"MTD %s(): FLASH internal timeout: 0x%.8lx, chip %d\n",
 				__func__,
-				status & dq5mask );
+						(unsigned long)(status & dq5mask), i);
 		} else {
 			printk( KERN_WARNING
-				"MTD %s(): Software timed out during write.\n",
-				__func__ );
+						"MTD %s(): Software timed out during write, chip %d.\n",
+						__func__, i);
 		}
+				
 		goto op_failed;
 	}
 
+			break;
+		}
+	}
+	
+	if (done)
+		goto op_done;
+
 	HANDLE_WACKY_STATE();
 
  op_failed:
 	/* reset on all failures. */
-	cfi_write( map, CMD(0xF0), chip->start );
+	cfi_send_gen_cmd_all(0xF0, 0, chip->start, map, cfi, cfi->device_type);
 	/* FIXME - should have reset delay before continuing */
 	CHECK_RETRIES();
 	ret = -EIO;
@@ -2040,7 +2132,7 @@ static void cfi_amdstd_resume(struct mtd
 		
 		if (chip->state == FL_PM_SUSPENDED) {
 			chip->state = FL_READY;
-			cfi_write(map, CMD(0xF0), chip->start);
+			cfi_send_gen_cmd_all(0xF0, 0, chip->start, map, cfi, cfi->device_type);
 			wake_up(&chip->wq);
 		}
 		else
@@ -2061,10 +2153,10 @@ static int do_printlockstatus_oneblock(s
 	struct cfi_private *cfi = map->fldrv_priv;
 	int ofs_factor = cfi->interleave * cfi->device_type;
 
-	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd_all(0x90, 0x55, 0, map, cfi, cfi->device_type);
 	printk(KERN_DEBUG "block status register for 0x%08lx is %x\n",
 	       adr, cfi_read_query(map, adr+(2*ofs_factor)));
-	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd_all(0xff, 0x55, 0, map, cfi, cfi->device_type);
 	
 	return 0;
 }
Index: drivers/mtd/chips/cfi_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_probe.c,v
retrieving revision 1.73
diff -u -p -w -r1.73 cfi_probe.c
--- drivers/mtd/chips/cfi_probe.c	8 Nov 2003 00:51:21 -0000	1.73
+++ drivers/mtd/chips/cfi_probe.c	29 Jun 2004 15:11:02 -0000
@@ -14,12 +14,13 @@
 #include <linux/errno.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/bitops.h>
 
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/gen_probe.h>
 
-//#define DEBUG_CFI 
+#undef DEBUG_CFI 
 
 #ifdef DEBUG_CFI
 static void print_cfi_ident(struct cfi_ident *);
@@ -53,6 +54,14 @@ static int cfi_probe_chip(struct map_inf
 {
 	int i;
 	
+	if (map->extra_interleave == 0)
+		map->extra_interleave = 1;
+	
+	cfi->subword_interleave = cfi->interleave;
+	cfi->extra_interleave_step =
+		find_last_set_bit(cfi->device_type * cfi->interleave);
+	cfi->interleave *= map->extra_interleave;
+	
 	if ((base + 0) >= map->size) {
 		printk(KERN_NOTICE
 			"Probe at base[0x00](0x%08lx) past the end of the map(0x%08lx)\n",


-- 
dwmw2
