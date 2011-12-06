Received: from eu1sys200aog111.obsmtp.com ([207.126.144.131])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoL-00053a-ET
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:07:50 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6B06811A
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:47 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1C3502483
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:47 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 01/13] nand-data: update TC58DVM72A1TG00 BBM info
Date: Tue,  6 Dec 2011 12:07:37 +0000
Message-Id: <1323173269-19931-1-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update Toshiba TC58DVM72A1TG00 bad block marker information to "1st page (6th
byte in OOB = non FFh)", as described in datasheet, and confirmed with Toshiba
engineers.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 09876ab..92bee24 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -1,7 +1,7 @@
 "Manufacturer","Part #","Man. ID","ID Code","Full ID","MB","Page","OOB","Block","Bus","ONFI Ver.","Bad Block Location","Scan Page 2","Scan last page","Scan (last-2)th page","Scan byte 1","Scan byte 6","ECC Req.","Bits per cell","ID Length","Detection Method","Full Support","ONFI-Capable","All but Size","Correct Size","Correct Page","Correct OOB","Correct Block","Correct Busw","Correct BBM","Notes"
 "Toshiba","TC58128AFT","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","All OOB bytes",TRUE,TRUE,FALSE,TRUE,TRUE,"?","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"For BBM, OOB is written non-FFh (only check 1st page, 1st byte?)"
 "Samsung","K9F1G08U0B","0xEC","0xF1","0xECF1009540",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Toshiba","TC58DVM72A1TG00","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","All OOB bytes",TRUE,TRUE,FALSE,TRUE,TRUE,"?","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"For BBM, OOB is written non-FFh (only check 1st page, 1st byte?)"
+"Toshiba","TC58DVM72A1TG00","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,FALSE,TRUE,"?","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9F5608D0C","0xEC","0x75","0xEC75",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"? (1-bit correct, 2-bit detect)",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9F5608Q0C","0xEC","0x35","0xEC35",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"? (1-bit correct, 2-bit detect)",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9F5608U0C","0xEC","0x75","0xEC75",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"? (1-bit correct, 2-bit detect)",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-- 
1.5.3.3
