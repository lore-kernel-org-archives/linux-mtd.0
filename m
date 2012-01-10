Received: from eu1sys200aog106.obsmtp.com ([207.126.144.121])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkasH-0002ab-Lq
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 12:32:23 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A19D211E
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 12:32:18 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 623002A98
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 12:32:18 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 2/3] nand-data: expand Samsung "K9XDG08U5D" devices
Date: Tue, 10 Jan 2012 12:32:20 +0000
Message-Id: <1326198741-12566-2-git-send-email-angus.clark@st.com>
In-Reply-To: <1326198741-12566-1-git-send-email-angus.clark@st.com>
References: <1326198741-12566-1-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch expands "K9XDG08U5D" to give two separate entries: K9MDG08U5D (Single
I/F device) and K9PDG08U5D (Dual I/F device).

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 01fd5dd..20a6f86 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -132,7 +132,8 @@
 "Samsung","K9LAG08U1A","0xEC","0xD3","0xECD314A564",2048,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Dual","K9G8G08U0A",
 "Samsung","K9LBG08U0D","0xEC","0xD7","0xECD7D5293841",4096,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
 "Samsung","K9HCG08U1D","0xEC","0xD7","0xECD7D5293841",8192,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Dual","K9LBG08U0D",
-"Samsung","K9XDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,4,4,4,"Single","K9LBG08U0D",
+"Samsung","K9MDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,4,4,4,"Single","K9LBG08U0D",
+"Samsung","K9PDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,4,4,4,"Dual","K9LBG08U0D",
 "Numonyx","NAND08GW3F2B","0x20","0xD3","0x20D390152441",1024,4096,224,"256 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,FALSE,TRUE,TRUE,"1-bit/512-byte",1,6,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
 "Samsung","K9K8G08U0B","0xEC","0xDC","0xECDC519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,1,1,1,"Single",,
 "Samsung","K9WAG08U1B","0xEC","0xDC","0xECDC519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,2,2,2,"Dual","K9K8G08U0B",
-- 
1.5.3.3
