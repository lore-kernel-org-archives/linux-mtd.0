Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965E3C54E67
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 12:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4mMPUp3d9/+QI/PMgNsomipekRluLfyEjofT6TjYdHM=; b=cXxjhuqqQ+CZsI
	E150nQctQ04u0ThxSHsV49efjaBwabfLhJy1ah5CCWL+MU/AwIsj+MX+8ItYMcQHGVWasbliy6Le9
	Vtoszh8S+WJH+52uuaZfrn6xEh6Evx+tEXSPd8qrlX77591TGO5HjrjGCi6IQsft5G1x1jggg6B00
	TkbZKOKPv1zxW8zf5YTvB2PNbVoH6C8IGTE/coS5ysD6I6FyjYGqPoEiOs+Q/YB8q/F5KQcz3zvfY
	yIZ+E5Y81C5Zl/64JBQMH/qc75Cf7lf4X3jS8M8/RerTR12CcJzP5op5UCu1q/ipggO9qvtrS8zOe
	z/MLFydVG3j53d3kO6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpopr-0000000DtEU-36xY;
	Thu, 28 Mar 2024 12:26:23 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpopo-0000000DtCV-0v2C
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 12:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711628780; x=1743164780;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ytuL6nijnEtsmbOuiFbmt070AZ7CBXvjNNko4leDU6E=;
  b=LAzvso+3sct7IMyzoxp+IvoJNpst2GzuW5o4APaSsZpXIpMvGDVJK5wr
   93R1pfPe3HSokIMH1laM90FLqTJDzjsoTd4+w3B03sisUMFAtPSHHUO3z
   AjcdiTifY0GMWkRuj3Hk3gKlRMl6XpubsddnwfFvRKwabthfTpj4xWdtZ
   TVVXyA2EXnS1GGr6OqxKpPRICZw/BJPogXzy/z0aAwOaQz+AVerpT3taC
   1GlsMY64s/VyZex2WghmwI5QbmZy1kPb9O12pPMQarHh5/kLGUzHTulhA
   8VGy7qPT2ga/DL3gGcC46JNTi04Yt3FZOGF65oDAxcp4HFE2OMHiEES+J
   g==;
X-CSE-ConnectionGUID: nylHtJs5Tt6eoDs6T4/rOQ==
X-CSE-MsgGUID: RRA2R6tdS5ShlCyFFR6T2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17505432"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="17505432"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16657560"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 05:26:14 -0700
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
Subject: [PATCH 00/13] spi: add driver for Intel discrete graphics
Date: Thu, 28 Mar 2024 14:22:23 +0200
Message-Id: <20240328122236.1718111-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_052620_296328_637E123B 
X-CRM114-Status: GOOD (  11.31  )
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

Add driver for access to Intel discrete graphics card
internal SPI device.
Expose device on auxiliary bus by i915 and Xe drivers and
provide spi driver to register this device with MTD framework.

This is a rewrite of "drm/i915/spi: spi access for discrete graphics"
series with connection to the Xe driver and splitting
the spi driver part to separate module in spi subsystem.

Alexander Usyskin (13):
  spi: add auxiliary device for intel dg spi
  drm/i915/spi: add spi device for discrete graphics
  drm/i915/spi: add intel_spi_region map
  drm/i915/spi: add support for access mode
  spi: add driver for intel graphics on-die spi device
  spi: intel-dg: implement region enumeration
  spi: intel-dg: implement spi access functions
  spi: intel-dg: spi register with mtd
  spi: intel-dg: implement mtd access handlers
  spi: intel-dg: align 64bit read and write
  spi: intel-dg: wake card on operations
  drm/xe/spi: add on-die spi device
  drm/xe/spi: add support for access mode

 drivers/gpu/drm/i915/Makefile         |   4 +
 drivers/gpu/drm/i915/i915_driver.c    |   6 +
 drivers/gpu/drm/i915/i915_drv.h       |   4 +
 drivers/gpu/drm/i915/i915_reg.h       |   1 +
 drivers/gpu/drm/i915/spi/intel_spi.c  |  97 +++
 drivers/gpu/drm/i915/spi/intel_spi.h  |  15 +
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   5 +
 drivers/gpu/drm/xe/xe_device.c        |   3 +
 drivers/gpu/drm/xe/xe_device_types.h  |   5 +
 drivers/gpu/drm/xe/xe_heci_gsc.c      |   5 +-
 drivers/gpu/drm/xe/xe_spi.c           | 107 ++++
 drivers/gpu/drm/xe/xe_spi.h           |  15 +
 drivers/spi/Kconfig                   |  11 +
 drivers/spi/Makefile                  |   1 +
 drivers/spi/spi-intel-dg.c            | 867 ++++++++++++++++++++++++++
 include/linux/intel_dg_spi_aux.h      |  27 +
 17 files changed, 1170 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h
 create mode 100644 drivers/gpu/drm/xe/xe_spi.c
 create mode 100644 drivers/gpu/drm/xe/xe_spi.h
 create mode 100644 drivers/spi/spi-intel-dg.c
 create mode 100644 include/linux/intel_dg_spi_aux.h

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
