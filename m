Received: from mail-bl2on0098.outbound.protection.outlook.com ([65.55.169.98]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHYoC-0004fC-5v
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2015 14:46:17 +0000
From: Graham Moore <grmoore@opensource.altera.com>
To: <linux-mtd@lists.infradead.org>
CC: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, <linux-kernel@vger.kernel.org>, Alan Tull
 <atull@opensource.altera.com>, Dinh Nguyen <dinguyen@opensource.altera.com>,
 Yves Vandervennet <yvanderv@opensource.altera.com>, Graham Moore
 <grmoore@opensource.altera.com>
Subject: [PATCH] mtd: nand: denali: max_banks calculation changed in revision
 5.1
Date: Tue, 21 Jul 2015 09:39:31 -0500
Message-ID: <1437489571-916-1-git-send-email-grmoore@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Read Denali hardware revision number and use it to
calculate max_banks,  The encoding of max_banks changed
in Denali revision 5.1.

Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
---
 drivers/mtd/nand/denali.c |   11 ++++++++++-
 drivers/mtd/nand/denali.h |    2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 870c7fc..a98b41e 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -458,8 +458,17 @@ static void find_valid_banks(struct denali_nand_info *denali)
 static void detect_max_banks(struct denali_nand_info *denali)
 {
 	uint32_t features = ioread32(denali->flash_reg + FEATURES);
+	/*
+	 * Read the revision register, so we can calculate the max_banks
+	 * properly: the encoding changed from rev 5.0 to 5.1
+	 */
+	u32 revision = MAKE_COMPARABLE_REVISION(
+				ioread32(denali->flash_reg + REVISION));
 
-	denali->max_banks = 2 << (features & FEATURES__N_BANKS);
+	if (revision < REVISION_5_1)
+		denali->max_banks = 2 << (features & FEATURES__N_BANKS);
+	else
+		denali->max_banks = 1 << (features & FEATURES__N_BANKS);
 }
 
 static void detect_partition_feature(struct denali_nand_info *denali)
diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
index 145bf88..4bf13bb 100644
--- a/drivers/mtd/nand/denali.h
+++ b/drivers/mtd/nand/denali.h
@@ -178,6 +178,8 @@
 
 #define REVISION				0x370
 #define     REVISION__VALUE				0xffff
+#define MAKE_COMPARABLE_REVISION(x)		swab16(x & REVISION__VALUE)
+#define REVISION_5_1				0x00000501
 
 #define ONFI_DEVICE_FEATURES			0x380
 #define     ONFI_DEVICE_FEATURES__VALUE			0x003f
-- 
1.7.9.5
