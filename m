Received: from fed1mtao06.cox.net ([68.6.19.125])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AHgN0-0005Xh-GC
	for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2003 09:24:02 +0000
Received: from arrakis ([68.99.203.187]) by fed1mtao06.cox.net
          (InterMail vM.5.01.06.05 201-253-122-130-105-20030824) with ESMTP
          id <20031106091736.VQSO8432.fed1mtao06.cox.net@arrakis>
          for <linux-mtd@lists.infradead.org>;
          Thu, 6 Nov 2003 04:17:36 -0500
Date: Thu, 6 Nov 2003 02:17:34 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: linux-mtd@lists.infradead.org
Message-ID: <20031106091734.GA9616@plexity.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii
Subject: [PATCH] Remove hardcoded number of CFI chips
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


All, 

The attached patch is an update of the patch I posted about a month
ago [1] that removes the hardcoded CFI_MAX_CHIPS, which was originally
written by Andrzej Mialkowski @ Intel.  This patch fixes two issues:

- Get rid of extra structure probe_info that was just carrying around 
  a long* variable.

- Fix bug in bitmap size on systems with 2-8 chips. The old patch had:

  +	max_chips = map->size >> cfi.chipshift;
  +	probe.chip_map = kmalloc((max_chips + 7) / 8, GFP_KERNEL);

  This would cause systems with 2-8 chips to be allocated only one
  byte for the bitmap instead of the 2 needed. Fixed code does:

  +  max_chips = map->size >> cfi.chipshift;
  +  chip_map = kmalloc((max_chips / 8) + ((max_chip % 8) ? 1 : 0), GFP_KERNEL);

  Probably a cleaner way to do this. We could just use a u32  of this 
  kmalloc which would give us a limit of 32 chips, which _should_ be OK 
  for most systems and when we need more, just move to a u64. If this
  is prefered, I'll update the patch.
  
Comments?

[1]: http://lists.infradead.org/pipermail/linux-mtd/2003-October/008608.html


Index: drivers/mtd/chips/cfi_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_probe.c,v
retrieving revision 1.72
diff -u -r1.72 cfi_probe.c
--- drivers/mtd/chips/cfi_probe.c	22 Jul 2003 13:23:38 -0000	1.72
+++ drivers/mtd/chips/cfi_probe.c	6 Nov 2003 08:54:56 -0000
@@ -26,7 +26,7 @@
 #endif
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
-			  struct flchip *chips, struct cfi_private *cfi);
+			  unsigned long *chip_map, struct cfi_private *cfi);
 static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
 
 struct mtd_info *cfi_probe(struct map_info *map);
@@ -49,7 +49,7 @@
 }
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
-			  struct flchip *chips, struct cfi_private *cfi)
+			  unsigned long *chip_map, struct cfi_private *cfi)
 {
 	int i;
 	
@@ -78,18 +78,24 @@
 	}
 
 	/* Check each previous chip to see if it's an alias */
-	for (i=0; i<cfi->numchips; i++) {
+ 	for (i=0; i < (base >> cfi->chipshift); i++) {
+ 		unsigned long start;
+ 		if(!test_bit(i, chip_map)) {
+			/* Skip location; no valid chip at this address */
+ 			continue; 
+ 		}
+ 		start = i << cfi->chipshift;
 		/* This chip should be in read mode if it's one
 		   we've already touched. */
-		if (qry_present(map,chips[i].start,cfi)) {
+		if (qry_present(map, start, cfi)) {
 			/* Eep. This chip also had the QRY marker. 
 			 * Is it an alias for the new one? */
-			cfi_send_gen_cmd(0xF0, 0, chips[i].start, map, cfi, cfi->device_type, NULL);
+			cfi_send_gen_cmd(0xF0, 0, start, map, cfi, cfi->device_type, NULL);
 
 			/* If the QRY marker goes away, it's an alias */
-			if (!qry_present(map, chips[i].start, cfi)) {
+			if (!qry_present(map, start, cfi)) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 			/* Yes, it's actually got QRY for data. Most 
@@ -100,7 +106,7 @@
 			
 			if (qry_present(map, base, cfi)) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 		}
@@ -108,13 +114,7 @@
 	
 	/* OK, if we got to here, then none of the previous chips appear to
 	   be aliases for the current one. */
-	if (cfi->numchips == MAX_CFI_CHIPS) {
-		printk(KERN_WARNING"%s: Too many flash chips detected. Increase MAX_CFI_CHIPS from %d.\n", map->name, MAX_CFI_CHIPS);
-		/* Doesn't matter about resetting it to Read Mode - we're not going to talk to it anyway */
-		return -1;
-	}
-	chips[cfi->numchips].start = base;
-	chips[cfi->numchips].state = FL_READY;
+	set_bit((base >> cfi->chipshift), chip_map); /* Update chip map */
 	cfi->numchips++;
 	
 	/* Put it back into Read Mode */
Index: drivers/mtd/chips/gen_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/gen_probe.c,v
retrieving revision 1.13
diff -u -r1.13 gen_probe.c
--- drivers/mtd/chips/gen_probe.c	25 Jun 2003 11:50:37 -0000	1.13
+++ drivers/mtd/chips/gen_probe.c	6 Nov 2003 08:54:57 -0000
@@ -53,14 +53,13 @@
 
 struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chip_probe *cp)
 {
-	unsigned long base=0;
 	struct cfi_private cfi;
 	struct cfi_private *retcfi;
-	struct flchip chip[MAX_CFI_CHIPS];
-	int i;
+	unsigned long *chip_map;
+	int i, j;
+	int max_chips;
 
 	memset(&cfi, 0, sizeof(cfi));
-	memset(&chip[0], 0, sizeof(chip));
 
 	/* Call the probetype-specific code with all permutations of 
 	   interleave and device type, etc. */
@@ -81,8 +80,6 @@
 		return NULL;
 	}
 #endif
-	chip[0].start = 0;
-	chip[0].state = FL_READY;
 	cfi.chipshift = cfi.cfiq->DevSize;
 
 	switch(cfi.interleave) {
@@ -106,21 +103,29 @@
 		
 	cfi.numchips = 1;
 
+	/* 
+	 * Allocate memory for bitmap of valid chips. 
+	 * Align bitmap storage size to full byte. 
+	 */ 
+	max_chips = map->size >> cfi.chipshift;
+	chip_map = kmalloc((max_chips / 8) + ((max_chip % 8) ? 1 : 0), GFP_KERNEL);
+	if (!chip_map) {
+		printk(KERN_WARNING "%s: kmalloc failed for CFI chip map\n", map->name);
+		kfree(cfi.cfiq);
+		return NULL;
+	}
+
+	set_bit(0, chip_map); /* Mark first chip valid */
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
+		cp->probe_chip(map, i << cfi.chipshift, chip_map, &cfi);
+	}
 
 	/*
 	 * Now allocate the space for the structures we need to return to 
@@ -132,19 +137,26 @@
 	if (!retcfi) {
 		printk(KERN_WARNING "%s: kmalloc failed for CFI private structure\n", map->name);
 		kfree(cfi.cfiq);
+		kfree(chip_map);
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
+		if(test_bit(i, chip_map)) {
+			struct flchip *pchip = &retcfi->chips[j++];
+
+			pchip->start = (i << cfi.chipshift);
+			pchip->state = FL_READY;
+			init_waitqueue_head(&pchip->wq);
+			spin_lock_init(&pchip->_spinlock);
+			pchip->mutex = &pchip->_spinlock;
+		}
 	}
 
+	kfree(chip_map);
 	return retcfi;
 }
 
Index: drivers/mtd/chips/jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.38
diff -u -r1.38 jedec_probe.c
--- drivers/mtd/chips/jedec_probe.c	26 Oct 2003 21:24:38 -0000	1.38
+++ drivers/mtd/chips/jedec_probe.c	6 Nov 2003 08:55:00 -0000
@@ -1416,7 +1416,7 @@
 static int cfi_jedec_setup(struct cfi_private *p_cfi, int index);
 
 static int jedec_probe_chip(struct map_info *map, __u32 base,
-			    struct flchip *chips, struct cfi_private *cfi);
+			    unsigned long *chip_map, struct cfi_private *cfi);
 
 struct mtd_info *jedec_probe(struct map_info *map);
 
@@ -1644,7 +1644,7 @@
 
 
 static int jedec_probe_chip(struct map_info *map, __u32 base,
-			      struct flchip *chips, struct cfi_private *cfi)
+			    unsigned long *chip_map, struct cfi_private *cfi)
 {
 	int i;
 	enum uaddr uaddr_idx = MTD_UADDR_NOT_SUPPORTED;
@@ -1731,21 +1731,24 @@
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
+		if(!test_bit(i, chip_map)) {
+			continue; /* Skip location; no valid chip at this address */
+		}
+		start = i << cfi->chipshift;
+		if (jedec_read_mfr(map, start, cfi) == cfi->mfr &&
+		    jedec_read_id(map, start, cfi) == cfi->id) {
 			/* Eep. This chip also looks like it's in autoselect mode.
 			   Is it an alias for the new one? */
-			jedec_reset(chips[i].start, map, cfi);
+			jedec_reset(start, map, cfi);
 
 			/* If the device IDs go away, it's an alias */
 			if (jedec_read_mfr(map, base, cfi) != cfi->mfr ||
 			    jedec_read_id(map, base, cfi) != cfi->id) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 			
@@ -1757,7 +1760,7 @@
 			if (jedec_read_mfr(map, base, cfi) == cfi->mfr &&
 			    jedec_read_id(map, base, cfi) == cfi->id) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 		}
@@ -1765,13 +1768,7 @@
 		
 	/* OK, if we got to here, then none of the previous chips appear to
 	   be aliases for the current one. */
-	if (cfi->numchips == MAX_CFI_CHIPS) {
-		printk(KERN_WARNING"%s: Too many flash chips detected. Increase MAX_CFI_CHIPS from %d.\n", map->name, MAX_CFI_CHIPS);
-		/* Doesn't matter about resetting it to Read Mode - we're not going to talk to it anyway */
-		return -1;
-	}
-	chips[cfi->numchips].start = base;
-	chips[cfi->numchips].state = FL_READY;
+	set_bit((base >> cfi->chipshift), chip_map); /* Update chip map */
 	cfi->numchips++;
 		
 ok_out:
Index: include/linux/mtd/cfi.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi.h,v
retrieving revision 1.37
diff -u -r1.37 cfi.h
--- include/linux/mtd/cfi.h	22 Oct 2003 18:18:41 -0000	1.37
+++ include/linux/mtd/cfi.h	6 Nov 2003 08:55:02 -0000
@@ -335,8 +335,6 @@
 	struct flchip chips[0];  /* per-chip data structure for each chip */
 };
 
-#define MAX_CFI_CHIPS 8 /* Entirely arbitrary to avoid realloc() */
-
 /*
  * Returns the command address according to the given geometry.
  */
Index: include/linux/mtd/gen_probe.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/gen_probe.h,v
retrieving revision 1.1
diff -u -r1.1 gen_probe.h
--- include/linux/mtd/gen_probe.h	2 Sep 2001 18:50:13 -0000	1.1
+++ include/linux/mtd/gen_probe.h	6 Nov 2003 08:55:02 -0000
@@ -10,12 +10,12 @@
 #include <linux/mtd/flashchip.h>
 #include <linux/mtd/map.h> 
 #include <linux/mtd/cfi.h>
+#include <asm/bitops.h>
 
 struct chip_probe {
 	char *name;
 	int (*probe_chip)(struct map_info *map, __u32 base,
-			  struct flchip *chips, struct cfi_private *cfi);
-
+			  unsigned long *chip_map, struct cfi_private *cfi);
 };
 
 struct mtd_info *mtd_do_chip_probe(struct map_info *map, struct chip_probe *cp);

-- 
Deepak Saxena - dsaxena@plexity.net

"To eliminate the concept of waste means to design things - products,
 packaging, and systems - from the very beggining on the understanding 
 that waste does not exist" - William McDonough & Michael Braungart,
                   from Cradle to Cradle: Remaking the Way We Make Things
