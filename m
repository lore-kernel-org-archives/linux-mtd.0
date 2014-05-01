Received: from mail-we0-f176.google.com ([74.125.82.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnkV-0002em-IB
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:57:51 +0000
Received: by mail-we0-f176.google.com with SMTP id q59so484989wes.7
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:57:31 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/47] mtd: nand: stm_nand_bch: add Power Management
Date: Thu,  1 May 2014 10:56:19 +0100
Message-Id: <1398938214-17847-13-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Populate the standard PM call-backs for; suspend, resume and restore.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 0c6aad2..8a63c4a 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -568,12 +568,51 @@ static int stm_nand_bch_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM
+static int stm_nand_bch_suspend(struct device *dev)
+{
+	struct nandi_controller *nandi = dev_get_drvdata(dev);
+
+	nandi_clk_disable(nandi);
+
+	return 0;
+}
+static int stm_nand_bch_resume(struct device *dev)
+{
+	struct nandi_controller *nandi = dev_get_drvdata(dev);
+
+	nandi_clk_enable(nandi);
+
+	return 0;
+}
+
+static int stm_nand_bch_restore(struct device *dev)
+{
+	struct nandi_controller *nandi = dev_get_drvdata(dev);
+	struct stm_plat_nand_bch_data *pdata = dev->platform_data;
+	struct stm_nand_bank_data *bank = pdata->bank;
+
+	nandi_init_controller(nandi, bank->csn);
+
+	return 0;
+}
+
+static const struct dev_pm_ops stm_nand_bch_pm_ops = {
+	.suspend = stm_nand_bch_suspend,
+	.resume = stm_nand_bch_resume,
+	.restore = stm_nand_bch_restore,
+};
+#else
+static const struct dev_pm_ops stm_nand_bch_pm_ops;
+#endif
+
 static struct platform_driver stm_nand_bch_driver = {
 	.probe	= stm_nand_bch_probe ,
 	.remove	= stm_nand_bch_remove,
 	.driver	= {
 		.name	= "stm-nand-bch",
 		.owner	= THIS_MODULE,
+		.pm	= &stm_nand_bch_pm_ops,
 	},
 };
 module_platform_driver(stm_nand_bch_driver);
-- 
1.8.3.2
