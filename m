Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13gebE-00078a-00
	for mtd-list@infradead.org; Wed, 04 Oct 2000 03:48:04 +0100
Received: from cherry.napri.sk ([194.1.128.4])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13gebB-00078U-00
	for mtd@infradead.org; Wed, 04 Oct 2000 03:48:01 +0100
Received: from ham.kundrat.sk (root@gw.pkx.sk [194.1.139.234])
	by cherry.napri.sk (8.9.3/8.9.3/Debian/GNU) with ESMTP id EAA10725
	for <mtd@infradead.org>; Wed, 4 Oct 2000 04:47:58 +0200
Received: (from kundrat@localhost)
	by ham.kundrat.sk (8.9.3/8.9.3/Debian/GNU) id EAA02202
	for mtd@infradead.org; Wed, 4 Oct 2000 04:26:29 +0200
Date: Wed, 4 Oct 2000 04:26:29 +0200
From: Peter Kundrat <kundrat@pkx.sk>
To: mtd@infradead.org
Subject: small nftl fix
Message-ID: <20001004042629.A2152@napri.sk>
References: <E13eFI9-0003GD-00@pearl.tao.co.uk> <6998.970054171@passion.cygnus.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
In-Reply-To: <6998.970054171@passion.cygnus.co.uk>; from dwmw2@infradead.org on Wed, Sep 27, 2000 at 12:29:31PM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii

Greetings,

When writing to an empty fs on nftl, I always got garbled partition table.
Looking at the nftl.c, there seems to be a problem with overwriting media header
(which seems to be at the FirstPhysicalEUN). 

So the patch simply skips first two units (i'd like to know if magic constant 2 
is fine (i got it from nftl_format.c)).

Except for that there is a smal fix for LEVEL3 debug eliminating the dump of
"unrecognised partitions" (it was not very syslog friendly anyways).

Last part is about setting LastFreeEUN after the scanning loop .. which didnt
make sense to me .. (it is not correct before the loop either - for the
case of no empty blocks, but seems better :).
Anyways its quite late now, so i may have missed something.

Another problem is the fact, that VirtualUnitTable and ReplUnitTable are
allocated for NumEraseUnits, but are indexed with absolute EUN numbers .. 

Also WriteInh seems to be set to 0x1 on all my units (formatted by m-sys utils),
but the code checks for 0xffffffff .. is that value in specification ?


	Thats for tonight, more later,

		pkx

PS: is it possible to obtain specifications for DOC devices resp. nftl layout ?

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="first-eun-pkx.patch"

--- nftl.c.orig	Sun Oct  1 11:52:19 2000
+++ nftl.c	Wed Oct  4 03:46:17 2000
@@ -237,10 +237,11 @@
 	nftl->lastEUN = le16_to_cpu(nftl->MediaHdr.NumEraseUnits) +
 		le16_to_cpu(nftl->MediaHdr.FirstPhysicalEUN) - 1;
 	nftl->numfreeEUNs = 0;
+	nftl->LastFreeEUN = le16_to_cpu(nftl->MediaHdr.FirstPhysicalEUN)+2;
 
 	/* Scan each physical Erase Unit for validity and to find the 
 	   Virtual Erase Unit Chain to which it belongs */
-	for (i = le16_to_cpu(nftl->MediaHdr.FirstPhysicalEUN); i <= nftl->lastEUN; i++) {
+	for (i = le16_to_cpu(nftl->MediaHdr.FirstPhysicalEUN)+2; i <= nftl->lastEUN; i++) {
 		union nftl_uci uci;
 		unsigned long ofs;
 		size_t retlen;
@@ -277,6 +278,10 @@
 		nftl->VirtualUnitTable[i] = le16_to_cpu(uci.a.VirtUnitNum);
 		nftl->ReplUnitTable[i] = le16_to_cpu(uci.a.ReplUnitNum);
 
+		if (nftl->ReplUnitTable[i] < le16_to_cpu(nftl->MediaHdr.FirstPhysicalEUN)+2) 
+			printk(KERN_WARNING "EUN %d: is replaced by HDR EUN (%x)\n", i,
+			       le16_to_cpu(uci.a.ReplUnitNum));
+
 		/* if (!(VUN & 0x8000) && VUN < (arraybounds)).. optimises to: */
 		if (le16_to_cpu(uci.a.VirtUnitNum) < nftl->numvunits) 
 			nftl->EUNtable[le16_to_cpu(uci.a.VirtUnitNum) & 0x7fff] = i;
@@ -288,7 +293,6 @@
 		}
 	} 
 	NFTLs[firstfree] = nftl;
-	nftl->LastFreeEUN = le16_to_cpu(nftl->MediaHdr.FirstPhysicalEUN);
 
 #ifdef PSYCHO_DEBUG
 	for (i=0; i < 10/* nftl->numvunits*/; i++) {
@@ -377,17 +381,24 @@
 			}
 			if (!strncmp(hdr.DataOrgID, "ANAND", 6)) {
 				DEBUG(MTD_DEBUG_LEVEL2, "Valid NFTL partition at ofs 0x%lx\n", ofs);	
+				DEBUG(MTD_DEBUG_LEVEL2,"Erase Units: %d, FirstPhysicalEUN: %d, FormattedSize: %d, UnitSizeFactor: 0x%0x\n",
+				      hdr.NumEraseUnits, hdr.FirstPhysicalEUN,
+				      hdr.FormattedSize, hdr.UnitSizeFactor);
 				NFTL_setup(mtd, ofs, &hdr);
-			} else {
-				DEBUG(MTD_DEBUG_LEVEL3,"No valid NFTL Partition at ofs 0x%lx\n", ofs);
-				for (i = 0; i < 6; i++) {
-				    DEBUG(MTD_DEBUG_LEVEL3,"%x, ", hdr.DataOrgID[i]);
-				}
+			} /* else {
+				DEBUG(MTD_DEBUG_LEVEL3,
+				      "No valid NFTL Partition at ofs 0x%lx"
+				      ", DataOrgId %02.2x,%02.2x,%02.2x,%02.2x,%02.2x,%02.2x (%6.6s)\n",
+				      ofs, hdr.DataOrgID[0], hdr.DataOrgID[1], hdr.DataOrgID[2], 
+				           hdr.DataOrgID[4], hdr.DataOrgID[5], hdr.DataOrgID[6],
+					   hdr.DataOrgID);
+
 				DEBUG(MTD_DEBUG_LEVEL3," = %s\n", hdr.DataOrgID);
 				DEBUG(MTD_DEBUG_LEVEL3,"%d, %d, %d, %d\n",
 				      hdr.NumEraseUnits, hdr.FirstPhysicalEUN,
 				      hdr.FormattedSize, hdr.UnitSizeFactor);
 			}
+				*/
 		}
 		return;
 	}
@@ -430,7 +441,7 @@
 		}
 
 		if (++pot > nftl->lastEUN)
-			pot = le16_to_cpu(nftl->MediaHdr.FirstPhysicalEUN);
+			pot = le16_to_cpu(nftl->MediaHdr.FirstPhysicalEUN)+2;
 
 		if (!silly--) {
 			printk("Tell Dave he fucked up. LastFreeEUN = %d, "

--fUYQa+Pmc3FrFX/N--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
