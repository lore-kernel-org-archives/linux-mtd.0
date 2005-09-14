Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EFdCL-0001wb-BV
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 15:45:47 -0400
Received: from slurryseal.ddns.mvista.com (av [127.0.0.1])
	by av.mvista.com (8.9.3/8.9.3) with ESMTP id MAA17135
	for <linux-mtd@lists.infradead.org>; Wed, 14 Sep 2005 12:41:18 -0700
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4) with ESMTP id
	j8EJfFpF028932
	for <linux-mtd@lists.infradead.org>; Wed, 14 Sep 2005 12:41:15 -0700
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4/Submit) id j8EJfFrN028931
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 12:41:15 -0700
Date: Wed, 14 Sep 2005 12:41:15 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20050914194115.GA28889@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Spansion S29WS-N CFI query fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Certain models of AMD Spansion CFI flash chips requires a CFI Query
command to be written to address 0x555, whereas (most?) other models
require the command to be written to address 0x55.  Models that require
address 0x555 include the S29WS-N MirrorBit flash family.  The CFI probe
code is generic for all CFI command sets.  Intel StrataFlash (at least
J/K-series) treats the CFI Query command address as a don't care.  The
MirrorBit flash chips don't seem to quite fit the JEDEC probe sequence
either.

So the following tries both addresses 0x55 and 0x555 at probe time.
It's also been tested on a StrataFlash J3 flash without ill effect.  The
use of the 0x555 address in these chips may have been a temporary
deviation, as the datasheet claims future models will use address 0x55.
So not sure if it's worth updating linux-mtd for this, but in case you've
got a board with these chips this patch may help.

If anyone has any better suggestions or knows of a flash chip in which
doing this may cause harm I'd appreciate hearing about it, thanks. --
Todd

Index: linux-2.6.13/drivers/mtd/chips/cfi_probe.c
===================================================================
--- linux-2.6.13.orig/drivers/mtd/chips/cfi_probe.c
+++ linux-2.6.13/drivers/mtd/chips/cfi_probe.c
@@ -28,7 +28,8 @@ static void print_cfi_ident(struct cfi_i
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
 			  unsigned long *chip_map, struct cfi_private *cfi);
-static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
+static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi,
+			  int amd555);
 
 struct mtd_info *cfi_probe(struct map_info *map);
 
@@ -51,20 +52,20 @@ do { \
 	xip_allowed(base, map); \
 } while (0)
 
-#define xip_disable_qry(base, map, cfi) \
+#define xip_disable_qry(base, map, cfi, amd555)	\
 do { \
 	xip_disable(); \
 	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL); \
 	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL); \
-	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL); \
+	cfi_send_gen_cmd(0x98, amd555 ? 0x555 : 0x55, base, map, cfi, cfi->device_type, NULL); \
 } while (0)
 
 #else
 
-#define xip_disable()			do { } while (0)
-#define xip_allowed(base, map)		do { } while (0)
-#define xip_enable(base, map, cfi)	do { } while (0)
-#define xip_disable_qry(base, map, cfi) do { } while (0)
+#define xip_disable()				do { } while (0)
+#define xip_allowed(base, map)			do { } while (0)
+#define xip_enable(base, map, cfi)		do { } while (0)
+#define xip_disable_qry(base, map, cfi, amd555) do { } while (0)
 
 #endif
 
@@ -103,6 +104,7 @@ static int __xipram cfi_probe_chip(struc
 				   unsigned long *chip_map, struct cfi_private *cfi)
 {
 	int i;
+	int amd555 = 0;
 	
 	if ((base + 0) >= map->size) {
 		printk(KERN_NOTICE
@@ -123,14 +125,21 @@ static int __xipram cfi_probe_chip(struc
 	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
 
 	if (!qry_present(map,base,cfi)) {
-		xip_enable(base, map, cfi);
-		return 0;
+		cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type,
+				 NULL);
+
+		if (!qry_present(map,base,cfi)) {
+			xip_enable(base, map, cfi);
+			return 0;
+		}
+
+		amd555 = 1;
 	}
 
 	if (!cfi->numchips) {
 		/* This is the first time we're called. Set up the CFI 
 		   stuff accordingly and return */
-		return cfi_chip_setup(map, cfi);
+		return cfi_chip_setup(map, cfi, amd555);
 	}
 
 	/* Check each previous chip to see if it's an alias */
@@ -190,7 +199,7 @@ static int __xipram cfi_probe_chip(struc
 }
 
 static int __xipram cfi_chip_setup(struct map_info *map, 
-				   struct cfi_private *cfi)
+				   struct cfi_private *cfi, int amd555)
 {
 	int ofs_factor = cfi->interleave*cfi->device_type;
 	__u32 base = 0;
@@ -215,7 +224,7 @@ static int __xipram cfi_chip_setup(struc
 	cfi->cfi_mode = CFI_MODE_CFI;
 	
 	/* Read the CFI info structure */
-	xip_disable_qry(base, map, cfi);
+	xip_disable_qry(base, map, cfi, amd555);
 	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
 		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
 
Index: linux-2.6.13/drivers/mtd/chips/cfi_util.c
===================================================================
--- linux-2.6.13.orig/drivers/mtd/chips/cfi_util.c
+++ linux-2.6.13/drivers/mtd/chips/cfi_util.c
@@ -51,8 +51,10 @@ __xipram cfi_read_pri(struct map_info *m
 	local_irq_disable();
 #endif
 
-	/* Switch it into Query Mode */
+	/* Switch it into Query Mode.  Some chips want address 0x55, some
+	   want 0x555. */
 	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type, NULL);
 
 	/* Read in the Extended Query Table */
 	for (i=0; i<size; i++) {
