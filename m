Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exv9S-0004fW-Dk
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 13:48:48 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 05/14] mtd: rawnand: mxc: remove useless checks in
 GET/SET_FEATURES functions
Date: Mon, 19 Mar 2018 14:47:22 +0100
Message-Id: <20180319134731.22605-6-miquel.raynal@bootlin.com>
In-Reply-To: <20180319134731.22605-1-miquel.raynal@bootlin.com>
References: <20180319134731.22605-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All the calls to the chip's hooks ->get/set_features() go through
the core's wrappers nand_get/set_features() that already do the
necessary checks about feature support. Remove these
checks from the mxc's functions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 61501654e708..944ecf03d3b1 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1428,11 +1428,6 @@ static int mxc_nand_set_features(struct mtd_info *mtd, struct nand_chip *chip,
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	int i;
 
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
-		return -EINVAL;
-
 	host->buf_start = 0;
 
 	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
@@ -1453,11 +1448,6 @@ static int mxc_nand_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	int i;
 
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
-		return -EINVAL;
-
 	host->devtype_data->send_cmd(host, NAND_CMD_GET_FEATURES, false);
 	mxc_do_addr_cycle(mtd, addr, -1);
 	host->devtype_data->send_page(mtd, NFC_OUTPUT);
-- 
2.14.1
