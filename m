Received: from eu1sys200aog104.obsmtp.com ([207.126.144.117])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ripxy-0006r5-Gf
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2012 16:14:59 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 139D510D
 for <linux-mtd@lists.infradead.org>; Thu,  5 Jan 2012 16:14:55 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CE8B918E1
 for <linux-mtd@lists.infradead.org>; Thu,  5 Jan 2012 16:14:55 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 6/7] nand-data: expand Samsung "K9XDG08U5D" devices
Date: Thu,  5 Jan 2012 16:13:59 +0000
Message-Id: <1325780040-19809-6-git-send-email-angus.clark@st.com>
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

This patch expands "K9XDG08U5D" to give two separate entries, K9MDG08U5D (Single
I/F device) and K9PDG08U5D (Dual I/F device).

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index e7a189c..e3dd75c 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -132,7 +132,8 @@
 "Samsung","K9LAG08U1A","0xEC","0xD3","0xECD314A564",2048,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Dual","K9G8G08U0A",
 "Samsung","K9LBG08U0D","0xEC","0xD7","0xECD7D5293841",4096,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
 "Samsung","K9HCG08U1D","0xEC","0xD7","0xECD7D5293841",8192,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Dual","K9LBG08U0D",
-"Samsung","K9XDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,4,4,4,"Single","K9LBG08U0D",
+"Samsung","K9MDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,4,4,4,"Single","K9LBG08U0D",
+"Samsung","K9PDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,4,4,4,"Dual","K9LBG08U0D",
 "Numonyx","NAND08GW3F2B","0x20","0xD3","0x20D390152441",1024,4096,224,"256 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,"1-bit/512-byte",1,6,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
 "Samsung","K9K8G08U0B","0xEC","0xDC","0xECDC519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
 "Samsung","K9WAG08U1B","0xEC","0xDC","0xECDC519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Dual","K9K8G08U0B",
-- 
1.5.3.3
