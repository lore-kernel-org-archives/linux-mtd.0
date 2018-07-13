Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fduNO-0007Qt-0w
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2018 09:28:38 +0000
Received: by mail-lf0-x244.google.com with SMTP id m13-v6so26633839lfb.12
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jul 2018 02:28:23 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 2/4] mtd: onenand: use mtd_device_register() where applicable
Date: Fri, 13 Jul 2018 11:27:32 +0200
Message-Id: <20180713092734.16408-3-zajec5@gmail.com>
In-Reply-To: <20180713092734.16408-1-zajec5@gmail.com>
References: <20180713092734.16408-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

If driver doesn't specify parsers it can use that little helper.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/nand/onenand/generic.c | 5 ++---
 drivers/mtd/nand/onenand/samsung.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/onenand/generic.c b/drivers/mtd/nand/onenand/generic.c
index d5ccaf943b91..acad17ec6581 100644
--- a/drivers/mtd/nand/onenand/generic.c
+++ b/drivers/mtd/nand/onenand/generic.c
@@ -66,9 +66,8 @@ static int generic_onenand_probe(struct platform_device *pdev)
 		goto out_iounmap;
 	}
 
-	err = mtd_device_parse_register(&info->mtd, NULL, NULL,
-					pdata ? pdata->parts : NULL,
-					pdata ? pdata->nr_parts : 0);
+	err = mtd_device_register(&info->mtd, pdata ? pdata->parts : NULL,
+				  pdata ? pdata->nr_parts : 0);
 
 	platform_set_drvdata(pdev, info);
 
diff --git a/drivers/mtd/nand/onenand/samsung.c b/drivers/mtd/nand/onenand/samsung.c
index 4cce4c0311ca..e64d0fdf7eb5 100644
--- a/drivers/mtd/nand/onenand/samsung.c
+++ b/drivers/mtd/nand/onenand/samsung.c
@@ -933,9 +933,8 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	if (s3c_read_reg(MEM_CFG_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ)
 		dev_info(&onenand->pdev->dev, "OneNAND Sync. Burst Read enabled\n");
 
-	err = mtd_device_parse_register(mtd, NULL, NULL,
-					pdata ? pdata->parts : NULL,
-					pdata ? pdata->nr_parts : 0);
+	err = mtd_device_register(mtd, pdata ? pdata->parts : NULL,
+				  pdata ? pdata->nr_parts : 0);
 	if (err) {
 		dev_err(&pdev->dev, "failed to parse partitions and register the MTD device\n");
 		onenand_release(mtd);
-- 
2.13.7
