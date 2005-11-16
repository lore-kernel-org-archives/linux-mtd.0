Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EcBJb-0002rt-9I
	for linux-mtd@lists.infradead.org; Wed, 16 Nov 2005 00:38:20 +0000
Received: from slurryseal.ddns.mvista.com (slurryseal.ddns.mvista.com
	[10.0.10.193])
	by hermes.mvista.com (Postfix) with ESMTP id 507F91AA6E
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Nov 2005 16:37:45 -0800 (PST)
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4) with ESMTP id
	jAG0cQDo019368
	for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2005 16:38:26 -0800
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4/Submit) id jAG0cPlP019367
	for linux-mtd@lists.infradead.org; Tue, 15 Nov 2005 16:38:25 -0800
Date: Tue, 15 Nov 2005 16:38:25 -0800
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20051116003825.GA19181@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Spansion S29WS-N MirrorBit flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Previously I sent an FYI patch on how to use Spansion S29WS-N MirrorBit
flash chips.  Although nominally CFI-compliant, these chips require CFI
query mode to be entered by writing to chip address 0x555 instead of
0x55, which seems a clear violation of the CFI specs I've seen.

The previous patch can cause harm to certain other AMD/Spansion chips
that do not discard the extraneous write to 0x555 and instead fail to
probe the 'QRY' magic.  So here's a new version that works harder to
figure out what address is needed, in case its helpful for anybody using
those chips.  Note that a previous commit for reading 16-bit CFI device
IDs is needed as well.

I think this is probably too ugly to live in CVS, and the datasheet
actually says they won't do this again in future models.

Index: drivers/mtd/chips/cfi_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_probe.c,v
retrieving revision 1.85
diff -u -r1.85 cfi_probe.c
--- drivers/mtd/chips/cfi_probe.c	15 Nov 2005 23:28:17 -0000	1.85
+++ drivers/mtd/chips/cfi_probe.c	16 Nov 2005 00:20:41 -0000
@@ -28,7 +28,8 @@
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
 			  unsigned long *chip_map, struct cfi_private *cfi);
-static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
+static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi,
+			  int amd555);
 
 struct mtd_info *cfi_probe(struct map_info *map);
 
@@ -51,12 +52,12 @@
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
@@ -64,7 +65,7 @@
 #define xip_disable()			do { } while (0)
 #define xip_allowed(base, map)		do { } while (0)
 #define xip_enable(base, map, cfi)	do { } while (0)
-#define xip_disable_qry(base, map, cfi) do { } while (0)
+#define xip_disable_qry(base, map, cfi, amd555) do { } while (0)
 
 #endif
 
@@ -103,6 +104,7 @@
 				   unsigned long *chip_map, struct cfi_private *cfi)
 {
 	int i;
+	int amd555 = 0;
 
 	if ((base + 0) >= map->size) {
 		printk(KERN_NOTICE
@@ -123,14 +125,21 @@
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
@@ -190,7 +199,7 @@
 }
 
 static int __xipram cfi_chip_setup(struct map_info *map,
-				   struct cfi_private *cfi)
+				   struct cfi_private *cfi, int amd555)
 {
 	int ofs_factor = cfi->interleave*cfi->device_type;
 	__u32 base = 0;
@@ -215,7 +224,7 @@
 	cfi->cfi_mode = CFI_MODE_CFI;
 
 	/* Read the CFI info structure */
-	xip_disable_qry(base, map, cfi);
+	xip_disable_qry(base, map, cfi, amd555);
 	for (i=0; i<(sizeof(struct cfi_ident) + num_erase_regions * 4); i++)
 		((unsigned char *)cfi->cfiq)[i] = cfi_read_query(map,base + (0x10 + i)*ofs_factor);
 
Index: drivers/mtd/chips/cfi_util.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_util.c,v
retrieving revision 1.10
diff -u -r1.10 cfi_util.c
--- drivers/mtd/chips/cfi_util.c	7 Nov 2005 11:14:23 -0000	1.10
+++ drivers/mtd/chips/cfi_util.c	16 Nov 2005 00:20:41 -0000
@@ -51,8 +51,16 @@
 	local_irq_disable();
 #endif
 
-	/* Switch it into Query Mode */
-	cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type, NULL);
+	/* Switch it into Query Mode.*/
+
+	/* Address 0x555 for Spansion S29WS-N MirrorBit flash chips. */
+
+	if ((cfi->mfr == CFI_MFR_AMD) && (cfi->id == 0x227E))
+		cfi_send_gen_cmd(0x98, 0x555, base, map, cfi, cfi->device_type,
+				 NULL);
+	else
+		cfi_send_gen_cmd(0x98, 0x55, base, map, cfi, cfi->device_type,
+				 NULL);
 
 	/* Read in the Extended Query Table */
 	for (i=0; i<size; i++) {
