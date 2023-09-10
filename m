Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8035EE14D8
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Sep 2023 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=etlyN8HT4IaBbomcgG4CEjGogWdRIqG8OtQ0zgK2q+I=; b=AW7LKhgEo/OBCu
	G0L/7YZ9h9ecKng2zjxph/ZzZo7WEWfe1YEieh/0iGcgNJipX3/uQy5P4UOfIdaOxfmIRIJ6hLIpn
	0xZBjguET5GMgizErnmURZZCLGvukqQxVrw1mps8SKuGfESzTzQSie74sQTGN1hNWsv/52Ja3Y7HJ
	CZAVUCnal4KseB9g01F4hRJ34l9ZfAhWY88bcY5NvKhsupzkkHDyWCNW9x9GiDFdYitHTECx344cr
	eTnheUkY6N3Ws1KCAJPJbIPr4MsIiD6SSKfqqE9eXupTEzGIm1sC7UAHSfnNedcrxpXpG+I8FG7hP
	/xnXwK815ZM43pTqs4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJnj-00Gb8M-39;
	Sun, 10 Sep 2023 12:44:31 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfJng-00Gb6z-0X
	for linux-mtd@lists.infradead.org;
	Sun, 10 Sep 2023 12:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694349868; x=1725885868;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CpTUXi17WIRqweC0f6oVujAzXfsCeus7646Tdx194rA=;
  b=N2Ko6/+gVNvgKK1O7tkrMnZIQ6As7AAYTmzVylJubFvkhvmlzm6qOQjS
   s7KU+odSWAnrTIBqBowTvptTZIvvYoo3rHO/jKNeilHF6/s47lfMUo+fG
   OGSFRydmP2zXcwh8Sn/Mx2CxIdhm51oEMNSqEBP1vYDIB43b1a2rOZcHZ
   7byjBM3xBMGoyUkvvmdjd6m47vd6D/3kVBziqaZ25xwsrgsL1djd5ABER
   WpMzUe8Wqi97n9u60N9MmPQ1B14/3xYSuj1hhx8kIO7wTPYgQgwasSnOA
   oRPHhxJD4dqafO0Qt09VN8iBYUMNAVcP3UFZ9UDpnd0BoWIgL3AjqV7YS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="441907073"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="441907073"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="1073814973"
X-IronPort-AV: E=Sophos;i="6.02,241,1688454000"; 
   d="scan'208";a="1073814973"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2023 05:44:22 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
	Vitaly Lubart <vitaly.lubart@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/10] drm/i915/spi: spi access for discrete graphics
Date: Sun, 10 Sep 2023 15:39:39 +0300
Message-Id: <20230910123949.1251964-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_054428_406219_ADCAA13D 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

Add driver for access to the discrete graphics card
internal SPI device.
Expose device on auxiliary bus and provide driver to register
this device with MTD framework.
This series is intended to be upstreamed through drm tree.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>


Alexander Usyskin (3):
  drm/i915/spi: align 64bit read and write
  drm/i915/spi: wake card on operations
  drm/i915/spi: add support for access mode

Jani Nikula (1):
  drm/i915/spi: add spi device for discrete graphics

Tomas Winkler (6):
  drm/i915/spi: add intel_spi_region map
  drm/i915/spi: add driver for on-die spi device
  drm/i915/spi: implement region enumeration
  drm/i915/spi: implement spi access functions
  drm/i915/spi: spi register with mtd
  drm/i915/spi: mtd: implement access handlers

 drivers/gpu/drm/i915/Kconfig             |   1 +
 drivers/gpu/drm/i915/Makefile            |   6 +
 drivers/gpu/drm/i915/i915_driver.c       |   7 +
 drivers/gpu/drm/i915/i915_drv.h          |   4 +
 drivers/gpu/drm/i915/i915_reg.h          |   1 +
 drivers/gpu/drm/i915/spi/intel_spi.c     | 101 +++
 drivers/gpu/drm/i915/spi/intel_spi.h     |  33 +
 drivers/gpu/drm/i915/spi/intel_spi_drv.c | 865 +++++++++++++++++++++++
 8 files changed, 1018 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi_drv.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
