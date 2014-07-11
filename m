Received: from smtp.mei.co.jp ([133.183.100.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X5QN3-0002bO-5o
 for linux-mtd@lists.infradead.org; Fri, 11 Jul 2014 02:15:33 +0000
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: denali: avoid using a magic number
Date: Fri, 11 Jul 2014 11:14:05 +0900
Message-Id: <1405044846-21447-1-git-send-email-yamada.m@jp.panasonic.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Josh Triplett <josh@joshtriplett.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Masahiro Yamada <yamada.m@jp.panasonic.com>,
 Rashika Kheria <rashika.kheria@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MAP10 command with '0x2000' data sets up a read-ahead/write access.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 drivers/mtd/nand/denali.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 9f2012a..7c1c1ab 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -74,6 +74,7 @@ MODULE_PARM_DESC(onfi_timing_mode, "Overrides default ONFI setting."
 #define SPARE_ACCESS		0x41
 #define MAIN_ACCESS		0x42
 #define MAIN_SPARE_ACCESS	0x43
+#define PIPELINE_ACCESS		0x2000
 
 #define DENALI_READ	0
 #define DENALI_WRITE	0x100
@@ -765,7 +766,7 @@ static int denali_send_pipeline_cmd(struct denali_nand_info *denali,
 			iowrite32(cmd, denali->flash_mem);
 		} else {
 			index_addr(denali, (uint32_t)cmd,
-					0x2000 | op | page_count);
+					PIPELINE_ACCESS | op | page_count);
 
 			/* wait for command to be accepted
 			 * can always use status0 bit as the
-- 
1.9.1
