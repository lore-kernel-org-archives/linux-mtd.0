Received: from mail-yh0-x22f.google.com ([2607:f8b0:4002:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XfCJj-0004yX-5Z
 for linux-mtd@lists.infradead.org; Fri, 17 Oct 2014 18:31:59 +0000
Received: by mail-yh0-f47.google.com with SMTP id c41so611748yho.34
 for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2014 11:31:37 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: computersforpeace@gmail.com
Subject: [PATCH 2/2] mtd: fsl-quadspi: Provide an error code on
 spi_nor_match_id() failure
Date: Fri, 17 Oct 2014 15:31:09 -0300
Message-Id: <1413570669-30738-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1413570669-30738-1-git-send-email-festevam@gmail.com>
References: <1413570669-30738-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 b45815@freescale.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

If spi_nor_match_id fails then we need to propagate an error code into 'ret',
otherwise the probe function will succeed.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index c5d10c3..4a2799f 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -911,8 +911,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 			goto map_failed;
 
 		id = spi_nor_match_id(modalias);
-		if (!id)
+		if (!id) {
+			ret = -EINVAL;
 			goto map_failed;
+		}
 
 		ret = of_property_read_u32(np, "spi-max-frequency",
 				&q->clk_rate);
-- 
1.9.1
