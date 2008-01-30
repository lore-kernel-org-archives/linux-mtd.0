Received: from nwd2mail11.analog.com ([137.71.25.57])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JK9Ig-0008Bq-Bs
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 09:32:17 +0000
From: Bryan Wu <bryan.wu@analog.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] [MTD/NAND] Blackfin NFC driver: fix ECC caculating bug
	when NAND Flash chip page size is 512 bytes
Date: Wed, 30 Jan 2008 17:18:18 +0800
Message-Id: <1201684698-26936-4-git-send-email-bryan.wu@analog.com>
In-Reply-To: <1201684698-26936-1-git-send-email-bryan.wu@analog.com>
References: <1201684698-26936-1-git-send-email-bryan.wu@analog.com>
Cc: Bryan Wu <bryan.wu@analog.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Bryan Wu <bryan.wu@analog.com>
---
 drivers/mtd/nand/bf5xx_nand.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index 2fe9678..7d6ac6a 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -293,7 +293,6 @@ static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 	u16 ecc0, ecc1;
 	u32 code[2];
 	u8 *p;
-	int bytes = 3, i;
 
 	/* first 4 bytes ECC code for 256 page size */
 	ecc0 = bfin_read_NFC_ECC0();
@@ -303,19 +302,24 @@ static int bf5xx_nand_calculate_ecc(struct mtd_info *mtd,
 
 	dev_dbg(info->device, "returning ecc 0x%08x\n", code[0]);
 
+	/* first 3 bytes in ecc_code for 256 page size */
+	p = (u8 *) code;
+	memcpy(ecc_code, p, 3);
+
 	/* second 4 bytes ECC code for 512 page size */
 	if (page_size == 512) {
 		ecc0 = bfin_read_NFC_ECC2();
 		ecc1 = bfin_read_NFC_ECC3();
 		code[1] = (ecc0 & 0x3FF) | ((ecc1 & 0x3FF) << 11);
-		bytes = 6;
+
+		/* second 3 bytes in ecc_code for second 256
+		 * bytes of 512 page size
+		 */
+		p = (u8 *) (code + 1);
+		memcpy((ecc_code + 3), p, 3);
 		dev_dbg(info->device, "returning ecc 0x%08x\n", code[1]);
 	}
 
-	p = (u8 *)code;
-	for (i = 0; i < bytes; i++)
-		ecc_code[i] = p[i];
-
 	return 0;
 }
 
-- 
1.5.3.4
