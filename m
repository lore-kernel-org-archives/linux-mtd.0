Received: from mail-by2lp0236.outbound.protection.outlook.com
 ([207.46.163.236] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz9og-00087E-Gh
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 19:22:11 +0000
From: Graham Moore <grmoore@altera.com>
To: <ggrahammoore@gmail.com>
Subject: [PATCH V2] In the Denali NAND controller driver,
 use 8 bytes for READID command.
Date: Mon, 23 Jun 2014 14:21:10 -0500
Message-ID: <1403551270-31873-1-git-send-email-grmoore@altera.com>
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
--
V2: Increase size of id_bytes array to 8.
---
 drivers/mtd/nand/denali.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 9f2012a..0b071a3 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -473,7 +473,7 @@ static void detect_partition_feature(struct denali_nand_info *denali)
 static uint16_t denali_nand_timing_set(struct denali_nand_info *denali)
 {
 	uint16_t status = PASS;
-	uint32_t id_bytes[5], addr;
+	uint32_t id_bytes[8], addr;
 	uint8_t i, maf_id, device_id;
 
 	dev_dbg(denali->dev,
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
