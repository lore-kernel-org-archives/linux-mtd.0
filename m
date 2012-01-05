Received: from eu1sys200aog105.obsmtp.com ([207.126.144.119])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RipxP-0006jj-LP
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2012 16:14:24 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 84894BC
 for <linux-mtd@lists.infradead.org>; Thu,  5 Jan 2012 16:14:17 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5698C2133
 for <linux-mtd@lists.infradead.org>; Thu,  5 Jan 2012 16:14:17 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 2/7] nand-data: rename duplicate Numonyx NAND01G
 devices as 'Rev C'
Date: Thu,  5 Jan 2012 16:13:55 +0000
Message-Id: <1325780040-19809-2-git-send-email-angus.clark@st.com>
In-Reply-To: <1325780040-19809-1-git-send-email-angus.clark@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The table includes two entries for each of the following Numonyx devices:
NAND01GR3B2B, NAND01GW3B2B, NAND01GR4B2B, NAND01GW4B2B.  After further analysis,
it seems that the data for the second set of entries actaully coresponds to the
'Rev C' version of the devices, rather than 'Rev B' as suggested by the names.
This patch renames the second set of entries with the 'Rev C' names.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 6929691..5bde226 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -121,10 +121,10 @@
 "Numonyx","NAND02GW3B2C","0x20","0xDA","0x20DA801D",256,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND02GR4B2C","0x20","0xBA","0x20BA8055",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND02GW4B2C","0x20","0xCA","0x20CA805D",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND01GR3B2B","0x20","0xA1","0x20A10015",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND01GW3B2B","0x20","0xF1","0x20F1001D",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND01GR4B2B","0x20","0xB1","0x20B10055",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND01GW4B2B","0x20","0xC1","0x20C1005D",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Numonyx","NAND01GR3B2C","0x20","0xA1","0x20A10015",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Numonyx","NAND01GW3B2C","0x20","0xF1","0x20F1001D",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Numonyx","NAND01GR4B2C","0x20","0xB1","0x20B10055",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Numonyx","NAND01GW4B2C","0x20","0xC1","0x20C1005D",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Hynix","HY27UF082G2A","0xAD","0xDA","0xADDA801D00",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Hynix","HY27UF162G2A","0xAD","0xCA","0xADCA805D00",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9G8G08B0A","0xEC","0xD3","0xECD314A564",1024,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-- 
1.5.3.3
