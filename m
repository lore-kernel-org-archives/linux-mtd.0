Received: from ns1.idleaire.net ([65.220.16.2] helo=iasrv1.idleaire.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEbVr-000385-GW
	for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2003 21:36:27 +0000
From: Dave Dillow <ddillow@idleaire.com>
To: Chris Ellec <cellec@celerity.net>
In-Reply-To: <3F9EA810.6010905@celerity.net>
References: <3F9EA810.6010905@celerity.net>
Message-Id: <1067376879.9396.1.camel@dillow.idleaire.com>
Mime-Version: 1.0
Date: 28 Oct 2003 16:34:39 -0500
Content-Type: multipart/mixed; boundary="=-MvIT7rYWSuWai+sWeMSc"
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MvIT7rYWSuWai+sWeMSc
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2003-10-28 at 12:32, Chris Ellec wrote:
> Hello,
> 
> I have a WinSystems devel board with a DOC on it. Dinfo from MSystems 
> reports a DOC 2000 at address D800 with 256 MB and an INFTL format.
> 

Try this -- it's my current hack to get my 128MB recoginzed. When I get
time, I plan to work on nand/diskonchip.c, per dwmw2's suggestion.

-- 
Dave Dillow <ddillow@idleaire.com>

--=-MvIT7rYWSuWai+sWeMSc
Content-Disposition: attachment; filename=doc2000.patch
Content-Type: text/plain; name=doc2000.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1191  -> 1.1192 
#	drivers/mtd/devices/doc2000.c	1.6     -> 1.7    
#	include/linux/mtd/doc2000.h	1.5     -> 1.6    
#	drivers/mtd/devices/docprobe.c	1.7     -> 1.8    
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 03/10/13	ddillow@idleaire.com	1.1192
# Add support for DoC 2000 TSOP
# --------------------------------------------
#
diff -Nru a/drivers/mtd/devices/doc2000.c b/drivers/mtd/devices/doc2000.c
--- a/drivers/mtd/devices/doc2000.c	Tue Oct 28 16:32:43 2003
+++ b/drivers/mtd/devices/doc2000.c	Tue Oct 28 16:32:43 2003
@@ -25,6 +25,7 @@
 #include <linux/mtd/doc2000.h>
 
 #define DOC_SUPPORT_2000
+#define DOC_SUPPORT_2000TSOP
 #define DOC_SUPPORT_MILLENNIUM
 
 #ifdef DOC_SUPPORT_2000
@@ -33,6 +34,12 @@
 #define DoC_is_2000(doc) (0)
 #endif
 
+#ifdef DOC_SUPPORT_2000TSOP
+#define DoC_is_2000TSOP(doc) (doc->ChipID == DOC_ChipID_Doc2kTSOP)
+#else
+#define DoC_is_2000TSOP(doc) (0)
+#endif
+
 #ifdef DOC_SUPPORT_MILLENNIUM
 #define DoC_is_Millennium(doc) (doc->ChipID == DOC_ChipID_DocMil)
 #else
@@ -76,7 +83,7 @@
 	int i;
 	
 	for (i = 0; i < cycles; i++) {
-		if (DoC_is_Millennium(doc))
+		if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc))
 			dummy = ReadDOC(doc->virtadr, NOP);
 		else
 			dummy = ReadDOC(doc->virtadr, DOCStatus);
@@ -95,6 +102,10 @@
 
 	/* Out-of-line routine to wait for chip response */
 	while (!(ReadDOC(docptr, CDSNControl) & CDSN_CTRL_FR_B)) {
+		/* issue 2 read from NOP register after reading from CDSNControl register
+	   	see Software Requirement 11.4 item 2. */
+		DoC_Delay(doc, 2);
+
 		if (time_after(jiffies, timeo)) {
 			DEBUG(MTD_DEBUG_LEVEL2, "_DoC_WaitReady timed out.\n");
 			return -EIO;
@@ -136,18 +147,20 @@
 {
 	unsigned long docptr = doc->virtadr;
 
-	if (DoC_is_2000(doc))
+	if (DoC_is_2000(doc) || DoC_is_2000TSOP(doc))
 		xtraflags |= CDSN_CTRL_FLASH_IO;
 
 	/* Assert the CLE (Command Latch Enable) line to the flash chip */
 	WriteDOC(xtraflags | CDSN_CTRL_CLE | CDSN_CTRL_CE, docptr, CDSNControl);
 	DoC_Delay(doc, 4);	/* Software requirement 11.4.3 for Millennium */
 
-	if (DoC_is_Millennium(doc))
+	if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc))
 		WriteDOC(command, docptr, CDSNSlowIO);
 
 	/* Send the command */
 	WriteDOC_(command, docptr, doc->ioreg);
+	if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc))
+		WriteDOC(command, docptr, WritePipeTerm);
 
 	/* Lower the CLE line */
 	WriteDOC(xtraflags | CDSN_CTRL_CE, docptr, CDSNControl);
@@ -169,7 +182,7 @@
 
 	docptr = doc->virtadr;
 
-	if (DoC_is_2000(doc))
+	if (DoC_is_2000(doc) || DoC_is_2000TSOP(doc))
 		xtraflags1 |= CDSN_CTRL_FLASH_IO;
 
 	/* Assert the ALE (Address Latch Enable) line to the flash chip */
@@ -190,7 +203,7 @@
 	 */
 
 	if (numbytes == ADDR_COLUMN || numbytes == ADDR_COLUMN_PAGE) {
-		if (DoC_is_Millennium(doc))
+		if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc))
 			WriteDOC(ofs & 0xff, docptr, CDSNSlowIO);
 		WriteDOC_(ofs & 0xff, docptr, doc->ioreg);
 	}
@@ -203,12 +216,15 @@
 
 	if (numbytes == ADDR_PAGE || numbytes == ADDR_COLUMN_PAGE) {
 		for (i = 0; i < doc->pageadrlen; i++, ofs = ofs >> 8) {
-			if (DoC_is_Millennium(doc))
+			if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc))
 				WriteDOC(ofs & 0xff, docptr, CDSNSlowIO);
 			WriteDOC_(ofs & 0xff, docptr, doc->ioreg);
 		}
 	}
 
+	if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc))
+		WriteDOC(ofs & 0xff, docptr, WritePipeTerm);
+
 	DoC_Delay(doc, 2);	/* Needed for some slow flash chips. mf. */
 	
 	/* FIXME: The SlowIO's for millennium could be replaced by 
@@ -237,7 +253,7 @@
 	if (len <= 0)
 		return;
 
-	if (DoC_is_Millennium(doc)) {
+	if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc)) {
 		/* Read the data via the internal pipeline through CDSN IO register,
 		   see Pipelined Read Operations 11.3 */
 		dummy = ReadDOC(docptr, ReadPipeInit);
@@ -252,7 +268,7 @@
 	for (i = 0; i < len; i++)
 		buf[i] = ReadDOC_(docptr, doc->ioreg + (i & modulus));
 
-	if (DoC_is_Millennium(doc)) {
+	if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc)) {
 		buf[i] = ReadDOC(docptr, LastDataRead);
 	}
 }
@@ -271,7 +287,7 @@
 	for (i = 0; i < len; i++)
 		WriteDOC_(buf[i], docptr, doc->ioreg + i);
 
-	if (DoC_is_Millennium(doc)) {
+	if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc)) {
 		WriteDOC(0x00, docptr, WritePipeTerm);
 	}
 }
@@ -347,15 +363,27 @@
 
 	/* Read the manufacturer and device id codes from the device */
 
-	/* CDSN Slow IO register see Software Requirement 11.4 item 5. */
-	dummy = ReadDOC(doc->virtadr, CDSNSlowIO);
-	DoC_Delay(doc, 2);
-	mfr = ReadDOC_(doc->virtadr, doc->ioreg);
+	if (DoC_is_Millennium(doc) || DoC_is_2000TSOP(doc)) {
+		DoC_Delay(doc, 2);
+		dummy = ReadDOC(doc->virtadr, ReadPipeInit);
+		mfr = ReadDOC(doc->virtadr, LastDataRead);
+
+		DoC_Delay(doc, 2);
+		dummy = ReadDOC(doc->virtadr, ReadPipeInit);
+		id = ReadDOC(doc->virtadr, LastDataRead);
+	} else {
+		/* CDSN Slow IO register see Software Req 11.4 item 5. */
+		dummy = ReadDOC(doc->virtadr, CDSNSlowIO);
+		DoC_Delay(doc, 2);
+		mfr = ReadDOC_(doc->virtadr, doc->ioreg);
+
+		/* CDSN Slow IO register see Software Req 11.4 item 5. */
+		dummy = ReadDOC(doc->virtadr, CDSNSlowIO);
+		DoC_Delay(doc, 2);
+		id = ReadDOC_(doc->virtadr, doc->ioreg);
+	}
 
-	/* CDSN Slow IO register see Software Requirement 11.4 item 5. */
-	dummy = ReadDOC(doc->virtadr, CDSNSlowIO);
-	DoC_Delay(doc, 2);
-	id = ReadDOC_(doc->virtadr, doc->ioreg);
+	printk("IdentChip checking floor %d chip %d id 0x%02x mfr 0x%02x\n", floor, chip, id, mfr);
 
 	/* No response - return failure */
 	if (mfr == 0xff || mfr == 0)
@@ -541,6 +569,10 @@
 
 
 	switch (this->ChipID) {
+	case DOC_ChipID_Doc2kTSOP:
+		mtd->name = "DiskOnChip 2000 TSOP";
+		this->ioreg = DoC_Mil_CDSN_IO;
+		break;
 	case DOC_ChipID_Doc2k:
 		mtd->name = "DiskOnChip 2000";
 		this->ioreg = DoC_2k_CDSN_IO;
@@ -692,7 +724,7 @@
 			DoC_ReadBuf(this, eccbuf, 6);
 
 			/* Flush the pipeline */
-			if (DoC_is_Millennium(this)) {
+			if (DoC_is_Millennium(this) || DoC_is_2000TSOP(this)) {
 				dummy = ReadDOC(docptr, ECCConf);
 				dummy = ReadDOC(docptr, ECCConf);
 				i = ReadDOC(docptr, ECCConf);
@@ -773,6 +805,7 @@
 	int len256 = 0;
 	struct Nand *mychip;
 	size_t left = len;
+	int status;
 
 	docptr = this->virtadr;
 
@@ -865,7 +898,7 @@
 			WriteDOC(CDSN_CTRL_ECC_IO | CDSN_CTRL_CE, docptr,
 				 CDSNControl);
 
-			if (DoC_is_Millennium(this)) {
+			if (DoC_is_Millennium(this) || DoC_is_2000TSOP(this)) {
 				WriteDOC(0, docptr, NOP);
 				WriteDOC(0, docptr, NOP);
 				WriteDOC(0, docptr, NOP);
@@ -875,6 +908,9 @@
 				WriteDOC_(0, docptr, this->ioreg);
 			}
 
+			WriteDOC(CDSN_CTRL_ECC_IO | CDSN_CTRL_FLASH_IO | CDSN_CTRL_CE, docptr,
+				 CDSNControl);
+
 			/* Read the ECC data through the DiskOnChip ECC logic */
 			for (di = 0; di < 6; di++) {
 				eccbuf[di] = ReadDOC(docptr, ECCSyndrome0 + di);
@@ -896,10 +932,16 @@
 		DoC_Command(this, NAND_CMD_STATUS, CDSN_CTRL_WP);
 		/* There's an implicit DoC_WaitReady() in DoC_Command */
 
-		dummy = ReadDOC(docptr, CDSNSlowIO);
-		DoC_Delay(this, 2);
+		if (DoC_is_Millennium(this) || DoC_is_2000TSOP(this)) {
+			ReadDOC(docptr, ReadPipeInit);
+			status = ReadDOC(docptr, LastDataRead);
+		} else {
+			dummy = ReadDOC(docptr, CDSNSlowIO);
+			DoC_Delay(this, 2);
+			status = ReadDOC_(docptr, this->ioreg);
+		}
 
-		if (ReadDOC_(docptr, this->ioreg) & 1) {
+		if (status & 1) {
 			printk(KERN_ERR "Error programming flash\n");
 			/* Error in programming */
 			*retlen = 0;
@@ -1067,6 +1109,7 @@
 	unsigned long docptr = this->virtadr;
 	struct Nand *mychip = &this->chips[ofs >> this->chipshift];
 	volatile int dummy;
+	int status;
 
 	//      printk("doc_write_oob(%lx, %d): %2.2X %2.2X %2.2X %2.2X ... %2.2X %2.2X .. %2.2X %2.2X\n",(long)ofs, len,
 	//   buf[0], buf[1], buf[2], buf[3], buf[8], buf[9], buf[14],buf[15]);
@@ -1115,10 +1158,16 @@
 		DoC_Command(this, NAND_CMD_STATUS, 0);
 		/* DoC_WaitReady() is implicit in DoC_Command */
 
-		dummy = ReadDOC(docptr, CDSNSlowIO);
-		DoC_Delay(this, 2);
+		if (DoC_is_Millennium(this) || DoC_is_2000TSOP(this)) {
+			ReadDOC(docptr, ReadPipeInit);
+			status = ReadDOC(docptr, LastDataRead);
+		} else {
+			dummy = ReadDOC(docptr, CDSNSlowIO);
+			DoC_Delay(this, 2);
+			status = ReadDOC_(docptr, this->ioreg);
+		}
 
-		if (ReadDOC_(docptr, this->ioreg) & 1) {
+		if (status & 1) {
 			printk(KERN_ERR "Error programming oob data\n");
 			/* There was an error */
 			*retlen = 0;
@@ -1134,10 +1183,16 @@
 	DoC_Command(this, NAND_CMD_STATUS, 0);
 	/* DoC_WaitReady() is implicit in DoC_Command */
 
-	dummy = ReadDOC(docptr, CDSNSlowIO);
-	DoC_Delay(this, 2);
+	if (DoC_is_Millennium(this) || DoC_is_2000TSOP(this)) {
+		ReadDOC(docptr, ReadPipeInit);
+		status = ReadDOC(docptr, LastDataRead);
+	} else {
+		dummy = ReadDOC(docptr, CDSNSlowIO);
+		DoC_Delay(this, 2);
+		status = ReadDOC_(docptr, this->ioreg);
+	}
 
-	if (ReadDOC_(docptr, this->ioreg) & 1) {
+	if (status & 1) {
 		printk(KERN_ERR "Error programming oob data\n");
 		/* There was an error */
 		*retlen = 0;
@@ -1170,6 +1225,7 @@
 	volatile int dummy;
 	unsigned long docptr;
 	struct Nand *mychip;
+	int status;
 
  	down(&this->lock);
 
@@ -1201,10 +1257,16 @@
 
 		DoC_Command(this, NAND_CMD_STATUS, CDSN_CTRL_WP);
 
-		dummy = ReadDOC(docptr, CDSNSlowIO);
-		DoC_Delay(this, 2);
-		
-		if (ReadDOC_(docptr, this->ioreg) & 1) {
+		if (DoC_is_Millennium(this) || DoC_is_2000TSOP(this)) {
+			ReadDOC(docptr, ReadPipeInit);
+			status = ReadDOC(docptr, LastDataRead);
+		} else {
+			dummy = ReadDOC(docptr, CDSNSlowIO);
+			DoC_Delay(this, 2);
+			status = ReadDOC_(docptr, this->ioreg);
+		}
+
+		if (status & 1) {
 			printk(KERN_ERR "Error erasing at 0x%x\n", ofs);
 			/* There was an error */
 			instr->state = MTD_ERASE_FAILED;
diff -Nru a/drivers/mtd/devices/docprobe.c b/drivers/mtd/devices/docprobe.c
--- a/drivers/mtd/devices/docprobe.c	Tue Oct 28 16:32:43 2003
+++ b/drivers/mtd/devices/docprobe.c	Tue Oct 28 16:32:43 2003
@@ -97,10 +97,11 @@
 static inline int __init doccheck(unsigned long potential, unsigned long physadr)
 {
 	unsigned long window=potential;
-	unsigned char tmp, tmpb, tmpc, ChipID;
+	unsigned char tmp, tmpb, tmpc;
 #ifndef DOC_PASSIVE_PROBE
 	unsigned char tmp2;
 #endif
+	unsigned char ChipID;
 
 	/* Routine copied from the Linux DOC driver */
 
@@ -138,10 +139,16 @@
 	/* We need to read the ChipID register four times. For some
 	   newer DiskOnChip 2000 units, the first three reads will
 	   return the DiskOnChip Millennium ident. Don't ask. */
-	ReadDOC(window, ChipID);
-	ReadDOC(window, ChipID);
-	ReadDOC(window, ChipID);
 	ChipID = ReadDOC(window, ChipID);
+#if 1
+	if(ChipID == DOC_ChipID_DocMil) {
+		ReadDOC(window, ChipID);
+		ReadDOC(window, ChipID);
+		ChipID = ReadDOC(window, ChipID);
+		if(ChipID != DOC_ChipID_DocMil)
+			ChipID = DOC_ChipID_Doc2kTSOP;
+	}
+#endif
   
 	switch (ChipID) {
 	case DOC_ChipID_Doc2k:
@@ -153,6 +160,7 @@
 				return ChipID;
 		break;
 		
+	case DOC_ChipID_Doc2kTSOP:
 	case DOC_ChipID_DocMil:
 		/* Check the TOGGLE bit in the ECC register */
 		tmp  = ReadDOC(window, ECCConf) & DOC_TOGGLE_BIT;
@@ -267,6 +275,12 @@
 		sprintf(namebuf, "with ChipID %2.2X", ChipID);
 
 		switch(ChipID) {
+		case DOC_ChipID_Doc2kTSOP:
+			name="2000 TSOP";
+			im_funcname = "DoC2k_init";
+			im_modname = "doc2000";
+			break;
+			
 		case DOC_ChipID_Doc2k:
 			name="2000";
 			im_funcname = "DoC2k_init";
diff -Nru a/include/linux/mtd/doc2000.h b/include/linux/mtd/doc2000.h
--- a/include/linux/mtd/doc2000.h	Tue Oct 28 16:32:43 2003
+++ b/include/linux/mtd/doc2000.h	Tue Oct 28 16:32:43 2003
@@ -114,6 +114,7 @@
 #define DOC_MODE_MDWREN 	0x04
 
 #define DOC_ChipID_Doc2k 	0x20
+#define DOC_ChipID_Doc2kTSOP 	0x21	/* internal number for MTD */
 #define DOC_ChipID_DocMil 	0x30
 #define DOC_ChipID_DocMilPlus32	0x40
 #define DOC_ChipID_DocMilPlus16	0x41
@@ -169,7 +170,7 @@
 	unsigned long physadr;
 	unsigned long virtadr;
 	unsigned long totlen;
-	char ChipID; /* Type of DiskOnChip */
+	unsigned char ChipID; /* Type of DiskOnChip */
 	int ioreg;
 	
 	unsigned long mfr; /* Flash IDs - only one type of flash per device */

--=-MvIT7rYWSuWai+sWeMSc--
