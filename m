Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eWNBq-00031g-O0
 for linux-mtd@lists.infradead.org; Tue, 02 Jan 2018 14:05:36 +0000
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Han Xu <han.xu@nxp.com>
Cc: kernel-janitors@vger.kernel.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] mtd: fsl-quadspi: account for const type of
 of_device_id.data
Date: Tue,  2 Jan 2018 14:28:05 +0100
Message-Id: <1514899688-27844-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver creates a number of const structures that it stores in the
data field of an of_device_id array.

The data field of an of_device_id structure has type const void *, so
there is no need for a const-discarding cast when putting const values
into such a structure.

Done using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/spi-nor/fsl-quadspi.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -u -p a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -801,10 +801,10 @@ static int fsl_qspi_nor_setup_last(struc
 }
 
 static const struct of_device_id fsl_qspi_dt_ids[] = {
-	{ .compatible = "fsl,vf610-qspi", .data = (void *)&vybrid_data, },
-	{ .compatible = "fsl,imx6sx-qspi", .data = (void *)&imx6sx_data, },
-	{ .compatible = "fsl,imx7d-qspi", .data = (void *)&imx7d_data, },
-	{ .compatible = "fsl,imx6ul-qspi", .data = (void *)&imx6ul_data, },
+	{ .compatible = "fsl,vf610-qspi", .data = &vybrid_data, },
+	{ .compatible = "fsl,imx6sx-qspi", .data = &imx6sx_data, },
+	{ .compatible = "fsl,imx7d-qspi", .data = &imx7d_data, },
+	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
 	{ .compatible = "fsl,ls1021a-qspi", .data = (void *)&ls1021a_data, },
 	{ /* sentinel */ }
 };
