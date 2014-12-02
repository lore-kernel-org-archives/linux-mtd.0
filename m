Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xvn4p-0003Jf-Gq
 for linux-mtd@lists.infradead.org; Tue, 02 Dec 2014 13:01:15 +0000
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
To: Andrew Bresticker <abrestic@chromium.org>, Ionela Voinescu
 <ionela.voinescu@imgtec.com>, James Hartley <james.hartley@imgtec.com>,
 "Brian Norris" <computersforpeace@gmail.com>, <bpqw@micron.com>,
 <arnaud.mouiche@invoxia.com>, <frankliu@micron.com>
Subject: [PATCH 1/6] mtd: nand: Check length of ID before reading bits per cell
Date: Tue, 2 Dec 2014 09:58:51 -0300
Message-ID: <1417525136-25731-2-git-send-email-ezequiel.garcia@imgtec.com>
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

The table-based NAND identification currently reads the number
of bits per cell from the 3rd byte of the extended ID. This is done
for the so-called 'full ID' devices; i.e. devices that have a known
length ID.

However, if the ID length is shorter than three, there's no 3rd byte,
and so it's wrong to read the bits per cell from there. Fix this by
adding a check for the ID length.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
---
 drivers/mtd/nand/nand_base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5b5c627..a4c9cee 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3589,7 +3589,8 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->erasesize = type->erasesize;
 		mtd->oobsize = type->oobsize;
 
-		chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
+		if (type->id_len > 2)
+			chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 		chip->chipsize = (uint64_t)type->chipsize << 20;
 		chip->options |= type->options;
 		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
-- 
2.1.0
