Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0526DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF00B60E98
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF00B60E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TN7hw30ppu0o29uzN2nDcrmiq2zICcWhH8OkVrwVYzY=; b=qCbgSgt6FaHFCs
	R9Vlm5lavHX0P9RkIn61g7l2jBSrotzRMXXuUy8P8lnWMhcpnsUCK00oEbcw2zgBq5fCDCgRGqE9e
	YqcgR6DbLOpHYI9VgjNW7CDPX+sDm97Ip91619D7egU1GETZK9TLrWN9yY0bSf/ScP8J3HumD3XUX
	n1zpQrJFCLxqOCtQJtpmsm554KeMz/PV7B/QWXc05Yekton7rv+6KNzulxlwliuRJbSBEvcjtYVCX
	oy5dEOeR+kxlLaj08pj6ZgmUaKy1qFURFpALDy6HUv3xLN2GjYmApWvsI2th4lSObEUwxQGCIQc+k
	nS9r+wMIV7cEXzjet2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVet-00BZAI-IS; Fri, 29 Oct 2021 17:27:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVeV-00BZ6j-4N; Fri, 29 Oct 2021 17:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528411; x=1667064411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YCGouzIq8e+BSUwzFjPuZojwtVcl1E7dDkRb2cjnCjk=;
 b=Y4U7y+axrZhE5bw9i7tAfbx5WF34Hq4JCxZCs8rXW017cZUudWmafxMq
 8GQKfMNxZO+3fO0fNM450K1hwXoRsVW3ol/0EvJ7NgZmzmXNX847zZ4k2
 BW1mMPHpNS5Z1FGAsKGTBFbVvVhwKbLrzAEyXQ8iphs6PPXt2lDuwN9dN
 sAiIcvns75ADskj62Tyy9e0avkB4Gcb0N1l6PFVNtEvXYUow5K6PJ+o/g
 KdWZ1Ok8Es7uvPTC5Y8ojr+3dlxOjDwi2hjbHeUQ3SXGFU+I0obH6yxS6
 BRbsQMsZLFZHJiwJp++ZxIEZOtidO5qV/FZQlNfsHs+snVZA92e7rM7N3 Q==;
IronPort-SDR: EJufF0UUcFE0RbQfttl9HAoFjGq02AMf34SdMdCy+SOuDRtTtW2XSne77u1C+2ahAlfxfJK4rY
 v0AoxNrjlAP8hcbkM91f50iErDEAIUjOoE4MQ8jD6tXrGHGpcELw+Uevf0p8z2A7F0z6fxiH3r
 MP1oZwn3RY6/CL+na0w7XEvZfr+Al00LD3nLDkMBC4/hEsAUb/wZ6mnh9PvN3/D+JyPnbNIMtB
 Q9YIZPu6NaCZC2JMah8yeAdBPaNgwUZLjOZDwjrjniH1wVRjDhNUaECIdhq7+6p9FbplNZNstR
 Rn6C1n4HPtqBKz+IZRKtlr1t
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="137361246"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:26:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:26:40 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:26:35 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 00/25] mtd: spi-nor: Clean params init
Date: Fri, 29 Oct 2021 20:26:08 +0300
Message-ID: <20211029172633.886453-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102651_268224_42AC8378 
X-CRM114-Status: GOOD (  10.57  )
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
Tested all the flashes from patch set. If someone can test the
locking ops on few flashes would be great. It seems that my flashes
have the non volatile bits weared out.

This patch set is split from:
https://lore.kernel.org/linux-mtd/20210727045222.905056-1-tudor.ambarus@microchip.com/
The ID collision series will be set in a dedicated patch set that will
depend on this one.

Changes in v3:
- move late_init() in struct spi_nor_fixups and update patches accordingly.     
R-b tags were dropped.
- new patch "mtd: spi-nor: sst: Get rid of SST_WRITE flash_info flag"
moves manufacturer specific flag out of the core.
- update methods description to make it clear who sets when
- introduce flash_info flag masks to make it clear when one should be set.
- rework "parse SFDP first idea".

Tudor Ambarus (25):
  mtd: spi-nor: core: Fix spi_nor_flash_parameter otp description
  mtd: spi-nor: core: Use container_of to get the pointer to struct
    spi_nor
  mtd: spi-nor: Introduce spi_nor_set_mtd_info()
  mtd: spi-nor: Get rid of nor->page_size
  mtd: spi-nor: core: Introduce the late_init() hook
  mtd: spi-nor: atmel: Use flash late_init() for locking
  mtd: spi-nor: sst: Use flash late_init() for locking
  mtd: spi-nor: winbond: Use manufacturer late_init() for OTP ops
  mtd: spi-nor: xilinx: Use manufacturer late_init() to set setup method
  mtd: spi-nor: sst: Use manufacturer late_init() to set _write()
  mtd: spi-nor: spansion: Use manufacturer late_init()
  mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is
    defined
  mtd: spi-nor: sst: Get rid of SST_WRITE flash_info flag
  mtd: spi-nor: Introduce flash_info flags masks
  mtd: spi-nor: Introduce spi_nor_nonsfdp_init_flags()
  mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
  mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
  mtd: spi-nor: core: Init flash params based on SFDP first for new
    flash additions
  mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
  mtd: spi-nor: sst: sst26vf064b: Init flash based on SFDP
  mtd: spi-nor: winbond: w25q256jvm: Init flash based on SFDP
  mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
  mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP
  mtd: spi-nor: issi: is25lp256: Init flash based on SFDP
  mtd: spi-nor: macronix: mx25l25635e: Init flash based on SFDP

 drivers/mtd/spi-nor/atmel.c      |   8 +-
 drivers/mtd/spi-nor/core.c       | 480 +++++++++++++++++--------------
 drivers/mtd/spi-nor/core.h       | 106 ++++---
 drivers/mtd/spi-nor/gigadevice.c |   7 +-
 drivers/mtd/spi-nor/issi.c       |   6 +-
 drivers/mtd/spi-nor/macronix.c   |  15 +-
 drivers/mtd/spi-nor/micron-st.c  |  20 +-
 drivers/mtd/spi-nor/otp.c        |   2 +-
 drivers/mtd/spi-nor/spansion.c   |  15 +-
 drivers/mtd/spi-nor/sst.c        | 105 ++++---
 drivers/mtd/spi-nor/swp.c        |   2 +-
 drivers/mtd/spi-nor/winbond.c    |   7 +-
 drivers/mtd/spi-nor/xilinx.c     |  21 +-
 include/linux/mtd/spi-nor.h      |   2 -
 14 files changed, 460 insertions(+), 336 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
