Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED151C3A5A0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 20:36:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2297206E9
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 20:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QusrOhA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2297206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeJ0Cm3j7XBldi1CfhdCRutjYiGOwDwBPM/tTLqAQ2E=; b=QusrOhA1YM0iG8
	nh4vZb6SskGxyqfNEM9EU83SJ6FzrIKkxY+D3nXru/IRJWgJNz30jLDNLBmJBoFsxEKfa6oCji4YX
	AptyLZqgHFP98tECotFh1+eisV4xZewxdGjf2Fp6iFuSay00IdPRQzPp5tETHw2pCrr7JAaz48hTa
	bbOhn+vaTgO0aW2qfWBrJNLakh1w9C0ZWP5ZPf9RhUgpQ1VzATkTLUmYapgIlFlDCiJrlWXRzjOJR
	LplxmjpZ/x2XHSbjJHhfLEeLYPy3y394vD/MZN5QtFJtuYMfyd6FQjLmmq0OFv+KZWV5rZdWKSV8S
	EoHVDCG5cggUwVo7vLMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQdA0-0002fQ-W1; Mon, 20 Apr 2020 20:36:56 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQd9w-0002bv-Og; Mon, 20 Apr 2020 20:36:54 +0000
Received: by mail-ot1-f66.google.com with SMTP id z17so9370620oto.4;
 Mon, 20 Apr 2020 13:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0kqh5Q9Co3AbSPBrTmVcdN3oyZQj3KIAbrC9Aw9Jey8=;
 b=hOPy4iK4mtNF+rw/BnxM/E9qR9Zkk/Xg/T2GDcQ2Bh/JtkGMldYzftv7qZAGkQhocT
 Nr/se4blpobhb/dVbS4TzNC6+FqrxCL57s9qB5BcNGCyFZgX0xgdIs+Td04YjsXdfZ8h
 qfMK9YgvKjmY9DtC6siTWeYz4eB9YSwr0lucQCJJolENmcBV7Rcq1p8+A+VWY8Md/KQG
 sYPOB1RWS3omX4iqRdnTAclYS59qVI72HnxkOeSGooRJBQSVmj8lOdZU2Ll2KLIMIcNo
 hb2qTcgY+cyJdsFbG1yhD3LTD82sZEEj3Boq2SCUw4b9bnQTuqcsvJF9XkMAG35fL6xe
 /58w==
X-Gm-Message-State: AGi0PuZ/69SSkoyxFUD7qIQZfBTy2DMUq/caLhsYWVPfSjVXygO7Ml0m
 ML+Y0PdzueYdqSAyxSxXNg==
X-Google-Smtp-Source: APiQypIKf0vB7yfwu8rT/KxQM+HvZK1R4I7Apur0UzYjSjNLrYCJKeDB/Ne3EnK+UZ4pWSPP25JeDQ==
X-Received: by 2002:a9d:6a02:: with SMTP id g2mr11554009otn.196.1587415011744; 
 Mon, 20 Apr 2020 13:36:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r21sm190334otg.67.2020.04.20.13.36.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 13:36:50 -0700 (PDT)
Received: (nullmailer pid 18971 invoked by uid 1000);
 Mon, 20 Apr 2020 20:36:47 -0000
Date: Mon, 20 Apr 2020 15:36:47 -0500
From: Rob Herring <robh@kernel.org>
To: Hadar Gat <hadar.gat@arm.com>
Subject: Re: [PATCH] of_device: removed #include that caused a recursion in
 included headers
Message-ID: <20200420203647.GA23189@bogus>
References: <1586784960-22692-1-git-send-email-hadar.gat@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1586784960-22692-1-git-send-email-hadar.gat@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_133652_815737_14A6B250 
X-CRM114-Status: GOOD (  13.11  )
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
Cc: Jose Abreu <joabreu@synopsys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 netdev@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-samsung-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-rockchip@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Joerg Roedel <joro@8bytes.org>,
 Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Tony Lindgren <tony@atomide.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, linux-omap@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Gilad Ben-Yossef <gilad@benyossef.com>, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Ofir Drang <ofir.drang@arm.com>,
 linux-gpio@vger.kernel.org, JC Kuo <jckuo@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, dmaengine@vger.kernel.org,
 freedreno@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Apr 13, 2020 at 04:35:53PM +0300, Hadar Gat wrote:
> Both of_platform.h and of_device.h were included each other.
> In of_device.h, removed unneeded #include to of_platform.h
> and added include to of_platform.h in the files that needs it.

Guess we forgot about that temporary comment!

Both of these headers have a lot of things we don't want 'normal' 
drivers calling. The most common thing needed from of_device.h is 
of_match_device/of_device_get_match_data. A good number are only for 
ibmebus. Maybe the header should be split or the former just moved 
to of.h.

For of_platform.h, it seems we have a bunch of unneeded includes:

$ git grep 'of_platform\.h' drivers/ | wc
    560    1120   36049
$ git grep -E 'of_(platform_(pop|def)|find_device)' drivers/ | wc
    248    1215   20630

Would nice to drop those (or switch to of_device.h?) too.

Be sure to build on Sparc. It's the oddball.

> 
> Signed-off-by: Hadar Gat <hadar.gat@arm.com>
> ---
>  drivers/base/platform.c                           | 1 +
>  drivers/bus/vexpress-config.c                     | 1 +
>  drivers/dma/at_hdmac.c                            | 1 +
>  drivers/dma/stm32-dmamux.c                        | 1 +
>  drivers/dma/ti/dma-crossbar.c                     | 1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c                   | 1 +
>  drivers/gpu/drm/msm/msm_drv.c                     | 1 +
>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 1 +
>  drivers/gpu/drm/sun4i/sun4i_tcon.c                | 1 +
>  drivers/iio/adc/stm32-adc-core.c                  | 1 +
>  drivers/iio/adc/stm32-dfsdm-adc.c                 | 1 +
>  drivers/iio/adc/stm32-dfsdm-core.c                | 1 +
>  drivers/iommu/tegra-smmu.c                        | 1 +
>  drivers/memory/atmel-ebi.c                        | 1 +
>  drivers/mfd/palmas.c                              | 1 +
>  drivers/mfd/ssbi.c                                | 1 +
>  drivers/mtd/nand/raw/omap2.c                      | 1 +
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 1 +
>  drivers/net/ethernet/ti/cpsw.c                    | 1 +
>  drivers/phy/tegra/xusb.c                          | 1 +
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c         | 1 +
>  drivers/soc/samsung/exynos-pmu.c                  | 1 +
>  drivers/soc/sunxi/sunxi_sram.c                    | 1 +
>  include/linux/of_device.h                         | 2 --
>  lib/genalloc.c                                    | 1 +
>  26 files changed, 25 insertions(+), 2 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
