Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xvn5C-0003QB-Ku
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 13:01:35 +0000
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
To: Andrew Bresticker <abrestic@chromium.org>, Ionela Voinescu
 <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>, Brian
 Norris <computersforpeace@gmail.com>, <bpqw@micron.com>,
 <arnaud.mouiche@invoxia.com>, <frankliu@micron.com>
Subject: [PATCH 3/6] mtd: nand: Allow to set a per-device ECC layout
Date: Tue, 2 Dec 2014 09:58:53 -0300
Message-ID: <1417525136-25731-4-git-send-email-ezequiel.garcia@imgtec.com>
In-Reply-To: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Ezequiel Garcia <ezequiel.garcia@imgtec.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Until now, the ECC was handled either by Linux (i.e. software ECC) or by the
NAND controller (i.e. hardware ECC). In each of these, the ECC layout is
defined by the controller of the NAND device, not by the NAND device itself.

However, devices with on-die ECC support have their own ECC layout so we need
a way to specify a per-device ECC layout.

This commit adds a new field to the nand_flash_dev structure, to allow devices
to specify its own ECC layout.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/mtd/nand/nand_base.c | 1 +
 include/linux/mtd/nand.h     | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index a4c9cee..10f5ac9 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3595,6 +3595,7 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		chip->options |= type->options;
 		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
 		chip->ecc_step_ds = NAND_ECC_STEP(type);
+		chip->ecc.layout = type->ecc.layout;
 		chip->onfi_timing_mode_default =
 					type->onfi_timing_mode_default;
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index a36fff1..a36d628 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -780,6 +780,7 @@ struct nand_chip {
  *               @ecc_step_ds in nand_chip{}, also from the datasheet.
  *               For example, the "4bit ECC for each 512Byte" can be set with
  *               NAND_ECC_INFO(4, 512).
+ * @ecc.layout: If the device has on-die ECC, it can provide its own ECC layout.
  * @onfi_timing_mode_default: the default ONFI timing mode entered after a NAND
  *			      reset. Should be deduced from timings described
  *			      in the datasheet.
@@ -803,6 +804,7 @@ struct nand_flash_dev {
 	struct {
 		uint16_t strength_ds;
 		uint16_t step_ds;
+		struct nand_ecclayout *layout;
 	} ecc;
 	int onfi_timing_mode_default;
 };
-- 
2.1.0
