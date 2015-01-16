Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC8Ck-0000Yg-BA
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 14:48:55 +0000
From: Archit Taneja <architt@codeaurora.org>
To: linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/5] mtd: Qualcomm NAND controller driver
Date: Fri, 16 Jan 2015 20:18:17 +0530
Message-Id: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
Cc: Archit Taneja <architt@codeaurora.org>, galak@codeaurora.org,
 linux-kernel@vger.kernel.org, agross@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for the NAND controller driver for SoC's that contain EBI2. For now,
the only SoC upstream that has EBI2 is IPQ806x.

The patchset requires the ADM dmaengine patches posted by Andy:

http://thread.gmane.org/gmane.linux.ports.arm.msm/11136

Archit Taneja (5):
  clk: qcom: Add EBI2 clocks for IPQ806x
  mtd: nand: Add qcom nand controller driver
  Documentaion: dt: add DT bindings for Qualcomm NAND controller
  arm: qcom: dts: Add NAND controller node for ipq806x
  arm: qcom: dts: Enale NAND node on IPQ8064 AP148 pplatform

 .../devicetree/bindings/mtd/qcom_nandc.txt         |   48 +
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |   32 +
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   19 +-
 drivers/clk/qcom/gcc-ipq806x.c                     |   34 +
 drivers/mtd/nand/Kconfig                           |    7 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/qcom_nandc.c                      | 1995 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-ipq806x.h       |    1 +
 8 files changed, 2136 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt
 create mode 100644 drivers/mtd/nand/qcom_nandc.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
