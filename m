Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dg8IR-0007fD-PG
 for linux-mtd@lists.infradead.org; Fri, 11 Aug 2017 11:40:09 +0000
From: Abhishek Sahu <absahu@codeaurora.org>
To: boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org,
 sricharan@codeaurora.org, Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v4 00/20] Add QCOM QPIC NAND support
Date: Fri, 11 Aug 2017 17:09:15 +0530
Message-Id: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
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

* v4:

1. Added Acked-by from Rob for DT documentation patches
2. Removed ipq8074 compatible string from ipq4019 DT example.
2. Used the BIT macro for NAND_CMD_VLD bits and consistent names
   as suggested by Boris in v3.

* v3:

1. Removed the patches already applied to linux-next and
   rebased the remaining patches on [1]
2. Reordered the patches and put the BAM DMA changes [2]
   dependent patches and compatible string patches in last
3. Removed the register offsets array and used the dev_cmd offsets
4. Changed some macro names to small letters for better code readability
5. Changed the compatible string to SoC specific
6. Did minor code changes for adding comment, error handling, structure names
7. Combined raw write (patch#18) and passing flag parameter (patch#22) patch
   into one
8. Made separate patch for compatible string and NAND properties
9. Made separate patch for BAM command descriptor and data descriptors handling
10. Changed commit message for some of the patches
11. Addressed review comments given in v2
12. Added Reviewed-by of Archit for some of the patches from v2
13. All the MTD tests are working fine for IPQ8064 AP148, IPQ4019 DK04 and
    IPQ8074 HK01 boards for v3 patches

[1] http://git.infradead.org/l2-mtd.git/shortlog/refs/heads/nand/next
[2] http://www.spinics.net/lists/dmaengine/msg13662.html

* v2:

1. Addressed the review comments given in v1
2. Removed the DMA coherent buffer for register read and used
   streaming DMA API’s
3. Reorganized the NAND read and write functions
4. Separated patch for driver and documentation changes
5. Changed the compatible string for EBI2

* v1:

http://www.spinics.net/lists/devicetree/msg183706.html

Abhishek Sahu (20):
  mtd: nand: qcom: fix read failure without complete bootchain
  mtd: nand: qcom: support for NAND controller properties
  mtd: nand: qcom: add bam property for QPIC NAND controller
  mtd: nand: qcom: add and initialize QPIC DMA resources
  mtd: nand: qcom: DMA mapping support for register read buffer
  mtd: nand: qcom: allocate BAM transaction
  mtd: nand: qcom: add BAM DMA descriptor handling
  mtd: nand: qcom: support for passing flags in transfer functions
  mtd: nand: qcom: support for read location registers
  mtd: nand: qcom: erased codeword detection configuration
  mtd: nand: qcom: enable BAM or ADM mode
  mtd: nand: qcom: QPIC data descriptors handling
  mtd: nand: qcom: support for different DEV_CMD register offsets
  mtd: nand: qcom: add command elements in BAM transaction
  mtd: nand: qcom: support for command descriptor formation
  dt-bindings: qcom_nandc: fix the ipq806x device tree example
  dt-bindings: qcom_nandc: IPQ4019 QPIC NAND documentation
  dt-bindings: qcom_nandc: IPQ8074 QPIC NAND documentation
  mtd: nand: qcom: support for IPQ4019 QPIC NAND controller
  mtd: nand: qcom: support for IPQ8074 QPIC NAND controller

 .../devicetree/bindings/mtd/qcom_nandc.txt         |  63 +-
 drivers/mtd/nand/qcom_nandc.c                      | 866 ++++++++++++++++++---
 2 files changed, 814 insertions(+), 115 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
