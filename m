Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY5Fk-0006rS-GP
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 08:24:53 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Subject: [PATCH v2 2/7] mtd: rawnand: sunxi: Use struct_size()
Date: Sat, 15 Dec 2018 09:24:32 +0100
Message-Id: <20181215082437.9175-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181215082437.9175-1-boris.brezillon@bootlin.com>
References: <20181215082437.9175-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use struct_size() to calculate sunxi_nand object size.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 9139fc003b1a..1453392a53e7 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1871,9 +1871,7 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
 		return -EINVAL;
 	}
 
-	sunxi_nand = devm_kzalloc(dev,
-				  sizeof(*sunxi_nand) +
-				  (nsels * sizeof(struct sunxi_nand_chip_sel)),
+	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
 				  GFP_KERNEL);
 	if (!sunxi_nand) {
 		dev_err(dev, "could not allocate chip\n");
-- 
2.17.1
