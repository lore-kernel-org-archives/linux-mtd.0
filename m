Received: from mailout02.sul.t-online.com ([194.25.134.17] helo=mailout02.sul.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15MUIa-0000no-00
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jul 2001 13:50:00 +0100
Date: Tue, 17 Jul 2001 14:54:37 +0200
To: linux-mtd@lists.infradead.org
Subject: Patch
Message-ID: <20010717145437.A26825@router.sternenhaufen>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: cemil@regio.net (Cemil Degirmenci)
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

----- Forwarded message from David Woodhouse <dwmw2@redhat.com> -----

To: cemil@regio.net
From: David Woodhouse <dwmw2@redhat.com>

Index: drivers/mtd/devices/doc2000.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/devices/doc2000.c,v
retrieving revision 1.43
diff -u -r1.43 doc2000.c
--- drivers/mtd/devices/doc2000.c	2001/06/02 14:30:43	1.43
+++ drivers/mtd/devices/doc2000.c	2001/07/17 12:47:52
@@ -84,19 +84,22 @@
 static int _DoC_WaitReady(struct DiskOnChip *doc)
 {
 	unsigned long docptr = doc->virtadr;
-	unsigned short c = 0xffff;
+	unsigned long timeo = jiffies + (HZ * 10);
 
 	DEBUG(MTD_DEBUG_LEVEL3,
 	      "_DoC_WaitReady called for out-of-line wait\n");
 
 	/* Out-of-line routine to wait for chip response */
-	while (!(ReadDOC(docptr, CDSNControl) & CDSN_CTRL_FR_B) && --c)
-		;
-
-	if (c == 0)
-		DEBUG(MTD_DEBUG_LEVEL2, "_DoC_WaitReady timed out.\n");
+	while (!(ReadDOC(docptr, CDSNControl) & CDSN_CTRL_FR_B)) {
+		if (time_after(jiffies, timeo)) {
+			DEBUG(MTD_DEBUG_LEVEL2, "_DoC_WaitReady timed out.\n");
+			return -EIO;
+		}
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		schedule_timeout(1);
+	}
 
-	return (c == 0);
+	return 0;
 }
 
 static inline int DoC_WaitReady(struct DiskOnChip *doc)
@@ -566,6 +569,7 @@
 
 	this->curfloor = -1;
 	this->curchip = -1;
+	init_MUTEX(&this->lock);
 
 	/* Ident all the chips present. */
 	DoC_ScanChips(this);
@@ -606,6 +610,8 @@
 	if (from >= this->totlen)
 		return -EINVAL;
 
+	down(&this->lock);
+
 	/* Don't allow a single read to cross a 512-byte block boundary */
 	if (from + len > ((from | 0x1ff) + 1))
 		len = ((from | 0x1ff) + 1) - from;
@@ -724,6 +730,8 @@
 	    DoC_WaitReady(this);
 	}
 
+	up(&this->lock);
+
 	return ret;
 }
 
@@ -751,6 +759,8 @@
 	if (to >= this->totlen)
 		return -EINVAL;
 
+	down(&this->lock);
+
 	/* Don't allow a single write to cross a 512-byte block boundary */
 	if (to + len > ((to | 0x1ff) + 1))
 		len = ((to | 0x1ff) + 1) - to;
@@ -813,6 +823,7 @@
 			printk("Error programming flash\n");
 			/* Error in programming */
 			*retlen = 0;
+			up(&this->lock);
 			return -EIO;
 		}
 
@@ -865,6 +876,7 @@
 		printk("Error programming flash\n");
 		/* Error in programming */
 		*retlen = 0;
+		up(&this->lock);
 		return -EIO;
 	}
 
@@ -874,6 +886,7 @@
 	if (eccbuf) {
 		unsigned char x[8];
 		size_t dummy;
+		int ret;
 
 		/* Write the ECC data to flash */
 		for (di=0; di<6; di++)
@@ -882,9 +895,11 @@
 		x[6]=0x55;
 		x[7]=0x55;
 		
-		return doc_write_oob(mtd, to, 8, &dummy, x);
+		ret = doc_write_oob(mtd, to, 8, &dummy, x);
+		up(&this->lock);
+		return ret;
 	}
-
+	up(&this->lock);
 	return 0;
 }
 
@@ -892,10 +907,12 @@
 			size_t * retlen, u_char * buf)
 {
 	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
-	int len256 = 0;
+	int len256 = 0, ret;
 	unsigned long docptr;
 	struct Nand *mychip;
 
+	down(&this->lock);
+
 	docptr = this->virtadr;
 
 	mychip = &this->chips[ofs >> this->chipshift];
@@ -939,12 +956,15 @@
 	/* Reading the full OOB data drops us off of the end of the page,
          * causing the flash device to go into busy mode, so we need
          * to wait until ready 11.4.1 and Toshiba TC58256FT docs */
-	return DoC_WaitReady(this);
+	
+	ret = DoC_WaitReady(this);
+	up(&this->lock);
+	return ret;
 
 }
 
-static int doc_write_oob(struct mtd_info *mtd, loff_t ofs, size_t len,
-			 size_t * retlen, const u_char * buf)
+static int doc_write_oob_nolock(struct mtd_info *mtd, loff_t ofs, size_t len,
+				size_t * retlen, const u_char * buf)
 {
 	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
 	int len256 = 0;
@@ -1032,8 +1052,20 @@
 	return 0;
 
 }
+
+static int doc_write_oob(struct mtd_info *mtd, loff_t ofs, size_t len,
+			 size_t * retlen, const u_char * buf)
+{
+	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
+	int ret;
+
+	down(&this->lock);
+	ret = doc_write_oob_nolock(mtd, ofs, len, retlen, buf);
+	up(&this->lock);
+	return ret;
+}
 
-int doc_erase(struct mtd_info *mtd, struct erase_info *instr)
+static int doc_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct DiskOnChip *this = (struct DiskOnChip *) mtd->priv;
 	__u32 ofs = instr->addr;
@@ -1041,6 +1073,8 @@
 	unsigned long docptr;
 	struct Nand *mychip;
 
+	down(&this->lock);
+
 	if (len != mtd->erasesize)
 		printk(KERN_WARNING "Erase not right size (%x != %x)n",
 		       len, mtd->erasesize);
@@ -1078,6 +1112,7 @@
 	if (instr->callback)
 		instr->callback(instr);
 
+	up(&this->lock);
 	return 0;
 }
 
Index: include/linux/mtd/doc2000.h
===================================================================
RCS file: /home/cvs/mtd/include/linux/mtd/doc2000.h,v
retrieving revision 1.13
diff -u -r1.13 doc2000.h
--- include/linux/mtd/doc2000.h	2001/05/29 12:03:45	1.13
+++ include/linux/mtd/doc2000.h	2001/07/17 12:47:52
@@ -134,6 +134,7 @@
 	int numchips;
 	struct Nand *chips;
 	struct mtd_info *nextdoc;
+	struct semaphore lock;
 };
 
 int doc_decode_ecc(unsigned char sector[512], unsigned char ecc1[6]);


----- End forwarded message -----

-- 
Cemil Degirmenci                //   http://cemil.debian-linux.de
Am Eisenberg 13                 //   Tel.       06638-9180010   
36341 Lauterbach                //   Mobil.     0177-2541153
Germany                         //   E-Mail     cemil@security-focus.de
