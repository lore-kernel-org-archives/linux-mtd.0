Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33585C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PUjbZZp06auw6J81Wzyt/3XXsGX5xfxhu3MfRt6WwCo=; b=YaHqT+tbZIBU+6
	htCe1vr/k2KbfyQgxUWXBjRW8Jfg9S0M1xjuFyUJgGGWEzZ7vUX4MoOXM+s8fbNiFVqeEaeEC18qT
	9kECG0Sgp9+H0YwaVw1G2rUpWTTcs75WGksIw/RaCAfrAzD/0n1zTqeyZtraswBXBdSFDfRb6CcT+
	2kOBsT78r6kj0tJfzBn4QDr6IsXVtlrRF42VzmaqA52KhbrBjqqmxUbIhnqtSuJLslf0yji3V1yfg
	zZkkM0RLqw2r8T9UL1ABCnMJTpzih/qk1Qif5cQAs1uZUrdHkv4WhkVQm8XU5p4olsYJ4whP5F96H
	HX0az3CbVLCwmiJEr6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mub4z-008pQc-8K; Tue, 07 Dec 2021 14:04:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mub3r-008p3l-P6; Tue, 07 Dec 2021 14:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638885795; x=1670421795;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lxiZjUXfOMeyNxaei212rWyGpKWu16Y8Wx3xUMd/9dU=;
 b=IwxuX5pGhKM9hx9eL0qfZXfkSE2ViSYwe/3+tHvEu1egKttOb2Y0BRny
 X0e53MHeuOwz3JzkdvYhMBULLdvB8eI3M1NIizirduO3xzXt3olWtJRaZ
 gmo8AYam4REED6znt0dPOdw1kku21Rbw01Q2oobIWM6SwFmAZE5W97ybD
 v6SoMtYKAiG9Tagf4TCkKjlcMgRs/BmWCzRbTu3SYfWGa/nazWWEEEpEO
 cS3d0MRAd3+5aLXt/30NzVvjkhYRwwKw9MIDUmaUxo2ceYYTe6Gbp/TvL
 mgnNwlzAkBWqhJyRi8VbjzrpMTRgR+mEgBKktQgFnkuBZ1PkaEonZxuJs A==;
IronPort-SDR: 7jxl6fhHQ4ChP5RA2GKy8CUUnEDshSfyxK4wEvSUEtDqeDIRi/dgrQvPEWjwrE8s71F6vHiT8G
 D/5PyS7x0wHZsK3DinVyLm9IRhWjMuLZv6t24LS12lJanj+OIZHpIJST+vgH5m66z6u2+DUU6t
 Vi6DZ7rbqhB4+4wh7psQVX91xem87cl9Szxohl3pF7CgVKjXlb0PrPEsNQxjnWV3ZkGUCdoD9q
 WgZIOizMTYsYXlyr7U85KCtEEPV+cywfBzcQYVroixOzltuOi/uZpRok0ZrehXbgRtj1T7sZ6K
 n9rAOVPqKnLrAZ3CWmzswBgT
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="138953508"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 07:03:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 07:03:01 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 07:02:56 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
Subject: [PATCH v6 00/14] mtd: spi-nor: Clean params init
Date: Tue, 7 Dec 2021 16:02:40 +0200
Message-ID: <20211207140254.87681-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_060315_922964_708DC30E 
X-CRM114-Status: GOOD (  13.52  )
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

Changes in v6:
patch 2/14: drop Fixes tag
patch 6/14: fix alignment of flash declarations in micron-st,
            spansion, and sst drivers
patch 9/14:
- fix missing variable in if condition in spi_nor_init_params_deprecated()
- call spi_nor_no_sfdp_init_params() if(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP)
- remove redundant !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) check
in spi_nor_init_params_deprecated()
- update description of spi_nor_init_params() with spi_nor_no_sfdp_init_params()
- add Pratyush's R-b tag
patches 11, 12, 13, 14: dump jedec_id, manufacturer partname and sfdp (including
sfdp sha1sum)

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
 drivers/mtd/spi-nor/core.c       | 503 +++++++++++++++++--------------
 drivers/mtd/spi-nor/core.h       | 206 ++++++++-----
 drivers/mtd/spi-nor/eon.c        |  33 +-
 drivers/mtd/spi-nor/esmt.c       |  15 +-
 drivers/mtd/spi-nor/everspin.c   |  12 +-
 drivers/mtd/spi-nor/fujitsu.c    |   3 +-
 drivers/mtd/spi-nor/gigadevice.c |  57 ++--
 drivers/mtd/spi-nor/intel.c      |  12 +-
 drivers/mtd/spi-nor/issi.c       |  60 ++--
 drivers/mtd/spi-nor/macronix.c   | 105 ++++---
 drivers/mtd/spi-nor/micron-st.c  | 210 +++++++------
 drivers/mtd/spi-nor/otp.c        |   2 +-
 drivers/mtd/spi-nor/sfdp.c       |  20 ++
 drivers/mtd/spi-nor/spansion.c   | 158 +++++-----
 drivers/mtd/spi-nor/sst.c        |  88 ++++--
 drivers/mtd/spi-nor/swp.c        |   2 +-
 drivers/mtd/spi-nor/winbond.c    | 161 +++++-----
 drivers/mtd/spi-nor/xilinx.c     |   2 +-
 drivers/mtd/spi-nor/xmc.c        |  10 +-
 21 files changed, 986 insertions(+), 759 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
