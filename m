Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQThF-0006mR-CI
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 07:17:06 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 04/14] qcom: mtd: nand: reorganize nand devices probing
Date: Thu, 29 Jun 2017 12:45:56 +0530
Message-Id: <1498720566-20782-5-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is reorganization of exiting code and will not change any
functionality. The NAND controller supports multiple NAND device
with different page size. The subsequent patch allocate memory
which depends upon the maximum number of codewords so this patch
reorganizes the NAND device probing. First the ONFI parameter
page will be read from each connected device followed by MTD
device registration.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 92 ++++++++++++++++++++++++++++---------------
 1 file changed, 61 insertions(+), 31 deletions(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 410ee53..eb0ec19 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2102,14 +2102,69 @@ static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
 		return ret;
 
 	ret = qcom_nand_host_setup(host);
-	if (ret)
-		return ret;
+
+	return ret;
+}
+
+static int qcom_nand_mtd_register(struct qcom_nand_controller *nandc,
+				  struct qcom_nand_host *host,
+				  struct device_node *dn)
+{
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int ret;
 
 	ret = nand_scan_tail(mtd);
 	if (ret)
 		return ret;
 
-	return mtd_device_register(mtd, NULL, 0);
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret)
+		nand_cleanup(mtd_to_nand(mtd));
+
+	return ret;
+}
+
+static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
+{
+	struct device *dev = nandc->dev;
+	struct device_node *dn = dev->of_node, *child;
+	struct qcom_nand_host *host, *tmp;
+	int ret;
+
+	for_each_available_child_of_node(dn, child) {
+		if (of_device_is_compatible(child, "qcom,nandcs")) {
+			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+			if (!host) {
+				of_node_put(child);
+				return -ENOMEM;
+			}
+
+			ret = qcom_nand_host_init(nandc, host, child);
+			if (ret) {
+				devm_kfree(dev, host);
+				continue;
+			}
+
+			list_add_tail(&host->node, &nandc->host_list);
+		}
+	}
+
+	if (list_empty(&nandc->host_list))
+		return -ENODEV;
+
+	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
+		ret = qcom_nand_mtd_register(nandc, host, child);
+		if (ret) {
+			list_del(&host->node);
+			devm_kfree(dev, host);
+		}
+	}
+
+	if (list_empty(&nandc->host_list))
+		return -ENODEV;
+
+	return 0;
 }
 
 /* parse custom DT properties here */
@@ -2141,10 +2196,8 @@ static int qcom_nandc_parse_dt(struct platform_device *pdev)
 static int qcom_nandc_probe(struct platform_device *pdev)
 {
 	struct qcom_nand_controller *nandc;
-	struct qcom_nand_host *host;
 	const void *dev_data;
 	struct device *dev = &pdev->dev;
-	struct device_node *dn = dev->of_node, *child;
 	struct resource *res;
 	int ret;
 	const struct qcom_nand_driver_data *driver_data;
@@ -2202,35 +2255,12 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_setup;
 
-	for_each_available_child_of_node(dn, child) {
-		if (of_device_is_compatible(child, "qcom,nandcs")) {
-			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-			if (!host) {
-				of_node_put(child);
-				ret = -ENOMEM;
-				goto err_cs_init;
-			}
-
-			ret = qcom_nand_host_init(nandc, host, child);
-			if (ret) {
-				devm_kfree(dev, host);
-				continue;
-			}
-
-			list_add_tail(&host->node, &nandc->host_list);
-		}
-	}
-
-	if (list_empty(&nandc->host_list)) {
-		ret = -ENODEV;
-		goto err_cs_init;
-	}
+	ret = qcom_probe_nand_devices(nandc);
+	if (ret)
+		goto err_setup;
 
 	return 0;
 
-err_cs_init:
-	list_for_each_entry(host, &nandc->host_list, node)
-		nand_release(nand_to_mtd(&host->chip));
 err_setup:
 	clk_disable_unprepare(nandc->aon_clk);
 err_aon_clk:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
