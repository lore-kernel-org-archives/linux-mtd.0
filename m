Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KOHS3-0000mI-BN
	for linux-mtd@lists.infradead.org; Wed, 30 Jul 2008 19:35:11 +0000
Message-Id: <200807301935.m6UJZ0l4012288@imap1.linux-foundation.org>
Subject: [patch 06/13] Blackfin NFC Driver: fix bug - hw ecc calc by making
	sure we extract 11 bits from each register instead of 10
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Wed, 30 Jul 2008 12:35:00 -0700
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	cooloney@kernel.org, vapier.adi@gmail.com
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
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/bf5xx_nand.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -puN drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-fix-bug-hw-ecc-calc-by-making-sure-we-extract-11-bits-from-each-register-instead-of-10 drivers/mtd/nand/bf5xx_nand.c
--- a/drivers/mtd/nand/bf5xx_nand.c~blackfin-nfc-driver-fix-bug-hw-ecc-calc-by-making-sure-we-extract-11-bits-from-each-register-instead-of-10
+++ a/drivers/mtd/nand/bf5xx_nand.c
@@ -298,7 +298,7 @@ static int bf5xx_nand_calculate_ecc(stru
 	ecc0 = bfin_read_NFC_ECC0();
 	ecc1 = bfin_read_NFC_ECC1();
 
-	code[0] = (ecc0 & 0x3FF) | ((ecc1 & 0x3FF) << 11);
+	code[0] = (ecc0 & 0x7ff) | ((ecc1 & 0x7ff) << 11);
 
 	dev_dbg(info->device, "returning ecc 0x%08x\n", code[0]);
 
@@ -310,7 +310,7 @@ static int bf5xx_nand_calculate_ecc(stru
 	if (page_size == 512) {
 		ecc0 = bfin_read_NFC_ECC2();
 		ecc1 = bfin_read_NFC_ECC3();
-		code[1] = (ecc0 & 0x3FF) | ((ecc1 & 0x3FF) << 11);
+		code[1] = (ecc0 & 0x7ff) | ((ecc1 & 0x7ff) << 11);
 
 		/* second 3 bytes in ecc_code for second 256
 		 * bytes of 512 page size
_
