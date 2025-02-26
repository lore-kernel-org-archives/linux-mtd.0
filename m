Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CEAC18E7C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2025 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=higDdQRigyqdLNJEfkvguekjHSMdWB67IoEv35C0llg=; b=lH76jTBqa1OdXD
	w+HTouzJ3Q51xKJB8Ajbtm682q4fMx/uMNssC/n3SfMeXz9c7M9P4c8l8JIPi/NTQ1ICSH2YnXlQu
	UmmeX28kM7WJ9JOPHYd8PHUdaE+zUC+LbeV2tJV8iN2qudrFIsK80QmwEFFpHj2Ul1NC8H7PtZ2jn
	ziKJHyBY+N8HhF37AW7SkHPbA+iWIYrU3Nf68mexETaiciDHUmj016XOvhFVZzqxm6RXqihkQ8dfx
	5BMeqEqNQUBLvUzMugTP/Rqb+bXNyu4lwmkVWyePQSRJG8idlkWD03aYwCKFaJJ6Bf2VaXJoeGBmR
	VJdsHlSGJe2580q/GlSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHSU-00000003uYt-2XEC;
	Wed, 26 Feb 2025 13:28:18 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnH3w-00000003llI-01uE
	for linux-mtd@lists.infradead.org;
	Wed, 26 Feb 2025 13:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740574976; x=1772110976;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ULpXsFAEFow3gkCLwgh86JGIiHc3fJj0geJeWnNoB8Y=;
  b=Z634I4sbkcZw+Bw8Zf5S6euwbyeXnZwgH6DxN3gFhZh37QB6XxTXK9Lh
   EKGdwR98EN7pQMgbZuq5O82SmLn8cY/7WiIjvE6bVLgub4F0yfpgq39O5
   6J1H+gQTw3rSm9YnI1E5PROz/gbQj4cjWll/PGX2DozvX0D3fhOnSP2rY
   EYvVu87O/afwGhsC0AdCvkjC9yVlccN9nvYekFZHoMLZ2LImyXGYSHO0V
   QS04c12u5ycDXilJ3wnOe8JWWf6uwsnVntxzelW4IpbT56NyghuXrOy7y
   POuoP2adE8W2y7JFLWx9JXiyJ7nnR6JhrRsyE1hf1h9ZJpk7uQ+zZ4xp1
   w==;
X-CSE-ConnectionGUID: KR/qz8uuTBWBb2G31Jz5/g==
X-CSE-MsgGUID: bww7PsZISc6vswFr2mcNkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41341469"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41341469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:02:55 -0800
X-CSE-ConnectionGUID: PPR1TWlpSYq/DOi6pbwKHA==
X-CSE-MsgGUID: /ubIuAZZQ6KN4fttNX62kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121690402"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 05:02:49 -0800
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
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v5 00/11] mtd: add driver for Intel discrete graphics
Date: Wed, 26 Feb 2025 14:51:32 +0200
Message-ID: <20250226125143.3791515-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_050256_074295_8F43BB3C 
X-CRM114-Status: GOOD (  13.30  )
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
 drivers/gpu/drm/xe/xe_nvm.c           | 131 ++++
 drivers/gpu/drm/xe/xe_nvm.h           |  15 +
 drivers/gpu/drm/xe/xe_pci.c           |   6 +
 drivers/mtd/devices/Kconfig           |  11 +
 drivers/mtd/devices/Makefile          |   1 +
 drivers/mtd/devices/mtd-intel-dg.c    | 845 ++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c                 | 135 ++--
 drivers/mtd/mtdcore.h                 |   2 +-
 drivers/mtd/mtdpart.c                 |  17 +-
 include/linux/intel_dg_nvm_aux.h      |  27 +
 22 files changed, 1310 insertions(+), 52 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.c
 create mode 100644 drivers/gpu/drm/i915/intel_nvm.h
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
 create mode 100644 drivers/mtd/devices/mtd-intel-dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
