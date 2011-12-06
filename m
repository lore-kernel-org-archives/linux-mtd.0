Received: from eu1sys200aog120.obsmtp.com ([207.126.144.149])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoM-000544-Mu
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:07:51 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81CA4121
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:48 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46DD52483
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:48 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 03/13] nand-data: Samsung devices: fix ID Length =
 "5?"
Date: Tue,  6 Dec 2011 12:07:39 +0000
Message-Id: <1323173269-19931-3-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-2-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change the ID Length for Samsung devices K9F8G08B0M, K9F8G08U0M, K9F8G08U1M,
from "5?" to "5", as documented in the datasheets and verified on a K9F8G08B0M
device.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 07505f7..bfc8b2f 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -74,9 +74,9 @@
 "Samsung","K9K8G08U0A","0xEC","0xD3","0xECD3519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Samsung","K9WAG08U1A","0xEC","0xD3","0xECD3519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Samsung","K9NBG08U5A","0xEC","0xD3","0xECD3519558",4096,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
-"Samsung","K9F8G08B0M","0xEC","0xD3","0xECD310A664",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,"5?","Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Samsung","K9F8G08U0M","0xEC","0xD3","0xECD310A664",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,"5?","Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Samsung","K9F8G08U1M","0xEC","0xD3","0xECD310A664",2048,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,"5?","Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"contains 2 K9F8G08U0M"
+"Samsung","K9F8G08B0M","0xEC","0xD3","0xECD310A664",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Samsung","K9F8G08U0M","0xEC","0xD3","0xECD310A664",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Samsung","K9KAG08U1M","0xEC","0xD3","0xECD310A664",2048,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"contains 2 K9F8G08U0M"
 "Numonyx","NAND04GR3B2D","0x20","0xAC","0x20AC101554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode"
 "Numonyx","NAND08GR3B4C","0x20","0xAC","0x20AC101554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode; contains two NAND04GR3B2D"
 "Numonyx","NAND04GW3B2D","0x20","0xDC","0x20DC109554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode"
-- 
1.5.3.3
