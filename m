Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czU2q-0005qv-Bf
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 20:11:47 +0000
Received: by mail-wr0-x242.google.com with SMTP id l44so16088472wrc.2
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 13:11:27 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mtd: nand: tmio_nand.c: prefer sharpslpart MTD partition
 parser
Date: Sat, 15 Apr 2017 22:11:18 +0200
Message-Id: <1492287078-22369-4-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1492287078-22369-1-git-send-email-andrea.adami@gmail.com>
References: <1492287078-22369-1-git-send-email-andrea.adami@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the specific parser for Sharp SL Series (Zaurus)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 drivers/mtd/nand/tmio_nand.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/tmio_nand.c b/drivers/mtd/nand/tmio_nand.c
index fc5e773..f3612ac 100644
--- a/drivers/mtd/nand/tmio_nand.c
+++ b/drivers/mtd/nand/tmio_nand.c
@@ -357,6 +357,8 @@ static void tmio_hw_stop(struct platform_device *dev, struct tmio_nand *tmio)
 		cell->disable(dev);
 }
 
+static const char * const probes[] = { "sharpslpart", NULL };
+
 static int tmio_probe(struct platform_device *dev)
 {
 	struct tmio_nand_data *data = dev_get_platdata(&dev->dev);
@@ -440,7 +442,7 @@ static int tmio_probe(struct platform_device *dev)
 		goto err_irq;
 
 	/* Register the partitions */
-	retval = mtd_device_parse_register(mtd, NULL, NULL,
+	retval = mtd_device_parse_register(mtd, probes, NULL,
 					   data ? data->partition : NULL,
 					   data ? data->num_partitions : 0);
 	if (!retval)
-- 
2.7.4
