Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxUnV-0004Yn-7s
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 08:35:44 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] mtd: nand: gpmi: Fix gpmi_nand_init() error path
Date: Mon, 10 Apr 2017 10:35:17 +0200
Message-Id: <1491813318-4417-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The GPMI driver is wrongly assuming that nand_release() can safely be
called on an uninitialized/unregistered NAND device.

Add a new err_nand_cleanup label in the error path and only execute if
nand_scan_tail() succeeded.

Note that we now call nand_cleanup() instead of nand_release()
(nand_release() is actually grouping the mtd_device_unregister() and
nand_cleanup() in one call) because there's no point in trying to
unregister a device that has never been registered.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index d52139635b67..92279a0d52f1 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -2048,18 +2048,20 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 
 	ret = nand_boot_init(this);
 	if (ret)
-		goto err_out;
+		goto err_nand_cleanup;
 	ret = chip->scan_bbt(mtd);
 	if (ret)
-		goto err_out;
+		goto err_nand_cleanup;
 
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
-		goto err_out;
+		goto err_nand_cleanup;
 	return 0;
 
+err_nand_cleanup:
+	nand_cleanup(chip);
 err_out:
-	gpmi_nand_exit(this);
+	gpmi_free_dma_buffer(this);
 	return ret;
 }
 
-- 
2.7.4
