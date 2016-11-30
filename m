Received: from skprod2.natinst.com ([130.164.80.23] helo=ni.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cC8D8-0006Wv-Bm
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2016 16:58:26 +0000
From: Zach Brown <zach.brown@ni.com>
To: <dwmw2@infradead.org>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <dedekind1@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 5/5] mtd: nand: set max_bb_per_die and blocks_per_die for
 ONFI compliant chips
Date: Wed, 30 Nov 2016 10:57:31 -0600
Message-ID: <1480525051-4991-6-git-send-email-zach.brown@ni.com>
In-Reply-To: <1480525051-4991-1-git-send-email-zach.brown@ni.com>
References: <1480525051-4991-1-git-send-email-zach.brown@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ONFI compliant chips contain the values for the max_bb_per_die and
blocks_per_die fields in the parameter page. When the ONFI paged is
retrieved/parsed the chip's fields are set by the corresponding fields
in the param page.

Signed-off-by: Zach Brown <zach.brown@ni.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>
Acked-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/nand_base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index b4a7c7f..623cdc5 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3601,6 +3601,9 @@ static int nand_flash_detect_onfi(struct mtd_info *mtd, struct nand_chip *chip,
 	chip->chipsize *= (uint64_t)mtd->erasesize * p->lun_count;
 	chip->bits_per_cell = p->bits_per_cell;
 
+	chip->max_bb_per_die = le16_to_cpu(p->bb_per_lun);
+	chip->blocks_per_die = le32_to_cpu(p->blocks_per_lun);
+
 	if (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS)
 		*busw = NAND_BUSWIDTH_16;
 	else
-- 
2.7.4
