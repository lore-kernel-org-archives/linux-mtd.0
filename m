Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dg8Jv-000088-Fo
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 11:41:40 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: boris.brezillon@free-electrons.com,
	robh+dt@kernel.org
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org,
 sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>,
 mark.rutland@arm.com
Subject: [PATCH v4 18/20] dt-bindings: qcom_nandc: IPQ8074 QPIC NAND
 documentation
Date: Fri, 11 Aug 2017 17:09:33 +0530
Message-Id: <1502451575-15712-19-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Qualcom IPQ8074 SoC uses QPIC NAND controller version 1.5.0
which uses BAM DMA Engine.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index d93b952..73d336be 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -6,6 +6,8 @@ Required properties:
 			    SoC and it uses ADM DMA
     * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being used in
                             IPQ4019 SoC and it uses BAM DMA
+    * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
+                            IPQ8074 SoC and it uses BAM DMA
 
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
