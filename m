Received: from ns1.idleaire.net ([65.220.16.2] helo=iasrv1.idleaire.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19i0nw-0003pn-MZ
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2003 00:56:24 +0100
From: Dave Dillow <dave@thedillows.org>
To: linux-mtd@lists.infradead.org
Message-Id: <1059609350.3569.75.camel@dillow.idleaire.com>
Mime-Version: 1.0
Date: 30 Jul 2003 19:55:51 -0400
Content-Type: multipart/mixed; boundary="=-jiMd3LCQ/14yrQ9E047b"
cc: dwmw2@infradead.org
Subject: Problems with 128MB DoC 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-jiMd3LCQ/14yrQ9E047b
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've got a DoC MD2202-D128-X that I'm trying to get working with Linux.
The binary only drivers from M-Sys may be an option, but I'd much rather
have the source to work with.

I first tried the CVS version of docprobe, and it reported an unknown
chip ID of 0x30. Following an exchange between David Woodhouse and Zachi
Friedman, I cooked up the attached patch to docprobe, which lets it find
my 2000, but then it fails with the following errors:

Using configured DiskOnChip probe address 0xd0000
DiskOnChip 2000 found at address 0xD0000
Unknown flash chip found: C6 C6
Please report to dwmw2@infradead.org
Unknown flash chip found: C6 C6
Please report to dwmw2@infradead.org
Unknown flash chip found: C6 C6
Please report to dwmw2@infradead.org
Unknown flash chip found: C6 C6
Please report to dwmw2@infradead.org
No flash chips recognised.

It seems kind of odd that the flash id and manufacturer id are the same
number, so I also tried forcing the chip to be a Millennium, and got the
expected failure -- it did not report unknown flash chips; it didn't see
any at all.

So, if doc2000.c is working for DoC 2000 < 128MB, then it looks like the
new ASIC changed more than just the toggle bit?

I have a fairly urgent need to get this working in some form or fashion.
I'm guessing the programming information is not publicly available --
any pointers on who I should talk to? Zachi, maybe? I'm willing to write
the code if I can get the information, or at the very least, I can be a
pretty quick turnaround tester.
-- 
Dave Dillow <dave@thedillows.org>

--=-jiMd3LCQ/14yrQ9E047b
Content-Disposition: attachment; filename=docprobe-new-2000.patch
Content-Type: text/plain; name=docprobe-new-2000.patch; charset=UTF-8
Content-Transfer-Encoding: 7bit

--- docprobe.c.orig	2003-07-30 14:24:34.000000000 -0400
+++ docprobe.c	2003-07-30 14:26:03.000000000 -0400
@@ -135,13 +135,19 @@
 		 window, DOCControl);
 #endif /* !DOC_PASSIVE_PROBE */	
 
-	/* We need to read the ChipID register four times. For some
-	   newer DiskOnChip 2000 units, the first three reads will
-	   return the DiskOnChip Millennium ident. Don't ask. */
-	ReadDOC(window, ChipID);
-	ReadDOC(window, ChipID);
-	ReadDOC(window, ChipID);
+	/* Some newer DiskOnChip 2000 units report as a Millennium.
+	 * To tell these apart, read the ID four times, and if the
+	 * fourth read does not come back as a Millenium, it is a
+	 * newer 2000 unit. */
 	ChipID = ReadDOC(window, ChipID);
+	if (ChipID == DOC_ChipID_DocMil) {
+		ReadDOC(window, ChipID);
+		ReadDOC(window, ChipID);
+		ChipID = ReadDOC(window, ChipID);
+		if (ChipID != DOC_ChipID_DocMil)
+			ChipID = DOC_ChipID_Doc2k;
+	}
+
   
 	switch (ChipID) {
 	case DOC_ChipID_Doc2k:
@@ -151,7 +157,10 @@
 		tmpc = ReadDOC(window, 2k_ECCStatus) & DOC_TOGGLE_BIT;
 		if (tmp != tmpb && tmp == tmpc)
 				return ChipID;
-		break;
+
+		/* The newer DiskOnChip 2000 units use the same toggle
+		 * bit as the Millenium chips, so fall through to that
+		 * test. */
 		
 	case DOC_ChipID_DocMil:
 		/* Check the TOGGLE bit in the ECC register */

--=-jiMd3LCQ/14yrQ9E047b--
