Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13HEVQ-0002bB-00
	for mtd-list@infradead.org; Wed, 26 Jul 2000 00:53:00 +0100
Received: from athena.evoserve.com ([210.16.10.134])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13HEVO-0002b5-00
	for mtd@infradead.org; Wed, 26 Jul 2000 00:52:59 +0100
Received: from evoserve.com (gateway.evoserve.com [210.16.10.120])
	by athena.evoserve.com (8.9.3/8.9.3) with ESMTP id HAA08873
	for <mtd@infradead.org>; Wed, 26 Jul 2000 07:54:42 +0800
Message-ID: <397E2D5A.DFBB7741@evoserve.com>
Date: Wed, 26 Jul 2000 08:14:18 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: muti-page-rw.diff follow-up
Content-Type: multipart/mixed;
 boundary="------------DFA492937485651A1C5444AB"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This is a multi-part message in MIME format.
--------------DFA492937485651A1C5444AB
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


I hope my modifications doesnt break nftl. I needed modifications to
make jffs work on the DOC. I am going to do the same to the DOCmil
driver when I have read through the docs. I have broken the ecc
functions in the doc2000 driver im afraid. I am fixing it now and I will
send patches when I am done. The diff is against mtd-snapshot-20000725.
--------------DFA492937485651A1C5444AB
Content-Type: text/plain; charset=us-ascii;
 name="multi-page-rw.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="multi-page-rw.diff"

diff -r -u mtd/kernel/doc2000.c mtd-snapshot-20000725/kernel/doc2000.c
--- mtd/kernel/doc2000.c	Wed Jul 26 06:00:03 2000
+++ mtd-snapshot-20000725/kernel/doc2000.c	Wed Jul 26 07:27:47 2000
@@ -496,18 +496,37 @@
 	unsigned long docptr;
 	struct Nand *mychip;
 
+        loff_t subfrom;
+        size_t sublen;
+        u_char *pos;
+        int multipage = 0;
+        loff_t end = from + len;
+
 	docptr = this->virtadr;
 
+        *retlen = 0;
+        sublen = len;
+        subfrom = from;
+        pos = buf;
+        
 	/* Don't allow read past end of device */
 	if (from >= this->totlen)
 		return -EINVAL;
-	
-	/* Don't allow a single read to cross a 512-byte block boundary */
-	if (from + len > ( (from | 0x1ff) + 1)) 
-		len = ((from | 0x1ff) + 1) - from;
 
+        if ((subfrom + sublen) > ((subfrom | 0x1ff) + 1)) {
+              multipage = 1;
+              sublen = ((subfrom | 0x1ff) + 1) - subfrom;
+        }
+do {
+        if ((subfrom + 512) > end) {
+             multipage = 0;
+             sublen = end - subfrom;
+             if (!sublen) break;
+        }
+
+	
 	/* Find the chip which is to be used and select it */
-	mychip = &this->chips[from >> (this->chipshift)];
+	mychip = &this->chips[subfrom >> (this->chipshift)];
 	
 	if (this->curfloor != mychip->floor) {
 		DoC_SelectFloor(docptr, mychip->floor);
@@ -527,15 +546,15 @@
 		WriteDOC ( DOC_ECC_EN, docptr, ECCConf);
 	}
 
-	DoC_Command(docptr, (from >> 8) & 1, CDSN_CTRL_WP);
-	DoC_Address(docptr, 3, from, CDSN_CTRL_WP , CDSN_CTRL_ECC_IO);
+	DoC_Command(docptr, (subfrom >> 8) & 1, CDSN_CTRL_WP);
+	DoC_Address(docptr, 3, subfrom, CDSN_CTRL_WP , CDSN_CTRL_ECC_IO);
 
-	for (di=0; di < len ; di++) {
-		buf[di] = ReadDOC(docptr, 2k_CDSN_IO);
+	for (di=0; di < sublen ; di++) {
+		pos[di] = ReadDOC(docptr, 2k_CDSN_IO);
 	}
 
 	/* Let the caller know we completed it */
-	*retlen = len;
+	*retlen += sublen;
 
 	if (eccbuf) {
 		/* Read the ECC data through the DiskOnChip ECC logic */
@@ -571,6 +590,14 @@
 		
 	}
 
+        if (multipage){
+             subfrom += sublen;
+             pos += sublen;
+             sublen = 512;
+        }
+
+} while (multipage);
+
 	return 0;
 }
 
@@ -587,24 +614,36 @@
 	unsigned long docptr;
 	struct Nand *mychip;
 
+        loff_t subto;
+        size_t sublen;
+        u_char *pos;
+        int multipage = 0;
+        loff_t end = to + len;
+        
 	docptr = this->virtadr;
 
+        *retlen = 0;
+        sublen = len;
+        subto = to;
+        pos = buf;
+        
 	/* Don't allow write past end of device */
 	if (to >= this->totlen)
 		return -EINVAL;
-#if 0	
-	/* Don't allow a single write to cross a 512-byte block boundary */
-	if (to + len > ( (to | 0x1ff) + 1)) 
-		len = ((to | 0x1ff) + 1) - to;
-
-#else
-	/* Don't allow writes which aren't exactly one block */
-	if (to & 0x1ff || len != 0x200)
-		return -EINVAL;
-#endif
 
+        if ((subto + sublen) > ((subto | 0x1ff) + 1)) {
+              multipage = 1;
+              sublen = ((subto | 0x1ff) + 1) - subto;
+        }
+do {
+        if ((subto + 512) > end) {
+             multipage = 0;
+             sublen = end - subto;
+             if (!sublen) break;
+        }
+        
 	/* Find the chip which is to be used and select it */
-	mychip = &this->chips[to >> (this->chipshift)];
+	mychip = &this->chips[subto >> (this->chipshift)];
 	
 	if (this->curfloor != mychip->floor) {
 		DoC_SelectFloor(docptr, mychip->floor);
@@ -628,10 +667,10 @@
 	}
 
 	DoC_Command(docptr, NAND_CMD_SEQIN, 0);
-	DoC_Address(docptr, 3, to, 0, CDSN_CTRL_ECC_IO);
+	DoC_Address(docptr, 3, subto, 0, CDSN_CTRL_ECC_IO);
 
-	for (di=0; di < len ; di++) {
-		WriteDOC(buf[di], docptr, 2k_CDSN_IO);
+	for (di=0; di < sublen ; di++) {
+		WriteDOC(pos[di], docptr, 2k_CDSN_IO);
 	}
 
 
@@ -675,8 +714,14 @@
 	}
 
 	/* Let the caller know we completed it */
-	*retlen = len;
+	*retlen += sublen;
 
+        if (multipage){
+             subto += sublen;
+             pos += sublen;
+             sublen = 512;
+        }
+} while (multipage); 
 	return 0;
 }
 


--------------DFA492937485651A1C5444AB--



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
