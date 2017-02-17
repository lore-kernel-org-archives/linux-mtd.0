Received: from mail.ispras.ru ([83.149.199.45])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ceqj2-0004AD-D4
 for linux-mtd@lists.infradead.org; Fri, 17 Feb 2017 22:10:03 +0000
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: [PATCH] mtd: spi-nor: hisi: do not ignore clk_prepare_enable() failure
Date: Sat, 18 Feb 2017 01:08:17 +0300
Message-Id: <1487369297-5810-1-git-send-email-khoroshilov@ispras.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hisi_spi_nor_probe() ignores clk_prepare_enable() error code.
The patch fixes that.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
---
 drivers/mtd/spi-nor/hisi-sfc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/hisi-sfc.c b/drivers/mtd/spi-nor/hisi-sfc.c
index 20378b0d55e9..a286350627a6 100644
--- a/drivers/mtd/spi-nor/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/hisi-sfc.c
@@ -448,8 +448,11 @@ static int hisi_spi_nor_probe(struct platform_device *pdev)
 	if (!host->buffer)
 		return -ENOMEM;
 
+	ret = clk_prepare_enable(host->clk);
+	if (ret)
+		return ret;
+
 	mutex_init(&host->lock);
-	clk_prepare_enable(host->clk);
 	hisi_spi_nor_init(host);
 	ret = hisi_spi_nor_register_all(host);
 	if (ret)
-- 
2.7.4
