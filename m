Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDE8C71157
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jun 2025 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ntBmddBT99RiNS1NXFSNJoYXDU13ZgKoXuWD/X2DUbw=; b=Gq1piJR0a/AOJl
	61APYt/YIuf+fziVw5QsdkPcrLtBtxho7BKXt51jQ4ouEqK50/n5BPp1SdMVHoIaBvNyL8mDnfWou
	iBbcSkfw4VanVrEvMXufVv1Ws7R6hjwQ2bV7kithAeWOdkzmTKwyOsIGGhngIEV6/FpRbEz3W34rD
	wS5v0GVv34GMS1T3V9sLLklDwCZOUwgayFg9toem94In9Kjs05wsHfEkHnADRv6roOtLwM3ipMCsK
	kWMuvU+Q7CBE32o6wDImtrXAJjy/JjqEs8cn7YvdHTPBq3tyI1XwG6KSvI09zVoF3qcgnEo6ylbFf
	eyIHXFhrk08ZY+kAlZig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZpv-00000007y90-1PcD;
	Tue, 17 Jun 2025 17:11:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXsW-00000007gzo-1j4W
	for linux-mtd@bombadil.infradead.org;
	Tue, 17 Jun 2025 15:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vdTTMbppVDvi6HZyALKcd83EuvKIgsR07qvM064Ve4g=; b=blTFHFqXQVgiMSP+vNUm7zJSn1
	EwGjTRQQPK0ViXszew5DO0KtzVi1+2D1YvAgNCm2xOTwIGWGLddD+090wbYRk+PqOCKLDk622OQkI
	FXCc9ZDVl4+yVGknlpz6oBNQtU8JuJJzrCP5tj4mZnPBN9pC9wXfdrjiEk7bbD8/Yj2hgz3SLR1bv
	qx4UE6SKQ6TmxHbDfHVBSsHfu0WuNj+ehjH53hry0MMPmUz3lngDh9yhB6uOl0JAWxSZsrLbMyA4H
	hDU1G9JTX+R5lk/1PtfNNcV4vYs03DCebb/1scS/Ucd2rbnMbu/l2sE/Lo7T4hz5K4E62vV4Eg9E0
	35a06jpA==;
Received: from mgamail.intel.com ([192.198.163.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRXsT-00000003pW6-43iY
	for linux-mtd@lists.infradead.org;
	Tue, 17 Jun 2025 15:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750172734; x=1781708734;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DX0cysxt7A+oa4cRvsJUSUuglXznBhRfZDERFVFd1ek=;
  b=ZPUIwkOPI1ZMLGIR74ctA7arRDz82s5CODpP382I+ZmGpL3FG5yXwO4i
   /FcaWqPX27nTBv6/+YbTnm1LF6B70r3mHfT4rkbVLMEGlMGWcnYKv/qZM
   QJjgS8bn0/qkr0z6q45iwv0YniBJDMMgemkH0JguniH/7HvrQPjujkNHL
   iXU0YtJUbyMzkRHW6LeOIfe6+z0HOvr/Ply4LV98XEg2fPWjRnPBS+Fwd
   9N/sTBo1NfyrDB9BkURoIw6unktZ7v3tp4HolrtU/qGAMIlTuuv6mMJso
   iHqeyfN1DezvnJ4Da/rqHPcWSXBJXTklc3osEvuMwxQz5kwIEEvj+J9c+
   Q==;
X-CSE-ConnectionGUID: OFq1zUufQ36XMQRqW1ZLJw==
X-CSE-MsgGUID: /lCekVQTQZaCD7wkCm9sxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63008704"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="63008704"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:05:30 -0700
X-CSE-ConnectionGUID: lUYQSzGuSgGKTYlYLKHIVA==
X-CSE-MsgGUID: ouRr0Fn7QaGWRa6lpD92yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="152672070"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 08:05:24 -0700
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
	Karthik Poosa <karthik.poosa@intel.com>,
	Raag Jadav <raag.jadav@intel.com>
Cc: Reuven Abliyev <reuven.abliyev@intel.com>,
	linux-mtd@lists.infradead.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [PATCH v14 0/8] mtd: add driver for Intel discrete graphics
Date: Tue, 17 Jun 2025 17:51:50 +0300
Message-ID: <20250617145159.3803852-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_160534_415210_0F435F27 
X-CRM114-Status: GOOD (  13.90  )
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

V9: Fix checkpatch warning on non-posted erase patch.
    Add Rodrigo's review and ack.

V10: Drop master device creation patch as it now in mtd-next.
     Drop power-management patch, it will be merged lately after
     master device patch is propagated.
     Rebase over drm-tip.

V11: Fix review comments.
     Add reviewed-by.
     Add cleanup in error path.
     Add PADDING region that exists on some BMG devices.

V12: Add Raag's r-b.
     Rebase over drm-tip.

V13: Rebase over drm-tip again to make it mergable.

V14: Drop i915 patches for now by Rodrigo's request.
     They will be merged later.

Alexander Usyskin (7):
  mtd: add driver for intel graphics non-volatile memory device
  mtd: intel-dg: implement region enumeration
  mtd: intel-dg: implement access functions
  mtd: intel-dg: register with mtd
  mtd: intel-dg: align 64bit read and write
  drm/xe/nvm: add on-die non-volatile memory device
  drm/xe/nvm: add support for access mode

Reuven Abliyev (1):
  drm/xe/nvm: add support for non-posted erase

 MAINTAINERS                           |   7 +
 drivers/gpu/drm/xe/Makefile           |   1 +
 drivers/gpu/drm/xe/regs/xe_gsc_regs.h |   4 +
 drivers/gpu/drm/xe/xe_device.c        |   5 +
 drivers/gpu/drm/xe/xe_device_types.h  |   6 +
 drivers/gpu/drm/xe/xe_heci_gsc.c      |   5 +-
 drivers/gpu/drm/xe/xe_nvm.c           | 167 ++++++
 drivers/gpu/drm/xe/xe_nvm.h           |  15 +
 drivers/gpu/drm/xe/xe_pci.c           |   6 +
 drivers/mtd/devices/Kconfig           |  11 +
 drivers/mtd/devices/Makefile          |   1 +
 drivers/mtd/devices/mtd_intel_dg.c    | 830 ++++++++++++++++++++++++++
 include/linux/intel_dg_nvm_aux.h      |  32 +
 13 files changed, 1086 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.c
 create mode 100644 drivers/gpu/drm/xe/xe_nvm.h
 create mode 100644 drivers/mtd/devices/mtd_intel_dg.c
 create mode 100644 include/linux/intel_dg_nvm_aux.h

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
