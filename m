Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77379C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 12:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bBGoiCOjSzLpdVt+K5vQVaUti6LXst804ycZzhlMxE0=; b=S5njFFQh2/bStk
	mNDfABVEe6+0tjBWf1m/ecZTSe3swJombtIxpiIAaomiFlTygpoGoP7iNulkm+xHTiJCcKx1XZufG
	ibOpzAP5U+pNkk2BAABI8DMrVP+n1HdMtvY4/sFIsL1aAPqjZkLhasM4waEQaUTjCzmwVa1MZTczV
	7IzwzyvXXmX5HDCZm7opxYneSp6eimvOVr6RTWq9PDBtxNj3zdg+dVy0qMblRIxnmCHP8yEXpZpcE
	5NaHUINr0vKjPQwW9Z0Ue3saraRz3mXV4f14st0cr7XhwvvKxW7GzaS87dRnqUPBQ7eCzXiCYaU44
	iePSHm57wMKHIpxCaneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHm4W-00Hapx-GR; Wed, 09 Feb 2022 12:27:44 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHm46-00Ham1-R1
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 12:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644409638; x=1675945638;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f5YRrzdrcrmQub6o/I68LvZKeDeM+mn9ZaD3mStbYdY=;
 b=UIQKnGRd2+XKoDUpO/5UaEDySOoXUgBfef/ObkQLN052AVMzL8TZ9WgZ
 Zh2hugHlpXWkd3l4OOER07k6yk1wjRwBTaESJQ9kMoJxH3KmmW5fiXRgX
 tiE61Elx9TbbIftdQPOSIVtxuAdO0jB19RJKLLPuO3ewkOuCaG0w6EMg4
 cobyaUgSfK7fSvdmRw/6JUE6iPyOnBEcxaTh2vXYUIxWiygLkPc/axuwC
 dD6W1da34irooZsrwqDrdO9ejinCW2ZrRiXU+1W4RkSDWYC4ccNlLwTq/
 CzNF/L2Jq+olp4JJR6qzO7hN7CRYE/IM3BS18jdiUt0NGQEOJqMfH5iOX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273727942"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="273727942"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 04:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="585546838"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2022 04:26:52 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 37728509; Wed,  9 Feb 2022 14:27:06 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [PATCH v6 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to SPI MEM
Date: Wed,  9 Feb 2022 15:27:03 +0300
Message-Id: <20220209122706.42439-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_042718_924014_4369234D 
X-CRM114-Status: GOOD (  21.72  )
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

Previous versions of the patch series can be found here:

  v5: https://lore.kernel.org/linux-mtd/20211220164625.9400-1-mika.westerberg@linux.intel.com/
  v4: https://lore.kernel.org/linux-mtd/20211118130543.11179-1-mika.westerberg@linux.intel.com/
  v3: https://lore.kernel.org/linux-mtd/20211013114432.31352-1-mika.westerberg@linux.intel.com/
  v2: https://lore.kernel.org/linux-mtd/20211007112132.30934-1-mika.westerberg@linux.intel.com/
  v1: https://lore.kernel.org/linux-mtd/20210930100719.2176-1-mika.westerberg@linux.intel.com/

Changes from v5:

  * Added tags from Pratyush Yadav and Tudor Ambarus
  * Added replacement_op field to intel_spi_mem_op to be used with
    erase operations
  * Return -EOPNOTSUPP if no match is found in intel_spi_exec_mem_op()

Changes from v4:

  * Correct check in intel_spi_cmp_mem_op()
  * Added tag from Boris

Changes from v3:

  * Create an array of supported opcodes and reject everything else.
  * Fix checkpatch warnings reported by Mauro
  * Added tags from Lee and Mauro

Changes from v2:

  * Added tag from Andy
  * Check buswidth in intel_spi_supports_mem_op() and return false if octal
    mode is asked. The Intel controllers support buswidths 1-4 but this is
    not exposed to software. It figures this itself through SFDP tables.
  * In case of software sequencer, support same opcodes than we support with
    the hardware sequencer if found in the opcodes table.

Changes from v1:

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
 drivers/mfd/lpc_ich.c                         |  59 +-
 drivers/mtd/spi-nor/controllers/Kconfig       |  36 -
 drivers/mtd/spi-nor/controllers/Makefile      |   3 -
 drivers/mtd/spi-nor/controllers/intel-spi.h   |  21 -
 drivers/spi/Kconfig                           |  39 +
 drivers/spi/Makefile                          |   3 +
 .../intel-spi-pci.c => spi/spi-intel-pci.c}   |  49 +-
 .../spi-intel-platform.c}                     |  21 +-
 .../intel-spi.c => spi/spi-intel.c}           | 850 ++++++++++++------
 drivers/spi/spi-intel.h                       |  19 +
 include/linux/mfd/lpc_ich.h                   |   2 +-
 .../x86/{intel-spi.h => spi-intel.h}          |  12 +-
 14 files changed, 719 insertions(+), 405 deletions(-)
 rename Documentation/driver-api/mtd/{intel-spi.rst => spi-intel.rst} (94%)
 delete mode 100644 drivers/mtd/spi-nor/controllers/intel-spi.h
 rename drivers/{mtd/spi-nor/controllers/intel-spi-pci.c => spi/spi-intel-pci.c} (84%)
 rename drivers/{mtd/spi-nor/controllers/intel-spi-platform.c => spi/spi-intel-platform.c} (65%)
 rename drivers/{mtd/spi-nor/controllers/intel-spi.c => spi/spi-intel.c} (55%)
 create mode 100644 drivers/spi/spi-intel.h
 rename include/linux/platform_data/x86/{intel-spi.h => spi-intel.h} (64%)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
