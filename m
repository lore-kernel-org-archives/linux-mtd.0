Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEICJ-00033f-HB
 for linux-mtd@lists.infradead.org; Tue, 06 Dec 2016 16:02:28 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <marek.vasut@gmail.com>
CC: <computersforpeace@gmail.com>, <boris.brezillon@free-electrons.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/1] mtd: spi-nor: improve macronix_quad_enable()
Date: Tue, 6 Dec 2016 17:01:41 +0100
Message-ID: <5b7ad2367d9b6a4e3a766ce6cadf16c313a03a26.1481039788.git.cyrille.pitchen@atmel.com>
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
code.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Reviewed-by: Jagan Teki <jagan@openedev.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index da7cd69d4857..1fd32b991eb7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1216,6 +1216,9 @@ static int macronix_quad_enable(struct spi_nor *nor)
 	val = read_sr(nor);
 	if (val < 0)
 		return val;
+	if (val & SR_QUAD_EN_MX)
+		return 0;
+
 	write_enable(nor);
 
 	write_sr(nor, val | SR_QUAD_EN_MX);
-- 
2.7.4
