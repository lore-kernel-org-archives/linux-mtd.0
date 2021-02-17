Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC39C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 11:03:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 249D864E76
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 11:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 249D864E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sv91Xzqenc3iMM3LgpMGpLS3GlbcGBqxwj+HUUG13Ng=; b=liY+LCC+b3qjb7nyTBg1RtbFh
	/5H8Om2yFTh5lKQaPOKkhCuIkq6J+5SOoLRwmCEuEFc+3w01k70Rjx8xJVFLamqFFxI5Jnh4nSbbL
	sWNsgxFOqynmcCXvxiQLQ/i+T9SmzF8SMFXuTxzIa3FOyZ4Tdc1XXvFuIPpW6FRkoPY9hdDDUZi0X
	VBfqF4daGkS2e9KzZSO9VTOB2Mj2+DV+kCZGHtXMHIPWY4Gklp9edUuNg99OCdoCVMfovvrE59qkS
	hFwPupHmmfUCG33d7nurw/sag1mUv6dsFFYYBlgLsmNQkeRWDU4VSQz/enxgguRWnzpS+iTugw6V6
	7JNcd2EIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCKbG-00070y-Gg; Wed, 17 Feb 2021 11:02:30 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCKbD-00070U-G0
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 11:02:28 +0000
IronPort-SDR: gQck0vKXujIJC/eL+I+n/l39FluCAibL1ZI7UDIrdFpIT/1KeP/Wh3vjlUIJEqB4AMRuCKLVNW
 JQ2aXcxzpzJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="180603996"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="180603996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 03:02:23 -0800
IronPort-SDR: ndU67Uz7VyDRZElHJE3LBsbDJqlkKLcu6bTYZ1s2JZ6m9e8K5Tukk1Xe1t1p5Qyt6ocenwyRrA
 bQEpp1sNaLWA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399912624"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 03:02:19 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210216181925.650082-1-tomas.winkler@intel.com>
Date: Wed, 17 Feb 2021 13:02:16 +0200
Message-ID: <878s7narev.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_060227_709876_82EBEE8E 
X-CRM114-Status: GOOD (  17.78  )
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

On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
> Intel discrete graphic devices have internal spi storage, that holds
> firmware and oprom images. The spi device is exposed to the user space
> via mtd framework to be accessed during manufacturing.
> The device is hardware locked after manufacturing and only read access
> is provided.
>
> The i915 plays role of a multi function device (mfd) and spi device
> is exposed as its child device. i915_spi platform driver binds to 
> this device.
>
> Because the graphic card may undergo reset at any time and basically hot
> unplug all its child devices, this series also provides a fix to the mtd
> framework to make the reset graceful.
>
> Tomas Winkler (9):
>   drm/i915/spi: add spi device for discrete graphics
>   drm/i915/spi: intel_spi_region map
>   drm/i915/spi: add driver for on-die spi device
>   drm/i915/spi: implement region enumeration
>   drm/i915/spi: implement spi access functions
>   drm/i915/spi: spi register with mtd
>   drm/i915/spi: mtd: implement access handlers
>   drm/i915/spi: serialize spi access
>   mtd: use refcount to prevent corruption
>
>  drivers/gpu/drm/i915/Kconfig             |   3 +
>  drivers/gpu/drm/i915/Makefile            |   6 +
>  drivers/gpu/drm/i915/i915_drv.c          |   9 +
>  drivers/gpu/drm/i915/i915_drv.h          |   4 +
>  drivers/gpu/drm/i915/i915_reg.h          |   1 +
>  drivers/gpu/drm/i915/spi/intel_spi.c     |  62 +++
>  drivers/gpu/drm/i915/spi/intel_spi.h     |  24 +

I'm open to discussion, but after glancing through the series I've got a
gut feeling spi/ subdir should be purely about the separate module, and
the above two files should be in i915/ directory instead.

As it is, I think it's a bit confusing that spi/ is both about the spi
kernel module and a singly .c file that's really part of
i915.ko. Perhaps that messes up the conventional descending to subdirs
in the kernel build too?

BR,
Jani.

>  drivers/gpu/drm/i915/spi/intel_spi_drv.c | 675 +++++++++++++++++++++++
>  drivers/mtd/mtdcore.c                    |  63 ++-
>  drivers/mtd/mtdcore.h                    |   1 +
>  drivers/mtd/mtdpart.c                    |  13 +-
>  include/linux/mtd/mtd.h                  |   2 +-
>  12 files changed, 831 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.c
>  create mode 100644 drivers/gpu/drm/i915/spi/intel_spi.h
>  create mode 100644 drivers/gpu/drm/i915/spi/intel_spi_drv.c

-- 
Jani Nikula, Intel Open Source Graphics Center

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
