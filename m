Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjIzG-0000zA-Qy
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 22:42:07 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 06/10] nand-data: update ONFI detection stats
Date: Tue, 19 Jul 2011 15:40:43 -0700
Message-ID: <1311115247-20636-6-git-send-email-computersforpeace@gmail.com>
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

Chips that support ONFI will be detected properly; we don't rely on any
ID decoding for these, even if ID decoding would detect them correctly.
This patch just updates the "Full Support" field for certain ONFI-capable
chips and changes their "Detection Method" to "ONFI".

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nand-data/nanddata.csv |   74 ++++++++++++++++++++++++------------------------
 1 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index ce953a8..a9b8226 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -78,9 +78,9 @@
 "Samsung","K9F8G08U0M","0xEC","0xD3","0xECD310A664",1024,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,"5?","Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9F8G08U1M","0xEC","0xD3","0xECD310A664",2048,4096,128,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,"5?","Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"contains 2 K9F8G08U0M"
 "Numonyx","NAND04GR3B2D","0x20","0xAC","0x20AC101554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode"
-"Numonyx","NAND08GR3B4C","0x20","0xAC","0x20AC101554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode; contains two NAND04GR3B2D"
+"Numonyx","NAND08GR3B4C","0x20","0xAC","0x20AC101554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode; contains two NAND04GR3B2D"
 "Numonyx","NAND04GW3B2D","0x20","0xDC","0x20DC109554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode"
-"Numonyx","NAND08GW3B4C","0x20","0xDC","0x20DC109554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode; contains two NAND04GW3B2D"
+"Numonyx","NAND08GW3B4C","0x20","0xDC","0x20DC109554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode; contains two NAND04GW3B2D"
 "Numonyx","NAND04GR4B2D","0x20","0xBC","0x20BC105554",512,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode"
 "Numonyx","NAND04GW4B2D","0x20","0xCC","0x20CC10D554",512,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode"
 "Numonyx","NAND08GR3B2C","0x20","0xA3","0x20A3511558",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"embedded 1/528 bit ECC; remains in Read ID mode"
@@ -91,18 +91,18 @@
 "Micron","MT29F8G08BAA","0x2C","0xD3","0x2CD3D19558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Micron","MT29F8G08DAA","0x2C","0xDC","0x2CDC909554",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"contains 2 MT29F4G08AAA"
 "Micron","MT29F16G08FAA","0x2C","0xD3","0x2CD3D19558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"contains 2 MT29F8G08BAA"
-"Micron","MT29F16G08MAA","0x2C","0xD5","0x2CD5943E74",2048,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI-Only?",FALSE,FALSE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,
-"Micron","MT29F32G08QAA","0x2C","0xD5","0x2CD5943E74",4096,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI-Only?",FALSE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,
-"Micron","MT29F64G08TAA","0x2C","0xD7","0x2CD7D53E78",8192,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI-Only?",FALSE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,
-"Micron","MT29F16G08CBABA","0x2C","0x48","0x2C48044685",2048,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI-Only?",FALSE,FALSE,FALSE,,FALSE,,TRUE,TRUE,"returns 0x00 after first 5 read ID bytes"
-"Micron","MT29F16G08CBABB","0x2C","0x48","0x2C48044685",2048,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI-Only?",FALSE,FALSE,FALSE,,FALSE,,TRUE,TRUE,"returns 0x00 after first 5 read ID bytes"
+"Micron","MT29F16G08MAA","0x2C","0xD5","0x2CD5943E74",2048,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI",TRUE,FALSE,TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,
+"Micron","MT29F32G08QAA","0x2C","0xD5","0x2CD5943E74",4096,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI",TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,
+"Micron","MT29F64G08TAA","0x2C","0xD7","0x2CD7D53E78",8192,4096,218,"512 KB","x8",1.0,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"8-bit/539-byte",2,5,"ONFI",TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,
+"Micron","MT29F16G08CBABA","0x2C","0x48","0x2C48044685",2048,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,,FALSE,,TRUE,TRUE,"returns 0x00 after first 5 read ID bytes"
+"Micron","MT29F16G08CBABB","0x2C","0x48","0x2C48044685",2048,4096,224,"1024 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"12-bit/540-byte",2,5,"ONFI",TRUE,FALSE,FALSE,,FALSE,,TRUE,TRUE,"returns 0x00 after first 5 read ID bytes"
 "Micron","MT29F8G08MAA","0x2C","0xD3","0x2CD394A564",1024,2048,64,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"4-bit/528-byte",2,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Micron","MT29F16G08QAA","0x2C","0xD3","0x2CD394A564",2048,2048,64,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"4-bit/528-byte",2,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "Micron","MT29F32G08TAA","0x2C","0xD5","0x2CD5D5A568",4096,2048,64,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"4-bit/528-byte",2,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"remains in Read ID mode"
 "ST","NAND04GR3B2D","0x20","0xAC","0x20AC101554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"ST","NAND08GR3B4C","0x20","0xAC","0x20AC101554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"ST","NAND08GR3B4C","0x20","0xAC","0x20AC101554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "ST","NAND04GW3B2D","0x20","0xDC","0x20DC109554",512,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"ST","NAND08GW3B4C","0x20","0xDC","0x20DC109554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
+"ST","NAND08GW3B4C","0x20","0xDC","0x20DC109554",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "ST","NAND04GR4B2D","0x20","0xBC","0x20BC105554",512,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "ST","NAND04GW4B2D","0x20","0xCC","0x20CC10D554",512,2048,64,"128 KB","x16",1.0,"1st page (1st word in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "ST","NAND08GR3B2C","0x20","0xA3","0x20A3511558",1024,2048,64,"128 KB","x8",1.0,"1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"22-bit/2048-bits",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
@@ -136,34 +136,34 @@
 "Numonyx","NAND08GW3F2B","0x20","0xD3","0x20D390152441",1024,2048,64,"128 KB","x8","N/A","1st page (1st or 6th byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,"1-bit/512-byte",1,6,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9K8G08U0B","0xEC","0xDC","0xECDC519558",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9WAG08U1B","0xEC","0xDC","0xECDC519558",2048,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/528-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Micron","MT29F16G08ABABA","0x2C","0x48","0x2C48002689",2048,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F16G08ABCBB","0x2C","0x48","0x2C48002689",2048,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F32G08AFABA","0x2C","0x48","0x2C48002689",4096,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F32G08AECBB","0x2C","0x48","0x2C48002689",4096,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F64G08AJABA","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F64G08AKABA","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F64G08AKCBB","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F64G08AMABA","0x2C","0x48","0x2C48002689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F64G08AMCBB","0x2C","0x48","0x2C48002689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F128G08AUABA","0x2C","0x68","0x2C6801A689",16384,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F128G08AUCBB","0x2C","0x68","0x2C6801A689",16384,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
-"Micron","MT29F32G08CBACA","0x2C","0x68","0x2C68044AA9",4096,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F64G08CEACA","0x2C","0x68","0x2C68044AA9",8192,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F64G08CECCB","0x2C","0x68","0x2C68044AA9",8192,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F64G08CFACA","0x2C","0x68","0x2C68044AA9",8192,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F128G08CXACA","0x2C","0x68","0x2C68044AA9",16384,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F64G08CBAAA","0x2C","0x88","0x2C88044BA9",8192,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F64G08CBCAB","0x2C","0x88","0x2C88044BA9",8192,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F128G08CEAAA","0x2C","0x88","0x2C88044BA9",16384,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F128G08CFAAA","0x2C","0x88","0x2C88044BA9",16384,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F128G08CECAB","0x2C","0x88","0x2C88044BA9",16384,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F256G08CJAAA","0x2C","0xA8","0x2CA805CBA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F256G08CKAAA","0x2C","0xA8","0x2CA805CBA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F256G08CKCAB","0x2C","0xA8","0x2CA805CBA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F256G08CMAAA","0x2C","0x88","0x2C88044BA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F256G08CMCAB","0x2C","0x88","0x2C88044BA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F512G08CUAAA","0x2C","0xA8","0x2CA805CBA9",65536,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
-"Micron","MT29F512G08CUCAB","0x2C","0xA8","0x2CA805CBA9",65536,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI-Only",FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F16G08ABABA","0x2C","0x48","0x2C48002689",2048,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F16G08ABCBB","0x2C","0x48","0x2C48002689",2048,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F32G08AFABA","0x2C","0x48","0x2C48002689",4096,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F32G08AECBB","0x2C","0x48","0x2C48002689",4096,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F64G08AJABA","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F64G08AKABA","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F64G08AKCBB","0x2C","0x68","0x2C6801A689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F64G08AMABA","0x2C","0x48","0x2C48002689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F64G08AMCBB","0x2C","0x48","0x2C48002689",8192,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F128G08AUABA","0x2C","0x68","0x2C6801A689",16384,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F128G08AUCBB","0x2C","0x68","0x2C6801A689",16384,4096,224,"512 KB","x8",2.1,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"4-bit/540-byte",1,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,TRUE,"Read ID produces 00h after byte 5"
+"Micron","MT29F32G08CBACA","0x2C","0x68","0x2C68044AA9",4096,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F64G08CEACA","0x2C","0x68","0x2C68044AA9",8192,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F64G08CECCB","0x2C","0x68","0x2C68044AA9",8192,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F64G08CFACA","0x2C","0x68","0x2C68044AA9",8192,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F128G08CXACA","0x2C","0x68","0x2C68044AA9",16384,4096,224,"1024 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F64G08CBAAA","0x2C","0x88","0x2C88044BA9",8192,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F64G08CBCAB","0x2C","0x88","0x2C88044BA9",8192,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F128G08CEAAA","0x2C","0x88","0x2C88044BA9",16384,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F128G08CFAAA","0x2C","0x88","0x2C88044BA9",16384,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F128G08CECAB","0x2C","0x88","0x2C88044BA9",16384,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F256G08CJAAA","0x2C","0xA8","0x2CA805CBA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F256G08CKAAA","0x2C","0xA8","0x2CA805CBA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F256G08CKCAB","0x2C","0xA8","0x2CA805CBA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F256G08CMAAA","0x2C","0x88","0x2C88044BA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F256G08CMCAB","0x2C","0x88","0x2C88044BA9",32768,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F512G08CUAAA","0x2C","0xA8","0x2CA805CBA9",65536,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
+"Micron","MT29F512G08CUCAB","0x2C","0xA8","0x2CA805CBA9",65536,8192,448,"2048 KB","x8",2.2,"1st page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,FALSE,"24-bit/1080-byte",2,5,"ONFI",TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE,
 "Samsung","K9LBG08U0M","0xEC","0xD7","0xECD755B678",4096,4096,128,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9HCG08U1M","0xEC","0xD7","0xECD755B678",8192,4096,128,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 2 K9LBG08U0M"
 "Samsung","K9MDG08U5M","0xEC","0xD7","0xECD755B678",16384,4096,128,"512 KB","x8","N/A","Last page (1st byte in OOB = non FFh)",FALSE,TRUE,TRUE,FALSE,"4-bit/512-byte",2,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 4 K9LBG08U0M"
-- 
1.7.0.4
