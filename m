Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXtoT-00058T-US
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2011 12:08:01 +0000
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1AF57153
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:54 +0000 (GMT)
Received: from mail7.sgp.st.com (mail7.sgp.st.com [164.129.223.81])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B862E247D
 for <linux-mtd@lists.infradead.org>; Tue,  6 Dec 2011 12:07:54 +0000 (GMT)
From: Angus CLARK <angus.clark@st.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH (mtd-www) 10/13] nand-data: update READID data for family of
 Micron devices
Date: Tue,  6 Dec 2011 12:07:46 +0000
Message-Id: <1323173269-19931-10-git-send-email-angus.clark@st.com>
In-Reply-To: <1323173269-19931-9-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
 <1323173269-19931-7-git-send-email-angus.clark@st.com>
 <1323173269-19931-8-git-send-email-angus.clark@st.com>
 <1323173269-19931-9-git-send-email-angus.clark@st.com>
Cc: Angus Clark <angus.clark@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update the READID data for the following Micron devices: MT29F4G08ABADA,
MT29F4G16ABADA, MT29F4G08ABBDA, MT29F4G16ABBDA, MT29F8G08ADBDA, MT29F8G16ADBDA,
MT29F8G08ADADA, MT29F8G16ADADA. (Problem with the second byte in the Full ID
column.)

Signed-off-by: Angus Clark <angus.clark@st.com>
---
 nand-data/nanddata.csv |   16 ++++++++--------
 1 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index ea3a68b..55715b9 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -210,14 +210,14 @@
 "Micron","MT29F2G16ABBEA","0x2C","0xBA","0x2CBA905506",256,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
 "Micron","MT29F2G08ABAEA","0x2C","0xDA","0x2CDA909506",256,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
 "Micron","MT29F2G16ABAEA","0x2C","0xCA","0x2CCA90D506",256,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-"Micron","MT29F4G08ABADA","0x2C","0xDC","0x2CCA909556",512,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-"Micron","MT29F4G16ABADA","0x2C","0xCC","0x2CDC90D556",512,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-"Micron","MT29F4G08ABBDA","0x2C","0xAC","0x2CCC901556",512,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-"Micron","MT29F4G16ABBDA","0x2C","0xBC","0x2CAC905556",512,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-"Micron","MT29F8G08ADBDA","0x2C","0xA3","0x2CBCD1155A",1024,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-"Micron","MT29F8G16ADBDA","0x2C","0xB3","0x2CA3D1555A",1024,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-"Micron","MT29F8G08ADADA","0x2C","0xD3","0x2CB3D1955A",1024,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-"Micron","MT29F8G16ADADA","0x2C","0xC3","0x2CD3D1D55A",1024,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F4G08ABADA","0x2C","0xDC","0x2CDC909556",512,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F4G16ABADA","0x2C","0xCC","0x2CCC90D556",512,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F4G08ABBDA","0x2C","0xAC","0x2CAC901556",512,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F4G16ABBDA","0x2C","0xBC","0x2CBC905556",512,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F8G08ADBDA","0x2C","0xA3","0x2CA3D1155A",1024,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F8G16ADBDA","0x2C","0xB3","0x2CB3D1555A",1024,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F8G08ADADA","0x2C","0xD3","0x2CD3D1955A",1024,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F8G16ADADA","0x2C","0xC3","0x2CC3D1D55A",1024,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
 "Micron","MT29F1G08ABADA","0x2C","0xF1","0x2CF1809502",128,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
 "Micron","MT29F1G08ABBDA","0x2C","0xA1","0x2CA1801502",128,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
 "Micron","MT29F1G16ABBDA","0x2C","0xB1","0x2CB1805502",128,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
-- 
1.5.3.3
