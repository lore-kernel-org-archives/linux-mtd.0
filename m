Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B40C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 10:47:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E920364DF3
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 10:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E920364DF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LYQTX/nngxRibCfTQcAFP59tuV1IXNYBY/Hfxef9xnk=; b=dTL/PVnQ9hee4LfA/ma6AIEBE
	+zmprhQMgBPQ43+TvO3sJWtp7X9Zo4jZ5x/fMbvLYGdAfXK11ofHc40NmqrgiApp+4kCMX8/0V7C6
	4xPhcGyk8LCd7ffPOhlKw5D9fT6isRO693KduTOAdVy2LB5m0ri4trKROu/beSZDbCRRANL2WgGry
	kxWMD7V1Gii5xA6o3smcbWQpGfw+dXuoNAnb8IIFiNUqqnQzFu0XFcCOtFgoZmF4c/CP1CzhOCHpY
	3DHSPqm3dKm50d7aXg8a+jJowfXPZXEzWIDWRZq6gsAfE0pFdRWO2sFeV4JrEXfGu8hzFq7tHNC2v
	dOFm3floA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCKLp-0005bo-Nw; Wed, 17 Feb 2021 10:46:33 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCKLm-0005bA-Rp
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 10:46:31 +0000
IronPort-SDR: Fr/M6zws8W/L4T3M0soq0EmegRTu07nt28GwNm2LF0qL82V6k4OgFRZGnpAcadxbAG3HZQ91cM
 6y5PC0AmHZQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="183289206"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="183289206"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 02:46:29 -0800
IronPort-SDR: JMkYgxM+VO7VgaFsA29FBcDFFp3GSQHdzdgy6geCWG+J58g/ErzsDIWSCQqtZChC5uofLycB0H
 hgFqq1Lv7siA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399908969"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 02:46:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 2/9] drm/i915/spi: intel_spi_region map
In-Reply-To: <20210216181925.650082-3-tomas.winkler@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <20210216181925.650082-3-tomas.winkler@intel.com>
Date: Wed, 17 Feb 2021 12:46:22 +0200
Message-ID: <87eehfas5d.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_054631_054905_AC8B22C5 
X-CRM114-Status: GOOD (  16.76  )
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
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-mtd@lists.infradead.org, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 16 Feb 2021, Tomas Winkler <tomas.winkler@intel.com> wrote:
> Add the dGFX spi region map and convey it via mfd cell platform data
> to the spi child device.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> ---
>  drivers/gpu/drm/i915/spi/intel_spi.c | 9 +++++++++
>  drivers/gpu/drm/i915/spi/intel_spi.h | 5 +++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
> index 07da7197bd5d..6f83f24f7208 100644
> --- a/drivers/gpu/drm/i915/spi/intel_spi.c
> +++ b/drivers/gpu/drm/i915/spi/intel_spi.c
> @@ -14,11 +14,20 @@ static const struct resource spi_resources[] = {
>  	DEFINE_RES_MEM_NAMED(GEN12_GUNIT_SPI_BASE, 0x80, "i915-spi-mmio"),
>  };
>  
> +static const struct i915_spi_region regions[I915_SPI_REGIONS] = {
> +	[0] = { .name = "DESCRIPTOR", },
> +	[2] = { .name = "GSC", },
> +	[11] = { .name = "OptionROM", },
> +	[12] = { .name = "DAM", },
> +};
> +
>  static const struct mfd_cell intel_spi_cell = {
>  	.id = 2,
>  	.name = "i915-spi",
>  	.num_resources = ARRAY_SIZE(spi_resources),
>  	.resources = spi_resources,
> +	.platform_data = (void *)regions,
> +	.pdata_size    = sizeof(regions),
>  };
>  
>  void intel_spi_init(struct intel_spi *spi, struct drm_i915_private *dev_priv)
> diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h b/drivers/gpu/drm/i915/spi/intel_spi.h
> index 276551fed993..6b5bf053f7d3 100644
> --- a/drivers/gpu/drm/i915/spi/intel_spi.h
> +++ b/drivers/gpu/drm/i915/spi/intel_spi.h
> @@ -8,6 +8,11 @@
>  
>  struct drm_i915_private;
>  
> +#define I915_SPI_REGIONS 13
> +struct i915_spi_region {
> +	const char *name;
> +};

Does this need to be exposed to the rest of i915? If we're trying to
isolate spi/, I'd prefer it if this header was the only header included
from the rest of i915, and contained the minimum required information.

As the driver has grown bigger, we've tried to minimize the
interconnections between the modules, and it's slow going. Let's try to
keep the new parts isolated.

BR,
Jani.

> +
>  struct intel_spi {
>  	struct drm_i915_private *i915;
>  };

-- 
Jani Nikula, Intel Open Source Graphics Center

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
