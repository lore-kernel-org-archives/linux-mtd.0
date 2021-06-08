Return-Path: <SRS0=i2dy=LC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98398C47082
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 16:33:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6252761278
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 16:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6252761278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q4W9uD7lclBQIK+Kaq2XUGvFsGtUPNLIWtKgVMCrwXk=; b=o/w4qyaW95j4pYwqCJtguvcTp6
	M7aEsfblqmbeC66xkoLwCDLYYUFcE9rDn9z7LgwKOWwwr5Iaa3UEYbbIcGh3AXda0GwGt3s03/WWB
	+3pRCr2n4ERGchVwGjhvgaIazgm7QvUSzxjLnv560Ri70XxnNIJ/4TZGHIiSbFcaQeDB7k0M0ffkd
	Y5iGh8KGpM/VG/LSb0vTvRLhWHDonsbGIgWBca6KSGzwBUSmlBu6iP47Yo8dlaZLas5xPf/1k/Qmv
	vm06qeqvB9kWNqFCsCVRbpd6eQ/wC6+Jx9WM87sVnzsUco476Z0FyQFd6J7HL95IflaMZtZzqjrEX
	/quj81nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqefC-009XKe-QK; Tue, 08 Jun 2021 16:33:14 +0000
Received: from mail-ed1-f46.google.com ([209.85.208.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeee-009XAu-G2; Tue, 08 Jun 2021 16:32:42 +0000
Received: by mail-ed1-f46.google.com with SMTP id f5so20236034eds.0;
 Tue, 08 Jun 2021 09:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WUaKdqkyjh6EzjeWuZqdi2dYNMKlRLnh+NM1sHEfuao=;
 b=X+CfpsFyq5hloeViHoJlyIds19uSTtUIlXAf7k7HrrJUDrSreBvTIyOHADrMjqCAEq
 No4vVonjSBSX0Ql67lfm9mL8pDnFKjMF3mKZsNVqW/Pq6NBek2wKwW1hxbkgrKzu8tC4
 43kO6TYrViuMaxdFjtiwt6J3TA6tHdQywILSow1IEt3NiZeVn2MTqF/aR0fLIxaGrV1w
 ozG0OpRHBTDGcY06ZL/er2groWt3t9mndbpDjrnFXgIt92u4v22hUGD8Jtr+J3EiYFn7
 eAPF1kPCdip9/viRZCIxtzLQB8eEnh7syshU+OfZSfYsV+FGiRrIs+VEHhi41s8cQ7hf
 c1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WUaKdqkyjh6EzjeWuZqdi2dYNMKlRLnh+NM1sHEfuao=;
 b=Q+V25PJiHzF3wIYu7QGp1c4YkNIz4Pu9FIlvDXn9jZovOZC18jMjy2K/luKW9mhd+F
 Gkx4OaHj9Zo1gp23SXocBK70RphmpX6bU+4FNWqS/PXN2yYEzJDjSFi+XijHoUD5zFOj
 Is8cOCNSxIc3saSaCXOBtlFlynuEYqaZo57wJKaDHsYd8lboyFdJCO1E13srZHB2fo0j
 QuGIoX+1ljf9vEXW55/dxCZGDtzWHBCst+d1SCKEAnQcaMYH4q/sSrhSznZzkoKCf4Yc
 PRXhHS/qX2LtYd4dmoTRzGIA8utURrKXzPft9pNPrh/Mv6Ijgt0xHNvRhwpD3lWKFUF5
 v+Sw==
X-Gm-Message-State: AOAM532qPKSpHHbtgsw0z5NSij87f8kTcK04MeZOsME6QSyvEiFpxTkx
 u3OQ4LYyuOTEPbvK9lt/HxQ=
X-Google-Smtp-Source: ABdhPJzzR0UxUuKFEEiY/gFD3U2yfUWNfHociiNEWPmaKlEGhRv6BT2dZsFeIRBn1A82AD/+Z6C00Q==
X-Received: by 2002:a05:6402:1592:: with SMTP id
 c18mr19539617edv.2.1623169896749; 
 Tue, 08 Jun 2021 09:31:36 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 f18sm74848ejz.119.2021.06.08.09.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 09:31:36 -0700 (PDT)
Subject: Re: [PATCH v6 4/8] clk: rockchip: Add support for hclk_sfc on rk3036
To: Jon Lin <jon.lin@rock-chips.com>, linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20210608022644.21074-1-jon.lin@rock-chips.com>
 <20210608022644.21074-5-jon.lin@rock-chips.com>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <4a4524f5-ee85-c7f6-aa95-1df84f2a8a99@gmail.com>
Date: Tue, 8 Jun 2021 18:31:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608022644.21074-5-jon.lin@rock-chips.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_093240_592561_699128F4 
X-CRM114-Status: GOOD (  21.56  )
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

Hi Jon,

For rk3036 we might need another fix added to this serie as well.

clk: rockchip: rk3036: fix up the sclk_sfc parent error
https://github.com/rockchip-linux/kernel/commit/100718ef0d44872db1672b6a88030374c0d1613b

===
Add more people for clk driver changes:

M:	Michael Turquette <mturquette@baylibre.com>
M:	Stephen Boyd <sboyd@kernel.org>
L:	linux-clk@vger.kernel.org

===

Johan

On 6/8/21 4:26 AM, Jon Lin wrote:

> From: Chris Morgan <macromorgan@hotmail.com>

From: Randy Li <randy.li@rock-chips.com>

> 
> Add support for the bus clock for the serial flash controller on the
> rk3036. Taken from the Rockchip BSP kernel but not tested on real
> hardware (as I lack a 3036 based SoC to test).
> 

Signed-off-by: Randy Li <randy.li@rock-chips.com>

Maybe give credit to the original author?
clk: rockchip: rk3036: export the sfc clocks
https://github.com/rockchip-linux/kernel/commit/600925e8ef6edbdda0a4ac6b3c55b0199be1e03e

> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> ---
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
> Changes in v1: None
> 
>  drivers/clk/rockchip/clk-rk3036.c      | 2 +-
>  include/dt-bindings/clock/rk3036-cru.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
> index 91d56ad45817..ebb628733f6d 100644
> --- a/drivers/clk/rockchip/clk-rk3036.c
> +++ b/drivers/clk/rockchip/clk-rk3036.c
> @@ -403,7 +403,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
>  	GATE(HCLK_OTG0, "hclk_otg0", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(5), 13, GFLAGS),
>  	GATE(HCLK_OTG1, "hclk_otg1", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(7), 3, GFLAGS),
>  	GATE(HCLK_I2S, "hclk_i2s", "hclk_peri", 0, RK2928_CLKGATE_CON(7), 2, GFLAGS),

> -	GATE(0, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),
> +	GATE(HCLK_SFC, "hclk_sfc", "hclk_peri", CLK_IGNORE_UNUSED, RK2928_CLKGATE_CON(3), 14, GFLAGS),

Maybe CLK_IGNORE_UNUSED should be changed to 0 ?

>  	GATE(HCLK_MAC, "hclk_mac", "hclk_peri", 0, RK2928_CLKGATE_CON(3), 5, GFLAGS),
>  
>  	/* pclk_peri gates */
> diff --git a/include/dt-bindings/clock/rk3036-cru.h b/include/dt-bindings/clock/rk3036-cru.h
> index 35a5a01f9697..a96a9870ad59 100644
> --- a/include/dt-bindings/clock/rk3036-cru.h
> +++ b/include/dt-bindings/clock/rk3036-cru.h
> @@ -81,6 +81,7 @@
>  #define HCLK_OTG0		449
>  #define HCLK_OTG1		450
>  #define HCLK_NANDC		453
> +#define HCLK_SFC		454
>  #define HCLK_SDMMC		456
>  #define HCLK_SDIO		457
>  #define HCLK_EMMC		459
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
