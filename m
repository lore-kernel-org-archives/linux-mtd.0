Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8pOo-0003fr-SH
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2016 14:16:47 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <marek.vasut@gmail.com>,
 <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH v4 1/8] mtd: spi-nor: improve macronix_quad_enable()
Date: Mon, 21 Nov 2016 15:15:40 +0100
Message-ID: <1a9d62bf291ca22516ffb9049d22e6b87830782d.1479736401.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1479736401.git.cyrille.pitchen@atmel.com>
References: <cover.1479736401.git.cyrille.pitchen@atmel.com>
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
Reviewed-by: Jagan Teki <jagan@openedev.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165d7d66..7ff807211e1e 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1211,6 +1211,11 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	val = read_sr(nor);
 	if (val < 0)
 		return val;
+	if (val & SR_QUAD_EN_MX)
+		return 0;
+
+	/* Update the Quad Enable bit. */
+	dev_dbg(nor->dev, "setting Macronix Quad Enable (non-volatile) bit\n");
 	write_enable(nor);
 
 	write_sr(nor, val | SR_QUAD_EN_MX);
-- 
2.7.4
