Return-Path: <SRS0=K+kN=OU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EBCC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 10:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A436115A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Sep 2021 10:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05A436115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FOPt5PgHN/Qm6fl9/yKX6YXi4NU9+LE2RFs8pyJ/j7I=; b=c3n7U1tL4d4ogz
	IksD3/UkYPx9B8VyRVOwcqnvgmyCT2UWElBVLpohBk5qP/X8JVHzA1YRpyb5VgIuEGZyj/etLFZ5y
	sHSpylrmeOJvxwkEEOU54WFI97jHglLQznjh5fT6mWMWngTTACGefHPRnav7N4mbx/J39CBywnASP
	33eVGnBQDsa0jCHVTw8S7Pai75+/JQY97Yur5uBtq+TIOTvlRn/jTP9sgv5+B62yZ5EOZlNHfoOtD
	X+7w7VhVr223QM1+EUSsWGyzQvWFEoMbCFsf6in0hbXkpYysu1EbbTxarLxVxlEkqD9WMwxH0IuF2
	DYvwslerhQ+qh/dAKEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVsyb-00DjYW-5h; Thu, 30 Sep 2021 10:07:41 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVsyF-00DjQR-J5
 for linux-mtd@lists.infradead.org; Thu, 30 Sep 2021 10:07:21 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="212408753"
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="212408753"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 03:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,335,1624345200"; d="scan'208";a="476946999"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 30 Sep 2021 03:07:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id B25C9118; Thu, 30 Sep 2021 13:07:19 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to SPI MEM
Date: Thu, 30 Sep 2021 13:07:16 +0300
Message-Id: <20210930100719.2176-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_030719_713161_90A917BF 
X-CRM114-Status: GOOD (  20.25  )
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

Hi all,

Based on discussion on the patch I sent some time ago here:

  http://lists.infradead.org/pipermail/linux-mtd/2021-June/086867.html

it turns out that the preferred way to deal with the SPI flash controller
drivers is through SPI MEM which is part of Linux SPI subsystem.

This series does that for the intel-spi driver. This also renames the
driver to follow the convention used in the SPI subsystem. The first patch
improves the write protection handling to be slightly more safer. The
following two patches do the conversion itself. Note the Intel SPI flash
controller only allows commands such as read, write and so on and it
internally uses whatever addressing etc. it figured from the SFDP on the
flash device.

I have tested this series on two systems with hardware sequencer (full
erase, write) and on a laptop with software sequencer (read only since I
don't have any means to restore the flash contents if something goes
wrong).

Let me know if it is better to send the full patches without rename
detection.

Mika Westerberg (3):
  mtd: spi-nor: intel-spi: Disable write protection only if asked
  mtd: spi-nor: intel-spi: Convert to SPI MEM
  Documentation / MTD: Rename the intel-spi driver

 Documentation/driver-api/mtd/index.rst        |   2 +-
 .../mtd/{intel-spi.rst => spi-intel.rst}      |   8 +-
 drivers/mfd/lpc_ich.c                         |  59 ++-
 drivers/mtd/spi-nor/controllers/Kconfig       |  36 --
 drivers/mtd/spi-nor/controllers/Makefile      |   3 -
 drivers/mtd/spi-nor/controllers/intel-spi.h   |  21 --
 drivers/spi/Kconfig                           |  38 ++
 drivers/spi/Makefile                          |   3 +
 .../intel-spi-pci.c => spi/spi-intel-pci.c}   |  49 ++-
 .../spi-intel-platform.c}                     |  21 +-
 .../intel-spi.c => spi/spi-intel.c}           | 341 +++++++++++-------
 drivers/spi/spi-intel.h                       |  19 +
 include/linux/mfd/lpc_ich.h                   |   2 +-
 .../x86/{intel-spi.h => spi-intel.h}          |  12 +-
 14 files changed, 353 insertions(+), 261 deletions(-)
 rename Documentation/driver-api/mtd/{intel-spi.rst => spi-intel.rst} (94%)
 delete mode 100644 drivers/mtd/spi-nor/controllers/intel-spi.h
 rename drivers/{mtd/spi-nor/controllers/intel-spi-pci.c => spi/spi-intel-pci.c} (84%)
 rename drivers/{mtd/spi-nor/controllers/intel-spi-platform.c => spi/spi-intel-platform.c} (65%)
 rename drivers/{mtd/spi-nor/controllers/intel-spi.c => spi/spi-intel.c} (78%)
 create mode 100644 drivers/spi/spi-intel.h
 rename include/linux/platform_data/x86/{intel-spi.h => spi-intel.h} (64%)

-- 
2.33.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
