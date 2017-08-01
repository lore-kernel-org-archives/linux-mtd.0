Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcVSn-0001xc-Qu
 for linux-mtd@lists.infradead.org; Tue, 01 Aug 2017 11:35:52 +0000
Received: by mail-pf0-x241.google.com with SMTP id 72so2092430pfl.4
 for <linux-mtd@lists.infradead.org>; Tue, 01 Aug 2017 04:35:29 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, narmstrong@baylibre.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] mtd: nand: denali: Handle return value of
 clk_prepare_enable.
Date: Tue,  1 Aug 2017 17:05:09 +0530
Message-Id: <1501587309-20900-2-git-send-email-arvind.yadav.cs@gmail.com>
In-Reply-To: <1501587309-20900-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1501587309-20900-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

clk_prepare_enable() can fail here and we must check its return value.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/nand/denali_dt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 47f398e..56e2e17 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -118,7 +118,9 @@ static int denali_dt_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "no clk available\n");
 		return PTR_ERR(dt->clk);
 	}
-	clk_prepare_enable(dt->clk);
+	ret = clk_prepare_enable(dt->clk);
+	if (ret)
+		return ret;
 
 	denali->clk_x_rate = clk_get_rate(dt->clk);
 
-- 
1.9.1
