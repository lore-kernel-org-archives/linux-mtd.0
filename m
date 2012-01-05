Received: from eu1sys200aog101.obsmtp.com ([207.126.144.111])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RipxH-0006iU-SN
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2012 16:14:17 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 26A5A88
 for <linux-mtd@lists.infradead.org>; Thu,  5 Jan 2012 16:14:04 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDB9A18E1
 for <linux-mtd@lists.infradead.org>; Thu,  5 Jan 2012 16:14:04 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 1/7] nand-data: updates to S30ML-P devices
Date: Thu,  5 Jan 2012 16:13:54 +0000
Message-Id: <1325780040-19809-1-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Updates to Spansion S30ML-P devices:
	- expand names to differentiate between x8 and x16 devices
	- fix ID 5th byte: 0x01 to 0x10 (checked with datasheet; seems regression
          introduced as part of commit 165cfaa9cdb1054bbafa98f24f179c6aa101fbe6
          "nand-data: remove asterisks")

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index c103399..6929691 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -65,12 +65,12 @@
 "Samsung","K9GAG08U0D","0xEC","0xD5","0xECD594293441",2048,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9LBG08U1D","0xEC","0xD5","0xECD594293441",4096,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 2 K9GAG08U0D"
 "Samsung","K9HCG08U5D","0xEC","0xD5","0xECD594293441",8192,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 4 K9GAG08U0D"
-"Spansion","S30ML512P","0x01","0x76","0x0176010101",64,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML512P","0x01","0x56","0x0156010101",64,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML256P","0x01","0x75","0x0175010101",32,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML256P","0x01","0x55","0x0155010101",32,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML128P","0x01","0x73","0x0173010101",16,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
-"Spansion","S30ML128P","0x01","0x53","0x0153030101",16,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x04"
+"Spansion","S30ML512P30xFIx0","0x01","0x76","0x0176010110",64,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML512P50xFIx1","0x01","0x56","0x0156010110",64,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML256P30xFIx0","0x01","0x75","0x0175010110",32,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML256P50xFIx1","0x01","0x55","0x0155010110",32,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML128P30xFIx0","0x01","0x73","0x0173010110",16,512,16,"512 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x00"
+"Spansion","S30ML128P50xFIx1","0x01","0x53","0x0153030110",16,512,16,"512 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte (correction)","ORNAND",5,"ID Table (ORNAND blocksize)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"Each model has x8/x16 bus versions, 2%/0% bad blocks; 2% => ID byte 3 = 0x04"
 "Samsung","K9K8G08U0A","0xEC","0xD3","0xECD3519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Samsung","K9WAG08U1A","0xEC","0xD3","0xECD3519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Samsung","K9NBG08U5A","0xEC","0xD3","0xECD3519558",4096,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
-- 
1.5.3.3
