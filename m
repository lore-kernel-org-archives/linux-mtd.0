Received: from eu1sys200aog116.obsmtp.com ([207.126.144.141])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoT-000588-7X
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:07:59 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EDCA4123
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:54 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93A1D2478
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:54 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 09/13] nand-data: Update BBM info for Toshiba
 TC58DVG02A5
Date: Tue,  6 Dec 2011 12:07:45 +0000
Message-Id: <1323173269-19931-9-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-8-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
 <1323173269-19931-7-git-send-email-angus.clark@st.com>
 <1323173269-19931-8-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update BBM info for Toshiba TC58DVG02A5, according to datasheet and confirmed by
a Toshiba engineer.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 10d3ed0..ea3a68b 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -182,7 +182,7 @@
 "Samsung","K9GBG08U0M","0xEC","0xD7","0xECD794725442",4096,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
 "Samsung","K9LCG08U1M","0xEC","0xD7","0xECD794725442",8192,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
 "Samsung","K9HDG08U5M","0xEC","0xD7","0xECD794725442",16384,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
-"Toshiba","TC58DVG02A5","0x98","0x79","0x9879",128,512,16,"16 KB","x8","N/A","All OOB bytes",,,,,,"TBD/512-byte","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,,"Preliminary sheet"
+"Toshiba","TC58DVG02A5","0x98","0x79","0x9879",128,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,FALSE,TRUE,"TBD/512-byte","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,,"Preliminary sheet"
 "Toshiba","TC58DVG3S0E","0x98","0xD3","0x98D3...",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"TBD/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table; Preliminary sheet"
 "Toshiba","TC58NVG0S3E","0x98","0xD1","0x98D1...",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
 "Toshiba","TC58NVG1S3E","0x98","0xDA","0x98DA...",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
-- 
1.5.3.3
