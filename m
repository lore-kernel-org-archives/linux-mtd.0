Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoT-00058e-IJ
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:07:59 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A579111C
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:55 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 478232480
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:55 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 11/13] nand-data: update MT29F8G08AB--- device IDs
Date: Tue,  6 Dec 2011 12:07:47 +0000
Message-Id: <1323173269-19931-11-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-10-git-send-email-angus.clark@st.com>
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
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Fix device IDs for Micron MT29F8G08ABABA and MT29F8G08ABCBB, from 0x28 to 0x38,
and update ONFI version to 2.1, according to dataheet.

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 55715b9..7f53305 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -191,8 +191,8 @@
 "Samsung","K9GAG08U0E","0xEC","0xD5","0xECD584725042",2048,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1078.5-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
 "Samsung","K9LBG08U0E","0xEC","0xD7","0xECD7C5725442",4096,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1078.5-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
 "Samsung","K9HCG08U1E","0xEC","0xD7","0xECD7C5725442",8192,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1078.5-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
-"Micron","MT29F8G08ABABA","0x2C","0x28","0x2C28002685",1024,4096,224,"512 KB","x8",2.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
-"Micron","MT29F8G08ABCBB","0x2C","0x28","0x2C28002685",1024,4096,224,"512 KB","x8",2.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F8G08ABABA","0x2C","0x38","0x2C38002685",1024,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F8G08ABCBB","0x2C","0x38","0x2C38002685",1024,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
 "Micron","MT29F32G08CBABA","0x2C","0x68","0x2C68044689",4096,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
 "Micron","MT29F32G08CBABB","0x2C","0x68","0x2C68044689",4096,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
 "Micron","MT29F32G08CBCBB","0x2C","0x68","0x2C68044689",4096,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
-- 
1.5.3.3
