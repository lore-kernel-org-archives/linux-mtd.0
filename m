Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbY-00025A-A6
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:04 +0000
Received: by mail-wi0-f171.google.com with SMTP id hr14so1708878wib.16
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:38 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 11/47] mtd: nand: stm_nand_bch: add Power Management
Date: Tue, 25 Mar 2014 08:19:28 +0000
Message-Id: <1395735604-26706-12-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
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

q
---
 drivers/mtd/nand/stm_nand_bch.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 8ab8e7b..e1ebf92 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -415,12 +415,51 @@ static int stm_nand_bch_remove(struct platform_device *pdev)
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
