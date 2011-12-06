Received: from eu1sys200aog113.obsmtp.com ([207.126.144.135])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoc-0005AZ-T9
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:08:12 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E7DDD107
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:57 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 95C862483
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:57 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 13/13] nand-data: add devices
Date: Tue,  6 Dec 2011 12:07:49 +0000
Message-Id: <1323173269-19931-13-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-12-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
 <1323173269-19931-7-git-send-email-angus.clark@st.com>
 <1323173269-19931-8-git-send-email-angus.clark@st.com>
 <1323173269-19931-9-git-send-email-angus.clark@st.com>
 <1323173269-19931-10-git-send-email-angus.clark@st.com>
 <1323173269-19931-11-git-send-email-angus.clark@st.com>
 <1323173269-19931-12-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add some devices to the table.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |   38 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 4e0814f..894ef49 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -222,3 +222,41 @@
 "Micron","MT29F1G08ABBDA","0x2C","0xA1","0x2CA1801502",128,2048,64,"128 KB","x8",1,"1st page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,1,1,1,"Single",,"Only exception: scan 1st page vs. scan 1st and 2nd page"
 "Micron","MT29F1G16ABBDA","0x2C","0xB1","0x2CB1805502",128,2048,64,"128 KB","x16",1,"1st page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,1,1,1,"Single",,"Only exception: scan 1st page vs. scan 1st and 2nd page"
 "Samsung","K9F2G08U0C","0xEC","0xDA","0xECDA109544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Hynix","HY27UF081G2A","0xAD","0xF1","0xADF1801D",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Hynix","HY27UF161G2A","0xAD","0xC1","0xADC1805D",128,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Hynix","HY27UF082G2M","0xAD","0xDA","0xADDAXX15",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Hynix","HY27UF162G2M","0xAD","0xCA","0xADCAXX55",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Hynix","HY27UG088G5M","0xAD","0xDC","0xADDC8095",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Single",,
+"Hynix","HY27UG088GDM","0xAD","0xDC","0xADDC8095",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Dual",,
+"Hynix","HY27UH08AG5M","0xAD","0xD3","0xADD3C195",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Single",,
+"Hynix","HY27UH08AGDM","0xAD","0xD3","0xADD3C195",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Dual",,
+"Hynix","HY27UH08AG5B","0xAD","0xD3","0xADD3519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Single",,
+"Hynix","H27UAG8T2A","0xAD","0xD5","0xADD594254441",2048,4096,224,"512 KB","x8","N/A","last or last-2 page (1st byte in OOB = non Ffh)",FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,"12-bit/528-byte",2,6,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,"BBM location is last and last-2 page"
+"Hynix","H27UBG8T2A","0xAD","0xD7","0xADD7949A7442",4096,8192,448,"2048 KB","x8","N/A","1st or last page (1st byte in OOB = non Ffh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1024-byte",2,6,"Extended ID decode",,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Samsung","K9F1G08U0A","0xEC","0xF1","0xECF1XX15",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Samsung","K9F1G08Q0A","0xEC","0xF1","0xECF1XX15",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Samsung","K9F2G16U0M","0xEC","0xCA","0xECCA8055",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"? (1-bit correct, 2-bit detect)",1,4,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Samsung","K9PDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,4,4,4,"Dual","K9LBG08U0D",
+"Samsung","K9GBG08U0A","0xEC","0xD7","0xECD794766443",4096,8192,640,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"40-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,1,1,1,"Single",,
+"Samsung","K9LCG08U1A","0xEC","0xD7","0xECD794766443",8192,8192,640,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"40-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,2,2,2,"Dual","K9GBG08U0A","datasheet (Rev1.0 May 2010) seems to have errors for TSOP pinout"
+"Samsung","K9HDG08U5A","0xEC","0xD7","0xECD794766443",16384,8192,640,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"40-bit/1024-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,4,4,4,"Dual","K9GBG08U0A","datasheet (Rev1.0 May 2010) seems to have errors for TSOP pinout"
+"Micron","MT29F32G08RAA","0x2C","0xD5","0x2CD5943E74",4096,4096,218,"512 KB","x8",1,"1st page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,2,2,2,"Dual","MT29F16G08MAA",
+"Micron","MT29F64G08UAA","0x2C","0xD7","0x2CD7D53E78",8192,4096,218,"512 KB","x8",1,"1st page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,2,4,2,"Dual","MT29F16G08MAA",
+"Micron","MT29F128G08WAA","0x2C","0xD7","0x2CD7D53E78",8192,4096,218,"512 KB","x8",1,"1st page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,4,8,4,"Dual","MT29F16G08MAA",
+"Micron","MT29F64G08CFACB","0x2C","0x68","0x2C68044AA9",8192,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,2,2,2,"Single","MT29F32G08CBACA","returns 0x00 after first 5 read ID bytes"
+"Micron","MT29F256G08CJAAB","0x2C","0xA8","0x2CA805CBA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,2,4,2,"Single","MT29F64G08CB","returns 0x00 after first 5 read ID bytes"
+"ST","NAND128R3A","0x20","0x33","0x2033",16,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,"1-bit/256bytes",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"ST","NAND128R4A","0x20","0x43","0x2043",16,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"1-bit/256bytes",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"ST","NAND128W4A","0x20","0x53","0x2053",16,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"1-bit/256bytes",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Numonyx","NAND512R3A2S","0x20","0x36","0x2036",64,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte (2-bit detect)",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Numonyx","NAND512W3A2S","0x20","0x76","0x2076",64,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte (2-bit detect)",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Numonyx","NAND512R4A2S","0x20","0x46","0x2046",64,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte (2-bit detect)",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Numonyx","NAND512W4A2S","0x20","0x56","0x2056",64,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte (2-bit detect)",1,2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
+"Toshiba","TC58NVG0S3AFT05","0x98","0xF1","0x98F1001540",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st word in OOB OR Page= non Ffh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"?",1,5,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,1,1,1,"Single",,"Sequential page-programming; BBM is column 0 or 2048 of 1st and 2nd page!"
+"Toshiba","TC58NVG1S3BFT00","0x98","0xDA","0x98DA001544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Sequential page-programming"
+"Toshiba","TC58NVG1S8BFT00","0x98","0xDA","0x98DA005544",256,2048,64,"128 KB","x16","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Non-standard Device ID (x8 ID rather than x16 ID), but ID3 gives correct results; Sequential page-programming"
+"Toshiba","TC58DVG02A1","0x98","0x79","0x9879",128,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,"TBD/512-byte","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,"Sequential page-programming"
+"Toshiba","TC58DVM72A1FT00","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,"?","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,"Sequential page-programming"
+"Toshiba","TC58DAM72A1FT00","0x98","0x33","0x9833",16,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,FALSE,TRUE,"?","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,"Sequential page-programming; assume dev ID follows conventions (info not in datasheet)"
+"Toshiba","TC58DVM72F1FT00","0x98","0x53","0x9853",16,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"?","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,"Sequential page-programming; assume dev ID follows conventions (info not in datasheet)"
+"Toshiba","TC58DAM72F1FT00","0x98","0x43","0x9843",16,512,16,"16 KB","x16","N/A","1st page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,FALSE,"?","1?",2,"ID Table",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,"Sequential page-programming; assume dev ID follows conventions (info not in datasheet)"
-- 
1.5.3.3
