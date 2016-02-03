Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQtIQ-0007V7-L5
 for linux-mtd@lists.infradead.org; Wed, 03 Feb 2016 09:00:19 +0000
From: Archit Taneja <architt@codeaurora.org>
To: computersforpeace@gmail.com,
	boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org, cernekee@gmail.com, sboyd@codeaurora.org,
 andy.gross@linaro.org, dehrenberg@google.com,
 linux-arm-msm@vger.kernel.org, Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v8 0/3] mtd: Qualcomm NAND controller driver
Date: Wed,  3 Feb 2016 14:29:48 +0530
Message-Id: <1454489991-14717-1-git-send-email-architt@codeaurora.org>
In-Reply-To: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
References: <1453360399-32029-1-git-send-email-architt@codeaurora.org>
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

The previous version added a BBT flag that allowed BBMs to be accessed
in raw mode. Adding a flag isn't the right way to fix it, and the
proposed fix is to add badblockbits support, and make sure all drivers
switch to accessing BBM in raw mode. For now, skip nand_bbt usage, and
implement our own versions of chip->block_bad and chip->mark_bad.

The first patch in the series contains a nand_base clean up which the
driver will utilize.

Based over l2-mtd.git

The patchset requires the v6 ADM dmaengine patches posted by Andy:

https://lkml.org/lkml/2015/3/17/19

v8:
- Fixed issues in erased page parsing as pointed by Boris.
- Rewrite the empty page detection func to detect the page
  at a chunk level. This simplifies the code quite a bit.
- Introduce raw page read/write ops.

v7:
- Incorporated missed suggestions from Boris.
- Updated cafe_nand, docg4, diskonchip drivers
- Some indentation fixes found by strict checkpatch checking

v6:
- Fix erased page parsing as suggested by Boris.
- Change compatible string to something more legible.
- Whitespace fixes.

v5:
- Skip creation of BBT as in v1. Will bring this back after BBMs are
  read/written in raw mode (using badblockbits support).
- Incorporated misc fixes/suggestions by Boris.
- Dropped the DT patches for now, since ADM DMA support isn't merged yet.

v4:
- Some more fixes. Mentioned in individual patch

v3:
- Various fixes and clean ups suggested by Stephen Boyd.

v2:
- Added a new BBT flag that allows us to read BBM in raw mode
- reduce memcpy-s in the driver
- some refactor and clean ups because of above changes

v1:
- original series:
  https://lkml.org/lkml/2015/1/16/317

Archit Taneja (3):
  mtd: nand: don't select chip in nand_chip's block_bad op
  mtd: nand: Qualcomm NAND controller driver
  dt/bindings: qcom_nandc: Add DT bindings

 .../devicetree/bindings/mtd/qcom_nandc.txt         |   86 +
 drivers/mtd/nand/Kconfig                           |    7 +
 drivers/mtd/nand/Makefile                          |    1 +
 drivers/mtd/nand/cafe_nand.c                       |    2 +-
 drivers/mtd/nand/diskonchip.c                      |    2 +-
 drivers/mtd/nand/docg4.c                           |    2 +-
 drivers/mtd/nand/nand_base.c                       |   41 +-
 drivers/mtd/nand/qcom_nandc.c                      | 2224 ++++++++++++++++++++
 include/linux/mtd/nand.h                           |    2 +-
 9 files changed, 2341 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/qcom_nandc.txt
 create mode 100644 drivers/mtd/nand/qcom_nandc.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
