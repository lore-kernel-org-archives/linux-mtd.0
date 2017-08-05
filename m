Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1de1qO-0004sr-3g
 for linux-mtd@lists.infradead.org; Sat, 05 Aug 2017 16:22:29 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 19/20] mtd: nand: qcom: Support for IPQ4019 QPIC NAND
 controller
Date: Sat,  5 Aug 2017 21:49:57 +0530
Message-Id: <1501949998-29859-20-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add the compatible string for IPQ4019 QPIC NAND controller
version 1.4.0 which uses BAM DMA.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 16463ac..cc58e8f 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2860,6 +2860,12 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	.flash_dev_offset = 0x0,
 };
 
+static const struct qcom_nandc_props ipq4019_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.is_bam = true,
+	.flash_dev_offset = 0x0,
+};
+
 /*
  * data will hold a struct pointer containing more differences once we support
  * more controller variants
@@ -2869,6 +2875,10 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 		.compatible = "qcom,ipq806x-nand",
 		.data = &ipq806x_nandc_props,
 	},
+	{
+		.compatible = "qcom,ipq4019-nand",
+		.data = &ipq4019_nandc_props,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
