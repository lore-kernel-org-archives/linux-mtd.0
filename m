Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoR-00057G-QU
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:07:57 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7C601107
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:53 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32CDD2480
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:53 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 08/13] nand-data: fix ID Length for Hynix "HY27US{08,
 16}12(1/2)B" devices
Date: Tue,  6 Dec 2011 12:07:44 +0000
Message-Id: <1323173269-19931-8-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-7-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
 <1323173269-19931-7-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix ID Length for Hynix "HY27US{08,16}12(1/2)B" devices, from '4' to '2',
according to datasheet I have, and READID listed in the table.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index c31865d..10d3ed0 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -173,8 +173,8 @@
 "Hynix","HY27US16561A","0xAD","0x55","0xAD55",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Hynix","HY27SS08561A","0xAD","0x35","0xAD35",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Hynix","HY27SS16561A","0xAD","0x45","0xAD45",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
-"Hynix","HY27US0812(1/2)B","0xAD","0x76","0xAD76",64,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,4,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Hynix","HY27US1612(1/2)B","0xAD","0x56","0xAD56",64,512,16,"16 KB","x16","N/A","1st or 2nd page (3rd word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,4,"ID Table",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"This is the ONLY x16 chip that uses byte 6 (""word 3"") for BBM"
+"Hynix","HY27US0812(1/2)B","0xAD","0x76","0xAD76",64,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Hynix","HY27US1612(1/2)B","0xAD","0x56","0xAD56",64,512,16,"16 KB","x16","N/A","1st or 2nd page (3rd word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/528-byte",1,2,"ID Table",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"This is the ONLY x16 chip that uses byte 6 ('word 3') for BBM"
 "Samsung","K9F1G08U0D","0xEC","0xF1","0xECF1001540",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9G8G08B0M","0xEC","0xD3","0xECD3142564",1024,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9G8G08U0M","0xEC","0xD3","0xECD3142564",1024,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-- 
1.5.3.3
