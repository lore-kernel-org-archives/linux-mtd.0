Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEMU7-0000mK-Pa
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 19:32:36 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: "Franklin S Cooper Jr." <fcooper@ti.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 3/5] mtd: nand: davinci: remove custom 'erased check'
 implementation
Date: Wed, 30 Dec 2015 20:32:05 +0100
Message-Id: <1451503927-10831-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The davinci drivers is manually checking for 'erased pages' while
correcting ECC bytes.
This logic can now done by the core infrastructure, and can thus be removed
from this drivers.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/davinci_nand.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index ddb73c3..8cb821b 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -317,14 +317,6 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
 	unsigned num_errors, corrected;
 	unsigned long timeo;
 
-	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
-	for (i = 0; i < 10; i++) {
-		if (ecc_code[i] != 0xff)
-			goto compare;
-	}
-	return 0;
-
-compare:
 	/* Unpack ten bytes into eight 10 bit values.  We know we're
 	 * little-endian, and use type punning for less shifting/masking.
 	 */
@@ -749,6 +741,7 @@ static int nand_davinci_probe(struct platform_device *pdev)
 			info->chip.ecc.correct = nand_davinci_correct_4bit;
 			info->chip.ecc.hwctl = nand_davinci_hwctl_4bit;
 			info->chip.ecc.bytes = 10;
+			info->chip.ecc.options = NAND_ECC_GENERIC_ERASED_CHECK;
 		} else {
 			info->chip.ecc.calculate = nand_davinci_calculate_1bit;
 			info->chip.ecc.correct = nand_davinci_correct_1bit;
-- 
2.1.4
