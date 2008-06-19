Received: from nwd2mail10.analog.com ([137.71.25.55])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K9HDo-0001fb-At
	for linux-mtd@lists.infradead.org; Thu, 19 Jun 2008 10:18:28 +0000
From: Bryan Wu <cooloney@kernel.org>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] [MTD] Blackfin NFC Driver: fix bug - hw ecc calc by
	making sure we extract 11 bits from each register instead of 10
Date: Thu, 19 Jun 2008 18:18:29 +0800
Message-Id: <1213870709-17356-3-git-send-email-cooloney@kernel.org>
In-Reply-To: <1213870709-17356-1-git-send-email-cooloney@kernel.org>
References: <1213870709-17356-1-git-send-email-cooloney@kernel.org>
Cc: Bryan Wu <cooloney@kernel.org>, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Mike Frysinger <vapier.adi@gmail.com>

Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
Signed-off-by: Bryan Wu <cooloney@kernel.org>
---
 drivers/mtd/nand/bf5xx_nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 3254348..fc58afe 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -298,7 +298,7 @@ static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 	ecc0 = bfin_read_NFC_ECC0();
 	ecc1 = bfin_read_NFC_ECC1();
 
-	code[0] = (ecc0 & 0x3FF) | ((ecc1 & 0x3FF) << 11);
+	code[0] = (ecc0 & 0x7ff) | ((ecc1 & 0x7ff) << 11);
 
 	dev_dbg(info->device, "returning ecc 0x%08x\n", code[0]);
 
@@ -310,7 +310,7 @@ static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 	if (page_size == 512) {
 		ecc0 = bfin_read_NFC_ECC2();
 		ecc1 = bfin_read_NFC_ECC3();
-		code[1] = (ecc0 & 0x3FF) | ((ecc1 & 0x3FF) << 11);
+		code[1] = (ecc0 & 0x7ff) | ((ecc1 & 0x7ff) << 11);
 
 		/* second 3 bytes in ecc_code for second 256
 		 * bytes of 512 page size
-- 
1.5.6
