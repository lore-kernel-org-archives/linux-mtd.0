Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE44DC4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:53:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A89361078
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 04:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A89361078
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L9Tky/QSvwRIWmHf2Ie+3z6Zy4RaA0Le0rgyUHi3CIY=; b=kE0dftrk3v6mZ5
	fbcfVW//g9NuJbPi0d1mZZ5nDTyAuMarODUlbxMP/zWgEH760qmAQeaeLoekt7uMfx3QFqiJ6/NjT
	jLCFK59CW086OlF93p8h7pSLqmYYglESAFts5RG83vqooyTnny+I6/UnbbFs4XoyMkS15W7/eGm0S
	fiZ5MaaagyFAP6rfe7aTYxixS4vMNIZiyUbBXS009Ulah7FbIshYuOTxg4BMlBN5KxqIgvuMLJuaX
	GbWJItjm231dyzF65c/KDATMJq7Xc+qwbZ972pG0gDJq4EpPnjrgFHX35SUUe2qQUBHje5Gxvr4Yf
	oDLbRnH95Djagag81/mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8F56-00DHOL-La; Tue, 27 Jul 2021 04:52:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8F50-00DHMd-TM; Tue, 27 Jul 2021 04:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627361554; x=1658897554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OkSzeKgWJMwURRZQ6yNXgDRVMLiV4GZOlYZwVpdbL0M=;
 b=nVsw9irF6OeyacWE5X61NtTlnFl7InE/ofsfsDsKcISZU8xvTYiyv/Op
 xhefSoxkvYyLhtj5xlp1/mOaA3Zs+ZdsgcYEc3/x2etPCZZoHsGZz0EXS
 wH+4Rb45HwhIuFb/vBBVy4cBp9J3FvdRqzPBNTm0ZwPRcSH4Op6Q/5wjD
 uoQl5bivAh1h8LnqIhvN+8gBS0OQ8cJA6epvvXK8t0UpH7+t5yX3BmJfA
 3mBMnAV4cu2pYStEUSkgXco2FeLWcFSLgIPEGsdQLfUtjA95/MVCjZqtz
 ZQkRPfJOoMFkrdSBu7yRIrgEnjkuHNczVlOe6ergzz8ZMlXjDbNkUQ7aA w==;
IronPort-SDR: A8kow0d0ZCslzRIy6EU3D52wQ1RPzNySeXk9IvYAfa74Py3N7fgJwca/jJJ2X+JLFty8ByMCG9
 +5GVpdCR3X+9MBbqfe4qnrT6vQpBUU4gtbcY5ZuZKWdEemZ/RorqX1t4PMxfpYZm+I8cJmMxKg
 nlkX9x+/LKjdxUlFor3hfdzHsgE7/speXyD27F+Rva4EisFQMU014LG/Gef6nAN7kJoQCOXx3b
 8yY6kTph9yZaZkFufojFMOZa/IWah1FFyBxCmbF1L57HqOkM5kroGr+KSx19w1nQJYs45kqFNg
 Sp6xMR+KnCWW6u955A//o+EF
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="130482089"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jul 2021 21:52:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 21:52:30 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 26 Jul 2021 21:52:25 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
CC: <figgyc@figgyc.uk>, <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>,
 <esben@geanix.com>, <knaerzche@gmail.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>,
 <macromorgan@hotmail.com>, <sr@denx.de>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <nicolas.ferre@microchip.com>, "Tudor
 Ambarus" <tudor.ambarus@microchip.com>
Subject: [PATCH v2 00/35] mtd: spi-nor: Handle ID collisions and clean params
 init
Date: Tue, 27 Jul 2021 07:51:47 +0300
Message-ID: <20210727045222.905056-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_215235_040354_750EF0D3 
X-CRM114-Status: GOOD (  11.58  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Handle flash ID collisions. Clean spi_nor_scan() and the flash
parameters initialization. Add guideliness on how to submit a new
flash proposal. An overview of the patch set can be seen in the
documentation patch, the last in the series.
Documentation/driver-api/mtd/spi-nor.rst is obsolete and must be
updated, but the series is getting big, and I though submitting
what I have to speed the review process. Will handle the documentation
afterwards.

Tested with sst26vf064b, w25q256jvm, is25lp256, s25fl256s0, gd25q256,
n25q256a and mx25l25635e.

Changes in v2: address Pratyush's comments on initial patch set.

Tudor Ambarus (35):
  mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
  mtd: spi-nor: core: Report correct name in case of ID collisions
  mtd: spi-nor: macronix: Handle ID collision b/w MX25L3233F and
    MX25L3205D
  mtd: spi-nor: macronix: Handle ID collision b/w MX25L12805D and
    MX25L12835F
  mtd: spi-nor: Introduce Manufacturer ID collisions driver
  mtd: spi-nor: manuf-id-collisions: Add support for xt25f128b
  mtd: spi-nor: manuf-id-collisions: Add support for xm25qh64c
  mtd: spi-nor: core: Introduce the ate_init() hook
  mtd: spi-nor: atmel: Use flash late_init() for locking
  mtd: spi-nor: sst: Use flash late_init() for locking
  mtd: spi-nor: winbond: Use manufacturer late_init() for OTP ops
  mtd: spi-nor: xilinx: Use manufacturer late_init() to set setup method
  mtd: spi-nor: sst: Use manufacturer late_init() to set _write()
  mtd: spi-nor: spansion: Use manufacturer late_init()
  mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is
    defined
  mtd: spi-nor: core: Mark default_init() as deprecated
  mtd: spi-nor: Introduce spi_nor_nonsfdp_flags_init()
  mtd: spi-nor: Get rid of SPI_NOR_4B_OPCODES flag
  mtd: spi-nor: Get rid of SPI_NOR_IO_MODE_EN_VOLATILE flag
  mtd: spi-nor: core: Use container_of to get the pointer to struct
    spi_nor
  mtd: spi-nor: Introduce spi_nor_set_mtd_info()
  mtd: spi-nor: core: Use common naming scheme for setting mtd_info
    fields
  mtd: spi-nor: Get rid of nor->page_size
  mtd: spi-nor: core: Fix spi_nor_flash_parameter otp description
  mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
  mtd: spi-nor: core: Introduce spi_nor_init_default_params()
  mtd: spi-nor: core: Init flash params based on SFDP first for new
    flash additions
  mtd: spi-nor: sst: sst26vf064b: Use SPI_NOR_PARSE_SFDP
  mtd: spi-nor: winbond: w25q256jvm: Use SPI_NOR_PARSE_SFDP
  mtd: spi-nor: issi: is25lp256: Use SPI_NOR_PARSE_SFDP
  mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
  mtd: spi-nor: gigadevice: gd25q256: Use SPI_NOR_PARSE_SFDP
  mtd: spi-nor: micron-st: n25q256a: Use SPI_NOR_PARSE_SFDP
  mtd: spi-nor: macronix: mx25l25635e: Use SPI_NOR_PARSE_SFDP
  docs: mtd: spi-nor: Add details about how to propose a new flash
    addition

 Documentation/driver-api/mtd/spi-nor.rst  |  65 +++
 drivers/mtd/spi-nor/Makefile              |   1 +
 drivers/mtd/spi-nor/atmel.c               |  30 +-
 drivers/mtd/spi-nor/core.c                | 482 ++++++++++++----------
 drivers/mtd/spi-nor/core.h                |  60 +--
 drivers/mtd/spi-nor/gigadevice.c          |   6 +-
 drivers/mtd/spi-nor/issi.c                |  12 +-
 drivers/mtd/spi-nor/macronix.c            |  67 ++-
 drivers/mtd/spi-nor/manuf-id-collisions.c |  29 ++
 drivers/mtd/spi-nor/micron-st.c           |  34 +-
 drivers/mtd/spi-nor/otp.c                 |   2 +-
 drivers/mtd/spi-nor/spansion.c            |  24 +-
 drivers/mtd/spi-nor/sst.c                 |  19 +-
 drivers/mtd/spi-nor/swp.c                 |   2 +-
 drivers/mtd/spi-nor/sysfs.c               |   2 +-
 drivers/mtd/spi-nor/winbond.c             |  11 +-
 drivers/mtd/spi-nor/xilinx.c              |  25 +-
 include/linux/mtd/spi-nor.h               |   4 +-
 18 files changed, 539 insertions(+), 336 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/manuf-id-collisions.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
