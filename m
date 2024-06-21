Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A26C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 06:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6C0ZLdv8IfZtGKCJmO6FJTH+YI/UkqPGcmRBVdYWYE=; b=FtuXu/NRdEfCZW
	XCrH0JePSfrBPtbktFaCZ+dSdIq5NQXMkU3U+X21cYyD/pLWQ/OJb9eSGsF2OwElufenSa3JZckpZ
	osJ0+A+WN0Yyu6pLN7OuJcR7Z2Bz8QLCuIdCRx5tFybcDX5FmupebLHQJdoC4VHITkdoAjqkUMGFU
	tbUJEEwAdeGRRsWV8KhknwEI2wUONBJnMAOGjKxD13/ShwP6QwANcsLLfijCMyanpX0kVm8eRK9LH
	kpVmwSvnD41xdr43Y/mh0RoaDkybAew7C+L8vHBe+URkh+txaGUrVOqUuHVITVX4ux9pzdq0+KPLr
	eSnlTpbAelFthuT/xAtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXhx-00000007xAz-1OVc;
	Fri, 21 Jun 2024 06:25:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKXht-00000007x9h-1OAC;
	Fri, 21 Jun 2024 06:25:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10B77CE2693;
	Fri, 21 Jun 2024 06:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AF6C4AF08;
	Fri, 21 Jun 2024 06:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718951106;
	bh=RpAnylSp0low2EHQteG2QlLwgHA9wIH1vL+LLeQ2mjU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QTtqTSt7sxy9Lmo4XPDD1xowEqVy+tWjG0ps1QYwszKL3GL4NZREqPWKpLxJLxLy4
	 YXbDqv2STLFJdr84drTE3Y1nUrdtCIQTroViB0VGplkj2CItQdHQN7urh5czKtBasK
	 n1uORR1v0FwAAPNWvbgR65hOY6ieDxItDmx4JqP5b29igau8PLZafE5R/7em6smL8b
	 Vmr4uxDzecxtT2YNcv4J3AzNbLPaVPHMbn8H52GrqxyWCEmHxsFNRwZYZRN1qljnd2
	 zw33WUafKRmVeFPc6onxF+e+0HM6gqViPp+ryW/XMZSe0wFiktXr2r1rHIHLpHt/+d
	 NvIFcybLXnQEg==
Message-ID: <7f7b1c7f-baa4-4b89-b65f-7bbf3dc13be6@kernel.org>
Date: Fri, 21 Jun 2024 08:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX
 SoC
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
 Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_232509_778293_FCA484D7 
X-CRM114-Status: GOOD (  24.12  )
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

On 20/06/2024 19:56, Piotr Wojtaszczyk wrote:
> LPC32XX connects few of its peripherals to pl08x DMA thru a multiplexer,
> this driver allows to route a signal request line thru the multiplexer for
> given peripheral.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v4:
> - This patch is new in v4
> 
>  MAINTAINERS                  |   1 +
>  drivers/dma/Kconfig          |   9 ++
>  drivers/dma/Makefile         |   1 +
>  drivers/dma/lpc32xx-dmamux.c | 195 +++++++++++++++++++++++++++++++++++
>  4 files changed, 206 insertions(+)
>  create mode 100644 drivers/dma/lpc32xx-dmamux.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fadf1baafd89..5ffe988ee282 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2403,6 +2403,7 @@ R:	Vladimir Zapolskiy <vz@mleia.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> +F:	drivers/dma/lpc32xx-dmamux.c
>  N:	lpc32xx
>  
>  ARM/Marvell Dove/MV78xx0/Orion SOC support
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 002a5ec80620..aeace3d7e066 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -378,6 +378,15 @@ config LPC18XX_DMAMUX
>  	  Enable support for DMA on NXP LPC18xx/43xx platforms
>  	  with PL080 and multiplexed DMA request lines.
>  
> +config LPC32XX_DMAMUX
> +	bool "NXP LPC32xx DMA MUX for PL080"
> +	depends on ARCH_LPC32XX || COMPILE_TEST
> +	depends on OF && AMBA_PL08X
> +	select MFD_SYSCON
> +	help
> +	  Support for PL080 multiplexed DMA request lines on
> +	  LPC32XX platrofm.
> +
>  config LS2X_APB_DMA
>  	tristate "Loongson LS2X APB DMA support"
>  	depends on LOONGARCH || COMPILE_TEST
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index 802ca916f05f..6f1350b62e7f 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -50,6 +50,7 @@ obj-$(CONFIG_INTEL_IOATDMA) += ioat/
>  obj-y += idxd/
>  obj-$(CONFIG_K3_DMA) += k3dma.o
>  obj-$(CONFIG_LPC18XX_DMAMUX) += lpc18xx-dmamux.o
> +obj-$(CONFIG_LPC32XX_DMAMUX) += lpc32xx-dmamux.o
>  obj-$(CONFIG_LS2X_APB_DMA) += ls2x-apb-dma.o
>  obj-$(CONFIG_MILBEAUT_HDMAC) += milbeaut-hdmac.o
>  obj-$(CONFIG_MILBEAUT_XDMAC) += milbeaut-xdmac.o
> diff --git a/drivers/dma/lpc32xx-dmamux.c b/drivers/dma/lpc32xx-dmamux.c
> new file mode 100644
> index 000000000000..4e6ce6026164
> --- /dev/null
> +++ b/drivers/dma/lpc32xx-dmamux.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright 2024 Timesys Corporation <piotr.wojtaszczyk@timesys.com>
> +//
> +// Based on TI DMA Crossbar driver by:
> +//   Copyright (C) 2015 Texas Instruments Incorporated - http://www.ti.com
> +//   Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
> +
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_dma.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +#define LPC32XX_SSP_CLK_CTRL 0x78
> +#define LPC32XX_I2S_CLK_CTRL 0x7c
> +
> +struct lpc32xx_dmamux {
> +	int signal;
> +	char *name_sel0;
> +	char *name_sel1;
> +	int muxval;
> +	int muxreg;
> +	int bit;
> +	bool busy;
> +};
> +
> +/* From LPC32x0 User manual "3.2.1 DMA request signals" */
> +static struct lpc32xx_dmamux lpc32xx_muxes[] = {
> +	{
> +		.signal = 3,
> +		.name_sel0 = "spi2-rx-tx",
> +		.name_sel1 = "ssp1-rx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 5,
> +	},
> +	{
> +		.signal = 10,
> +		.name_sel0 = "uart7-rx",
> +		.name_sel1 = "i2s1-dma1",
> +		.muxreg = LPC32XX_I2S_CLK_CTRL,
> +		.bit = 4,
> +	},
> +	{
> +		.signal = 11,
> +		.name_sel0 = "spi1-rx-tx",
> +		.name_sel1 = "ssp1-tx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 4,
> +	},
> +	{
> +		.signal = 14,
> +		.name_sel0 = "none",
> +		.name_sel1 = "ssp0-rx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 3,
> +	},
> +	{
> +		.signal = 15,
> +		.name_sel0 = "none",
> +		.name_sel1 = "ssp0-tx",
> +		.muxreg = LPC32XX_SSP_CLK_CTRL,
> +		.bit = 2,
> +	},
> +};
> +
> +struct lpc32xx_dmamux_data {
> +	struct dma_router dmarouter;
> +	struct regmap *reg;
> +	spinlock_t lock; /* protects busy status flag */
> +};

Please keep declarations of structures before definitions, so this
should go before lpc32xx_muxes.

> +

...

> +	dmamux->reg = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(dmamux->reg)) {
> +		dev_err(&pdev->dev, "syscon lookup failed\n");
> +		return PTR_ERR(dmamux->reg);

This should be rather:
return dev_err_probe().


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
