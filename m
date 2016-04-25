Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1audKr-0004jN-2M
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 10:01:46 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] mtd: nand: add a pairing field to nand_flash_dev
Date: Mon, 25 Apr 2016 12:01:20 +0200
Message-Id: <1461578481-26567-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1461578481-26567-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new field to attach a pairing scheme to a NAND chip definition, and
assign it to mtd->pairing when a full-id match is detected.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 1 +
 include/linux/mtd/nand.h     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a64e0d5..0666b59 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3791,6 +3791,7 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->writesize = type->pagesize;
 		mtd->erasesize = type->erasesize;
 		mtd->oobsize = type->oobsize;
+		mtd->pairing = type->pairing;
 
 		chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 		chip->chipsize = (uint64_t)type->chipsize << 20;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 874b267..685b26e 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -855,6 +855,7 @@ static inline void nand_set_controller_data(struct nand_chip *chip, void *priv)
  * @onfi_timing_mode_default: the default ONFI timing mode entered after a NAND
  *			      reset. Should be deduced from timings described
  *			      in the datasheet.
+ * @pairing: The page pairing scheme used by this NAND, if any.
  *
  */
 struct nand_flash_dev {
@@ -877,6 +878,7 @@ struct nand_flash_dev {
 		uint16_t step_ds;
 	} ecc;
 	int onfi_timing_mode_default;
+	const struct mtd_pairing_scheme *pairing;
 };
 
 /**
-- 
2.7.4
