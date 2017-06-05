Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dI1LW-00080O-Bj
 for linux-mtd@lists.infradead.org; Mon, 05 Jun 2017 23:23:45 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH v4 01/23] mtd: nand: denali_dt: clean up resource ioremap
Date: Tue,  6 Jun 2017 08:21:40 +0900
Message-Id: <1496704922-12261-2-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
References: <1496704922-12261-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

No need to use two struct resource pointers.  Just reuse one.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v4:
  - Newly added

Changes in v3: None
Changes in v2: None

 drivers/mtd/nand/denali_dt.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index df9ef36..b48430f 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -49,7 +49,7 @@ MODULE_DEVICE_TABLE(of, denali_nand_dt_ids);
 
 static int denali_dt_probe(struct platform_device *pdev)
 {
-	struct resource *denali_reg, *nand_data;
+	struct resource *res;
 	struct denali_dt *dt;
 	const struct denali_dt_data *data;
 	struct denali_nand_info *denali;
@@ -74,15 +74,13 @@ static int denali_dt_probe(struct platform_device *pdev)
 		return denali->irq;
 	}
 
-	denali_reg = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						  "denali_reg");
-	denali->flash_reg = devm_ioremap_resource(&pdev->dev, denali_reg);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "denali_reg");
+	denali->flash_reg = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(denali->flash_reg))
 		return PTR_ERR(denali->flash_reg);
 
-	nand_data = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						 "nand_data");
-	denali->flash_mem = devm_ioremap_resource(&pdev->dev, nand_data);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nand_data");
+	denali->flash_mem = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(denali->flash_mem))
 		return PTR_ERR(denali->flash_mem);
 
-- 
2.7.4
