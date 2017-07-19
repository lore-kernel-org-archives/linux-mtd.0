Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXnU3-0005ZV-Ev
 for linux-mtd@lists.infradead.org; Wed, 19 Jul 2017 11:49:41 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 04/25] dt-bindings: qcom_nandc: change compatible string
 for EBI2 NANDC
Date: Wed, 19 Jul 2017 17:17:52 +0530
Message-Id: <1500464893-11352-5-git-send-email-absahu@codeaurora.org>
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
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 70dd511..4511918 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -1,7 +1,9 @@
 * Qualcomm NAND controller
 
 Required properties:
-- compatible:		should be "qcom,ipq806x-nand"
+- compatible:		should be "qcom,ebi2-nandc" - EBI2 NAND which uses ADM
+			DMA like IPQ8064.
+
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
 - clock-names:		must contain "core" for the core clock and "aon" for the
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
