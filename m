Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9Adt-0001Xp-12
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2013 09:11:54 +0000
From: Huang Shijie <b32955@freescale.com>
To: <computersforpeace@gmail.com>
Subject: [mtd-www: ] nand-data: add four Toshiba nand chips
Date: Tue, 13 Aug 2013 17:09:24 +0800
Message-ID: <1376384964-740-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the items for four Toshiba nand chips.
All the four nand chips are supported by the kernel now.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 nand-data/nanddata.csv |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/nand-data/nanddata.csv b/nand-data/nanddata.csv
index 20a6f86..408f0df 100644
--- a/nand-data/nanddata.csv
+++ b/nand-data/nanddata.csv
@@ -192,6 +192,10 @@
 "Toshiba","TC58NVG0S3E","0x98","0xD1","0x98D1...",128,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table"
 "Toshiba","TC58NVG1S3E","0x98","0xDA","0x98DA...",256,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table"
 "Toshiba","TC58NVG2S3E","0x98","0xDC","0x98DC...",512,2048,64,"128 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"1-bit/512-byte","1?",5,"Extended ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table"
+"Toshiba","TC58NVG2S0F","0x98","0xDC","0x98dc902676150108",512,4096,224,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"4-bit/512-byte","1",8,"Full ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table, get the full ID by testing"
+"Toshiba","TC58NVG3S0F","0x98","0xD3","0x98d3902676150208",1024,4096,232,"256 KB","x8","N/A","1st or 2nd page (1st byte in OOB = non FFh)",TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,"4-bit/512-byte","1",8,"Full ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table, get the full ID by testing"
+"Toshiba","TC58NVG5D2","0x98","0xD7","0x98d7943276560900",4096,8192,640,"1 MB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"40-bit/1024-byte","2",8,"Full ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table, get the full ID by testing"
+"Toshiba","TC58NVG6D2","0x98","0xDE","0x98de948276560420",8192,8192,640,"2 MB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"40-bit/1024-byte","2",8,"Full ID decode",TRUE,FALSE,TRUE,TRUE,TRUE,,TRUE,TRUE,TRUE,1,1,1,"Single",,"Datasheet doesn't list full ID, only shows ID decoder table, get the full ID by testing"
 "Hynix","H27UAG8T2M","0xAD","0xD5","0xADD514B644",2048,4096,128,"512 KB","x8","N/A","Last or (last-2)th page (1st byte in OOB = non FFh)",FALSE,FALSE,TRUE,TRUE,TRUE,FALSE,"4-bit/528-byte",2,5,"Extended ID decode",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,1,1,1,"Single",,
 "Samsung","K9GAG08U0E","0xEC","0xD5","0xECD584725042",2048,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1078.5-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,1,1,1,"Single",,"Weird 1st AND last page scan?"
 "Samsung","K9LBG08U0E","0xEC","0xD7","0xECD7C5725442",4096,8192,436,"1024 KB","x8","N/A","1st or last page (1st byte in OOB = non FFh)",TRUE,FALSE,TRUE,FALSE,TRUE,FALSE,"24-bit/1078.5-byte",2,6,"Extended ID decode (Samsung)",FALSE,FALSE,FALSE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,1,2,1,"Single","K9GAG08U0E","Weird 1st AND last page scan?"
-- 
1.7.3.2
