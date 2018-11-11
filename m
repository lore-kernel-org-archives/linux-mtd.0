Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLkao-0004Y7-QT
 for linux-mtd@lists.infradead.org; Sun, 11 Nov 2018 07:55:40 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Han Xu <han.xu@nxp.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Xiaolei Li <xiaolei.li@mediatek.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Stefan Agner <stefan@agner.ch>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 00/22] mtd: rawnand: 3rd batch of cleanup
Date: Sun, 11 Nov 2018 08:55:02 +0100
Message-Id: <20181111075524.13123-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

After the sanitization of the raw NAND API, here is a smaller
patchset continuing in this direction.

Patch 1 is just a follow-up on the "stop passing mtd_info objects
around" patches, except this times it takes care of internal functions.
There's still a lot of sanitization to do in drivers in order to get
rid of those mtd params, but I'll leave that to driver maintainers.

Patch 2 is trying to get rid of 3 forward declarations that are not
really needed.

Patch 3 is getting rid of useless test in nand_legacy_set_defaults().

Patch 4 is making nand_exec_op() private, so that NAND controller
drivers are not tempted to use it.

Patch 5 is getting rid of an unused flag that has been around for quite
some time.

Patches 6 to 11 are doing various cleanups/fixes/improvements in the
ams-delta driver.

Patches 12 to 20 are deprecating the ->select_chip() hook which should
now be replaced by internal target/die selection logic directly called
from the ->exec_op() and ecc.read/write_xxx() implementations. The
rational behind this change is that modern controller now take care of
asserting/deasserting the CS pin on a per-operation basis, and if we
ever want to implement advanced queuing logic (instead of the basic
serialization we currently have) we'll have to attach a CS line to the
operation we want to execute.

Finally, patches 21 and 22 are moving the controller specific methods
to nand_controller_ops.

As usual, let me know what you think of those changes.

Regards,

Boris

Main changes between v1 and v2:
- Patch the ams-delta driver

Main changes between v2 and v3:
- Fix the bug reported by Janusz
- Fix a bug reported by kbuild bots

Boris Brezillon (22):
  mtd: rawnand: Stop passing mtd_info objects to internal functions
  mtd: rawnand: Reorganize code to avoid forward declarations
  mtd: rawnand: legacy: Drop useless test in nand_legacy_set_defaults()
  mtd: rawnand: Move nand_exec_op() to internal.h
  mtd: rawnand: Remove unused NAND_CONTROLLER_ALLOC flag
  mtd: rawnand: ams-delta: Allow this driver to be compiled when
    COMPILE_TEST=y
  mtd: rawnand: ams-delta: Add an SPDX tag to replace the license text
  mtd: rawnand: ams-delta: Fix various coding style issues
  mtd: rawnand: ams-delta: cleanup ams_delta_init() error path
  mtd: rawnand: ams-delta: Check mtd_device_register() return code
  mtd: rawnand: ams-delta: Explicitly inherit from nand_controller
  mtd: rawnand: Add nand_[de]select_target() helpers
  mtd: rawnand: Pass the CS line to be selected in struct nand_operation
  mtd: rawnand: Make ->select_chip() optional when ->exec_op() is
    implemented
  mtd: rawnand: fsmc: Stop implementing ->select_chip()
  mtd: rawnand: marvell: Stop implementing ->select_chip()
  mtd: rawnand: tegra: Stop implementing ->select_chip()
  mtd: rawnand: vf610: Stop implementing ->select_chip()
  mtd: rawnand: ams-delta: Stop implementing ->select_chip()
  mtd: rawnand: Deprecate the ->select_chip() hook
  mtd: rawnand: Move the ->exec_op() method to nand_controller_ops
  mtd: rawnand: Move ->setup_data_interface() to nand_controller_ops

 drivers/mtd/nand/raw/Kconfig                  |   2 +-
 drivers/mtd/nand/raw/ams-delta.c              |  95 ++-
 drivers/mtd/nand/raw/atmel/nand-controller.c  |   9 +-
 drivers/mtd/nand/raw/au1550nd.c               |   2 +-
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  |   2 +-
 drivers/mtd/nand/raw/cafe_nand.c              |   2 +-
 drivers/mtd/nand/raw/davinci_nand.c           |   2 +-
 drivers/mtd/nand/raw/denali.c                 |   5 +-
 drivers/mtd/nand/raw/diskonchip.c             |   4 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c          |   2 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c           |   2 +-
 drivers/mtd/nand/raw/fsl_upm.c                |   2 +-
 drivers/mtd/nand/raw/fsmc_nand.c              |  32 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  27 +-
 drivers/mtd/nand/raw/hisi504_nand.c           |   2 +-
 drivers/mtd/nand/raw/internals.h              |  33 +
 drivers/mtd/nand/raw/jz4740_nand.c            |   6 +-
 drivers/mtd/nand/raw/jz4780_nand.c            |   2 +-
 drivers/mtd/nand/raw/marvell_nand.c           |  32 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c            |   4 +-
 drivers/mtd/nand/raw/mtk_nand.c               |   4 +-
 drivers/mtd/nand/raw/mxc_nand.c               |  14 +-
 drivers/mtd/nand/raw/nand_base.c              | 743 +++++++++---------
 drivers/mtd/nand/raw/nand_bbt.c               | 285 +++----
 drivers/mtd/nand/raw/nand_hynix.c             |   8 +-
 drivers/mtd/nand/raw/nand_legacy.c            |  35 +-
 drivers/mtd/nand/raw/ndfc.c                   |   2 +-
 drivers/mtd/nand/raw/plat_nand.c              |   2 +-
 drivers/mtd/nand/raw/qcom_nandc.c             |   2 +-
 drivers/mtd/nand/raw/r852.c                   |   4 +-
 drivers/mtd/nand/raw/s3c2410.c                |   7 +-
 drivers/mtd/nand/raw/sh_flctl.c               |   2 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |   4 +-
 drivers/mtd/nand/raw/tango_nand.c             |   4 +-
 drivers/mtd/nand/raw/tegra_nand.c             |  32 +-
 drivers/mtd/nand/raw/vf610_nfc.c              |  38 +-
 drivers/mtd/nand/raw/xway_nand.c              |   2 +-
 include/linux/mtd/rawnand.h                   | 150 ++--
 38 files changed, 853 insertions(+), 752 deletions(-)

-- 
2.17.1
