Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxUnV-0004Yy-7t
 for linux-mtd@lists.infradead.org; Mon, 10 Apr 2017 08:35:43 +0000
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
Subject: [PATCH 2/2] mtd: nand: gpmi: Kill gpmi_nand_exit()
Date: Mon, 10 Apr 2017 10:35:18 +0200
Message-Id: <1491813318-4417-2-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1491813318-4417-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1491813318-4417-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The only user of gpmi_nand_exit() is gpmi_nand_remove(). Move its content
to the caller.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 92279a0d52f1..f22eeedc728f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1929,12 +1929,6 @@ static int gpmi_set_geometry(struct gpmi_nand_data *this)
 	return gpmi_alloc_dma_buffer(this);
 }
 
-static void gpmi_nand_exit(struct gpmi_nand_data *this)
-{
-	nand_release(nand_to_mtd(&this->nand));
-	gpmi_free_dma_buffer(this);
-}
-
 static int gpmi_init_last(struct gpmi_nand_data *this)
 {
 	struct nand_chip *chip = &this->nand;
@@ -2131,7 +2125,8 @@ static int gpmi_nand_remove(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this = platform_get_drvdata(pdev);
 
-	gpmi_nand_exit(this);
+	nand_release(nand_to_mtd(&this->nand));
+	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	return 0;
 }
-- 
2.7.4
