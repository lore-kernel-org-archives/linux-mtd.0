Received: from mail.base45.de ([2001:67c:2050:310::a:2])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Swc-0005LA-4S
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 08:14:04 +0000
From: Alexander Couzens <lynxis@fe80.eu>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Alexander Couzens <lynxis@fe80.eu>
Subject: [PATCH 3/3][v3] mtd: nand: davinci: set ECC algorithm explicitly for
 HW based ECC
Date: Tue,  2 May 2017 10:13:23 +0200
Message-Id: <20170502081323.3138-4-lynxis@fe80.eu>
In-Reply-To: <20170502081323.3138-1-lynxis@fe80.eu>
References: <20170313074641.28b383e7@bbrezillon>
 <20170502081323.3138-1-lynxis@fe80.eu>
In-Reply-To: <20170313074641.28b383e7@bbrezillon>
References: <20170313074641.28b383e7@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Required to set the ooblayout based on the algorithm.

Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
---
 drivers/mtd/nand/davinci_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 27fa8b87cd5f..9e5167496ce1 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -760,11 +760,13 @@ static int nand_davinci_probe(struct platform_device *pdev)
 			info->chip.ecc.hwctl = nand_davinci_hwctl_4bit;
 			info->chip.ecc.bytes = 10;
 			info->chip.ecc.options = NAND_ECC_GENERIC_ERASED_CHECK;
-		} else {
+			info->chip.ecc.algo = NAND_ECC_BCH;
+		} else { /* 1bit ecc hamming */
 			info->chip.ecc.calculate = nand_davinci_calculate_1bit;
 			info->chip.ecc.correct = nand_davinci_correct_1bit;
 			info->chip.ecc.hwctl = nand_davinci_hwctl_1bit;
 			info->chip.ecc.bytes = 3;
+			info->chip.ecc.algo = NAND_ECC_HAMMING;
 		}
 		info->chip.ecc.size = 512;
 		info->chip.ecc.strength = pdata->ecc_bits;
-- 
2.12.2
