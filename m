Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV9FU-000608-S8
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 05:32:18 +0000
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: miquel.raynal@bootlin.com, boris.brezillon@bootlin.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>
Subject: [RFC PATCH v2 5/6] mtd: rawnand: micron: add ONFI_FEATURE_ON_DIE_ECC
 to supported features
Date: Tue, 19 Jun 2018 17:31:24 +1200
Message-Id: <20180619053125.16792-6-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
References: <20180619053125.16792-1-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add ONFI_FEATURE_ON_DIE_ECC to the set/get features list for Micron
NAND flash.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- New

 drivers/mtd/nand/raw/nand_micron.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index e582c9e61715..d1e8f57544a0 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -66,7 +66,9 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
 
 	if (p->supports_set_get_features) {
 		set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->set_feature_list);
+		set_bit(ONFI_FEATURE_ON_DIE_ECC, p->set_feature_list);
 		set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->get_feature_list);
+		set_bit(ONFI_FEATURE_ON_DIE_ECC, p->get_feature_list);
 	}
 
 	return 0;
-- 
2.17.1
