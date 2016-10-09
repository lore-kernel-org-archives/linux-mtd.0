Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bt61j-0006Sh-1f
 for linux-mtd@lists.infradead.org; Sun, 09 Oct 2016 04:47:56 +0000
Received: by mail-pa0-x243.google.com with SMTP id hh10so4886436pac.0
 for <linux-mtd@lists.infradead.org>; Sat, 08 Oct 2016 21:47:33 -0700 (PDT)
Date: Sat, 8 Oct 2016 21:47:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: [GIT PULL] MTD updates for 4.9-rc1
Message-ID: <20161009044730.GB10199@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Linus,

I've not been very active this cycle, so these are mostly from Boris,
for the NAND flash subsystem.

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/for-linus-20161008

for you to fetch changes up to 69db4aa44fdd8befc2eccd1313d841c5128c385c:

  Merge tag '4.9/mtd-pairing-scheme' of github.com:linux-nand/linux (2016-10-08 20:56:54 -0700)

----------------------------------------------------------------
MTD updates for 4.9-rc1

NAND:

 * Add the infrastructure to automate NAND timings configuration
 * Provide a generic DT property to maximize ECC strength
 * Some refactoring in the core bad block table handling, to help with
   improving some of the logic in error cases.
 * Minor cleanups and fixes

MTD:

 * Add APIs for handling page pairing; this is necessary for reliably
   supporting MLC and TLC NAND flash, where paired-page disturbance affects
   reliability. Upper layers (e.g., UBI) should make use of these in the near
   future.

----------------------------------------------------------------
Andrey Smirnov (4):
      Kconfig: nand: Make MTD_NAND_FSL_ELBC depend on FSL_SOC
      Kconfig: nand: Remove redundant dependency on MTD_NAND
      mtd: nand: Error out if cmd_ctrl() is missing
      mtd: nand: Get rid of needless 'goto'

Boris Brezillon (11):
      mtd: introduce the mtd_pairing_scheme concept
      mtd: nand: timings: Fix tADL_min for ONFI 4.0 chips
      mtd: nand: timings: Reorder tRR_min def in mode 0
      mtd: nand_bbt: Move BBT block selection logic out of write_bbt()
      mtd: nand: automate NAND timings selection
      mtd: nand: Add an option to maximize the ECC strength
      mtd: nand: Support maximizing ECC when using software BCH
      mtd: nand: sunxi: Support ECC maximization
      mtd: nand: Fix nand_command_lp() for 8bits opcodes
      mtd: nand: mxc: Test CONFIG_OF instead of CONFIG_OF_MTD
      mtd: Kill the OF_MTD Kconfig option

Brian Norris (4):
      mtd: nand: sh_flctl: handle dma_submit() errors
      Merge tag 'for-4.9' of github.com:linux-nand/linux
      mtd: nand: fix trivial spelling error
      Merge tag '4.9/mtd-pairing-scheme' of github.com:linux-nand/linux

Han Xu (1):
      mtd: nand: gpmi: get correct free oob space

Harvey Hunt (1):
      MAINTAINERS: Add maintainer entry for Ingenic JZ4780 NAND driver

Karl Beldan (1):
      mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl

Krzysztof Kozlowski (1):
      mtd: nand: s3c2410: Register cpufreq notifier only on S3C24xx

Kyle Roeschley (1):
      mtd: nand_bbt: scan for next free bbt block if writing bbt fails

Marc Gonzalez (1):
      mtd: nand: import nand_hw_control_init()

Ray Jui (1):
      mtd: brcmnand: iProc big endian and ONFI support

Richard Weinberger (2):
      mtd: nand: Provide nand_cleanup() function to free NAND related resources
      mtdpart: Propagate _get/put_device()

Roger Quadros (2):
      mtd: nand: omap2: Don't call dma_release_channel() if dma_request_chan() failed
      mtd: nand: Allow MTD_NAND_OMAP2 to be usable on Keystone devices

Sascha Hauer (9):
      mtd: nand: remove unnecessary 'extern' from function declarations
      mtd: nand: Create a NAND reset function
      mtd: nand: Introduce nand_data_interface
      mtd: nand: convert ONFI mode into data interface
      mtd: nand: Add function to convert ONFI mode to data_interface
      mtd: nand: Expose data interface for ONFI mode 0
      mtd: nand: sunxi: switch from manual to automated timing config
      mtd: nand: mxc: implement onfi get/set features
      mtd: nand: mxc: Add timing setup for v2 controllers

 Documentation/devicetree/bindings/mtd/nand.txt |   9 +
 MAINTAINERS                                    |   6 +
 drivers/mtd/mtdcore.c                          | 104 ++++++
 drivers/mtd/mtdpart.c                          |  19 +
 drivers/mtd/nand/Kconfig                       |  12 +-
 drivers/mtd/nand/bf5xx_nand.c                  |   3 +-
 drivers/mtd/nand/brcmnand/brcmnand.c           |  15 +-
 drivers/mtd/nand/brcmnand/brcmnand.h           |  13 +-
 drivers/mtd/nand/brcmnand/iproc_nand.c         |  18 +-
 drivers/mtd/nand/davinci_nand.c                |   3 +
 drivers/mtd/nand/docg4.c                       |   3 +-
 drivers/mtd/nand/fsl_elbc_nand.c               |   3 +-
 drivers/mtd/nand/fsl_ifc_nand.c                |   3 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c         |   3 +-
 drivers/mtd/nand/jz4780_nand.c                 |   3 +-
 drivers/mtd/nand/mxc_nand.c                    | 137 ++++++-
 drivers/mtd/nand/nand_base.c                   | 260 ++++++++++++--
 drivers/mtd/nand/nand_bbt.c                    | 161 ++++++---
 drivers/mtd/nand/nand_timings.c                | 470 ++++++++++++++-----------
 drivers/mtd/nand/ndfc.c                        |   3 +-
 drivers/mtd/nand/omap2.c                       |   2 +-
 drivers/mtd/nand/pxa3xx_nand.c                 |   3 +-
 drivers/mtd/nand/qcom_nandc.c                  |   3 +-
 drivers/mtd/nand/s3c2410.c                     |   7 +-
 drivers/mtd/nand/sh_flctl.c                    |   8 +-
 drivers/mtd/nand/sunxi_nand.c                  | 108 +++---
 drivers/mtd/nand/txx9ndfmc.c                   |   3 +-
 drivers/of/Kconfig                             |   4 -
 include/linux/mtd/mtd.h                        | 107 ++++++
 include/linux/mtd/nand.h                       | 234 ++++++++----
 30 files changed, 1267 insertions(+), 460 deletions(-)
