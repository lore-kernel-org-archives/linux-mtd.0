Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlcS-0004TW-55
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:25:13 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 01/14] mtd: rawnand: rename default
 ->onfi_get/set_features() implementations
Date: Fri,  2 Mar 2018 15:24:09 +0100
Message-Id: <20180302142422.2543-2-miquel.raynal@bootlin.com>
In-Reply-To: <20180302142422.2543-1-miquel.raynal@bootlin.com>
References: <20180302142422.2543-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Prepare future work on the ->onfi_get/set_features() hooks by renaming
the core's implementation as 'default' ones.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e70ca16a5118..d1d5e2281860 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4769,14 +4769,15 @@ static int nand_max_bad_blocks(struct mtd_info *mtd, loff_t ofs, size_t len)
 }
 
 /**
- * nand_onfi_set_features- [REPLACEABLE] set features for ONFI nand
+ * nand_default_onfi_set_features- [REPLACEABLE] set features for ONFI nand
  * @mtd: MTD device structure
  * @chip: nand chip info structure
  * @addr: feature address.
  * @subfeature_param: the subfeature parameters, a four bytes array.
  */
-static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
-			int addr, uint8_t *subfeature_param)
+static int nand_default_onfi_set_features(struct mtd_info *mtd,
+					  struct nand_chip *chip, int addr,
+					  uint8_t *subfeature_param)
 {
 	if (!chip->onfi_version ||
 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
@@ -4787,14 +4788,15 @@ static int nand_onfi_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /**
- * nand_onfi_get_features- [REPLACEABLE] get features for ONFI nand
+ * nand_default_onfi_get_features- [REPLACEABLE] get features for ONFI nand
  * @mtd: MTD device structure
  * @chip: nand chip info structure
  * @addr: feature address.
  * @subfeature_param: the subfeature parameters, a four bytes array.
  */
-static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
-			int addr, uint8_t *subfeature_param)
+static int nand_default_onfi_get_features(struct mtd_info *mtd,
+					  struct nand_chip *chip, int addr,
+					  uint8_t *subfeature_param)
 {
 	if (!chip->onfi_version ||
 	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
@@ -4879,9 +4881,9 @@ static void nand_set_defaults(struct nand_chip *chip)
 
 	/* set for ONFI nand */
 	if (!chip->onfi_set_features)
-		chip->onfi_set_features = nand_onfi_set_features;
+		chip->onfi_set_features = nand_default_onfi_set_features;
 	if (!chip->onfi_get_features)
-		chip->onfi_get_features = nand_onfi_get_features;
+		chip->onfi_get_features = nand_default_onfi_get_features;
 
 	/* If called twice, pointers that depend on busw may need to be reset */
 	if (!chip->read_byte || chip->read_byte == nand_read_byte)
-- 
2.14.1
