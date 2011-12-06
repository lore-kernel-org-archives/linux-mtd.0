Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoP-00055j-Li
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:07:54 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 649DF11A
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:51 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1BC962483
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:51 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 06/13] nand-data: fix name for Samsung "K9XDG08U5D"
Date: Tue,  6 Dec 2011 12:07:42 +0000
Message-Id: <1323173269-19931-6-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-5-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Change Samsung "K9XDG08U5D" to "K9MDG08U5D".

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 53b9a94..cd75572 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -128,7 +128,7 @@
 "Samsung","K9LAG08U1A","0xEC","0xD3","0xECD314A564",2048,2048,64,"256 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9LBG08U0D","0xEC","0xD7","0xECD7D5293841",4096,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9HCG08U1D","0xEC","0xD7","0xECD7D5293841",8192,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Samsung","K9XDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"Samsung","K9MDG08U5D","0xEC","0xD7","0xECD7D5293841",16384,4096,218,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"8-bit/512-byte (correction)",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Numonyx","NAND08GW3F2B","0x20","0xD3","0x20D390152441",1024,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,TRUE,"1-bit/512-byte",1,6,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9K8G08U0B","0xEC","0xDC","0xECDC519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9WAG08U1B","0xEC","0xDC","0xECDC519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
-- 
1.5.3.3
