Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bEzbD-0006HX-EM
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 13:50:47 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "George Spelvin" <linux@sciencehorizons.net>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] mtd: nand: add a pairing field to nand_flash_dev
Date: Mon, 20 Jun 2016 15:50:18 +0200
Message-Id: <1466430618-9713-4-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1466430618-9713-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add a new field to attach a pairing scheme to a NAND chip definition
and assign it to mtd->pairing when a full-id match is detected.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 1 +
 include/linux/mtd/nand.h     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index dc30e3c5c032..920b0b31ff71 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3791,6 +3791,7 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->writesize = type->pagesize;
 		mtd->erasesize = type->erasesize;
 		mtd->oobsize = type->oobsize;
+		mtd_set_pairing_scheme(mtd, type->pairing);
 
 		chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 		chip->chipsize = (uint64_t)type->chipsize << 20;
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 874b2671af90..685b26efcf82 100644
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
