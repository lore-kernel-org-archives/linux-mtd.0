Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1erlce-0004l9-VR
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2018 14:25:26 +0000
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
Subject: [PATCH v3 03/14] mtd: rawnand: mxc: rename the local
 ->set/get_features() implementation
Date: Fri,  2 Mar 2018 15:24:11 +0100
Message-Id: <20180302142422.2543-4-miquel.raynal@bootlin.com>
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

MXC NAND driver embeds its own implementation of the
->set/get_features() hooks. These hooks were once flagged "onfi" but a
lot of not-ONFI compliant NAND chips use it so they have been renamed
to remove the "onfi" relationship. Rename these functions the same way
for consistency.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index d331305f45c1..61501654e708 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1421,9 +1421,8 @@ static void mxc_nand_command(struct mtd_info *mtd, unsigned command,
 	}
 }
 
-static int mxc_nand_onfi_set_features(struct mtd_info *mtd,
-				      struct nand_chip *chip, int addr,
-				      u8 *subfeature_param)
+static int mxc_nand_set_features(struct mtd_info *mtd, struct nand_chip *chip,
+				 int addr, u8 *subfeature_param)
 {
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
@@ -1447,9 +1446,8 @@ static int mxc_nand_onfi_set_features(struct mtd_info *mtd,
 	return 0;
 }
 
-static int mxc_nand_onfi_get_features(struct mtd_info *mtd,
-				      struct nand_chip *chip, int addr,
-				      u8 *subfeature_param)
+static int mxc_nand_get_features(struct mtd_info *mtd, struct nand_chip *chip,
+				 int addr, u8 *subfeature_param)
 {
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
@@ -1752,8 +1750,8 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this->read_word = mxc_nand_read_word;
 	this->write_buf = mxc_nand_write_buf;
 	this->read_buf = mxc_nand_read_buf;
-	this->set_features = mxc_nand_onfi_set_features;
-	this->get_features = mxc_nand_onfi_get_features;
+	this->set_features = mxc_nand_set_features;
+	this->get_features = mxc_nand_get_features;
 
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk))
-- 
2.14.1
