Received: from krakowiak.inetia.pl ([195.114.181.203])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19fixE-0000Ck-2x
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 17:28:32 +0100
Received: from www.n1.pl (www.n1.pl [195.114.173.151])
	sims.4.0.2000.10.12.16.25.p8)
	with ESMTP id <0HIJ00B1KF3K1K@krakowiak.inetia.pl> for
	linux-mtd@lists.infradead.org;
	Thu, 24 Jul 2003 18:28:33 +0200 (MET DST)
Date: Thu, 24 Jul 2003 18:28:31 +0200
From: andrzej.mialkowski@inetia.pl
In-reply-to: <20030722102148.GD29430@wohnheim.fh-wedel.de>
To: =?iso-8859-2?b?SvZybg==?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <1059064111.3f20092f90a2e@imail.internetia.pl>
MIME-version: 1.0
References: <1058792691.3f1be4f31ca98@imail.internetia.pl>
 <20030721160453.GA3677@wohnheim.fh-wedel.de>
 <1058823245.3f1c5c4da93b0@imail.internetia.pl>
 <20030722102148.GD29430@wohnheim.fh-wedel.de>
Content-type: text/plain; charset=ISO-8859-2
Content-transfer-encoding: 8BIT
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: hardcoded maximum number of CFI chips - continued
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Cytowanie Jörn Engel <joern@wohnheim.fh-wedel.de>:
> In that case, why don't you just crank up the number from 8 to 16?  It
> is the simpler solution to your problem at hand.
> 
> Jörn

Jörn,

Answer is very simple: It is not first my Linux port. In period last two years 
i had to port Linux to about 9 different ARM based systems. In all cases I 
meet several hardcoded limitations. This means so it is also my personal 
business to make Linux easier to port. I'm trying to balace between complexity 
of change an effect. As far as I know friedns from my hadware team, next time 
they will mount me 27.5 chips :).

I looked once again on generic probe code and found following conclusion:
Chips table is used only for alias detection and for building runtime retcfi 
structure. In both cases only information used is chip address. This means 
that table of flchip structures may be replaced by any data structure that is 
able to return this information. Thought about lists, tables and finally 
decided to use bitmap. Bitmap of valid chips can be used effectively if 
assumption that number of possible chips (locations to check!) in map is 
reasonable in comparison to number of chips. Algorithm is not effective only 
if map driver reports millions of unoccupied possible chip locations (if we 
have a lot of chips we must have much more memory for runtime structures).
In my case map driver detects number of writable bits in banking hardware so 
in result of calculations I have 16 possible chip locations.

Below is patch for my work tree 2.4.19-rmk7-ds3, tried to do not affect 
algorithms and large parts of code. Not tested JEDEC part but changes are 
almost identical like for CFI.

Andrzej

diff -Nru --minimal --ignore-all-space prev/drivers/mtd/chips/cfi_probe.c 
linux/drivers/mtd/chips/cfi_probe.c
--- prev/drivers/mtd/chips/cfi_probe.c	Tue Apr 29 13:57:43 2003
+++ linux/drivers/mtd/chips/cfi_probe.c	Thu Jul 24 14:45:06 2003
@@ -25,7 +25,7 @@
 #endif
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
-			  struct flchip *chips, struct cfi_private *cfi);
+			  struct probe_info *probe, struct cfi_private *cfi);
 static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
 
 struct mtd_info *cfi_probe(struct map_info *map);
@@ -48,7 +48,7 @@
 }
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
-			  struct flchip *chips, struct cfi_private *cfi)
+			  struct probe_info *probe, struct cfi_private *cfi)
 {
 	int i;
 	
@@ -80,21 +80,26 @@
 		return cfi_chip_setup(map, cfi);
 	}
 
-	/* Check each previous chip to see if it's an alias */
-	for (i=0; i<cfi->numchips; i++) {
+	/* Check each previous chip locations to see if it's an alias */
+	for (i=0; i < (base >> cfi->chipshift); i++) {
+		unsigned long start;
+		if(!test_bit(i, probe->chip_map)) {
+			continue; /* Skip location; no valid chip at this 
address */
+		}
+		start = i << cfi->chipshift;
 		/* This chip should be in read mode if it's one
 		   we've already touched. */
-		if (qry_present(map,chips[i].start,cfi)) {
+		if (qry_present(map, start, cfi)) {
 			/* Eep. This chip also had the QRY marker. 
 			 * Is it an alias for the new one? */
-			cfi_send_gen_cmd(0xF0, 0, chips[i].start, map, cfi, 
cfi->device_type, NULL);
+			cfi_send_gen_cmd(0xF0, 0, start, map, cfi, cfi-
>device_type, NULL);
 			/* some devices don't respond to 0xF0, so send 0xFF to 
be sure */
-			cfi_send_gen_cmd(0xFF, 0, chips[i].start, map, cfi, 
cfi->device_type, NULL);
+			cfi_send_gen_cmd(0xFF, 0, start, map, cfi, cfi-
>device_type, NULL);
 
 			/* If the QRY marker goes away, it's an alias */
-			if (!qry_present(map, chips[i].start, cfi)) {
+			if (!qry_present(map, start, cfi)) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x 
for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 			/* Yes, it's actually got QRY for data. Most 
@@ -106,7 +111,7 @@
 			cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi-
>device_type, NULL);
 			if (qry_present(map, base, cfi)) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x 
for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 		}
@@ -114,13 +119,7 @@
 	
 	/* OK, if we got to here, then none of the previous chips appear to
 	   be aliases for the current one. */
-	if (cfi->numchips == MAX_CFI_CHIPS) {
-		printk(KERN_WARNING"%s: Too many flash chips detected. 
Increase MAX_CFI_CHIPS from %d.\n", map->name, MAX_CFI_CHIPS);
-		/* Doesn't matter about resetting it to Read Mode - we're not 
going to talk to it anyway */
-		return -1;
-	}
-	chips[cfi->numchips].start = base;
-	chips[cfi->numchips].state = FL_READY;
+	set_bit((base >> cfi->chipshift), probe->chip_map); /* Update chip map 
*/
 	cfi->numchips++;
 	
 	/* Put it back into Read Mode */
diff -Nru --minimal --ignore-all-space prev/drivers/mtd/chips/gen_probe.c 
linux/drivers/mtd/chips/gen_probe.c
--- prev/drivers/mtd/chips/gen_probe.c	Fri Mar 14 17:21:18 2003
+++ linux/drivers/mtd/chips/gen_probe.c	Thu Jul 24 15:47:20 2003
@@ -50,11 +50,11 @@
 
 struct cfi_private *genprobe_ident_chips(struct map_info *map, struct 
chip_probe *cp)
 {
-	unsigned long base=0;
 	struct cfi_private cfi;
 	struct cfi_private *retcfi;
-	struct flchip chip[MAX_CFI_CHIPS];
-	int i;
+	struct probe_info probe;
+	int i, j;
+	int max_chips;
 
 	memset(&cfi, 0, sizeof(cfi));
 
@@ -77,8 +77,6 @@
 		return NULL;
 	}
 #endif
-	chip[0].start = 0;
-	chip[0].state = FL_READY;
 	cfi.chipshift = cfi.cfiq->DevSize;
 
 	switch(cfi.interleave) {
@@ -102,45 +100,57 @@
 		
 	cfi.numchips = 1;
 
+	/* Allocate memory for bitmap of valid chips. Align bitmap storage 
size to full byte. */
+	max_chips = map->size >> cfi.chipshift;
+	probe.chip_map = kmalloc((max_chips + 7) / 8, GFP_KERNEL);
+	if (!probe.chip_map) {
+		printk(KERN_WARNING "%s: kmalloc failed for CFI chip map\n", 
map->name);
+		kfree(cfi.cfiq);
+		return NULL;
+	}
+
+	set_bit(0, probe.chip_map); /* Mark first chip valid */
+
 	/*
 	 * Now probe for other chips, checking sensibly for aliases while
 	 * we're at it. The new_chip probe above should have let the first
 	 * chip in read mode.
-	 *
-	 * NOTE: Here, we're checking if there is room for another chip
-	 *       the same size within the mapping. Therefore, 
-	 *       base + chipsize <= map->size is the correct thing to do, 
-	 *       because, base + chipsize would be the  _first_ byte of the
-	 *       next chip, not the one we're currently pondering.
 	 */
 
-	for (base = (1<<cfi.chipshift); base + (1<<cfi.chipshift) <= map->size;
-	     base += (1<<cfi.chipshift))
-		cp->probe_chip(map, base, &chip[0], &cfi);
+	for (i = 1; i < max_chips; i++) {
+		cp->probe_chip(map, i << cfi.chipshift, &probe, &cfi);
+	}
 
 	/*
 	 * Now allocate the space for the structures we need to return to 
 	 * our caller, and copy the appropriate data into them.
 	 */
 
-	retcfi = kmalloc(sizeof(struct cfi_private) + cfi.numchips * sizeof
(struct flchip), GFP_KERNEL);
+	retcfi = kmalloc(sizeof(struct cfi_private) + (cfi.numchips - 1) * 
sizeof(struct flchip), GFP_KERNEL);
 
 	if (!retcfi) {
 		printk(KERN_WARNING "%s: kmalloc failed for CFI private 
structure\n", map->name);
 		kfree(cfi.cfiq);
+		kfree(probe.chip_map);
 		return NULL;
 	}
 
 	memcpy(retcfi, &cfi, sizeof(cfi));
-	memcpy(&retcfi->chips[0], chip, sizeof(struct flchip) * cfi.numchips);
+	memset(&retcfi->chips[0], 0, sizeof(struct flchip) * cfi.numchips);
 
-	/* Fix up the stuff that breaks when you move it */
-	for (i=0; i< retcfi->numchips; i++) {
-		init_waitqueue_head(&retcfi->chips[i].wq);
-		spin_lock_init(&retcfi->chips[i]._spinlock);
-		retcfi->chips[i].mutex = &retcfi->chips[i]._spinlock;
+	for (i = 0, j = 0; (j < cfi.numchips) && (i < max_chips); i++) {
+		if(test_bit(i, probe.chip_map)) {
+			struct flchip *pchip = &retcfi->chips[j++];
+
+			pchip->start = (i << cfi.chipshift);
+			pchip->state = FL_READY;
+			init_waitqueue_head(&pchip->wq);
+			spin_lock_init(&pchip->_spinlock);
+			pchip->mutex = &pchip->_spinlock;
+		}
 	}
 
+	kfree(probe.chip_map);
 	return retcfi;
 }
 
diff -Nru --minimal --ignore-all-space prev/drivers/mtd/chips/jedec_probe.c 
linux/drivers/mtd/chips/jedec_probe.c
--- prev/drivers/mtd/chips/jedec_probe.c	Fri Mar 14 17:21:19 2003
+++ linux/drivers/mtd/chips/jedec_probe.c	Thu Jul 24 15:11:10 2003
@@ -803,7 +803,7 @@
 static int cfi_jedec_setup(struct cfi_private *p_cfi, int index);
 
 static int jedec_probe_chip(struct map_info *map, __u32 base,
-			    struct flchip *chips, struct cfi_private *cfi);
+			    struct probe_info *probe, struct cfi_private *cfi);
 
 struct mtd_info *jedec_probe(struct map_info *map);
 
@@ -871,7 +871,7 @@
 }
 
 static int jedec_probe_chip(struct map_info *map, __u32 base,
-			      struct flchip *chips, struct cfi_private *cfi)
+			    struct probe_info *probe, struct cfi_private *cfi)
 {
 	int i;
 	int unlockpass = 0;
@@ -977,21 +977,24 @@
 		}
 	}
 	
-	/* Check each previous chip to see if it's an alias */
-	for (i=0; i<cfi->numchips; i++) {
-		/* This chip should be in read mode if it's one
-		   we've already touched. */
-		if (jedec_read_mfr(map, chips[i].start, cfi) == cfi->mfr &&
-		    jedec_read_id(map, chips[i].start, cfi) == cfi->id) {
+	/* Check each previous chip locations to see if it's an alias */
+	for (i=0; i < (base >> cfi->chipshift); i++) {
+		unsigned long start;
+		if(!test_bit(i, probe->chip_map)) {
+			continue; /* Skip location; no valid chip at this 
address */
+		}
+		start = i << cfi->chipshift;
+		if (jedec_read_mfr(map, start, cfi) == cfi->mfr &&
+		    jedec_read_id(map, start, cfi) == cfi->id) {
 			/* Eep. This chip also looks like it's in autoselect 
mode.
 			   Is it an alias for the new one? */
-			jedec_reset(chips[i].start, map, cfi);
+			jedec_reset(start, map, cfi);
 
 			/* If the device IDs go away, it's an alias */
 			if (jedec_read_mfr(map, base, cfi) != cfi->mfr ||
 			    jedec_read_id(map, base, cfi) != cfi->id) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x 
for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 			
@@ -1003,7 +1006,7 @@
 			if (jedec_read_mfr(map, base, cfi) == cfi->mfr &&
 			    jedec_read_id(map, base, cfi) == cfi->id) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x 
for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 		}
@@ -1011,13 +1014,7 @@
 		
 	/* OK, if we got to here, then none of the previous chips appear to
 	   be aliases for the current one. */
-	if (cfi->numchips == MAX_CFI_CHIPS) {
-		printk(KERN_WARNING"%s: Too many flash chips detected. 
Increase MAX_CFI_CHIPS from %d.\n", map->name, MAX_CFI_CHIPS);
-		/* Doesn't matter about resetting it to Read Mode - we're not 
going to talk to it anyway */
-		return -1;
-	}
-	chips[cfi->numchips].start = base;
-	chips[cfi->numchips].state = FL_READY;
+	set_bit((base >> cfi->chipshift), probe->chip_map); /* Update chip map 
*/
 	cfi->numchips++;
 		
 ok_out:
diff -Nru --minimal --ignore-all-space prev/include/linux/mtd/cfi.h 
linux/include/linux/mtd/cfi.h
--- prev/include/linux/mtd/cfi.h	Fri Mar 14 17:05:39 2003
+++ linux/include/linux/mtd/cfi.h	Thu Jul 24 13:32:18 2003
@@ -306,8 +306,6 @@
 	struct flchip chips[0];  /* per-chip data structure for each chip */
 };
 
-#define MAX_CFI_CHIPS 8 /* Entirely arbitrary to avoid realloc() */
-
 /*
  * Returns the command address according to the given geometry.
  */
diff -Nru --minimal --ignore-all-space prev/include/linux/mtd/gen_probe.h 
linux/include/linux/mtd/gen_probe.h
--- prev/include/linux/mtd/gen_probe.h	Fri Mar 14 15:49:56 2003
+++ linux/include/linux/mtd/gen_probe.h	Thu Jul 24 14:42:46 2003
@@ -10,12 +10,16 @@
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/map.h> 
 #include <linux/mtd/cfi.h>
+#include <asm/bitops.h>
+
+struct probe_info {
+	long *chip_map;	/* bitmap of valid chips in mtd map */
+};
 
 struct chip_probe {
 	char *name;
 	int (*probe_chip)(struct map_info *map, __u32 base,
-			  struct flchip *chips, struct cfi_private *cfi);
-
+			  struct probe_info *probe, struct cfi_private *cfi);
 };
 
 struct mtd_info *mtd_do_chip_probe(struct map_info *map, struct chip_probe 
*cp); 
