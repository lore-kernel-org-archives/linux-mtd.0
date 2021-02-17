Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E81AC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 10:38:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9572664DF3
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 10:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9572664DF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5rCM9TkA5u+G0NuZTfb7TgXc6p4sBQMnxzTL7yC9+H4=; b=UVA+7j/qPAQnkPBsFNeNCBjiT
	i4uVctCnK/3zqH8ZcYVkrtZEvlsyG2pIlSrEutqwX1NmQgVOS5DUjt9aNgqNUGLy0YsSspo1C0Qq8
	gvnTtkQfQ7BLoCc2D7p/JofrU3gh4UV3IlXs7KwuHtFFWMvDTFrpLNtpmqBe3BALnoNqywuz5b3yv
	yZ80mNU4drL8czlouDRj3pBOrYyJcBcjQ/fdxwKVIvTVguJFRkKlDL2MzPrbwDO5kXQdY2j92ic7T
	7Fb+1IIuXwp1CyrBSGcSOCW5BhcAkhz4k11k2j5P9jPxZ61mrs0dw69NhvzvVqHHMMgaiCajlx18C
	rStJqURGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCKBz-0004i5-Rb; Wed, 17 Feb 2021 10:36:23 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCKBw-0004hS-F5
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 10:36:21 +0000
IronPort-SDR: kzPOs7S1NVuT9p76mGBRY3Z/e3PKKBkUGf1Jw+OQJKVkOv3IrcUbtFfOd2dlw3x8nfpZ8KzzCo
 vLL72nbvEZnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="183287405"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="183287405"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 02:36:15 -0800
IronPort-SDR: 2INRq4SZoquCpQPJ/wAOYvMsyb3qqFZbhwfbVHrNoCkU8y3YFlmzSDGf4csCIcZZXOtg/p3eXe
 o+GWd4WnNCfQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399907213"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 02:36:10 -0800
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
Date: Wed, 17 Feb 2021 12:36:07 +0200
Message-ID: <87k0r7asmg.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_053620_700079_EBC96028 
X-CRM114-Status: GOOD (  15.45  )
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

What's the plan wrt i915/spi maintainership?

BR,
Jani.

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
