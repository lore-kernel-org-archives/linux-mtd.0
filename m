Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exrFV-0006Af-KS
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2018 09:38:45 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>,
 Stefan Agner <stefan@agner.ch>, juliensu@mxic.com.tw,
 jocelyncarroue@macronix.com, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v4 07/13] mtd: rawnand: avoid setting again the timings to
 mode 0 after a reset
Date: Mon, 19 Mar 2018 10:38:05 +0100
Message-Id: <20180319093811.18351-8-miquel.raynal@bootlin.com>
In-Reply-To: <20180319093811.18351-1-miquel.raynal@bootlin.com>
References: <20180319093811.18351-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After a nand_reset_data_interface(), both the NAND chip and the NAND
controller use timing mode 0. The previously defined data interface for
this chip has been saved and is supposed to be restored after that.
However, if the saved data interface also refers to timing mode 0, there
is no need to re-apply them again.

Also, as nand_setup_data_interface() uses ->set/get_features(), it could
lead to issues when doing the reset at probe time as the parameter page
is not available yet to know if these functions are supported or not.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 281c4e1daa29..e5bcfbf7c7f6 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -2821,6 +2821,16 @@ int nand_reset(struct nand_chip *chip, int chipnr)
 	if (ret)
 		return ret;
 
+	/*
+	 * A nand_reset_data_interface() put both the NAND chip and the NAND
+	 * controller in timings mode 0. If the default mode for this chip is
+	 * also 0, no need to proceed to the change again. Plus, at probe time,
+	 * nand_setup_data_interface() uses ->set/get_features() which would
+	 * fail anyway as the parameter page is not available yet.
+	 */
+	if (!chip->onfi_timing_mode_default)
+		return 0;
+
 	chip->data_interface = saved_data_intf;
 	ret = nand_setup_data_interface(chip, chipnr);
 	if (ret)
-- 
2.14.1
