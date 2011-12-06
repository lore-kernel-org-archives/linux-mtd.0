Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXttL-0007wn-CC
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:13:00 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 61585158
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:50 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 191942484
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:50 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 05/13] nand-data: remove incorrect/duplicate Numonyx
 NAND01G devices
Date: Tue,  6 Dec 2011 12:07:41 +0000
Message-Id: <1323173269-19931-5-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-4-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
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
NAND01GR3B2B, NAND01GW3B2B, NAND01GR4B2B, NAND01GW4B2B.  This patch removes the
second set since it disagrees with the datasheets I have with regards to ONFI
V1.0 support and the READID data.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index edf91ab..53b9a94 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -121,10 +121,6 @@
 "Numonyx","NAND02GW3B2C","0x20","0xDA","0x20DA801D",256,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND02GR4B2C","0x20","0xBA","0x20BA8055",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND02GW4B2C","0x20","0xCA","0x20CA805D",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND01GR3B2B","0x20","0xA1","0x20A10015",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND01GW3B2B","0x20","0xF1","0x20F1001D",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND01GR4B2B","0x20","0xB1","0x20B10055",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND01GW4B2B","0x20","0xC1","0x20C1005D",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Hynix","HY27UF082G2A","0xAD","0xDA","0xADDA801D00",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Hynix","HY27UF162G2A","0xAD","0xCA","0xADCA805D00",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9G8G08B0A","0xEC","0xD3","0xECD314A564",1024,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-- 
1.5.3.3
