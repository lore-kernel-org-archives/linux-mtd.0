Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D9EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 11:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3511610A2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 11:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3511610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6NdtRVSqPDE3OyLCKsVF9Peu1YKGPYohFkv0GwjQWpo=; b=4XA8yatXYMQ35V
	FAM+BN3nWkEumqs3LB7jqrGSmV/nwzyp/MhI1505eYyBNd3IpUxp9lWDZNdoJCtA3vhPwjR3LPvjj
	jVbsDUbMiNX35JkoQSAprM/H1Kopsq5asVk3Ltnq4Jz6KeHKKEd/wYUgZciZwPdRd2duTFEN2zpsq
	XkN9H/Jk3ueTLBnEJTl4uRM/JrrM9Bezw/2HNasBF7f07UbY/TmvkOux1EU7yvUyw/WWqSBdCOG4r
	3XeqQtJPOYy+iEqm0cLWEZJKfy+crIphWR7KA+22vAJs34HDGbZZ5n1lyLkFS3cax+N11u4DaO0ce
	xsh8XVCCLnqfxL35vC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYRTf-00H55y-VZ; Thu, 07 Oct 2021 11:22:20 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYRSz-00H4um-9j
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 11:21:38 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="224996410"
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="224996410"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 04:21:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,354,1624345200"; d="scan'208";a="488941198"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 07 Oct 2021 04:21:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id E3B2E159; Thu,  7 Oct 2021 14:21:32 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH v2 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to SPI MEM
Date: Thu,  7 Oct 2021 14:21:29 +0300
Message-Id: <20211007112132.30934-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_042137_415038_352BA59A 
X-CRM114-Status: GOOD (  18.35  )
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

Previous version of the patch series can be found here:

  https://lore.kernel.org/linux-mtd/20210930100719.2176-1-mika.westerberg@linux.intel.com/

Changes from the previous version:

  * Arrange dependencies in Kconfig entries the same way in both glue
    drivers.
  * Added empty lines between different subsystem includes.
  * dev_err() to single line
  * Return intel_spi_sw_cycle() directly in intel_spi_erase().
  * Drop redundant elses.
  * Fixed typo in the commit message of the patch 3/3.

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
 drivers/spi/Kconfig                           |  39 ++
 drivers/spi/Makefile                          |   3 +
 .../intel-spi-pci.c => spi/spi-intel-pci.c}   |  49 ++-
 .../spi-intel-platform.c}                     |  21 +-
 .../intel-spi.c => spi/spi-intel.c}           | 345 ++++++++++--------
 drivers/spi/spi-intel.h                       |  19 +
 include/linux/mfd/lpc_ich.h                   |   2 +-
 .../x86/{intel-spi.h => spi-intel.h}          |  12 +-
 14 files changed, 355 insertions(+), 264 deletions(-)
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
