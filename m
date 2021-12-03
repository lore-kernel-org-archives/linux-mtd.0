Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9993CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZAsbiawHach7x4/Asn9Hqej5MP/UurPVDWkzls3Sa4E=; b=qwqQPQ5dKJ3Xv/
	09LMjtU361yUnD1UhB2k2AOpNc29Gu1hQ2TLe933jfAitfaxnHvNOBpjJj1/7BY8MSV0k9det0BBN
	f0/gWz1zFBpBsZfgCU55IDU30CKvP5P4qKcnjR3f3IDemdtdG8G2lzrtUeSe6PXYHHEgs0HlGxp6X
	CFg9yOnwZWwLX+79MPUpCQutOMhANRRVHmSvpGusNWDhyelqSaAfqVwl8XDVOfXzXK3Zpje3bMZXD
	/Nlnwm6tF6qyEaRMTk0UyI76ACEv2hxGQAXgZM+Ovor35VbUoqk0ET+3S7D0QGv7eh8D+cAaAks9Y
	JBYgVIxwGDYp/VZNWk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9Sw-00G7vv-Ab; Fri, 03 Dec 2021 14:23:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Ss-00G7vJ-Pm; Fri, 03 Dec 2021 14:23:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638541387; x=1670077387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oGJEtYyiauhcyYNFO8aJ4m2ie/xQZRSjKiu25fflwuI=;
 b=eKEvvHXSwgGwPgQsj13e0mzdXeiGVbLEuoHCpw/0dyuP06mNZtZX/Ou/
 Z21PnVuLZKEN92YmxBNblBpCuMxPsbz/71AXeqfbeqK5J5u9ARCcUK0Qw
 DOSJ4ir07CMrEVaUM84dci8LGiqAhQvTh7MZ0m1qOjtSy9qiPIWW3BX+g
 bqreByOXF2jBaLMIgY7YLyV+WMRGF9cvamkKVFTp3/FyWtRpIzBbFd2Aa
 nosPfQIBDwWG/AbsPsmPobsZBvFJD5e/qM/187c34KnM3CXCfBgbY798H
 hf+gbhtqdbmA0NjA+jhegs1fuAfVpAPCSq/0TGwjlD4zMSLOc1/X2vHTx g==;
IronPort-SDR: py9zF5HyGQDN1kdCGsXuyEDbelOfexF0rlyPDs0vrXTLBvukrWOq+zD6hErYYFiyzndGfuNZEc
 3q45zOOfriKboISxGJlQNYeKuLuwzoaM5QqeGsPzmYNxgY0x38YicHtSiHRP8WoCLZemwi1GNX
 jSnjhy6Y4Zfq4DtyUBDclsZ6/ugi5X7rp7rGSdSTyh1QthMqS9iCrzpKcwDBwMdDOqrs5pTrpK
 HlT16mMtWcYOa4/miX26z7x/mMzHmxNFDx9+Vjjl3kEkJTkfdG/MNLCMKSVuQtmYbN+6si78ZC
 hAJvCMHqSr3idnEu6vl3+VUM
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="145438054"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2021 07:23:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 3 Dec 2021 07:23:02 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 3 Dec 2021 07:22:57 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v5 00/14] mtd: spi-nor: Clean params init
Date: Fri, 3 Dec 2021 16:22:42 +0200
Message-ID: <20211203142256.47370-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062306_890951_F6DEAB2E 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Clean spi_nor_scan() and the flash parameters initialization code. 
Reworked how the flags are handled for the flash_info entries.
Tested all the flashes from patch set.

Changes in v5:
- new patch 0001-mtd-spi-nor-Fix-mtd-size-for-s3an-flashes.patch
- update comment from
  '[PATCH v4 02/13] mtd: spi-nor: Introduce spi_nor_set_mtd_info()',
  s/'No mtd_info fields are used up to this point.'/
    'No mtd_info fields should be used up to this point.'
- collect R-b tags

Changes in v4:
- new patch:
  "mtd: spi-nor: core: Don't use mtd_info in the NOR's probe sequence of calls"
- move spi_nor_post_sfdp_fixups() in drivers/mtd/spi-nor/sfdp.c 
- Reworked flash_info flags. nor->info->flags are split in new flash_info
  members: parse_sfdp, flags, no_sfdp_flags, fixup_flags and mfr_flags.
- remove roll-back mechanism for flashes that use PARSE_SFDP.
- dropped R-b tags where the new version of the patch modified how things
  are handled
- v4 changes log in each commit after ---

Changes in v3:
- move late_init() in struct spi_nor_fixups and update patches accordingly.     
R-b tags were dropped.
- new patch "mtd: spi-nor: sst: Get rid of SST_WRITE flash_info flag"
moves manufacturer specific flag out of the core.
- update methods description to make it clear who sets when
- introduce flash_info flag masks to make it clear when one should be set.
- rework "parse SFDP first idea".

Tudor Ambarus (14):
  mtd: spi-nor: Fix mtd size for s3an flashes
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
 drivers/mtd/spi-nor/xilinx.c     |   2 +-
 drivers/mtd/spi-nor/xmc.c        |  10 +-
 21 files changed, 985 insertions(+), 760 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
