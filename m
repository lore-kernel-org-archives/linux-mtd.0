Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEMUT-0000nt-5W
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2015 19:32:58 +0000
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
Subject: [PATCH v4 5/5] mtd: nand: jz4740: remove custom 'erased check'
 implementation
Date: Wed, 30 Dec 2015 20:32:07 +0100
Message-Id: <1451503927-10831-6-git-send-email-boris.brezillon@free-electrons.com>
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

The jz4740 drivers is manually checking for 'erased pages' while
correcting ECC bytes.
This logic can now done by the core infrastructure, and can thus be removed
from this drivers.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/jz4740_nand.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
index adccae3..f934060 100644
--- a/drivers/mtd/nand/jz4740_nand.c
+++ b/drivers/mtd/nand/jz4740_nand.c
@@ -224,24 +224,6 @@ static int jz_nand_correct_ecc_rs(struct mtd_info *mtd, uint8_t *dat,
 	uint32_t t;
 	unsigned int timeout = 1000;
 
-	t = read_ecc[0];
-
-	if (t == 0xff) {
-		for (i = 1; i < 9; ++i)
-			t &= read_ecc[i];
-
-		t &= dat[0];
-		t &= dat[nand->chip.ecc.size / 2];
-		t &= dat[nand->chip.ecc.size - 1];
-
-		if (t == 0xff) {
-			for (i = 1; i < nand->chip.ecc.size - 1; ++i)
-				t &= dat[i];
-			if (t == 0xff)
-				return 0;
-		}
-	}
-
 	for (i = 0; i < 9; ++i)
 		writeb(read_ecc[i], nand->base + JZ_REG_NAND_PAR0 + i);
 
-- 
2.1.4
