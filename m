Received: from fed1mtao05.cox.net ([68.6.19.126])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5Tjv-0001ur-El
	for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2003 18:29:15 +0100
Received: from arrakis ([68.99.203.187]) by fed1mtao05.cox.net
          (InterMail vM.5.01.06.05 201-253-122-130-105-20030824) with ESMTP
          id <20031003172743.IWSU10143.fed1mtao05.cox.net@arrakis>
          for <linux-mtd@lists.infradead.org>;
          Fri, 3 Oct 2003 13:27:43 -0400
Date: Fri, 3 Oct 2003 10:27:43 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: linux-mtd@lists.infradead.org
Message-ID: <20031003172742.GA22844@plexity.net>
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


This is a resend of a patch originally posted by  Andrzej Mialkowski
from Intel a few months ago that removes the hardcoded MAX_CFI_CHIPS
and replaces it with a dynamic bitmap. I believe it got approved but never
checked in, but not 100% sure so I'm reposting it to see if it should
be pushed into CVS, cleaned up, or dropped.  I need this for several 
platforms with large numbers of chips, so I'd rather not see it just die.

Tnx,
~Deepak


Index: drivers/mtd/chips/cfi_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_probe.c,v
retrieving revision 1.72
diff -u -r1.72 cfi_probe.c
--- drivers/mtd/chips/cfi_probe.c	22 Jul 2003 13:23:38 -0000	1.72
+++ drivers/mtd/chips/cfi_probe.c	3 Oct 2003 17:13:00 -0000
@@ -26,7 +26,7 @@
 #endif
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
-			  struct flchip *chips, struct cfi_private *cfi);
+			  struct probe_info *probe, struct cfi_private *cfi);
 static int cfi_chip_setup(struct map_info *map, struct cfi_private *cfi);
 
 struct mtd_info *cfi_probe(struct map_info *map);
@@ -49,7 +49,7 @@
 }
 
 static int cfi_probe_chip(struct map_info *map, __u32 base,
-			  struct flchip *chips, struct cfi_private *cfi)
+			  struct probe_info *probe, struct cfi_private *cfi)
 {
 	int i;
 	
@@ -78,18 +78,24 @@
 	}
 
 	/* Check each previous chip to see if it's an alias */
-	for (i=0; i<cfi->numchips; i++) {
+ 	for (i=0; i < (base >> cfi->chipshift); i++) {
+ 		unsigned long start;
+ 		if(!test_bit(i, probe->chip_map)) {
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
+	set_bit((base >> cfi->chipshift), probe->chip_map); /* Update chip map */
 	cfi->numchips++;
 	
 	/* Put it back into Read Mode */
Index: drivers/mtd/chips/gen_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/gen_probe.c,v
retrieving revision 1.13
diff -u -r1.13 gen_probe.c
--- drivers/mtd/chips/gen_probe.c	25 Jun 2003 11:50:37 -0000	1.13
+++ drivers/mtd/chips/gen_probe.c	3 Oct 2003 17:13:01 -0000
@@ -53,14 +53,13 @@
 
 struct cfi_private *genprobe_ident_chips(struct map_info *map, struct chip_probe *cp)
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
@@ -106,21 +103,26 @@
 		
 	cfi.numchips = 1;
 
+	/* Allocate memory for bitmap of valid chips. Align bitmap storage size to full byte. */
+	max_chips = map->size >> cfi.chipshift;
+	probe.chip_map = kmalloc((max_chips + 7) / 8, GFP_KERNEL);
+	if (!probe.chip_map) {
+		printk(KERN_WARNING "%s: kmalloc failed for CFI chip map\n", map->name);
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
@@ -132,19 +134,26 @@
 	if (!retcfi) {
 		printk(KERN_WARNING "%s: kmalloc failed for CFI private structure\n", map->name);
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
 
Index: drivers/mtd/chips/jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.32
diff -u -r1.32 jedec_probe.c
--- drivers/mtd/chips/jedec_probe.c	1 Oct 2003 17:40:05 -0000	1.32
+++ drivers/mtd/chips/jedec_probe.c	3 Oct 2003 17:13:01 -0000
@@ -1365,7 +1365,7 @@
 static int cfi_jedec_setup(struct cfi_private *p_cfi, int index);
 
 static int jedec_probe_chip(struct map_info *map, __u32 base,
-			    struct flchip *chips, struct cfi_private *cfi);
+			    struct probe_info *probe, struct cfi_private *cfi);
 
 struct mtd_info *jedec_probe(struct map_info *map);
 
@@ -1593,7 +1593,7 @@
 
 
 static int jedec_probe_chip(struct map_info *map, __u32 base,
-			      struct flchip *chips, struct cfi_private *cfi)
+			    struct probe_info *probe, struct cfi_private *cfi)
 {
 	int i;
 	enum uaddr uaddr_idx = MTD_UADDR_NOT_SUPPORTED;
@@ -1679,21 +1679,24 @@
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
 			
@@ -1705,7 +1708,7 @@
 			if (jedec_read_mfr(map, base, cfi) == cfi->mfr &&
 			    jedec_read_id(map, base, cfi) == cfi->id) {
 				printk(KERN_DEBUG "%s: Found an alias at 0x%x for the chip at 0x%lx\n",
-				       map->name, base, chips[i].start);
+				       map->name, base, start);
 				return 0;
 			}
 		}
@@ -1713,13 +1716,7 @@
 		
 	/* OK, if we got to here, then none of the previous chips appear to
 	   be aliases for the current one. */
-	if (cfi->numchips == MAX_CFI_CHIPS) {
-		printk(KERN_WARNING"%s: Too many flash chips detected. Increase MAX_CFI_CHIPS from %d.\n", map->name, MAX_CFI_CHIPS);
-		/* Doesn't matter about resetting it to Read Mode - we're not going to talk to it anyway */
-		return -1;
-	}
-	chips[cfi->numchips].start = base;
-	chips[cfi->numchips].state = FL_READY;
+	set_bit((base >> cfi->chipshift), probe->chip_map); /* Update chip map */
 	cfi->numchips++;
 		
 ok_out:
Index: include/linux/mtd/cfi.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/cfi.h,v
retrieving revision 1.36
diff -u -r1.36 cfi.h
--- include/linux/mtd/cfi.h	22 Jul 2003 13:23:39 -0000	1.36
+++ include/linux/mtd/cfi.h	3 Oct 2003 17:13:01 -0000
@@ -334,8 +334,6 @@
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
+++ include/linux/mtd/gen_probe.h	3 Oct 2003 17:13:01 -0000
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
 
 struct mtd_info *mtd_do_chip_probe(struct map_info *map, struct chip_probe *cp);

-- 
Deepak Saxena - dsaxena@plexity.net

"To eliminate the concept of waste means to design things - products,
 packaging, and systems - from the very beggining on the understanding 
 that waste does not exist" - William McDonough & Michael Braungart,
                 From Cradle to Cradle: Remaking the Way We Make Things
