Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bF2P3-00031w-Vc
 for linux-mtd@lists.infradead.org; Mon, 20 Jun 2016 16:50:26 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/9] mtd: spi-nor: improve macronix_quad_enable()
Date: Mon, 20 Jun 2016 18:50:00 +0200
Message-ID: <ce96adc91d3eb2dec48a21b4405bce02d5f57b24.1466440540.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1466440540.git.cyrille.pitchen@atmel.com>
References: <cover.1466440540.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The patch checks whether the Quad Enable bit is already set in the Status
Register. If so, the function exits immediately with a successful return
code. Otherwise, a message is now printed telling we're setting the
non-volatile bit.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a63922ed6385..86a555e43eb1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1194,6 +1194,11 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	val = read_sr(nor);
 	if (val < 0)
 		return val;
+	if (val & SR_QUAD_EN_MX)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	dev_info(nor->dev, "setting Macronix Quad Enable (non-volatile) bit\n");
 	write_enable(nor);
 
 	write_sr(nor, val | SR_QUAD_EN_MX);
-- 
1.8.2.2
