Received: from eu1sys200aog119.obsmtp.com ([207.126.144.147])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoN-00054q-JE
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:07:53 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B6AC123
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:49 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 409CA2483
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:49 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 04/13] nand-data: Fix Numonyx 'NAND02GW42C' name
Date: Tue,  6 Dec 2011 12:07:40 +0000
Message-Id: <1323173269-19931-4-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-3-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Numonyx 'NAND02GW42C' should be 'NAND02GW4B2C'.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index bfc8b2f..edf91ab 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -120,7 +120,7 @@
 "Numonyx","NAND02GR3B2C","0x20","0xAA","0x20AA8015",256,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND02GW3B2C","0x20","0xDA","0x20DA801D",256,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND02GR4B2C","0x20","0xBA","0x20BA8055",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Numonyx","NAND02GW42C","0x20","0xCA","0x20CA805D",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Numonyx","NAND02GW4B2C","0x20","0xCA","0x20CA805D",256,2048,64,"128 KB","x16","N/A","1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND01GR3B2B","0x20","0xA1","0x20A10015",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND01GW3B2B","0x20","0xF1","0x20F1001D",128,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND01GR4B2B","0x20","0xB1","0x20B10055",128,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,4,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-- 
1.5.3.3
