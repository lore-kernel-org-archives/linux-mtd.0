Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEDEC433E1
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EA792068D
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 17:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlIq0ffG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EA792068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eTW+AAqBF6epThUGYE26yBjMaRmpFqH484f2rnjF8LA=; b=HlIq0ffGccseOJ
	1Rp9lhvnR1GIXl+hYQurTUY7+f0UwrJ/hlLZzP46a32qVDPvTz5NdbdZ+poStsY2ugkWxmzH2vIzP
	eFKBFAYPZ5TGjlKWdisoNJXVaWwCT9/1TiV5JbvvIZtbuHaELSD8ATaFmAtkrNNHEzq/cRwlNu4PG
	VO4AhUyfLdAYqLx4abLLX0pHmkUxRfNuSYvVSIpU+8rat5QfHQMFCb3mnDWK9yKteQWBEJsQ7AW7K
	+IngSdUdcb2rfTHvbPjREXpI6sM7PcXPHBPzc3UP6HwexTTb/G/9TRRQ7p18rYXk+Sp3S2NLbh72Y
	6RC4KtTG8Z8HweQbvAkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgXee-00059z-7A; Wed, 03 Jun 2020 17:58:20 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgXeQ-00050a-5h; Wed, 03 Jun 2020 17:58:08 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id AB7EA24000A;
 Wed,  3 Jun 2020 17:58:00 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v10 00/20] Introduction of the generic ECC framework
Date: Wed,  3 Jun 2020 19:57:39 +0200
Message-Id: <20200603175759.19948-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_105806_485309_A1FE1BAC 
X-CRM114-Status: GOOD (  12.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

After discussing with Boris, he convinced me that the changes should
be done in another order. That's why first I update the nand_ecc_algo
enumeration in raw NAND, then I introduce the new bindings and the ECC
core itself. Only after that, I patch the raw NAND core (and slightly
SPI-NAND) to share the generic data with the NAND core/ECC framework.

Changes in v10:
* After reworking the entire series, I only kept 4 patches aside,
  resending all of them.
* Fixed typos, updated commit logs as proposed.
* Introduced nanddev_set_ecc_requirements().
* Used spaces instead of tabs in an array.
* Renamed the nand_ecc_is_strong_enough() helper.
* Dropped the use of the MAXIMIZE flag in denali.c.
* Renamed this flag MAXIMIZE_STRENGTH.
* Renamed the of_get_nand_ecc_config*() helpers.

Changes in v9:
* This time sending the additional patchs, not just the old ones with
  corrections. v8 should be ignored, sorry for the noise.

Changes in v8:
* Split "Convert generic NAND bits to ECC framework" into several peaces:
  > added two helpers
  > converted SPI-NAND then raw-NAND.
* Fixed a comment.
* Used the _ooblayout suffix instead of _layout.


Miquel Raynal (20):
  mtd: rawnand: Add a kernel doc to the ECC algorithm enumeration
  mtd: rawnand: Rename the ECC algorithm enumeration items
  mtd: rawnand: Move the nand_ecc_algo enum to the generic NAND layer
  mtd: nand: Add a NAND page I/O request type
  dt-bindings: mtd: Document nand-ecc-placement
  dt-bindings: mtd: Document nand-ecc-engine
  dt-bindings: mtd: Document boolean NAND ECC properties
  mtd: nand: Introduce the ECC engine framework
  mtd: rawnand: Separate the ECC engine type and the ECC byte placement
  mtd: rawnand: Use the new ECC engine type enumeration
  mtd: nand: Create a helper to extract the ECC configuration
  mtd: spinand: Use nanddev_get_ecc_conf() when relevant
  mtd: nand: Create helpers to set/extract the ECC requirements
  mtd: rawnand: Use nanddev_get/set_ecc_requirements() when relevant
  mtd: nand: Use the new generic ECC object
  mtd: rawnand: Make use of the ECC framework
  mtd: rawnand: Use the ECC framework OOB layouts
  mtd: rawnand: Use the ECC framework nand_ecc_is_strong_enough() helper
  mtd: rawnand: Use the ECC framework user input parsing bits
  mtd: rawnand: Use the NAND framework user_conf object for ECC flags

 .../bindings/mtd/nand-controller.yaml         |  28 +
 arch/arm/mach-davinci/board-da830-evm.c       |   2 +-
 arch/arm/mach-davinci/board-da850-evm.c       |   2 +-
 arch/arm/mach-davinci/board-dm355-evm.c       |   2 +-
 arch/arm/mach-davinci/board-dm355-leopard.c   |   3 +-
 arch/arm/mach-davinci/board-dm365-evm.c       |   2 +-
 arch/arm/mach-davinci/board-dm644x-evm.c      |   2 +-
 arch/arm/mach-davinci/board-dm646x-evm.c      |   2 +-
 arch/arm/mach-davinci/board-mityomapl138.c    |   2 +-
 arch/arm/mach-davinci/board-neuros-osd2.c     |   2 +-
 arch/arm/mach-davinci/board-omapl138-hawk.c   |   2 +-
 arch/arm/mach-s3c24xx/common-smdk.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-anubis.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-at2440evb.c        |   2 +-
 arch/arm/mach-s3c24xx/mach-bast.c             |   2 +-
 arch/arm/mach-s3c24xx/mach-gta02.c            |   2 +-
 arch/arm/mach-s3c24xx/mach-jive.c             |   2 +-
 arch/arm/mach-s3c24xx/mach-mini2440.c         |   2 +-
 arch/arm/mach-s3c24xx/mach-osiris.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-qt2410.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-rx1950.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-rx3715.c           |   2 +-
 arch/arm/mach-s3c24xx/mach-vstms.c            |   2 +-
 arch/arm/mach-s3c64xx/mach-hmt.c              |   2 +-
 arch/arm/mach-s3c64xx/mach-mini6410.c         |   2 +-
 arch/arm/mach-s3c64xx/mach-real6410.c         |   2 +-
 drivers/mtd/nand/Kconfig                      |   8 +
 drivers/mtd/nand/Makefile                     |   2 +
 drivers/mtd/nand/ecc.c                        | 484 +++++++++++++++
 drivers/mtd/nand/raw/Kconfig                  |   1 +
 drivers/mtd/nand/raw/ams-delta.c              |   4 +-
 drivers/mtd/nand/raw/arasan-nand-controller.c |  16 +-
 drivers/mtd/nand/raw/atmel/nand-controller.c  |  31 +-
 drivers/mtd/nand/raw/au1550nd.c               |   4 +-
 .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  |   3 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      |  28 +-
 .../mtd/nand/raw/cadence-nand-controller.c    |   4 +-
 drivers/mtd/nand/raw/cafe_nand.c              |   3 +-
 drivers/mtd/nand/raw/cs553x_nand.c            |   2 +-
 drivers/mtd/nand/raw/davinci_nand.c           |  38 +-
 drivers/mtd/nand/raw/denali.c                 |   3 +-
 drivers/mtd/nand/raw/denali_pci.c             |   2 +-
 drivers/mtd/nand/raw/diskonchip.c             |   3 +-
 drivers/mtd/nand/raw/fsl_elbc_nand.c          |  20 +-
 drivers/mtd/nand/raw/fsl_ifc_nand.c           |  12 +-
 drivers/mtd/nand/raw/fsl_upm.c                |   4 +-
 drivers/mtd/nand/raw/fsmc_nand.c              |  14 +-
 drivers/mtd/nand/raw/gpio.c                   |   4 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c    |  15 +-
 drivers/mtd/nand/raw/hisi504_nand.c           |   6 +-
 .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |  20 +-
 drivers/mtd/nand/raw/lpc32xx_mlc.c            |   2 +-
 drivers/mtd/nand/raw/lpc32xx_slc.c            |   3 +-
 drivers/mtd/nand/raw/marvell_nand.c           |  35 +-
 drivers/mtd/nand/raw/meson_nand.c             |   2 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c            |   4 +-
 drivers/mtd/nand/raw/mtk_nand.c               |  12 +-
 drivers/mtd/nand/raw/mxc_nand.c               |  25 +-
 drivers/mtd/nand/raw/nand_base.c              | 565 +++++++-----------
 drivers/mtd/nand/raw/nand_esmt.c              |  15 +-
 drivers/mtd/nand/raw/nand_hynix.c             |  44 +-
 drivers/mtd/nand/raw/nand_jedec.c             |   9 +-
 drivers/mtd/nand/raw/nand_micron.c            |  23 +-
 drivers/mtd/nand/raw/nand_onfi.c              |  17 +-
 drivers/mtd/nand/raw/nand_samsung.c           |  22 +-
 drivers/mtd/nand/raw/nand_toshiba.c           |  19 +-
 drivers/mtd/nand/raw/nandsim.c                |   8 +-
 drivers/mtd/nand/raw/ndfc.c                   |   2 +-
 drivers/mtd/nand/raw/omap2.c                  |  22 +-
 drivers/mtd/nand/raw/orion_nand.c             |   4 +-
 drivers/mtd/nand/raw/pasemi_nand.c            |   4 +-
 drivers/mtd/nand/raw/plat_nand.c              |   4 +-
 drivers/mtd/nand/raw/qcom_nandc.c             |   2 +-
 drivers/mtd/nand/raw/r852.c                   |   3 +-
 drivers/mtd/nand/raw/s3c2410.c                |  20 +-
 drivers/mtd/nand/raw/sh_flctl.c               |   6 +-
 drivers/mtd/nand/raw/sharpsl.c                |   2 +-
 drivers/mtd/nand/raw/socrates_nand.c          |   5 +-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c        |   9 +-
 drivers/mtd/nand/raw/sunxi_nand.c             |  27 +-
 drivers/mtd/nand/raw/tango_nand.c             |   4 +-
 drivers/mtd/nand/raw/tegra_nand.c             |  37 +-
 drivers/mtd/nand/raw/tmio_nand.c              |   2 +-
 drivers/mtd/nand/raw/txx9ndfmc.c              |   2 +-
 drivers/mtd/nand/raw/vf610_nfc.c              |   6 +-
 drivers/mtd/nand/raw/xway_nand.c              |   4 +-
 drivers/mtd/nand/spi/core.c                   |  12 +-
 drivers/mtd/nand/spi/macronix.c               |   7 +-
 drivers/mtd/nand/spi/toshiba.c                |   6 +-
 include/linux/mtd/nand.h                      | 188 +++++-
 include/linux/mtd/rawnand.h                   |  34 +-
 include/linux/platform_data/mtd-davinci.h     |   9 +-
 .../linux/platform_data/mtd-nand-s3c2410.h    |   2 +-
 93 files changed, 1315 insertions(+), 723 deletions(-)
 create mode 100644 drivers/mtd/nand/ecc.c

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
