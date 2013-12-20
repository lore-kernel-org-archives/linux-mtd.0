Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtuaS-00010D-CR
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 07:33:33 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MY300I1LGZ89910@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 16:33:08 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
In-reply-to: <000d01cefd55$7e48a2a0$7ad9e7e0$%han@samsung.com>
Subject: [PATCH V2 4/8] mtd: denali_dt: Use devm_clk_get()
Date: Fri, 20 Dec 2013 16:33:08 +0900
Message-id: <001101cefd55$ba9e3120$2fda9360$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, 'Jingoo Han' <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>, 'Dinh Nguyen' <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use devm_clk_get() to make cleanup paths simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
No change since v1.

 drivers/mtd/nand/denali_dt.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
index 9253024..babb02c 100644
--- a/drivers/mtd/nand/denali_dt.c
+++ b/drivers/mtd/nand/denali_dt.c
@@ -108,7 +108,7 @@ static int denali_dt_probe(struct platform_device *ofdev)
 		denali->dev->dma_mask = NULL;
 	}
 
-	dt->clk = clk_get(&ofdev->dev, NULL);
+	dt->clk = devm_clk_get(&ofdev->dev, NULL);
 	if (IS_ERR(dt->clk)) {
 		dev_err(&ofdev->dev, "no clk available\n");
 		return PTR_ERR(dt->clk);
@@ -124,7 +124,6 @@ static int denali_dt_probe(struct platform_device *ofdev)
 
 out_disable_clk:
 	clk_disable_unprepare(dt->clk);
-	clk_put(dt->clk);
 
 	return ret;
 }
@@ -135,7 +134,6 @@ static int denali_dt_remove(struct platform_device *ofdev)
 
 	denali_remove(&dt->denali);
 	clk_disable(dt->clk);
-	clk_put(dt->clk);
 
 	return 0;
 }
-- 
1.7.10.4
