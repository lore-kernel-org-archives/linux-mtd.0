Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3LX1-0006Kp-SM
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2014 08:09:00 +0000
Received: by mail-pd0-f172.google.com with SMTP id z10so802159pdj.3
 for <linux-mtd@lists.infradead.org>; Wed, 15 Jan 2014 00:08:35 -0800 (PST)
From: Prabhakar Lad <prabhakar.csengg@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: davinci_nand: Remove unnecessary labels from error path
Date: Wed, 15 Jan 2014 13:38:26 +0530
Message-Id: <1389773306-7055-1-git-send-email-prabhakar.csengg@gmail.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>

This patch removes the unnecessary labels from
the error path in probe function which did nothing
than just returning error values, Thus simplifying code
path and improved readability.

Signed-off-by: Lad, Prabhakar <prabhakar.csengg@gmail.com>
---
 drivers/mtd/nand/davinci_nand.c |   31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index b77a01e..3e4d457 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -609,8 +609,7 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info) {
 		dev_err(&pdev->dev, "unable to allocate memory\n");
-		ret = -ENOMEM;
-		goto err_nomem;
+		return -ENOMEM;
 	}
 
 	platform_set_drvdata(pdev, info);
@@ -619,20 +618,16 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 	res2 = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res1 || !res2) {
 		dev_err(&pdev->dev, "resource missing\n");
-		ret = -EINVAL;
-		goto err_nomem;
+		return -EINVAL;
 	}
 
 	vaddr = devm_ioremap_resource(&pdev->dev, res1);
-	if (IS_ERR(vaddr)) {
-		ret = PTR_ERR(vaddr);
-		goto err_ioremap;
-	}
+	if (IS_ERR(vaddr))
+		return PTR_ERR(vaddr);
+
 	base = devm_ioremap_resource(&pdev->dev, res2);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
-		goto err_ioremap;
-	}
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	info->dev		= &pdev->dev;
 	info->base		= base;
@@ -699,7 +694,7 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 			spin_unlock_irq(&davinci_nand_lock);
 
 			if (ret == -EBUSY)
-				goto err_ecc;
+				return ret;
 
 			info->chip.ecc.calculate = nand_davinci_calculate_4bit;
 			info->chip.ecc.correct = nand_davinci_correct_4bit;
@@ -715,16 +710,14 @@ static int __init nand_davinci_probe(struct platform_device *pdev)
 		info->chip.ecc.strength = pdata->ecc_bits;
 		break;
 	default:
-		ret = -EINVAL;
-		goto err_ecc;
+		return -EINVAL;
 	}
 	info->chip.ecc.mode = ecc_mode;
 
 	info->clk = devm_clk_get(&pdev->dev, "aemif");
 	if (IS_ERR(info->clk)) {
-		ret = PTR_ERR(info->clk);
 		dev_dbg(&pdev->dev, "unable to get AEMIF clock, err %d\n", ret);
-		goto err_clk;
+		return PTR_ERR(info->clk);
 	}
 
 	ret = clk_prepare_enable(info->clk);
@@ -853,10 +846,6 @@ err_clk_enable:
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-err_ecc:
-err_clk:
-err_ioremap:
-err_nomem:
 	return ret;
 }
 
-- 
1.7.9.5
