Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1edvaK-0007A6-Qu
 for linux-mtd@lists.infradead.org; Tue, 23 Jan 2018 10:13:46 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH] mtd: nand: gpmi: Fix subpage reads
Date: Tue, 23 Jan 2018 11:13:17 +0100
Message-Id: <20180123101317.15925-1-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 25f815f66a14 ("mtd: nand: force drivers to explicitly send
READ/PROG commands") added a call to nand_read_page_op() in
gpmi_ecc_read_page(), which means this function now sends a READ0
command and place the data pointer at the beginning of the page. This
logic is breaking gpmi_ecc_read_subpage() which was calling
gpmi_ecc_read_page() and expected it to only retrieve the data without
sending the READ0 command.

Create a gpmi_ecc_read_page_data() helper which only does the data
retrieval and ECC correction steps and implement gpmi_ecc_read_page()
as a wrapper that calls nand_read_page_op()+gpmi_ecc_read_page_data().

This way, gpmi_ecc_read_subpage() can call gpmi_ecc_read_page_data()
which restores the logic we had before commit 25f815f66a14 ("mtd: nand:
force drivers to explicitly send READ/PROG commands").

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 3198f5f79a82..93f212457d4d 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1029,11 +1029,13 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
 }
 
-static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
-				uint8_t *buf, int oob_required, int page)
+static int gpmi_ecc_read_page_data(struct nand_chip *chip,
+				   uint8_t *buf, int oob_required,
+				   int page)
 {
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
+	struct mtd_info *mtd = nand_to_mtd(chip);
 	void          *payload_virt;
 	dma_addr_t    payload_phys;
 	void          *auxiliary_virt;
@@ -1043,8 +1045,6 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	unsigned int  max_bitflips = 0;
 	int           ret;
 
-	nand_read_page_op(chip, page, 0, NULL, 0);
-
 	dev_dbg(this->dev, "page number is : %d\n", page);
 	ret = read_page_prepare(this, buf, nfc_geo->payload_size,
 					this->payload_virt, this->payload_phys,
@@ -1178,6 +1178,14 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 	return max_bitflips;
 }
 
+static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
+			      uint8_t *buf, int oob_required, int page)
+{
+	nand_read_page_op(chip, page, 0, NULL, 0);
+
+	return gpmi_ecc_read_page_data(chip, buf, oob_required, page);
+}
+
 /* Fake a virtual small page for the subpage read */
 static int gpmi_ecc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 			uint32_t offs, uint32_t len, uint8_t *buf, int page)
@@ -1257,7 +1265,7 @@ static int gpmi_ecc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
 
 	/* Read the subpage now */
 	this->swap_block_mark = false;
-	max_bitflips = gpmi_ecc_read_page(mtd, chip, buf, 0, page);
+	max_bitflips = gpmi_ecc_read_page_data(chip, buf, 0, page);
 
 	/* Restore */
 	writel(r1_old, bch_regs + HW_BCH_FLASH0LAYOUT0);
-- 
2.11.0
