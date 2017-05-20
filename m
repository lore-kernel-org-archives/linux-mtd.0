Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dC6FS-0000gS-5V
 for linux-mtd@lists.infradead.org; Sat, 20 May 2017 15:24:55 +0000
Received: by mail-qk0-x242.google.com with SMTP id o85so13770449qkh.0
 for <linux-mtd@lists.infradead.org>; Sat, 20 May 2017 08:24:33 -0700 (PDT)
From: "Mario J. Rugiero" <mrugiero@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 "Mario J. Rugiero" <mrugiero@gmail.com>
Subject: [PATCH 0/3] mtd: nand: allow force erasing of bad blocks through
 debugfs entry
Date: Sat, 20 May 2017 12:24:25 -0300
Message-Id: <20170520152428.9184-1-mrugiero@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Some manufacturers use different layouts than MTD for the NAND, creating
incompatibilities when going from a vendor-specific kernel to mainline.
In particular, NAND devices for AllWinner boards write non-FF values to
the bad block marker, and thus false positives arise when detecting bad
blocks with the MTD driver. Sometimes there are enough false positives
to make the device unusable.
A proposed solution is NAND scrubbing, something a user who knows what
she's doing (TM) could do to avoid this. It consists in erasing blocks
disregarding the BBM. Since the user must know what she's doing, the
only way to enable this feature is through a per-chip debugfs entry.

Mario J. Rugiero (3):
  mtd: create per-device and module-scope debugfs entries
  mtd: nand: create a wrapper for mtd_device_register for NAND specific
    initialization.
  mtd: nand: add option to ignore bad blocks when erasing, opt-in
    through debugfs

 drivers/mtd/mtdcore.c                    | 17 ++++++++++++
 drivers/mtd/mtdcore.h                    |  2 ++
 drivers/mtd/nand/ams-delta.c             |  2 +-
 drivers/mtd/nand/atmel/nand-controller.c |  2 +-
 drivers/mtd/nand/au1550nd.c              |  2 +-
 drivers/mtd/nand/bf5xx_nand.c            |  2 +-
 drivers/mtd/nand/brcmnand/brcmnand.c     |  2 +-
 drivers/mtd/nand/davinci_nand.c          |  2 +-
 drivers/mtd/nand/denali.c                |  2 +-
 drivers/mtd/nand/diskonchip.c            |  4 +--
 drivers/mtd/nand/fsl_upm.c               |  2 +-
 drivers/mtd/nand/fsmc_nand.c             |  2 +-
 drivers/mtd/nand/gpio.c                  |  2 +-
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c   |  2 +-
 drivers/mtd/nand/hisi504_nand.c          |  2 +-
 drivers/mtd/nand/jz4780_nand.c           |  2 +-
 drivers/mtd/nand/lpc32xx_mlc.c           |  2 +-
 drivers/mtd/nand/lpc32xx_slc.c           |  2 +-
 drivers/mtd/nand/mpc5121_nfc.c           |  2 +-
 drivers/mtd/nand/nand_base.c             | 45 +++++++++++++++++++++++++++++---
 drivers/mtd/nand/nandsim.c               |  2 +-
 drivers/mtd/nand/ndfc.c                  |  2 +-
 drivers/mtd/nand/nuc900_nand.c           |  2 +-
 drivers/mtd/nand/omap2.c                 |  4 +--
 drivers/mtd/nand/orion_nand.c            |  2 +-
 drivers/mtd/nand/oxnas_nand.c            |  2 +-
 drivers/mtd/nand/pasemi_nand.c           |  2 +-
 drivers/mtd/nand/pxa3xx_nand.c           |  2 +-
 drivers/mtd/nand/qcom_nandc.c            |  2 +-
 drivers/mtd/nand/sh_flctl.c              |  2 +-
 drivers/mtd/nand/sm_common.c             |  2 +-
 drivers/mtd/nand/socrates_nand.c         |  2 +-
 drivers/mtd/nand/sunxi_nand.c            |  2 +-
 drivers/mtd/nand/tango_nand.c            |  2 +-
 drivers/mtd/nand/vf610_nfc.c             |  2 +-
 drivers/mtd/nand/xway_nand.c             |  2 +-
 include/linux/mtd/mtd.h                  | 10 +++++++
 include/linux/mtd/nand.h                 | 17 ++++++++++++
 38 files changed, 122 insertions(+), 39 deletions(-)

-- 
2.13.0
