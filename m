Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar9pb-0003XA-GX
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 19:55:08 +0000
Received: by mail-wm0-x229.google.com with SMTP id v188so44904524wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2016 12:54:47 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 00/12] mtd: nand: get rid of NAND_ECC_SOFT_BCH
Date: Fri, 15 Apr 2016 21:54:00 +0200
Message-Id: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
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

This patchset completes usage of the new "algo" field and drops unwanted
NAND_ECC_SOFT_BCH.

It's based on nand/next git repository.

Rafał Miłecki (12):
  mtd: nand: bf5xx: set ECC algorithm explicitly
  mtd: nand: davinci: set ECC algorithm explicitly
  avr32: set Atmel NAND ECC algorithm explicitly
  mtd: nand: atmel: set ECC algorithm explicitly
  CRIS v32: nand: set ECC algorithm explicitly
  staging: mt29f_spinand: set ECC algorithm explicitly
  mtd: nand: set ECC algorithm to Hamming on fallback
  mtd: nand: hisi504: set ECC algorithm based on DT info
  mtd: nand: fsmc: validate ECC setup by checking algorithm directly
  mtd: nand: read ECC algorithm from the new field
  of: mtd: drop support for NAND_ECC_SOFT_BCH as "soft_bch" mapping
  mtd: mtd: drop NAND_ECC_SOFT_BCH enum value

 arch/avr32/boards/atngw100/setup.c             |   1 +
 arch/avr32/boards/atstk1000/atstk1002.c        |   1 +
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c |   1 +
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c |   1 +
 drivers/mtd/nand/atmel_nand.c                  |   6 ++
 drivers/mtd/nand/bf5xx_nand.c                  |   1 +
 drivers/mtd/nand/davinci_nand.c                |   8 ++
 drivers/mtd/nand/fsmc_nand.c                   |  10 ++-
 drivers/mtd/nand/hisi504_nand.c                |   1 +
 drivers/mtd/nand/jz4780_nand.c                 |   1 -
 drivers/mtd/nand/nand_base.c                   | 101 +++++++++++++------------
 drivers/mtd/nand/nandsim.c                     |   2 +-
 drivers/mtd/nand/sunxi_nand.c                  |   2 -
 drivers/of/of_mtd.c                            |   9 ++-
 drivers/staging/mt29f_spinand/mt29f_spinand.c  |   1 +
 include/linux/mtd/nand.h                       |   1 -
 include/linux/platform_data/atmel.h            |   1 +
 17 files changed, 91 insertions(+), 57 deletions(-)

-- 
1.8.4.5
