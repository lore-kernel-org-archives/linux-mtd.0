Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C9BC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA65364E04
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 18:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA65364E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MFHKyuAZeZgHZ3jXVltcqhCR/UrRaF0aMVMEFi2Pumw=; b=hcJ9AQwG7yxsNUWHFTSnkkGT8P
	+WcMxmJsEdVrZP6NG0jNj30AAX726bXDVo58Fl3qVef8Lu/mLxdy/kx/4jY2A4bGeLa420+si0G2A
	S1SQxlmqVd6BCzTOvqdKg2evsXBW/IfkQHbwU4gJzutNPvQYoOJnGtER4qUs+53T+dgr64Sj8k7m7
	yhFiieEGN/XyPuhyeSM+2VJC2vVm6Q7VEci57dsYSM4upOSEhjnmuQwJULHAYQuxB0022VS/bB1E2
	9dVWJiudrn14LtyCkQ7xGDPk4N7maJ45cjocWzM4OdPHPA6Ja/qXcqiICtHvv33XTWKqyVBgOa5lZ
	0rP/cmVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4x3-0005tO-UL; Tue, 16 Feb 2021 18:19:57 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4wz-0005sF-IZ
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 18:19:55 +0000
IronPort-SDR: SN/p7bMqWIhq44SUtiOl2A4GZb0T3E9qVsU7/lB1dOj4IYQXQ/aIsOoHo+fh2S6Q/Zx9UjmdWW
 blafHV2Tbicw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="180412980"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="180412980"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:19:42 -0800
IronPort-SDR: kVRW30FBHl6jQ07M4Kli/gFcqT8uIQvnQd5fLDWpcvd67pFC4oc7NYHGGbTwH7n/WfSc41kukB
 L9jBb9dAMW2g==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399608957"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2021 10:19:39 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Date: Tue, 16 Feb 2021 20:19:16 +0200
Message-Id: <20210216181925.650082-1-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_131954_520913_4FFE1C6F 
X-CRM114-Status: GOOD (  11.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Intel discrete graphic devices have internal spi storage, that holds
firmware and oprom images. The spi device is exposed to the user space
via mtd framework to be accessed during manufacturing.
The device is hardware locked after manufacturing and only read access
is provided.

The i915 plays role of a multi function device (mfd) and spi device
is exposed as its child device. i915_spi platform driver binds to 
this device.

Because the graphic card may undergo reset at any time and basically hot
unplug all its child devices, this series also provides a fix to the mtd
framework to make the reset graceful.

Tomas Winkler (9):
  drm/i915/spi: add spi device for discrete graphics
  drm/i915/spi: intel_spi_region map
  drm/i915/spi: add driver for on-die spi device
  drm/i915/spi: implement region enumeration
  drm/i915/spi: implement spi access functions
  drm/i915/spi: spi register with mtd
  drm/i915/spi: mtd: implement access handlers
  drm/i915/spi: serialize spi access
  mtd: use refcount to prevent corruption

 drivers/gpu/drm/i915/Kconfig             |   3 +
 drivers/gpu/drm/i915/Makefile            |   6 +
 drivers/gpu/drm/i915/i915_drv.c          |   9 +
 drivers/gpu/drm/i915/i915_drv.h          |   4 +
 drivers/gpu/drm/i915/i915_reg.h          |   1 +
 drivers/gpu/drm/i915/spi/intel_spi.c     |  62 +++
 drivers/gpu/drm/i915/spi/intel_spi.h     |  24 +
 drivers/gpu/drm/i915/spi/intel_spi_drv.c | 675 +++++++++++++++++++++++
 drivers/mtd/mtdcore.c                    |  63 ++-
 drivers/mtd/mtdcore.h                    |   1 +
 drivers/mtd/mtdpart.c                    |  13 +-
 include/linux/mtd/mtd.h                  |   2 +-
 12 files changed, 831 insertions(+), 32 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h
 create mode 100644 drivers/gpu/drm/i915/spi/intel_spi_drv.c

-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
