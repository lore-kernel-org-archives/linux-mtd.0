Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1boEYf-0005Pl-OT
 for linux-mtd@lists.infradead.org; Sun, 25 Sep 2016 18:53:50 +0000
Date: Sun, 25 Sep 2016 20:53:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PULL] mtd: nand: material for 4.9
Message-ID: <20160925205326.67b5a9bd@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Here is my PR for 4.9. Let me know if you see any problem.
Also, please let us know ahead of time if you can't take this PR (I know you
are busy lately, and I guess I could send this PR directly to Linus or ask
Richard to take it in its UBIFS/UBI tree).

Thanks,

Boris

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git@github.com:linux-nand/linux.git tags/for-4.9

for you to fetch changes up to d44154f969a44269a9288c274c1c2fd9e85df8a5:

  mtd: nand: Provide nand_cleanup() function to free NAND related resources (2016-09-23 09:35:16 +0200)

----------------------------------------------------------------
Notable core changes:
- add the infrastructure to automate NAND timings configuration
- provide a generic DT property to maximize ECC strength

The rest is just a bunch of minor drivers and core fixes/cleanup
patches.

----------------------------------------------------------------
Andrey Smirnov (4):
      Kconfig: nand: Make MTD_NAND_FSL_ELBC depend on FSL_SOC
      Kconfig: nand: Remove redundant dependency on MTD_NAND
      mtd: nand: Error out if cmd_ctrl() is missing
      mtd: nand: Get rid of needless 'goto'

Boris Brezillon (10):
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

Brian Norris (1):
      mtd: nand: sh_flctl: handle dma_submit() errors

Han Xu (1):
      mtd: nand: gpmi: get correct free oob space

Harvey Hunt (1):
      MAINTAINERS: Add maintainer entry for Ingenic JZ4780 NAND driver

Krzysztof Kozlowski (1):
      mtd: nand: s3c2410: Register cpufreq notifier only on S3C24xx

Kyle Roeschley (1):
      mtd: nand_bbt: scan for next free bbt block if writing bbt fails

Marc Gonzalez (1):
      mtd: nand: import nand_hw_control_init()

Ray Jui (1):
      mtd: brcmnand: iProc big endian and ONFI support

Richard Weinberger (1):
      mtd: nand: Provide nand_cleanup() function to free NAND related resources

Roger Quadros (1):
      mtd: nand: Allow MTD_NAND_OMAP2 to be usable on Keystone devices

Sascha Hauer (9):
      mtd: nand: remove unnecessary 'extern' from function declarations
      mtd: nand: Create a NAND reset function
      mtd: nand: Introduce nand_data_interface
      mtd: nand: convert ONFI mode into data interface
      mtd: nand: Add function to convert ONFI mode to data_interface
      mtd: nand: Expose data interface for ONFI mode 0
      mtd: nand: mxc: implement onfi get/set features
      mtd: nand: mxc: Add timing setup for v2 controllers

 Documentation/devicetree/bindings/mtd/nand.txt |   9 ++
 MAINTAINERS                                    |   6 +
 drivers/mtd/nand/Kconfig                       |  12 +-
 drivers/mtd/nand/bf5xx_nand.c                  |   3 +-
 drivers/mtd/nand/brcmnand/brcmnand.c           |  15 +-
 drivers/mtd/nand/brcmnand/brcmnand.h           |  13 +-
 drivers/mtd/nand/brcmnand/iproc_nand.c         |  18 ++-
 drivers/mtd/nand/docg4.c                       |   3 +-
 drivers/mtd/nand/fsl_elbc_nand.c               |   3 +-
 drivers/mtd/nand/fsl_ifc_nand.c                |   3 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c         |   3 +-
 drivers/mtd/nand/jz4780_nand.c                 |   3 +-
 drivers/mtd/nand/mxc_nand.c                    | 137 ++++++++++++++++++-
 drivers/mtd/nand/nand_base.c                   | 260 +++++++++++++++++++++++++++++++----
 drivers/mtd/nand/nand_bbt.c                    | 161 ++++++++++++++++------
 drivers/mtd/nand/nand_timings.c                | 470 +++++++++++++++++++++++++++++++++++----------------------------
 drivers/mtd/nand/ndfc.c                        |   3 +-
 drivers/mtd/nand/pxa3xx_nand.c                 |   3 +-
 drivers/mtd/nand/qcom_nandc.c                  |   3 +-
 drivers/mtd/nand/s3c2410.c                     |   7 +-
 drivers/mtd/nand/sh_flctl.c                    |   8 +-
 drivers/mtd/nand/sunxi_nand.c                  | 108 ++++++---------
 drivers/mtd/nand/txx9ndfmc.c                   |   3 +-
 drivers/of/Kconfig                             |   4 -
 include/linux/mtd/nand.h                       | 234 +++++++++++++++++++++----------
 25 files changed, 1033 insertions(+), 459 deletions(-)
