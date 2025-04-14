Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586DEC369B8
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Apr 2025 09:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JSxAt0VT0wp3EjVgusNIe6MxAh4tfXucvPpcXTCloy4=; b=QXq7jqQ6lHs6U1
	DYOReFDVAGoH3vMyPKu6GTOeHk/1UCFKHAwpAO9g8UekfYPoxlfxl0tMhHr178WZzDaQetLAEJlEG
	IPT3RR/ID4b/w9IpC/JOm4khvpvwbUd3zx0whvJtt0/ytVl8aPIh3N1WUp2p6U9Oxjv0Aod0MWoHR
	X0RcprItv0JMN61f/Q2xRGVT6hMMmihWi5ImSH6E2eNZxqmxE3h+aF/fyVFDTDzXVhvjUlFzYlOHT
	FiID51fJo2W8Fhnh1/3xY40WtTdiTAuV06a+QxzKhV5Fd4daO9yaYoWoVAJH39OSUiwynVfgdB5Jh
	Qeh2gdkf0NgaoV5pttwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GT3-00000001Kys-1dNy;
	Mon, 14 Apr 2025 09:51:05 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GRH-00000001KIL-3Xq4
	for linux-mtd@lists.infradead.org;
	Mon, 14 Apr 2025 09:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744624156; x=1776160156;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ndzYPRIDm/AVgAGmvgd5p3a/hBleFEOnvNJbaFIqhS0=;
  b=K5whGEHkWaQUIB2qJMDDCHpTIAL6JtCllkrRu4hk9X0IZmfgaJEY4oSr
   vd70ui3hnZrV+D3SseKkuYDKgWQ1uct68N1F/AqtgWAo4syT+6K6LSv2L
   15kPbcjTXFoi2uKzonXYrN+c/9DINeCZMraOwMDsjMUSylMCiG5x3gklI
   I1BuX0pLOr1RjtJCLR4gX6heCIvYsyt1eKXmXhU0oWBjqbVPJp2b6lXWD
   7sLY5QADZGOJmiE7GGW++vUvF1nU32rPiBm88xDiwLe3qHKNbK1T25wsH
   tg9Mhg9WlX6R2RTAj1ivWGBBCQk7Py1jjKqM60Fjqn2njq3cz3rsbHkAC
   Q==;
X-CSE-ConnectionGUID: oczrctvcRC6VW/Aik4NYJg==
X-CSE-MsgGUID: VEpiEK77TPaeuJefocElbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45222597"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="45222597"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:49:15 -0700
X-CSE-ConnectionGUID: +n11DQa5QV+XqyUoJY2YtA==
X-CSE-MsgGUID: vuGzZh5QTsiWpLUTN3ez2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="152954810"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 02:49:09 -0700
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karthik Poosa <karthik.poosa@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	Oren Weil <oren.jer.weil@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v8 00/12] mtd: add driver for Intel discrete graphics
Date: Mon, 14 Apr 2025 12:37:51 +0300
Message-ID: <20250414093803.2133463-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_024915_892539_9879004B 
X-CRM114-Status: GOOD (  14.39  )
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
internal NVM device.
Expose device on auxiliary bus by i915 and Xe drivers and
provide mtd driver to register this device with MTD framework.

This is a rewrite of "drm/i915/spi: spi access for discrete graphics"
and "spi: add driver for Intel discrete graphics"
series with connection to the Xe driver and splitting
the spi driver part to separate module in mtd subsystem.

This series intended to be pushed through drm-xe-next.

V2: Replace dev_* prints with drm_* prints in drm (xe and i915) patches.
    Enable NVM device on Battlemage HW (xe driver patch)
    Fix overwrite register address (xe driver patch)
    Add Rodrigo's r-b

V3: Use devm_pm_runtime_enable to simplify flow.
    Drop print in i915 unload that was accidentally set as error.
    Drop HAS_GSC_NVM macro in line with latest Xe changes.
    Add more Rodrigo's r-b and Miquel's ack.

V4: Add patch that always creates mtd master device
    and adjust mtd-intel-dg power management to use this device.

V5: Fix master device creation to accomodate for devices without
    partitions (create partitoned master in this case)
    Rebase over latest drm-xe-next
    Add ack's
V6: Fix master device release (use rigth idr in release)
    Rebase over latest drm-xe-next
    Grammar and style fixes

V7: Add patch with non-posted erase support (fix hang on BMG)
    Rebase over latest drm-xe-next

V8: Create separate partition device under master device, if requested
    and configure parent of usual partitions to this partition.
    Rebase over drm-tip.

Abliyev, Reuven (1):
  drm/xe/nvm: add support for non-posted erase

Alexander Usyskin (11):
  mtd: core: always create master device
  mtd: add driver for intel graphics non-volatile memory device
  mtd: intel-dg: implement region enumeration
  mtd: intel-dg: implement access functions
  mtd: intel-dg: register with mtd
  mtd: intel-dg: align 64bit read and write
  mtd: intel-dg: wake card on operations
  drm/i915/nvm: add nvm device for discrete graphics
  drm/i915/nvm: add support for access mode
  drm/xe/nvm: add on-die non-volatile memory device
  drm/xe/nvm: add support for access mode

 MAINTAINERS                           |   7 +
 drivers/gpu/drm/i915/Makefile         |   4 +
 drivers/gpu/drm/i915/i915_driver.c    |   6 +
 drivers/gpu/drm/i915/i915_drv.h       |   3 +
 drivers/gpu/drm/i915/i915_reg.h       |   1 +
 drivers/gpu/drm/i915/intel_nvm.c      | 115 ++++
 drivers/gpu/drm/i915/intel_nvm.h      |  15 +
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   4 +
 drivers/gpu/drm/xe/xe_device.c        |   5 +
 drivers/gpu/drm/xe/xe_device_types.h  |   6 +
 drivers/gpu/drm/xe/xe_heci_gsc.c      |   5 +-
 drivers/gpu/drm/xe/xe_nvm.c           | 161 +++++
 drivers/gpu/drm/xe/xe_nvm.h           |  15 +
 drivers/gpu/drm/xe/xe_pci.c           |   6 +
 drivers/mtd/devices/Kconfig           |  11 +
 drivers/mtd/devices/Makefile          |   1 +
 drivers/mtd/devices/mtd_intel_dg.c    | 884 ++++++++++++++++++++++++++
 drivers/mtd/mtdchar.c                 |   2 +-
 drivers/mtd/mtdcore.c                 | 152 +++--
 drivers/mtd/mtdcore.h                 |   2 +-
 drivers/mtd/mtdpart.c                 |  16 +-
 include/linux/intel_dg_nvm_aux.h      |  29 +
 include/linux/mtd/partitions.h        |   2 +-
 24 files changed, 1398 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
 create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
