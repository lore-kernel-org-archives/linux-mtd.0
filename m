Received: from mail-lf0-x229.google.com ([2a00:1450:4010:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1arqF1-0002Le-3i
 for linux-mtd@lists.infradead.org; Sun, 17 Apr 2016 17:12:11 +0000
Received: by mail-lf0-x229.google.com with SMTP id j11so193458136lfb.1
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2016 10:11:50 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH V2 00/11] mtd: nand: get rid of NAND_ECC_SOFT_BCH
Date: Sun, 17 Apr 2016 19:11:33 +0200
Message-Id: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
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

V2: Drop avr32 patch and modify atmel patch
    Out-of-commit comment in hisi504 patch
    Fixes in nand_base.c to handle mode && algo correctly

Rafał Miłecki (11):
  mtd: nand: bf5xx: set ECC algorithm explicitly
  mtd: nand: davinci: set ECC algorithm explicitly
  mtd: nand: atmel: set ECC algorithm explicitly
  CRIS v32: nand: set ECC algorithm explicitly
  staging: mt29f_spinand: set ECC algorithm explicitly
  mtd: nand: set ECC algorithm to Hamming on fallback
  mtd: nand: hisi504: set ECC algorithm based on DT info
  mtd: nand: fsmc: validate ECC setup by checking algorithm directly
  mtd: nand: read ECC algorithm from the new field
  of: mtd: drop support for NAND_ECC_SOFT_BCH as "soft_bch" mapping
  mtd: mtd: drop NAND_ECC_SOFT_BCH enum value

 arch/cris/arch-v32/drivers/mach-a3/nandflash.c |   1 +
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c |   1 +
 drivers/mtd/nand/atmel_nand.c                  |  13 +++
 drivers/mtd/nand/bf5xx_nand.c                  |   1 +
 drivers/mtd/nand/davinci_nand.c                |   8 ++
 drivers/mtd/nand/fsmc_nand.c                   |  10 ++-
 drivers/mtd/nand/hisi504_nand.c                |   1 +
 drivers/mtd/nand/jz4780_nand.c                 |   1 -
 drivers/mtd/nand/nand_base.c                   | 118 +++++++++++++++----------
 drivers/mtd/nand/nandsim.c                     |   2 +-
 drivers/mtd/nand/sunxi_nand.c                  |   2 -
 drivers/of/of_mtd.c                            |   9 +-
 drivers/staging/mt29f_spinand/mt29f_spinand.c  |   1 +
 include/linux/mtd/nand.h                       |   1 -
 14 files changed, 111 insertions(+), 58 deletions(-)

-- 
1.8.4.5
