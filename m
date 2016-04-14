Received: from m50-134.163.com ([123.125.50.134])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqXhA-0007G5-2t
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2016 03:11:53 +0000
From: zengzhaoxiu@163.com
To: linux-kernel@vger.kernel.org
Cc: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH V3 19/29] mtd: use parity16 in ssfdc
Date: Thu, 14 Apr 2016 11:10:51 +0800
Message-Id: <1460603451-5408-1-git-send-email-zengzhaoxiu@163.com>
In-Reply-To: <1460601525-3822-1-git-send-email-zengzhaoxiu@163.com>
References: <1460601525-3822-1-git-send-email-zengzhaoxiu@163.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>

The original get_parity return even parity of the input number. So
hweight of "block_address & 0x7ff" must be odd if block_address is valid.

This patch use parity16, and rearrange the code.

Signed-off-by: Zhaoxiu Zeng <zhaoxiu.zeng@gmail.com>
---
 drivers/mtd/ssfdc.c | 31 ++++++++-----------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/mtd/ssfdc.c b/drivers/mtd/ssfdc.c
index daf82ba..1d55f15 100644
--- a/drivers/mtd/ssfdc.c
+++ b/drivers/mtd/ssfdc.c
@@ -182,24 +182,10 @@ static int read_raw_oob(struct mtd_info *mtd, loff_t offs, uint8_t *buf)
 	return 0;
 }
 
-/* Parity calculator on a word of n bit size */
-static int get_parity(int number, int size)
-{
- 	int k;
-	int parity;
-
-	parity = 1;
-	for (k = 0; k < size; k++) {
-		parity += (number >> k);
-		parity &= 1;
-	}
-	return parity;
-}
-
 /* Read and validate the logical block address field stored in the OOB */
 static int get_logical_address(uint8_t *oob_buf)
 {
-	int block_address, parity;
+	int block_address;
 	int offset[2] = {6, 11}; /* offset of the 2 address fields within OOB */
 	int j;
 	int ok = 0;
@@ -215,18 +201,17 @@ static int get_logical_address(uint8_t *oob_buf)
 
 		/* Check for the signature bits in the address field (MSBits) */
 		if ((block_address & ~0x7FF) == 0x1000) {
-			parity = block_address & 0x01;
 			block_address &= 0x7FF;
-			block_address >>= 1;
 
-			if (get_parity(block_address, 10) != parity) {
-				pr_debug("SSFDC_RO: logical address field%d"
-					"parity error(0x%04X)\n", j+1,
-					block_address);
-			} else {
-				ok = 1;
+			ok = parity16(block_address);
+			if (ok) {
+				block_address >>= 1;
 				break;
 			}
+
+			pr_debug("SSFDC_RO: logical address field%d"
+				"parity error(0x%04X)\n", j+1,
+				block_address);
 		}
 	}
 
-- 
2.5.0
