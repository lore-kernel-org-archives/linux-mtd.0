Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXnTt-0005QS-FO
 for linux-mtd@lists.infradead.org; Wed, 19 Jul 2017 11:49:34 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 03/25] mtd: nand: qcom: change compatible string for EBI2
 NANDC
Date: Wed, 19 Jul 2017 17:17:51 +0530
Message-Id: <1500464893-11352-4-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current compatible string “qcom,ipq806x-nand" implies that
the driver is specific to IPQ806x. This driver can be used by
any chip which uses EBI2 NAND controller so changed the
compatible string to “qcom,ebi2-nandc” to give it more generic
name.

Since there is no user for this driver currently in so
changing compatible string is safe.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/mtd/nand/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
index f3b995d..8fa2f0c 100644
--- a/drivers/mtd/nand/qcom_nandc.c
+++ b/drivers/mtd/nand/qcom_nandc.c
@@ -2190,7 +2190,7 @@ static int qcom_nandc_remove(struct platform_device *pdev)
  * more controller variants
  */
 static const struct of_device_id qcom_nandc_of_match[] = {
-	{	.compatible = "qcom,ipq806x-nand",
+	{	.compatible = "qcom,ebi2-nandc",
 		.data = (void *)EBI2_NANDC_ECC_MODES,
 	},
 	{}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
