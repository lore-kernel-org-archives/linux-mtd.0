Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QjIzG-0000ug-Fj
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2011 22:42:00 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 05/10] nand-data: edit "note" text
Date: Tue, 19 Jul 2011 15:40:42 -0700
Message-ID: <1311115247-20636-5-git-send-email-computersforpeace@gmail.com>
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

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nand-data/nanddata.csv |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index c7539ac..ce953a8 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -1,7 +1,7 @@
 "Manufacturer","Part #","Man. ID","ID Code","Full ID","MB","Page","OOB","Block","Bus","ONFI","Bad Block Location","Scan Page 2","Scan last page","Scan byte 1","Scan byte 6","ECC Req.","Bits per cell","ID Length","Detection Method","Full Support","All but Size","Correct Size","Correct Page","Correct OOB","Correct Block","Correct Busw","Correct BBM","Notes"
-"Toshiba","TC58128AFT","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","All OOB bytes",TRUE,TRUE,TRUE,TRUE,"?","1?",2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"For BBM, entire OOB is written non-FFh (only check 1st page, 1st byte?)"
+"Toshiba","TC58128AFT","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","All OOB bytes",TRUE,TRUE,TRUE,TRUE,"?","1?",2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"For BBM, OOB is written non-FFh (only check 1st page, 1st byte?)"
 "Samsung","K9F1G08U0B","0xEC","0xF1","0xECF1009540",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Toshiba","TC58DVM72A1TG00","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","All OOB bytes",TRUE,TRUE,TRUE,TRUE,"?","1?",2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"For BBM, entire OOB is written non-FFh (only check 1st page, 1st byte?)"
+"Toshiba","TC58DVM72A1TG00","0x98","0x73","0x9873",16,512,16,"16 KB","x8","N/A","All OOB bytes",TRUE,TRUE,TRUE,TRUE,"?","1?",2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,"For BBM, OOB is written non-FFh (only check 1st page, 1st byte?)"
 "Samsung","K9F5608D0C","0xEC","0x75","0xEC75",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"? (1-bit correct, 2-bit detect)",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9F5608Q0C","0xEC","0x35","0xEC35",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"? (1-bit correct, 2-bit detect)",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9F5608U0C","0xEC","0x75","0xEC75",32,512,16,"16 KB","x8","N/A","1st or 2nd page (6th byte in OOB = non FFh)",TRUE,FALSE,FALSE,TRUE,"? (1-bit correct, 2-bit detect)",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
@@ -9,7 +9,7 @@
 "Samsung","K9F5616Q0C","0xEC","0x45","0xEC45",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"? (1-bit correct, 2-bit detect)",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9F5616U0C","0xEC","0x55","0xEC55",32,512,16,"16 KB","x16","N/A","1st or 2nd page (1st word in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"? (1-bit correct, 2-bit detect)",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9F4G08U0A","0xEC","0xDC","0xECDC109554",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-"Samsung","K9K8G08U1A","0xEC","0xDC","0xECDC109554",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Made of two K9F4G08U0As"
+"Samsung","K9K8G08U1A","0xEC","0xDC","0xECDC109554",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,"Contains 2 K9F4G08U0A"
 "Samsung","K9F4G08U0M","0xEC","0xDC","0xECDC109554",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "Samsung","K9K8G08U1M","0xEC","0xDC","0xECDC109554",1024,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,"1-bit/512-byte",1,5,"Extended ID decode",FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,
 "ST","NAND128W3A","0x20","0x73","0x2073",16,512,16,"16 KB","x8","N/A","1st page (6th byte in OOB = non FFh)",FALSE,FALSE,FALSE,TRUE,"22-bit/2048-bits",1,2,"ID Table",TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,
-- 
1.7.0.4
