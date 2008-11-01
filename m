Received: from out02.mta.xmission.com ([166.70.13.232])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KwDon-0007Ri-Ay
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 10:34:58 +0000
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Woodhouse <dwmw2@infradead.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
	<m1k5bohs61.fsf@frodo.ebiederm.org>
	<1225524813.16774.140.camel@macbook.infradead.org>
	<m1skqbhmh2.fsf@frodo.ebiederm.org>
	<1225529384.16774.162.camel@macbook.infradead.org>
	<m1d4hfhhim.fsf@frodo.ebiederm.org>
	<m163n7hh8i.fsf_-_@frodo.ebiederm.org>
Date: Sat, 01 Nov 2008 03:31:36 -0700
In-Reply-To: <m163n7hh8i.fsf_-_@frodo.ebiederm.org> (Eric W. Biederman's
	message of "Sat, 01 Nov 2008 03:29:17 -0700")
Message-ID: <m1y703g2k7.fsf_-_@frodo.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [PATCH 2/2] mtd: Simplify cfi_send_gen_cmd.
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org,
	Corinna Schultz <cschultz@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


- type is current unused and is always passed as cfi->device_type
  so it is completely redudndant, so kill it.
- prev_val is not used and so we can remove it and the code that
  stores a value in it.
- The return address is never used so we don't need to have
  one or to compute the return address.

With these cleanups calling cfi_send_gen_cmd no longers scrolls
off the right edge of the screen.  Hooray!

Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   66 ++++++++++++++++-------------------
 drivers/mtd/chips/cfi_cmdset_0020.c |   16 ++++----
 drivers/mtd/chips/cfi_probe.c       |   40 ++++++++++----------
 drivers/mtd/chips/cfi_util.c        |    6 ++--
 drivers/mtd/chips/jedec_probe.c     |   20 +++++-----
 drivers/mtd/maps/nettel.c           |    3 +-
 include/linux/mtd/cfi.h             |   14 +------
 7 files changed, 74 insertions(+), 91 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 9e7a236..ea27ed1 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -937,16 +937,16 @@ static inline int do_read_secsi_onechip(struct map_info *map, struct flchip *chi
 
 	chip->state = FL_READY;
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x88, cfi->addr_unlock1, chip->start, map, cfi);
 
 	map_copy_from(map, buf, adr, len);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x00, cfi->addr_unlock1, chip->start, map, cfi);
 
 	wake_up(&chip->wq);
 	spin_unlock(chip->mutex);
@@ -1045,9 +1045,9 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
  retry:
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
+	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi);
 	map_write(map, datum, adr);
 	chip->state = FL_WRITING;
 
@@ -1283,9 +1283,9 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, cmd_adr);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
+	//cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi);
 
 	/* Write Buffer Load */
 	map_write(map, CMD(0x25), cmd_adr);
@@ -1471,12 +1471,12 @@ static int __xipram do_erase_chip(struct map_info *map, struct flchip *chip)
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x10, cfi->addr_unlock1, chip->start, map, cfi);
 
 	chip->state = FL_ERASING;
 	chip->erase_suspended = 0;
@@ -1559,11 +1559,11 @@ static int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 	ENABLE_VPP(map);
 	xip_disable(map, chip, adr);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
 	map_write(map, CMD(0x30), adr);
 
 	chip->state = FL_ERASING;
@@ -1681,16 +1681,11 @@ static int do_atmel_lock(struct map_info *map, struct flchip *chip,
 	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): LOCK 0x%08lx len %d\n",
 	      __func__, adr, len);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x80, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi);
 	map_write(map, CMD(0x40), chip->start + adr);
 
 	chip->state = FL_READY;
@@ -1717,8 +1712,7 @@ static int do_atmel_unlock(struct map_info *map, struct flchip *chip,
 	DEBUG(MTD_DEBUG_LEVEL3, "MTD %s(): LOCK 0x%08lx len %d\n",
 	      __func__, adr, len);
 
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi);
 	map_write(map, CMD(0x70), adr);
 
 	chip->state = FL_READY;
diff --git a/drivers/mtd/chips/cfi_cmdset_0020.c b/drivers/mtd/chips/cfi_cmdset_0020.c
index d4714dd..6ea8dd5 100644
--- a/drivers/mtd/chips/cfi_cmdset_0020.c
+++ b/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -1160,17 +1160,17 @@ static int cfi_staa_lock(struct mtd_info *mtd, loff_t ofs, size_t len)
 	while(len) {
 
 #ifdef DEBUG_LOCK_BITS
-		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi);
 		printk("before lock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi);
 #endif
 
 		ret = do_lock_oneblock(map, &cfi->chips[chipnum], adr);
 
 #ifdef DEBUG_LOCK_BITS
-		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi);
 		printk("after lock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi);
 #endif
 
 		if (ret)
@@ -1302,22 +1302,22 @@ static int cfi_staa_unlock(struct mtd_info *mtd, loff_t ofs, size_t len)
 		unsigned long temp_adr = adr;
 		unsigned long temp_len = len;
 
-		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi);
                 while (temp_len) {
 			printk("before unlock %x: block status register is %x\n",temp_adr,cfi_read_query(map, temp_adr+(2*ofs_factor)));
 			temp_adr += mtd->erasesize;
 			temp_len -= mtd->erasesize;
 		}
-		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi);
 	}
 #endif
 
 	ret = do_unlock_oneblock(map, &cfi->chips[chipnum], adr);
 
 #ifdef DEBUG_LOCK_BITS
-	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, 0x55, 0, map, cfi);
 	printk("after unlock: block status register is %x\n",cfi_read_query(map, adr+(2*ofs_factor)));
-	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xff, 0x55, 0, map, cfi);
 #endif
 
 	return ret;
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index c418e92..59f1d80 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -44,17 +44,17 @@ do { \
 
 #define xip_enable(base, map, cfi) \
 do { \
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL); \
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL); \
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi); \
+	cfi_send_gen_cmd(0xFF, 0, base, map, cfi); \
 	xip_allowed(base, map); \
 } while (0)
 
 #define xip_disable_qry(base, map, cfi) \
 do { \
 	xip_disable(); \
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL); \
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL); \
-	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL); \
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi); \
+	cfi_send_gen_cmd(0xFF, 0, base, map, cfi); \
+	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi); \
 } while (0)
 
 #else
@@ -116,9 +116,9 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 	}
 
 	xip_disable();
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi);
+	cfi_send_gen_cmd(0xFF, 0, base, map, cfi);
+	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi);
 
 	if (!qry_present(map,base,cfi)) {
 		xip_enable(base, map, cfi);
@@ -144,8 +144,8 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 		if (qry_present(map, start, cfi)) {
 			/* Eep. This chip also had the QRY marker.
 			 * Is it an alias for the new one? */
-			cfi_send_gen_cmd(0xF0, 0, start, map, cfi, cfi->device_type, NULL);
-			cfi_send_gen_cmd(0xFF, 0, start, map, cfi, cfi->device_type, NULL);
+			cfi_send_gen_cmd(0xF0, 0, start, map, cfi);
+			cfi_send_gen_cmd(0xFF, 0, start, map, cfi);
 
 			/* If the QRY marker goes away, it's an alias */
 			if (!qry_present(map, start, cfi)) {
@@ -158,8 +158,8 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 			 * unfortunate. Stick the new chip in read mode
 			 * too and if it's the same, assume it's an alias. */
 			/* FIXME: Use other modes to do a proper check */
-			cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-			cfi_send_gen_cmd(0xFF, 0, start, map, cfi, cfi->device_type, NULL);
+			cfi_send_gen_cmd(0xF0, 0, base, map, cfi);
+			cfi_send_gen_cmd(0xFF, 0, start, map, cfi);
 
 			if (qry_present(map, base, cfi)) {
 				xip_allowed(base, map);
@@ -176,8 +176,8 @@ static int __xipram cfi_probe_chip(struct map_info *map, __u32 base,
 	cfi->numchips++;
 
 	/* Put it back into Read Mode */
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi);
+	cfi_send_gen_cmd(0xFF, 0, base, map, cfi);
 	xip_allowed(base, map);
 
 	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
@@ -224,10 +224,10 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 	 * so should be treated as nops or illegal (and so put the device
 	 * back into Read Mode, which is a nop in this case).
 	 */
-	cfi_send_gen_cmd(0xf0,     0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xf0,     0, base, map, cfi);
+	cfi_send_gen_cmd(0xaa, 0x555, base, map, cfi);
+	cfi_send_gen_cmd(0x55, 0x2aa, base, map, cfi);
+	cfi_send_gen_cmd(0x90, 0x555, base, map, cfi);
 	cfi->mfr = cfi_read_query16(map, base);
 	cfi->id = cfi_read_query16(map, base + ofs_factor);
 
@@ -237,9 +237,9 @@ static int __xipram cfi_chip_setup(struct map_info *map,
 			  cfi_read_query(map, base + 0xf * ofs_factor);
 
 	/* Put it back into Read Mode */
-	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, 0, base, map, cfi);
 	/* ... even if it's an Intel chip */
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xFF, 0, base, map, cfi);
 	xip_allowed(base, map);
 
 	/* Do any necessary byteswapping */
diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
index 0ee4570..8379c71 100644
--- a/drivers/mtd/chips/cfi_util.c
+++ b/drivers/mtd/chips/cfi_util.c
@@ -48,7 +48,7 @@ __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* n
 #endif
 
 	/* Switch it into Query Mode */
-	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi);
 
 	/* Read in the Extended Query Table */
 	for (i=0; i<size; i++) {
@@ -57,8 +57,8 @@ __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* n
 	}
 
 	/* Make sure it returns to read mode */
-	cfi_send_gen_cmd(0xf0, 0, base, map, cfi, cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xff, 0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xf0, 0, base, map, cfi);
+	cfi_send_gen_cmd(0xff, 0, base, map, cfi);
 
 #ifdef CONFIG_MTD_XIP
 	(void) map_read(map, base);
diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 2f3f2f7..98afaf9 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1842,17 +1842,17 @@ static void jedec_reset(u32 base, struct map_info *map, struct cfi_private *cfi)
 		DEBUG( MTD_DEBUG_LEVEL3,
 		       "reset unlock called %x %x \n",
 		       cfi->addr_unlock1,cfi->addr_unlock2);
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi);
 	}
 
-	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, base, map, cfi);
 	/* Some misdesigned Intel chips do not respond for 0xF0 for a reset,
 	 * so ensure we're in read mode.  Send both the Intel and the AMD command
 	 * for this.  Intel uses 0xff for this, AMD uses 0xff for NOP, so
 	 * this should be safe.
 	 */
-	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xFF, 0, base, map, cfi);
 	/* FIXME - should have reset delay before continuing */
 }
 
@@ -2027,10 +2027,10 @@ static inline int jedec_match( uint32_t base,
 	 */
 	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__ );
 	if (cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi);
 	/* FIXME - should have a delay before continuing */
 
  match_done:
@@ -2076,10 +2076,10 @@ static int jedec_probe_chip(struct map_info *map, __u32 base,
 
 	/* Autoselect Mode */
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi, cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi);
 	/* FIXME - should have a delay before continuing */
 
 	if (!cfi->numchips) {
diff --git a/drivers/mtd/maps/nettel.c b/drivers/mtd/maps/nettel.c
index 965e6c6..2586d2f 100644
--- a/drivers/mtd/maps/nettel.c
+++ b/drivers/mtd/maps/nettel.c
@@ -146,8 +146,7 @@ static int nettel_reboot_notifier(struct notifier_block *nb, unsigned long val,
 
 	/* Make sure all FLASH chips are put back into read mode */
 	for (b = 0; (b < nettel_intel_partitions[3].size); b += 0x100000) {
-		cfi_send_gen_cmd(0xff, 0x55, b, &nettel_intel_map, cfi,
-			cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xff, 0x55, b, &nettel_intel_map, cfi);
 	}
 	return(NOTIFY_OK);
 }
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index 0c85510..67931dd 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -435,26 +435,16 @@ static inline unsigned long cfi_merge_status(map_word val, struct map_info *map,
 
 /*
  * Sends a CFI command to a bank of flash for the given geometry.
- *
- * Returns the offset in flash where the command was written.
- * If prev_val is non-null, it will be set to the value at the command address,
- * before the command was written.
  */
-static inline uint32_t cfi_send_gen_cmd(u_char cmd, uint32_t cmd_addr, uint32_t base,
-				struct map_info *map, struct cfi_private *cfi,
-				int type, map_word *prev_val)
+static inline void cfi_send_gen_cmd(u_char cmd, uint32_t cmd_addr, uint32_t base,
+				struct map_info *map, struct cfi_private *cfi)
 {
 	map_word val;
 	uint32_t addr = base + cfi_build_cmd_addr(cmd_addr, map, cfi);
 
 	val = cfi_build_cmd(cmd, map, cfi);
 
-	if (prev_val)
-		*prev_val = map_read(map, addr);
-
 	map_write(map, val, addr);
-
-	return addr - base;
 }
 
 static inline uint8_t cfi_read_query(struct map_info *map, uint32_t addr)
-- 
1.5.6.5
