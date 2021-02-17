Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8252FC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 10:58:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC92164E0F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 10:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC92164E0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=djbIEFy4vQXKqLC8ZfmAEQeLR8ldf10qpb40qcqea2w=; b=nu4G5LXqRvqraOWf8fZuYGY7O
	ksUoNhMj0xSnlehO1ws6mvYu2er60z1FZKt/cipudhlxKjKBtkmJRbM56j9bcQtTaSy1BysS2S/3U
	dRRb+c5PbqmOkQ9maDB0Rk+V+J52pl3Y96yCvWh5gFVcOQUnhfQ/OhCAwC1/AWifRgw0V4/IcFjJw
	O76iZI4Enn30VqsnkKuWZbbegHIZ+7/tKYh7Dz+MWMIna0t174ip8TKxf8whCWcBo+wZjJWRzvtj0
	sv/biSeRsTDBMCXOxx5lzNxkrabjDZfzd5n68joNg2kAdG0LzZo5I2evVKRrOQTrH6Nr+vRdbasq9
	cY0Fbs1oA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCKVh-0006a8-Ld; Wed, 17 Feb 2021 10:56:45 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCKVe-0006ZN-LY
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 10:56:43 +0000
IronPort-SDR: q5Rgkl6lx67pt6lUXzM5tqJSXqik+hLtgJ8MDK+D6rFUiDeeg0O0XQE36vzblKXf1mVMzWmZB/
 7H3iaZsuPsbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="170822189"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="170822189"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 02:56:39 -0800
IronPort-SDR: /aOYE4UlPmGiqjJMGLJeLQhvaVEVzN0J0prPAZJzLlr1siHc+k6/trrmj6QlVYtWjWvTLLhFJv
 48V19lECbFEg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="399910882"
Received: from mvalka-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 02:56:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC PATCH 3/9] drm/i915/spi: add driver for on-die spi device
In-Reply-To: <20210216181925.650082-4-tomas.winkler@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <20210216181925.650082-4-tomas.winkler@intel.com>
Date: Wed, 17 Feb 2021 12:56:32 +0200
Message-ID: <87blcjarof.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_055642_887256_BE7D56BC 
X-CRM114-Status: GOOD (  23.79  )
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
> Add the platform driver for i915 on-die spi device, exposed via mfd
> framework.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig             |   2 +
>  drivers/gpu/drm/i915/Makefile            |   3 +
>  drivers/gpu/drm/i915/spi/intel_spi_drv.c | 116 +++++++++++++++++++++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/spi/intel_spi_drv.c
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index abcaa8da45ac..13c870e5878e 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -27,6 +27,8 @@ config DRM_I915
>  	select CEC_CORE if CEC_NOTIFIER
>  	select VMAP_PFN
>  	select MFD_CORE
> +	select MTD

Selecting MTD does not seem to be a popular thing to do, which is
usually a clue it's probably the wrong thing to do.

> +	select MTD_PARTITIONED_MASTER
>  	help
>  	  Choose this option if you have a system that has "Intel Graphics
>  	  Media Accelerator" or "HD Graphics" integrated graphics,
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 7fa9120feb8d..f209cd541eec 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -299,6 +299,9 @@ endif
>  obj-$(CONFIG_DRM_I915) += i915.o
>  obj-$(CONFIG_DRM_I915_GVT_KVMGT) += gvt/kvmgt.o
>  
> +obj-m += i915_spi.o

And literally nobody does this.

> +i915_spi-y := spi/intel_spi_drv.o

Time to add a separate Kconfig and Makefile in spi/?

BR,
Jani.

> +
>  # header test
>  
>  # exclude some broken headers from the test coverage
> diff --git a/drivers/gpu/drm/i915/spi/intel_spi_drv.c b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
> new file mode 100644
> index 000000000000..23261f35b71f
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/spi/intel_spi_drv.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2019-2021, Intel Corporation. All rights reserved.
> + */
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +#include <linux/io.h>
> +#include <linux/device.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <spi/intel_spi.h>

Should this have "" instead of <>?

> +
> +struct i915_spi {
> +	void __iomem *base;
> +	size_t size;
> +	unsigned int nregions;
> +	struct {
> +		const char *name;
> +		u8 id;
> +		u64 offset;
> +		u64 size;
> +	} regions[];
> +};
> +
> +static int i915_spi_probe(struct platform_device *platdev)
> +{
> +	struct resource *bar;
> +	struct device *device;
> +	struct i915_spi *spi;
> +	struct i915_spi_region *regions;
> +	unsigned int nregions;
> +	unsigned int i, n;
> +	size_t size;
> +	char *name;
> +	size_t name_size;
> +
> +	device = &platdev->dev;
> +
> +	regions = dev_get_platdata(&platdev->dev);
> +	if (!regions) {
> +		dev_err(device, "no regions defined\n");
> +		return -ENODEV;
> +	}
> +
> +	/* count available regions */
> +	for (nregions = 0, i = 0; i < I915_SPI_REGIONS; i++) {
> +		if (regions[i].name)
> +			nregions++;
> +	}
> +
> +	if (!nregions) {
> +		dev_err(device, "no regions defined\n");
> +		return -ENODEV;
> +	}
> +
> +	size = sizeof(*spi) + sizeof(spi->regions[0]) * nregions;
> +	spi = devm_kzalloc(device, size, GFP_KERNEL);
> +	if (!spi)
> +		return -ENOMEM;
> +
> +	spi->nregions = nregions;
> +	for (n = 0, i = 0; i < I915_SPI_REGIONS; i++) {
> +		if (regions[i].name) {
> +			name_size = strlen(dev_name(&platdev->dev)) +
> +				    strlen(regions[i].name) + 2; /* for point */
> +			name = devm_kzalloc(device, name_size, GFP_KERNEL);
> +			if (!name)
> +				continue;
> +			snprintf(name, name_size, "%s.%s",
> +				 dev_name(&platdev->dev), regions[i].name);
> +			spi->regions[n].name = name;
> +			spi->regions[n].id = i;
> +			n++;
> +		}
> +	}
> +
> +	bar = platform_get_resource(platdev, IORESOURCE_MEM, 0);
> +	if (!bar)
> +		return -ENODEV;
> +
> +	spi->base = devm_ioremap_resource(device, bar);
> +	if (IS_ERR(spi->base)) {
> +		dev_err(device, "mmio not mapped\n");
> +		return PTR_ERR(spi->base);
> +	}
> +
> +	platform_set_drvdata(platdev, spi);
> +
> +	dev_dbg(device, "i915-spi is bound\n");
> +
> +	return 0;
> +}
> +
> +static int i915_spi_remove(struct platform_device *platdev)
> +{
> +	platform_set_drvdata(platdev, NULL);
> +
> +	return 0;
> +}
> +
> +MODULE_ALIAS("platform:i915-spi");
> +static struct platform_driver i915_spi_driver = {
> +	.probe  = i915_spi_probe,
> +	.remove = i915_spi_remove,
> +	.driver = {
> +		.name = "i915-spi",
> +	},
> +};
> +
> +module_platform_driver(i915_spi_driver);
> +
> +MODULE_LICENSE("GPL and additional rights");
> +MODULE_AUTHOR("Intel Corporation");
> +MODULE_DESCRIPTION("Intel DGFX SPI driver");

-- 
Jani Nikula, Intel Open Source Graphics Center

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
