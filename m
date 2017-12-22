Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eSR8A-00010K-KY
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 17:29:12 +0000
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Han Xu <han.xu@nxp.com>
Cc: linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Subject: [PATCH 1/2] mtd: nand: Check ONFI timings have been acked by the chip
Date: Fri, 22 Dec 2017 18:28:52 +0100
Message-Id: <20171222172853.27710-2-miquel.raynal@free-electrons.com>
In-Reply-To: <20171222172853.27710-1-miquel.raynal@free-electrons.com>
References: <20171222172853.27710-1-miquel.raynal@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Choosing ONFI timings when ->onfi_set/get_features() calls are supported
by the NAND chip is a matter of reading the chip's ONFI parameter page
and telling the chip the chosen mode (between all of the supported ones)
with ->onfi_set_feature().

Add a check on whether the chip "acked" the timing mode or not.

This can be a problem for NAND chips that do not follow entirely the
ONFI specification. These chips actually support other modes than
"mode 0", but do not update the parameter page once a timing mode has
been selected. This issue will be addressed in another patch that will
add the feature to overwrite NAND chips features within the parameter
page, from the NAND chip driver.

Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
---
 drivers/mtd/nand/nand_base.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 96c97588e1ba..ea862be6a803 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1236,6 +1236,18 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
 				tmode_param);
 		if (ret)
 			goto err;
+
+		ret = chip->onfi_get_features(mtd, chip,
+					      ONFI_FEATURE_ADDR_TIMING_MODE,
+					      tmode_param);
+		if (ret)
+			goto err;
+
+		if (tmode_param[0] != chip->onfi_timing_mode_default) {
+			pr_warn("timings mode %d not acknowledged by the NAND chip\n",
+				chip->onfi_timing_mode_default);
+			goto err;
+		}
 	}
 
 	ret = chip->setup_data_interface(mtd, chipnr, &chip->data_interface);
-- 
2.11.0
