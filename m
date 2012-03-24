Received: from m50-133.163.com ([123.125.50.133])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SBObk-0007Qm-H1
 for linux-mtd@lists.infradead.org; Sat, 24 Mar 2012 10:54:05 +0000
Date: Sat, 24 Mar 2012 18:38:30 +0800
From: Zhaoxiu Zeng <zengzhaoxiu@163.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/nand/nand_ecc.c: replace bitsperbyte table by a simple
 operation
Message-ID: <20120324103830.GA17632@Fedora16>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Signed-off-by: Zhaoxiu Zeng <zengzhaoxiu@163.com>

---
 drivers/mtd/nand/nand_ecc.c |   50 +++++++++---------------------------------
 1 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/mtd/nand/nand_ecc.c b/drivers/mtd/nand/nand_ecc.c
index b7cfe0d..e05a0fd 100644
--- a/drivers/mtd/nand/nand_ecc.c
+++ b/drivers/mtd/nand/nand_ecc.c
@@ -85,30 +85,6 @@ static const char invparity[256] = {
 };
 
 /*
- * bitsperbyte contains the number of bits per byte
- * this is only used for testing and repairing parity
- * (a precalculated value slightly improves performance)
- */
-static const char bitsperbyte[256] = {
-	0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
-	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
-	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
-	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
-	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
-	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
-	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
-	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
-	1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
-	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
-	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
-	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
-	2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
-	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
-	3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
-	4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8,
-};
-
-/*
  * addressbits is a lookup table to filter out the bits from the xor-ed
  * ECC data that identify the faulty location.
  * this is only used for repairing parity
@@ -448,12 +424,14 @@ int __nand_correct_data(unsigned char *buf,
 	unsigned int byte_addr;
 	/* 256 or 512 bytes/ecc  */
 	const uint32_t eccsize_mult = eccsize >> 8;
+	const uint32_t check_mask = eccsize_mult == 2 ? 0x555555 : 0x545555;
+	uint32_t tmp;
 
 	/*
 	 * b0 to b2 indicate which bit is faulty (if any)
 	 * we might need the xor result  more than once,
 	 * so keep them in a local var
-	*/
+	 */
 #ifdef CONFIG_MTD_NAND_ECC_SMC
 	b0 = read_ecc[0] ^ calc_ecc[0];
 	b1 = read_ecc[1] ^ calc_ecc[1];
@@ -467,14 +445,11 @@ int __nand_correct_data(unsigned char *buf,
 
 	/* repeated if statements are slightly more efficient than switch ... */
 	/* ordered in order of likelihood */
-
-	if ((b0 | b1 | b2) == 0)
+	tmp = ((uint32_t)b2 << 16) | ((uint32_t)b1 << 8) | b0;
+	if (tmp == 0)
 		return 0;	/* no error */
 
-	if ((((b0 ^ (b0 >> 1)) & 0x55) == 0x55) &&
-	    (((b1 ^ (b1 >> 1)) & 0x55) == 0x55) &&
-	    ((eccsize_mult == 1 && ((b2 ^ (b2 >> 1)) & 0x54) == 0x54) ||
-	     (eccsize_mult == 2 && ((b2 ^ (b2 >> 1)) & 0x55) == 0x55))) {
+	if (((tmp ^ (tmp >> 1)) & check_mask) == check_mask) {
 	/* single bit error */
 		/*
 		 * rp17/rp15/13/11/9/7/5/3/1 indicate which byte is the faulty
@@ -492,19 +467,16 @@ int __nand_correct_data(unsigned char *buf,
 		 * We could also do addressbits[b2] >> 1 but for the
 		 * performance it does not make any difference
 		 */
-		if (eccsize_mult == 1)
-			byte_addr = (addressbits[b1] << 4) + addressbits[b0];
-		else
-			byte_addr = (addressbits[b2 & 0x3] << 8) +
-				    (addressbits[b1] << 4) + addressbits[b0];
+		byte_addr = (addressbits[b1] << 4) + addressbits[b0];
+		if (eccsize_mult == 2)
+			byte_addr += (addressbits[b2 & 0x3] << 8);
 		bit_addr = addressbits[b2 >> 2];
 		/* flip the bit */
 		buf[byte_addr] ^= (1 << bit_addr);
 		return 1;
-
 	}
-	/* count nr of bits; use table lookup, faster than calculating it */
-	if ((bitsperbyte[b0] + bitsperbyte[b1] + bitsperbyte[b2]) == 1)
+
+	if (!(tmp & (tmp - 1)))
 		return 1;	/* error in ECC data; no action needed */
 
 	printk(KERN_ERR "uncorrectable error : ");
-- 
1.7.7.6
