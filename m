Received: from dns-bn1lp0143.outbound.protection.outlook.com ([207.46.163.143]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvVYo-0001xk-W8
 for linux-mtd@lists.infradead.org; Fri, 13 Jun 2014 17:46:43 +0000
From: Graham Moore <grmoore@altera.com>
To: <ggrahammoore@gmail.com>
Subject: [PATCH] In the Denali NAND controller driver,
 use 8 bytes for READID command.
Date: Fri, 13 Jun 2014 12:46:05 -0500
Message-ID: <1402681565-7826-1-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Graham Moore <grmoore@altera.com>, linux-kernel@vger.kernel.org,
 Yves Vandervennet <rocket.yvanderv@gmail.com>, linux-mtd@lists.infradead.org,
 Alan Tull <atull@altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The Denali NAND driver reads only 5 bytes of ID, but some Hynix and Samsung
have size parameters in the 6th byte.  As a result, the page and oob size
for a Hynix H27UAG8T2B were calculated incorrectly and the driver failed to
load.

The solution is to read 8 bytes of ID, as expected by the nand framework.

Signed-off-by: Graham Moore <grmoore@altera.com>
---
 drivers/mtd/nand/denali.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 9f2012a..7276125 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -488,7 +488,7 @@ static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 	addr = (uint32_t)MODE_11 | BANK(denali->flash_bank);
 	index_addr(denali, (uint32_t)addr | 0, 0x90);
 	index_addr(denali, (uint32_t)addr | 1, 0);
-	for (i = 0; i < 5; i++)
+	for (i = 0; i < 8; i++)
 		index_addr_read_data(denali, addr | 2, &id_bytes[i]);
 	maf_id = id_bytes[0];
 	device_id = id_bytes[1];
@@ -1276,7 +1276,7 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
 		addr = (uint32_t)MODE_11 | BANK(denali->flash_bank);
 		index_addr(denali, (uint32_t)addr | 0, 0x90);
 		index_addr(denali, (uint32_t)addr | 1, 0);
-		for (i = 0; i < 5; i++) {
+		for (i = 0; i < 8; i++) {
 			index_addr_read_data(denali,
 						(uint32_t)addr | 2,
 						&id);
-- 
1.7.10.4
