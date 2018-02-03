Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ehuYv-0002Xz-RK
 for linux-mtd@lists.infradead.org; Sat, 03 Feb 2018 09:56:47 +0000
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/6] mtd: nand: Avoid setting again the timings to mode 0
 after a reset
Date: Sat,  3 Feb 2018 10:55:39 +0100
Message-Id: <20180203095544.9855-2-miquel.raynal@bootlin.com>
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
 drivers/mtd/nand/nand_base.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 9602d17845e2..00111e669c11 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2771,6 +2771,16 @@ int nand_reset(struct nand_chip *chip, int chipnr)
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
