Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faGQF-00078K-Oj
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 08:12:33 +0000
From: Colin King <colin.king@canonical.com>
To: Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: rawnand: gpmi: remove redundant variable payload_virt
Date: Tue,  3 Jul 2018 09:12:14 +0100
Message-Id: <20180703081214.32754-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Colin Ian King <colin.king@canonical.com>

Variable payload_virt is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'payload_virt' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index f6aa358a3452..58d4e4a93a93 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -957,7 +957,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 	struct gpmi_nand_data *this = nand_get_controller_data(chip);
 	struct bch_geometry *nfc_geo = &this->bch_geometry;
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	void          *payload_virt;
 	dma_addr_t    payload_phys;
 	unsigned int  i;
 	unsigned char *status;
@@ -967,7 +966,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 
 	dev_dbg(this->dev, "page number is : %d\n", page);
 
-	payload_virt = this->payload_virt;
 	payload_phys = this->payload_phys;
 
 	if (virt_addr_valid(buf)) {
@@ -976,7 +974,6 @@ static int gpmi_ecc_read_page_data(struct nand_chip *chip,
 		dest_phys = dma_map_single(this->dev, buf, nfc_geo->payload_size,
 					   DMA_FROM_DEVICE);
 		if (!dma_mapping_error(this->dev, dest_phys)) {
-			payload_virt = buf;
 			payload_phys = dest_phys;
 			direct = true;
 		}
-- 
2.17.1
