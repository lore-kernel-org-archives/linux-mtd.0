Received: from smtp04.smtpout.orange.fr ([80.12.242.126]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxoKN-0008UE-U3
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 05:26:58 +0000
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: boris.brezillon@free-electrons.com, richard@nod.at,
 nicolas.ferre@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] mtd: nand: NULL terminate a of_device_id table
Date: Tue, 11 Apr 2017 07:22:52 +0200
Message-Id: <20170411052252.20656-1-christophe.jaillet@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

of_device_id tables should be NULL terminated.

Fixes: 07b23e3db9ed ("mtd: nand: Cleanup/rework the atmel_nand driver")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/nand/atmel/nand-controller.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 27301603f394..af9dd0e04261 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -1636,6 +1636,7 @@ static const struct of_device_id atmel_matrix_of_ids[] = {
 		.compatible = "atmel,at91sam9x5-matrix",
 		.data = (void *)AT91SAM9X5_MATRIX_EBICSA,
 	},
+	{ /* sentinel */ },
 };
 
 static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
-- 
2.11.0
