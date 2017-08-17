Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diJcN-0007xT-44
 for linux-mtd@lists.infradead.org; Thu, 17 Aug 2017 12:10:53 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>,
 Archit Taneja <architt@codeaurora.org>,
 Sricharan R <sricharan@codeaurora.org>,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v5 15/16] mtd: nand: qcom: support for IPQ4019 QPIC NAND
 controller
Date: Thu, 17 Aug 2017 17:37:53 +0530
Message-Id: <1502971674-13810-16-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
References: <1502971674-13810-1-git-send-email-absahu@codeaurora.org>
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

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---

* Changes from v4: None

 drivers/mtd/nand/qcom_nandc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 52d9fae..84fcdb3 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2866,6 +2866,12 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 	.dev_cmd_reg_start = 0x0,
 };
 
+static const struct qcom_nandc_props ipq4019_nandc_props = {
+	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
+	.is_bam = true,
+	.dev_cmd_reg_start = 0x0,
+};
+
 /*
  * data will hold a struct pointer containing more differences once we support
  * more controller variants
@@ -2875,6 +2881,10 @@ static int qcom_nandc_remove(struct platform_device *pdev)
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
