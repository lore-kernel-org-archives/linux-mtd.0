Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ehuYv-0002ac-RI
 for linux-mtd@lists.infradead.org; Sat, 03 Feb 2018 09:56:47 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH 3/6] mtd: nand: mxc: Remove useless checks in GET/SET_FEATURES
 functions
Date: Sat,  3 Feb 2018 10:55:41 +0100
Message-Id: <20180203095544.9855-4-miquel.raynal@bootlin.com>
In-Reply-To: <20180203095544.9855-1-miquel.raynal@bootlin.com>
References: <20180203095544.9855-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Miquel Raynal <miquel.raynal@free-electrons.com>

All the calls to the chip's hooks ->onfi_get/set_features() go through
the core's wrappers nand_get/set_features() that already do the
necessary checks about ONFI compliance and feature support. Remove these
checks from the mxc's functions.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/mxc_nand.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index f3be0b2a8869..e36f6ae50bdd 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1324,11 +1324,6 @@ static int mxc_nand_onfi_set_features(struct mtd_info *mtd,
 	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
 	int i;
 
-	if (!chip->onfi_version ||
-	    !(le16_to_cpu(chip->onfi_params.opt_cmd)
-	      & ONFI_OPT_CMD_SET_GET_FEATURES))
-		return -EINVAL;
-
 	host->buf_start = 0;
 
 	for (i = 0; i < ONFI_SUBFEATURE_PARAM_LEN; ++i)
@@ -1350,11 +1345,6 @@ static int mxc_nand_onfi_get_features(struct mtd_info *mtd,
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
