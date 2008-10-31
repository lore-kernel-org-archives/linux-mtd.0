Subject: Re: ST M29W320D incorrectly configured
From: David Woodhouse <dwmw2@infradead.org>
To: Corinna Schultz <cschultz@linux.vnet.ibm.com>
In-Reply-To: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
Content-Type: text/plain
Date: Fri, 31 Oct 2008 14:38:47 +0000
Message-Id: <1225463927.16774.106.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org, ebiederm@xmission.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-10-29 at 19:53 -0400, Corinna Schultz wrote:
> I'm having a problem getting the unlock addresses correctly configured  
> for the ST M29W320D chip. CFI query data is shown below (from  
> debugging statements I enabled and/or added to the driver). The chip  
> is wired so that the #BYTE pin is low, putting the chip into x8 mode.  
> The data bus is physically 8 bits.
> 
> I don't understand everything that's going on in the code, but it  
> seems to me that the following code (taken from cfi_cmdset_0002.c,  
> which sets the unlock addresses needed for writing and erasing) has a  
> logic error. Maybe someone can explain it to me?
> 
>   if (    /* x16 in x8 mode */
>      ((cfi->device_type == CFI_DEVICETYPE_X8) &&
>       (cfi->cfiq->InterfaceDesc == 2))
> 
> 
> The reason I think this is in error is that both the device type and  
> the interfaceDesc are defined by the hardware, and not indicative of  
> the mode. Besides, isn't this conditional actually testing if the chip
> is an X8 chip and supports x8 and x16 async modes?

That condition is doubly wrong, I think. Not only does it never trigger,
but it'd do the wrong thing if it _did_ trigger. I think the answer is
to revert this:
http://lists.infradead.org/pipermail/linux-mtd-cvs/2004-September/004096.html

It would be nice if we could do it that way, but these ST chips don't
seem to work. When they're in 16-bit mode, they really do need a byte
address of 0x555 for the second unlock address, not 0x554 (0x2aa*2) as
every other chip seems to accept. Although it takes _extra_ logic to
check the input on the 'A-1' pin, they seem to have it.

So I think the answer is to go back to cfi->addr_unlock[12] being _byte_
addresses within the chip...

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 3e6f5d8..045e3c3 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -404,21 +404,18 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 			}
 		}
 		/* Set the default CFI lock/unlock addresses */
-		cfi->addr_unlock1 = 0x555;
-		cfi->addr_unlock2 = 0x2aa;
-		/* Modify the unlock address if we are in compatibility mode */
-		if (	/* x16 in x8 mode */
-			((cfi->device_type == CFI_DEVICETYPE_X8) &&
-				(cfi->cfiq->InterfaceDesc ==
-					CFI_INTERFACE_X8_BY_X16_ASYNC)) ||
-			/* x32 in x16 mode */
-			((cfi->device_type == CFI_DEVICETYPE_X16) &&
-				(cfi->cfiq->InterfaceDesc ==
-					CFI_INTERFACE_X16_BY_X32_ASYNC)))
-		{
-			cfi->addr_unlock1 = 0xaaa;
-			cfi->addr_unlock2 = 0x555;
-		}
+		cfi->addr_unlock1 = 0x555 << cfi->device_type;
+		cfi->addr_unlock2 = 0x2aa << cfi->device_type;
+
+		/* Handle the case of x16 chips in x8 mode which are _really_
+		   picky about the unlock addresses, and require that A-1 is
+		   set too. This is only some ST chips so far...  */
+		if (cfi->device_type == 2 && map_bankwidth(map) == cfi_interleave(cfi))
+			cfi->addr_unlock2 |= 1; /* i.e. 0x555 instead of 0x554 */
+
+		/* Theoretically there can be x32 chips with a x16 mode, which
+		   might need similar treatment. We'll deal with that if it
+		   happens. */
 
 	} /* CFI mode */
 	else if (cfi->cfi_mode == CFI_MODE_JEDEC) {
@@ -994,16 +991,16 @@ static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chi
 
 	chip->state = FL_READY;
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 
 	map_copy_from(map, buf, adr, len);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 
 	wake_up(&chip->wq);
 	spin_unlock(chip->mutex);
@@ -1102,9 +1099,9 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
  retry:
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	map_write(map, datum, adr);
 	chip->state = FL_WRITING;
 
@@ -1340,9 +1337,9 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, cmd_adr);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 
 	/* Write Buffer Load */
 	map_write(map, CMD(0x25), cmd_adr);
@@ -1528,12 +1525,12 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
@@ -1616,11 +1613,11 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	map_write(map, CMD(0x30), adr);
 
 	chip->state = FL_ERASING;
@@ -1739,15 +1736,15 @@ static int do_atmel_lock(struct map_info *map, struct flchip *chip,
 	      __func__, adr, len);
 
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
+			 CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-			 cfi->device_type, NULL);
+			 CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
+			 CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
+			 CFI_DEVICETYPE_X8, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-			 cfi->device_type, NULL);
+			 CFI_DEVICETYPE_X8, NULL);
 	map_write(map, CMD(0x40), chip->start + adr);
 
 	chip->state = FL_READY;
@@ -1775,7 +1772,7 @@ static int do_atmel_unlock(struct map_info *map, struct flchip *chip,
 	      __func__, adr, len);
 
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
+			 CFI_DEVICETYPE_X8, NULL);
 	map_write(map, CMD(0x70), adr);
 
 	chip->state = FL_READY;
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index f84ab61..93f464f 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1844,11 +1844,11 @@ static void jedec_reset(u32 base, struct map_info *map, struct cfi_private *cfi)
 		DEBUG( MTD_DEBUG_LEVEL3,
 		       "reset unlock called %x %x \n",
 		       cfi->addr_unlock1,cfi->addr_unlock2);
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	}
 
-	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	/* Some misdesigned Intel chips do not respond for 0xF0 for a reset,
 	 * so ensure we're in read mode.  Send both the Intel and the AMD command
 	 * for this.  Intel uses 0xff for this, AMD uses 0xff for NOP, so
@@ -1859,9 +1859,10 @@ static void jedec_reset(u32 base, struct map_info *map, struct cfi_private *cfi)
 }
 
 
-static int cfi_jedec_setup(struct cfi_private *p_cfi, int index)
+static int cfi_jedec_setup(struct map_info *map, struct cfi_private *p_cfi, int index)
 {
 	int i,num_erase_regions;
+	unsigned unlock_mask = 0xFFFF << (map_bankwidth(map) / cfi_interleave(p_cfi) - 1);
 	uint8_t uaddr;
 
 	if (! (jedec_table[index].devtypes & p_cfi->device_type)) {
@@ -1900,10 +1901,9 @@ static int cfi_jedec_setup(struct cfi_private *p_cfi, int index)
 
 	/* The table has unlock addresses in _bytes_, and we try not to let
 	   our brains explode when we see the datasheets talking about address
-	   lines numbered from A-1 to A18. The CFI table has unlock addresses
-	   in device-words according to the mode the device is connected in */
-	p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 / p_cfi->device_type;
-	p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 / p_cfi->device_type;
+	   lines numbered from A-1 to A18. */
+	p_cfi->addr_unlock1 = unlock_addrs[uaddr].addr1 & unlock_mask;
+	p_cfi->addr_unlock2 = unlock_addrs[uaddr].addr2 & unlock_mask;
 
 	return 1; 	/* ok */
 }
@@ -1924,6 +1924,7 @@ static inline int jedec_match( uint32_t base,
 	int rc = 0;           /* failure until all tests pass */
 	u32 mfr, id;
 	uint8_t uaddr;
+	unsigned unlock_mask = 0xFFFF << (map_bankwidth(map) / cfi_interleave(cfi) - 1);
 
 	/*
 	 * The IDs must match.  For X16 and X32 devices operating in
@@ -1987,8 +1988,8 @@ static inline int jedec_match( uint32_t base,
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): check unlock addrs 0x%.4x 0x%.4x\n",
 	       __func__, cfi->addr_unlock1, cfi->addr_unlock2 );
 	if ( MTD_UADDR_UNNECESSARY != uaddr && MTD_UADDR_DONT_CARE != uaddr
-	     && ( unlock_addrs[uaddr].addr1 / cfi->device_type != cfi->addr_unlock1 ||
-		  unlock_addrs[uaddr].addr2 / cfi->device_type != cfi->addr_unlock2 ) ) {
+	     && ( (unlock_addrs[uaddr].addr1 & unlock_mask) != cfi->addr_unlock1 ||
+		  (unlock_addrs[uaddr].addr2 & unlock_mask) != cfi->addr_unlock2 ) ) {
 		DEBUG( MTD_DEBUG_LEVEL3,
 			"MTD %s(): 0x%.4x 0x%.4x did not match\n",
 			__func__,
@@ -2029,10 +2030,10 @@ static inline int jedec_match( uint32_t base,
 	 */
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__ );
 	if (cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	/* FIXME - should have a delay before continuing */
 
  match_done:
@@ -2049,13 +2050,15 @@ static int jedec_probe_chip(struct map_info *map, __u32 base,
 
  retry:
 	if (!cfi->numchips) {
+		unsigned unlock_mask = 0xFFFF << (map_bankwidth(map) / cfi_interleave(cfi) - 1);
+
 		uaddr_idx++;
 
 		if (MTD_UADDR_UNNECESSARY == uaddr_idx)
 			return 0;
 
-		cfi->addr_unlock1 = unlock_addrs[uaddr_idx].addr1 / cfi->device_type;
-		cfi->addr_unlock2 = unlock_addrs[uaddr_idx].addr2 / cfi->device_type;
+		cfi->addr_unlock1 = unlock_addrs[uaddr_idx].addr1 & unlock_mask;
+		cfi->addr_unlock2 = unlock_addrs[uaddr_idx].addr2 & unlock_mask;
 	}
 
 	/* Make certain we aren't probing past the end of map */
@@ -2067,8 +2070,8 @@ static int jedec_probe_chip(struct map_info *map, __u32 base,
 
 	}
 	/* Ensure the unlock addresses we try stay inside the map */
-	probe_offset1 = cfi_build_cmd_addr(cfi->addr_unlock1, cfi_interleave(cfi), cfi->device_type);
-	probe_offset2 = cfi_build_cmd_addr(cfi->addr_unlock2, cfi_interleave(cfi), cfi->device_type);
+	probe_offset1 = cfi_build_cmd_addr(cfi->addr_unlock1, cfi_interleave(cfi), CFI_DEVICETYPE_X8);
+	probe_offset2 = cfi_build_cmd_addr(cfi->addr_unlock2, cfi_interleave(cfi), CFI_DEVICETYPE_X8);
 	if (	((base + probe_offset1 + map_bankwidth(map)) >= map->size) ||
 		((base + probe_offset2 + map_bankwidth(map)) >= map->size))
 		goto retry;
@@ -2078,10 +2081,10 @@ static int jedec_probe_chip(struct map_info *map, __u32 base,
 
 	/* Autoselect Mode */
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, CFI_DEVICETYPE_X8, NULL);
 	/* FIXME - should have a delay before continuing */
 
 	if (!cfi->numchips) {
@@ -2099,7 +2102,7 @@ static int jedec_probe_chip(struct map_info *map, __u32 base,
 				       "MTD %s(): matched device 0x%x,0x%x unlock_addrs: 0x%.4x 0x%.4x\n",
 				       __func__, cfi->mfr, cfi->id,
 				       cfi->addr_unlock1, cfi->addr_unlock2 );
-				if (!cfi_jedec_setup(cfi, i))
+				if (!cfi_jedec_setup(map, cfi, i))
 					return 0;
 				goto ok_out;
 			}
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index ee5124e..f32bd96 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -267,8 +267,8 @@ struct cfi_private {
 	int interleave;
 	int device_type;
 	int cfi_mode;		/* Are we a JEDEC device pretending to be CFI? */
-	int addr_unlock1;
-	int addr_unlock2;
+	int addr_unlock1;	/* These are _byte_ addresses, rather than */
+	int addr_unlock2;	/* needing to be multiplied by device_type */
 	struct mtd_info *(*cmdset_setup)(struct map_info *);
 	struct cfi_ident *cfiq; /* For now only one. We insist that all devs
 				  must be of the same type. */

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
