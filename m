Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXOed-0007AZ-3m
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 10:55:45 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, stable@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Fix JEDEC detection
Date: Thu, 13 Dec 2018 11:55:26 +0100
Message-Id: <20181213105526.30871-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_jedec_detect() should return 1 when the PARAM page parsing
succeeds, otherwise the core considers JEDEC detection failed and falls
back to ID-based detection.

Fixes: 480139d9229e ("mtd: rawnand: get rid of the JEDEC parameter page in nand_chip")
Cc: <stable@vger.kernel.org>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/nand_jedec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_jedec.c b/drivers/mtd/nand/raw/nand_jedec.c
index 5c26492c841d..38b5dc22cb30 100644
--- a/drivers/mtd/nand/raw/nand_jedec.c
+++ b/drivers/mtd/nand/raw/nand_jedec.c
@@ -107,6 +107,8 @@ int nand_jedec_detect(struct nand_chip *chip)
 		pr_warn("Invalid codeword size\n");
 	}
 
+	ret = 1;
+
 free_jedec_param_page:
 	kfree(p);
 	return ret;
-- 
2.17.1
