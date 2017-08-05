Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1de1oz-0005P5-19
 for linux-mtd@lists.infradead.org; Sat, 05 Aug 2017 16:21:05 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, marek.vasut@gmail.com, robh+dt@kernel.org,
 mark.rutland@arm.com
Cc: richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v3 03/20] mtd: nand: qcom: add bam property for QPIC NAND
 controller
Date: Sat,  5 Aug 2017 21:49:41 +0530
Message-Id: <1501949998-29859-4-git-send-email-absahu@codeaurora.org>
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

The current driver only supports EBI2 NAND controller which uses
ADM DMA. The latest QCOM SoC uses QPIC NAND controller with BAM
DMA. NAND registers and programming sequence are same for EBI2
and QPIC NAND so the same driver can support QPIC NAND also by
adding the BAM DMA support. This patch adds the is_bam in NAND
property which will be checked for determining the DMA engine type.

Reviewed-by: Archit Taneja <architt@codeaurora.org>
Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index 4dc6b7e..08cda7d 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -330,9 +330,11 @@ struct qcom_nand_host {
  * This data type corresponds to the nand controller properties which varies
  * among different NAND controllers.
  * @ecc_modes - ecc mode for NAND
+ * @is_bam - whether NAND controller is using BAM
  */
 struct qcom_nandc_props {
 	u32 ecc_modes;
+	bool is_bam;
 };
 
 static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
@@ -2254,6 +2256,7 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 
 static const struct qcom_nandc_props ipq806x_nandc_props = {
 	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
+	.is_bam = false,
 };
 
 /*
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
