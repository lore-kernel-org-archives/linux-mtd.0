Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZM7zS-0005Zr-Cg
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 05:08:47 +0000
From: Archit Taneja <architt@codeaurora.org>
To: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com,
 computersforpeace@gmail.com
Cc: linux-arm-msm@vger.kernel.org, agross@codeaurora.org, sboyd@codeaurora.org,
 linux-kernel@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v3 0/5] mtd: Qualcomm NAND controller driver
Date: Mon,  3 Aug 2015 10:38:13 +0530
Message-Id: <1438578498-32254-1-git-send-email-architt@codeaurora.org>
In-Reply-To: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add support for the NAND controller driver for SoC's that contain EBI2.
For now, the only SoC upstream that has EBI2 is IPQ806x.

The original version was posted a while back. The main comments were
about the driver not being able to use nand_bbt. This was because the
controller could read factory bad block markers only in RAW mode. This
forced us to implement our own versions of chip->block_bad and
chip->blobk_markbad, and also we had to skip creating a BBT.

Discussions with Kevin Cernekee concluded that having a new BBT flag
that incorporates this controller's special requirement is a possible
option.

The new version makes use of this flag and now uses nand_bbt, at the
cost of implement read_oob_raw and write_oob_raw ops.

The patchset requires the v6 ADM dmaengine patches posted by Andy:

https://lkml.org/lkml/2015/3/17/19

v3:
- Various fixes and clean ups suggested by Stephen Boyd.

v2:
- Added a new BBT flag that allows us to read BBM in raw mode
- reduce memcpy-s in the driver
- some refactor and clean ups because of above changes

v1:
- original series:
  https://lkml.org/lkml/2015/1/16/317


Archit Taneja (5):
  mtd: nand: Create a BBT flag to access bad block markers in raw mode
  mtd: nand: Qualcomm NAND controller driver
  dt/bindings: qcom_nandc: Add DT bindings
  arm: qcom: dts: Add NAND controller node for ipq806x
  arm: qcom: dts: Enable NAND node on IPQ8064 AP148 platform

 .../devicetree/bindings/mtd/qcom_nandc.txt         |   49 +
 arch/arm/boot/dts/qcom-ipq8064-ap148.dts           |   36 +
 arch/arm/boot/dts/qcom-ipq8064.dtsi                |   15 +
 drivers/mtd/nand/Kconfig                           |    7 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/nand_base.c                       |    6 +-
 drivers/mtd/nand/nand_bbt.c                        |    6 +-
 drivers/mtd/nand/qcom_nandc.c                      | 1913 ++++++++++++++++++++
 include/linux/mtd/bbm.h                            |    7 +
 9 files changed, 2038 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt
 create mode 100644 drivers/mtd/nand/qcom_nandc.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
