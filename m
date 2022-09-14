Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3116DECAAD3
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Sep 2022 22:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/+Rng8nN3GSUA/NlEPkrrRHGvQp7Rch9QpqhW5wBPo=; b=A53zLgCYjnvM5H
	5DiJ2mPe3cxkars/U6hf6lDZgyOGgrRRErmY4h93R76ByOGlxfOIBVGUBIeUDHKnP2zJ6R6phjMNF
	mvyYVTxc45WQLiKvmXCljWk6P+UFzujhGIiP+xmN78O4IBxGwwIAO3lQI31aJ6lSnY359raYBJxoe
	PpxGWDTNY2v9Qy83BZMKFcBKlXU7S7phAcsKG/zf86yFWJETu+lTsmhmrpd/AgXdvN7b5HM6w7S+e
	s+NEu9SJyu+cLmh/zuKHBxYi3MpvKlmPHkBviSvduGZZ1RFhVdsYRyUbt+uMT7yRhotWFOye1AFYL
	KQiK/0glGsVrx41jd+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYab8-00B6hD-Rz; Wed, 14 Sep 2022 22:11:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYab5-00B6d2-38
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2022 22:11:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so12496045wmb.4
        for <linux-mtd@lists.infradead.org>; Wed, 14 Sep 2022 15:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NtHUpnkTzZLClNVo69m+97iJj6YVMUW1mrBbO6+GYx4=;
        b=k2pheIKKkU+v+L7T78yXrfbXdox99kc/Tr45O+C7PY7veqxy0014cMCxQVXON4s2s5
         bjH2835AjYfVooRAqAaLXN46FFfFKz+yTuex+r2f7lCxZurHDc4UdYiF8eLRo0KAplWR
         howoQOCotQNuEVzUXqcqGIoxmMAnxUpg1Nfe9d0Jxelq/67lT0FWysxG1WSfq+tllrjF
         MJGftTJiPRdKNtaMK8f6XZUTaNntZtfd/XstIgXIWzhi4UbcNZACk5afdo4Gcg15URcE
         POfHX75eaFbmiVIcvYCWJEfT2RE09oo6kgsX5SeMsEEBrOhKyU0oNum9hOQ4q8nVbdPe
         lGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NtHUpnkTzZLClNVo69m+97iJj6YVMUW1mrBbO6+GYx4=;
        b=i0o878wBwE9JK6Fru+S1tD6Jc4qdcIU2OffACpDgUuOTM2TdgzGET2pdIezHOtt1T0
         pbjQPthJjqN5OE7+1a0O4SnKZHJWhcVW192Fk71Psyq4jgsSRVNeuDqamzhC5oIJb4oO
         5wFWoc540Fapv3OWvnk7l9V/GGnj2l75Wv61IXXjnBxgmiQ5GCbJQbscWHdl9G4a7ZS5
         gGQ3BeucAe0xA9hF/i7U9FYzIqKmXhGG5Uf+go4b4gQ/5K0SJqN69nh1xHUxECNYpUqw
         OgVDJx56QnteOY8w+XWgLzVLioYqWq4IKmgoDwzwlxu8L3WJWheJG2TXS6w1TrKEugcg
         vpyw==
X-Gm-Message-State: ACgBeo3ecYqWqo36DS5uvRvYazKQDWM5F4fS8vqmYHenGZQI5oidN2Gn
	lmbn0pfyBciU+80eDNHtPtgyXg==
X-Google-Smtp-Source: AA6agR6NcwwbUlfaV8V54oY0YHXnyEWnJv3scoxu+jgnhyd/kEyHVKwb+mdfdcFhsX6xndenkvt7mg==
X-Received: by 2002:a1c:4b0d:0:b0:3b4:76ae:f7a5 with SMTP id y13-20020a1c4b0d000000b003b476aef7a5mr4848503wma.23.1663193464311;
        Wed, 14 Sep 2022 15:11:04 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b0022a9246c853sm396428wrr.41.2022.09.14.15.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 15:11:03 -0700 (PDT)
Date: Thu, 15 Sep 2022 01:11:02 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Han Xu <han.xu@nxp.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	"open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] clk: imx: imx6sx: remove the SET_RATE_PARENT flag for
 QSPI clocks
Message-ID: <YyJRdnTpoM7kw/Bt@linaro.org>
References: <20220914201049.3508104-1-han.xu@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220914201049.3508104-1-han.xu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_151107_207372_1B2D300A 
X-CRM114-Status: GOOD (  17.17  )
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

On 22-09-14 15:10:48, Han Xu wrote:
> There is no dedicate parent clock for QSPI so SET_RATE_PARENT flag
> should not be used. For instance, the default parent clock for QSPI is
> pll2_bus, which is also the parent clock for quite a few modules, such
> as MMDC, once GPMI NAND set clock rate for EDO5 mode can cause system
> hang due to pll2_bus rate changed.
> 
> Fixes: f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")
> Signed-off-by: Han Xu <han.xu@nxp.com>

Acked-by: Abel Vesa <abel.vesa@linaro.org>

Stephen, will you be picking this?

> ---
>  drivers/clk/imx/clk-imx6sx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 2301d8fb8c76..1e53e366cde7 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -324,13 +324,13 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
>  	hws[IMX6SX_CLK_SSI3_SEL]           = imx_clk_hw_mux("ssi3_sel",         base + 0x1c,  14,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
>  	hws[IMX6SX_CLK_SSI2_SEL]           = imx_clk_hw_mux("ssi2_sel",         base + 0x1c,  12,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
>  	hws[IMX6SX_CLK_SSI1_SEL]           = imx_clk_hw_mux("ssi1_sel",         base + 0x1c,  10,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
> -	hws[IMX6SX_CLK_QSPI1_SEL]          = imx_clk_hw_mux_flags("qspi1_sel", base + 0x1c,  7, 3, qspi1_sels, ARRAY_SIZE(qspi1_sels), CLK_SET_RATE_PARENT);
> +	hws[IMX6SX_CLK_QSPI1_SEL]          = imx_clk_hw_mux("qspi1_sel",        base + 0x1c,  7,      3,      qspi1_sels,        ARRAY_SIZE(qspi1_sels);
>  	hws[IMX6SX_CLK_PERCLK_SEL]         = imx_clk_hw_mux("perclk_sel",       base + 0x1c,  6,      1,      perclk_sels,       ARRAY_SIZE(perclk_sels));
>  	hws[IMX6SX_CLK_VID_SEL]            = imx_clk_hw_mux("vid_sel",          base + 0x20,  21,     3,      vid_sels,          ARRAY_SIZE(vid_sels));
>  	hws[IMX6SX_CLK_ESAI_SEL]           = imx_clk_hw_mux("esai_sel",         base + 0x20,  19,     2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_CAN_SEL]            = imx_clk_hw_mux("can_sel",          base + 0x20,  8,      2,      can_sels,          ARRAY_SIZE(can_sels));
>  	hws[IMX6SX_CLK_UART_SEL]           = imx_clk_hw_mux("uart_sel",         base + 0x24,  6,      1,      uart_sels,         ARRAY_SIZE(uart_sels));
> -	hws[IMX6SX_CLK_QSPI2_SEL]          = imx_clk_hw_mux_flags("qspi2_sel", base + 0x2c, 15, 3, qspi2_sels, ARRAY_SIZE(qspi2_sels), CLK_SET_RATE_PARENT);
> +	hws[IMX6SX_CLK_QSPI2_SEL]          = imx_clk_hw_mux("qspi2_sel",        base + 0x2c,  15,     3,      qspi2_sels,        ARRAY_SIZE(qspi2_sels);
>  	hws[IMX6SX_CLK_SPDIF_SEL]          = imx_clk_hw_mux("spdif_sel",        base + 0x30,  20,     2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_AUDIO_SEL]          = imx_clk_hw_mux("audio_sel",        base + 0x30,  7,      2,      audio_sels,        ARRAY_SIZE(audio_sels));
>  	hws[IMX6SX_CLK_ENET_PRE_SEL]       = imx_clk_hw_mux("enet_pre_sel",     base + 0x34,  15,     3,      enet_pre_sels,     ARRAY_SIZE(enet_pre_sels));
> -- 
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
