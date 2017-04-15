Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czU2q-0005qt-Ak
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 20:11:46 +0000
Received: by mail-wr0-x242.google.com with SMTP id o21so16121629wrb.3
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 13:11:25 -0700 (PDT)
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
Subject: [PATCH 2/3] mtd: nand: sharpsl.c: prefer sharpslpart MTD partition
 parser
Date: Sat, 15 Apr 2017 22:11:17 +0200
Message-Id: <1492287078-22369-3-git-send-email-andrea.adami@gmail.com>
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

This is the specific parser for Sharp SL Series (Zaurus).

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 drivers/mtd/nand/sharpsl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/sharpsl.c b/drivers/mtd/nand/sharpsl.c
index 064ca17..2d1ba0e 100644
--- a/drivers/mtd/nand/sharpsl.c
+++ b/drivers/mtd/nand/sharpsl.c
@@ -108,6 +108,8 @@ static int sharpsl_nand_calculate_ecc(struct mtd_info *mtd, const u_char * dat,
 /*
  * Main initialization routine
  */
+static const char * const probes[] = { "sharpslpart", NULL };
+
 static int sharpsl_nand_probe(struct platform_device *pdev)
 {
 	struct nand_chip *this;
@@ -183,7 +185,7 @@ static int sharpsl_nand_probe(struct platform_device *pdev)
 	/* Register the partitions */
 	mtd->name = "sharpsl-nand";
 
-	err = mtd_device_parse_register(mtd, NULL, NULL,
+	err = mtd_device_parse_register(mtd, probes, NULL,
 					data->partitions, data->nr_partitions);
 	if (err)
 		goto err_add;
-- 
2.7.4
