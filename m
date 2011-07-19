Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjIzG-0000zB-U8
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 22:42:01 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 07/10] nand-data: add new chips
Date: Tue, 19 Jul 2011 15:40:44 -0700
Message-ID: <1311115247-20636-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
References: <1311115247-20636-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Part information from various NAND datasheets is included here.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nand-data/nanddata.csv |   35 +++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index a9b8226..b3f24f1 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -191,3 +191,38 @@
 "Toshiba","TC58NVG0S3E","0x98","0xD1","0x98D1...",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
 "Toshiba","TC58NVG1S3E","0x98","0xDA","0x98DA...",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
 "Toshiba","TC58NVG2S3E","0x98","0xDC","0x98DC...",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,"Datasheet doesn't list full ID, only shows ID decoder table"
+"Hynix","H27UAG8T2M","0xAD","0xD5","0xADD514B644",2048,4096,128,"512 KB","x8","N/A","Last or (last-2)th page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/528-byte",2,5,"Extended ID decode",FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,
+"Samsung","K9GAG08U0E","0xEC","0xD5","0xECD584725042",2048,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1078.5-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
+"Samsung","K9LBG08U0E","0xEC","0xD7","0xECD7C5725442",4096,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1078.5-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
+"Samsung","K9HCG08U1E","0xEC","0xD7","0xECD7C5725442",8192,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"24-bit/1078.5-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,FALSE,"Weird 1st AND last page scan?"
+"Micron","MT29F8G08ABABA","0x2C","0x28","0x2C28002685",1024,4096,224,"512 KB","x8",2.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F8G08ABCBB","0x2C","0x28","0x2C28002685",1024,4096,224,"512 KB","x8",2.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F32G08CBABA","0x2C","0x68","0x2C68044689",4096,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F32G08CBABB","0x2C","0x68","0x2C68044689",4096,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F32G08CBCBB","0x2C","0x68","0x2C68044689",4096,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F64G08CEABA","0x2C","0x68","0x2C68044689",8192,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F64G08CFABA","0x2C","0x68","0x2C68044689",8192,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F64G08CECBB","0x2C","0x68","0x2C68044689",8192,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F64G08CFABB","0x2C","0x68","0x2C68044689",8192,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F128G08CJABA","0x2C","0x88","0x2C8805C689",16384,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F128G08CKABA","0x2C","0x88","0x2C8805C689",16384,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F128G08CJABB","0x2C","0x88","0x2C8805C689",16384,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F128G08CKCBB","0x2C","0x88","0x2C8805C689",16384,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F256G08CUABA","0x2C","0x88","0x2C8805C689",32768,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F256G08CUCBB","0x2C","0x88","0x2C8805C689",32768,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,
+"Micron","MT29F2G08ABBEA","0x2C","0xAA","0x2CAA901506",256,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F2G16ABBEA","0x2C","0xBA","0x2CBA905506",256,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F2G08ABAEA","0x2C","0xDA","0x2CDA909506",256,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F2G16ABAEA","0x2C","0xCA","0x2CCA90D506",256,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F4G08ABADA","0x2C","0xDC","0x2CCA909556",512,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F4G16ABADA","0x2C","0xCC","0x2CDC90D556",512,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F4G08ABBDA","0x2C","0xAC","0x2CCC901556",512,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F4G16ABBDA","0x2C","0xBC","0x2CAC905556",512,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F8G08ADBDA","0x2C","0xA3","0x2CBCD1155A",1024,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F8G16ADBDA","0x2C","0xB3","0x2CA3D1555A",1024,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F8G08ADADA","0x2C","0xD3","0x2CB3D1955A",1024,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F8G16ADADA","0x2C","0xC3","0x2CD3D1D55A",1024,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F1G08ABADA","0x2C","0xF1","0x2CF1809502",128,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F1G08ABBDA","0x2C","0xA1","0x2CA1801502",128,2048,64,"128 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Micron","MT29F1G16ABBDA","0x2C","0xB1","0x2CB1805502",128,2048,64,"128 KB","x16",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/528-byte",1,5,"ONFI",TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,"Only exception: scan 1st page vs. scan 1st and 2nd page"
+"Samsung","K9F2G08U0C","0xEC","0xDA","0xECDA109544",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-- 
1.7.0.4
