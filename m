Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C2AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 10:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QahVctCPei2vYTjWAk0HqZLCcjWsIuNkdrYIXUx6sYo=; b=MroCo8D3hGpTEa
	AwgNDGM70X3nwz6Mz5O/EPr9HIR6ywZISCJD6nSIB9O2aJLiBe+GCZbsPuTQDQLCiHQCVt/0GdT3H
	yify1PVRLeDgx98que71tNq/bzTKOXnxfD5clXVcH/ybYT8cNcowfLsotiC2GY760Y3FcSy0J5e8a
	OKnQ4oI0KYms6H5hM3SCX2OeLb7XPQzlxA0n5jM3bLRXBRR5CHajAogOMR+GWhcgUw3s+HTbJgsjX
	cn5g9yCMY27HwTCqmiEFAYh5Ph/N6lUNj2DdE/49f7Q+mMSqxpjwBQu2AFYYhOCNbUekETQg4nEQI
	OADl+FkcM2RfEvVcJFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp6FI-00Flrb-W1; Mon, 22 Nov 2021 10:08:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp5y1-00Fgme-Bi; Mon, 22 Nov 2021 09:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637574629; x=1669110629;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LuEfcE1ZrzctajFkbeBwHr97miWGyHJLwKz62hoai3k=;
 b=wzYD3gPmY9e7i/a/u45WhmxKWCTtM8HpmGDtiuoqA1vsOYRbZ9QwzigK
 f2Eug6hcWf2K51gH9XMHjZ/MpgzjcshL8bac3sSOhvYW6mPTj6N/G1owb
 /h/OpAUiThrvUDYI9W5xABB4MRrBISC+ndcH9wCshaqjY1VWccHGZL0RN
 tiZ5kuJb8Xe/pk8axxDqURX35W0veWQhns+GBXcuWsQXWfp2/hQiiXWKi
 Wgg8rnI3JvtEMtmd1mT6RuLOfxZ0sJ4t2gAzNzO2Ubf1oQdxWH0+GvOUG
 J43KoG/OmKuPRKswEAXYbs8ZNgg9rKslc4Y3+6sIABi+ikydRKPq8APEg Q==;
IronPort-SDR: pQXduIKh1qPUdXZwevtj8fYqRDbvOAzSPCErtNjJvBBewM+FAt4qgDfZHsinjj8h0KZ5VUmh5H
 rF3j2uSimTUsPqBbrzsXDKP5Hvr5fNTjnJgaErW+s0yv6+ucq7+BcdWgRTdl74sjpE8SryuDCg
 MmKjbkkGXT0h7NEFqAgjSLvamR6ucERvgr+266m0nfyB4Hl4xvSqQNKb+RU3wBno4mWcBhwSMh
 a6+LwXQ/ZbTQMpWn6Zm7PBpk28/eD/R57wFGvIyn7yHy8IQxmx9bRRnbyW7VBEfmuH4QcAgpZP
 jdCghRnUdFJuPPMX+ea2g4JI
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="152761159"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Nov 2021 02:50:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 22 Nov 2021 02:50:26 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 22 Nov 2021 02:50:21 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v4 00/13] mtd: spi-nor: Clean params init
Date: Mon, 22 Nov 2021 11:50:07 +0200
Message-ID: <20211122095020.393346-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_015029_484560_4B97C786 
X-CRM114-Status: GOOD (  11.18  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Clean spi_nor_scan() and the flash parameters initialization code. 
Tested all the flashes from patch set. Reworked how the flags are
handled for the flash_info entries.

Changes in 4:
- new patch:
  "mtd: spi-nor: core: Don't use mtd_info in the NOR's probe sequence of calls"
- move spi_nor_post_sfdp_fixups() in drivers/mtd/spi-nor/sfdp.c 
- Reworked flash_info flags. nor->info->flags are split in new flash_info
  members: parse_sfdp, flags, no_sfdp_flags, fixup_flags and mfr_flags.
- remove roll-back mechanism for flashes that use PARSE_SFDP.
- dropped R-b tags where the new version of the patch modified how things
  are handled

Changes in v3:
- move late_init() in struct spi_nor_fixups and update patches accordingly.     
R-b tags were dropped.
- new patch "mtd: spi-nor: sst: Get rid of SST_WRITE flash_info flag"
moves manufacturer specific flag out of the core.
- update methods description to make it clear who sets when
- introduce flash_info flag masks to make it clear when one should be set.
- rework "parse SFDP first idea".
- v4 changes log in each commit after ---

Tudor Ambarus (13):
  mtd: spi-nor: core: Don't use mtd_info in the NOR's probe sequence of
    calls
  mtd: spi-nor: Introduce spi_nor_set_mtd_info()
  mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is
    defined
  mtd: spi-nor: core: Introduce flash_info mfr_flags
  mtd: spi-nor: Rework the flash_info flags
  mtd: spi-nor: Introduce spi_nor_init_flags()
  mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
  mtd: spi-nor: core: Init all flash parameters based on SFDP where
    possible
  mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
  mtd: spi-nor: winbond: w25q256jvm: Init flash based on SFDP
  mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
  mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP
  mtd: spi-nor: issi: is25lp256: Init flash based on SFDP

 drivers/mtd/spi-nor/atmel.c      |  71 +++--
 drivers/mtd/spi-nor/catalyst.c   |  15 +-
 drivers/mtd/spi-nor/core.c       | 500 +++++++++++++++++--------------
 drivers/mtd/spi-nor/core.h       | 206 ++++++++-----
 drivers/mtd/spi-nor/eon.c        |  33 +-
 drivers/mtd/spi-nor/esmt.c       |  15 +-
 drivers/mtd/spi-nor/everspin.c   |  12 +-
 drivers/mtd/spi-nor/fujitsu.c    |   3 +-
 drivers/mtd/spi-nor/gigadevice.c |  57 ++--
 drivers/mtd/spi-nor/intel.c      |  12 +-
 drivers/mtd/spi-nor/issi.c       |  60 ++--
 drivers/mtd/spi-nor/macronix.c   | 105 ++++---
 drivers/mtd/spi-nor/micron-st.c  | 211 +++++++------
 drivers/mtd/spi-nor/otp.c        |   2 +-
 drivers/mtd/spi-nor/sfdp.c       |  20 ++
 drivers/mtd/spi-nor/spansion.c   | 160 +++++-----
 drivers/mtd/spi-nor/sst.c        |  88 ++++--
 drivers/mtd/spi-nor/swp.c        |   2 +-
 drivers/mtd/spi-nor/winbond.c    | 161 +++++-----
 drivers/mtd/spi-nor/xmc.c        |  10 +-
 20 files changed, 984 insertions(+), 759 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
