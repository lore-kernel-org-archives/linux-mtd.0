Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQTgv-0006hT-EU
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 07:16:43 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org,
 Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 00/14] Add QCOM QPIC NAND support
Date: Thu, 29 Jun 2017 12:45:52 +0530
Message-Id: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
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

The current QCOM NAND driver only support EBI2 NAND which uses
ADM DMA. The latest QCOM controller supports QPIC NAND which uses
BAM DMA. NAND registers and programming sequence are same for EBI2
and QPIC NAND so the same driver can support QPIC NAND also by
adding the BAM DMA support. This patch series adds the support for
QPIC NAND controller version 1.4.0 available in IPQ4019 and QPIC
NAND controller version 1.5.0 available in IPQ8074.

The kernel MTD tests have been run to validate all these patches
in IPQ8064 AP148, IPQ4019 DK04 and IPQ8074 HK01 boards and all
the MTD tests are passing on these boards.

The QPIC NAND requires the command channel support for BAM DMA
engine and currently BAM engine does not support the command
descriptors so the following patches have been posted for the
same in dmaengine mailing list. The above patches are dependent
upon these BAM DMA patches.

https://www.spinics.net/lists/kernel/msg2542483.html

Abhishek Sahu (14):
  qcom: mtd: nand: Add driver data for QPIC DMA
  qcom: mtd: nand: add and initialize QPIC DMA resources
  qcom: mtd: nand: Fixed config error for BCH
  qcom: mtd: nand: reorganize nand devices probing
  qcom: mtd: nand: allocate bam transaction
  qcom: mtd: nand: add bam dma descriptor handling
  qcom: mtd: nand: support for passing flags in transfer functions
  qcom: mtd: nand: Add support for additional CSRs
  qcom: mtd: nand: BAM support for read page
  qcom: mtd: nand: support for QPIC Page read/write
  qcom: mtd: nand: BAM raw read and write support
  qcom: mtd: nand: change register offset defines with enums
  qcom: mtd: nand: support for QPIC version 1.5.0
  qcom: mtd: nand: programmed NAND_DEV_CMD_VLD register

 .../devicetree/bindings/mtd/qcom_nandc.txt         |  110 +-
 drivers/mtd/nand/qcom_nandc.c                      | 1114 +++++++++++++++++---
 2 files changed, 1050 insertions(+), 174 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
