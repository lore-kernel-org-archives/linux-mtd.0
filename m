Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3CCCFC51F
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Nov 2025 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2MBxskZZhtBDo1iyfFsBb63Boj9f5A+L+JGTcJNHMw=; b=eoCsbqGiYuIiGG
	D7ujOj9AioKQNdgayhuhiuijy0Zc/uFuMgElGhX6JR0Chd7M6IuH0Qx1zf+Joz6Fm9CFkTGDrGYHd
	PX4zhzIp/IJDBhRMEVq8PJyyzedXBoJwsf47/SQ6eRF41Uca9bTzR2ixjhvNdjy23FHk3DKMjMm3m
	iADpkJ2GVyH0CCWHT+plvT3NmxY4J29FSfQ2GCyI39fOmKTjqjHCYc27pNb+NBubh9Icfey2abBKa
	w7A8VHmLq9HbGXmIaGwMoXGTNSox4u9Szy0o1femQYk6dGSxRq05664PmVAxMsl5a3r/6+A3lqCgz
	KPD5UhTDtyNtSbisGbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMpgB-00000009hNE-3nMp;
	Sat, 22 Nov 2025 15:37:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMpg8-00000009hMS-1A8f
	for linux-mtd@lists.infradead.org;
	Sat, 22 Nov 2025 15:37:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477563e28a3so20249155e9.1
        for <linux-mtd@lists.infradead.org>; Sat, 22 Nov 2025 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763825854; x=1764430654; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTyNC1+UYoKVAcGxt2SVHOhb/Uf0xrNXGcZihp5xtts=;
        b=QGRWZ5Dkx3yUnV//B3/k7HhXr3diqu87CcBqvuu1q85FpTa+jNd8ZxmxqETIh/5WOa
         d1OfCDamKe72Wqsa7Z1P83O6kxSVuEaY8IdcV7r8w1n5I/U76ubGdV30OBV+n8DJRKDq
         Q5HWZ2Jb3HoqzLruXLrEtKmdvGZzZ5Z9wUu3YcZuQou31YSNkkhSkKZATFzzrwS3vtTe
         twq1TMq524lhVfroYMCaboPqCkFpBCntBxHj1vCvVoWXb+FmLO8e26N2sxR4PTQX3x5A
         Sae8ffDK13S+4qCEX8EZNHr1fbt95P8fIdJdQbYqFhKLs+YhsHoguVI7fFFr3zpUv79t
         Rx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763825854; x=1764430654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTyNC1+UYoKVAcGxt2SVHOhb/Uf0xrNXGcZihp5xtts=;
        b=P+8zQ39STG0yR76/g9AQ6D3SM6ndVeA5S/M/faRdF02DD4s+ZrmjhKYPw13bGXYj+L
         bjdNiN5RktpQRb0KXn1N7cmAssANtzMP9ceqxLpReS+e7UO9Rk/W6oYahtS3zjO5XsCg
         dDkoOKtOkJbpgo66sGJhv3JvewFCx/zA6lXkTFlwr3vIUt57AHRSdjIFf2iSwojxaH0q
         TyQuVF/I2A++aq55yssQJPW5SKxJ5kZw4DeEiV20FZ4apGK6jAdzfAPpZM4aSwi9UpnX
         X3+8cl6bCLDhIMVkqzIsdxkJFZgfFE7QoGwX6WsBNXWFYMuwm0ywwGYIRGuqRgBH5IoU
         RvBg==
X-Gm-Message-State: AOJu0Yx36ecbnPro2+96Cx+fkRTqARdQY+UDzH9xDWkr+HI4ep/E1Rel
	dNpesC54R6Et2bXQ69xygh4CmsmlxmgcMTWeRpDnJJMDxYAsLK6mIecp4SG7lnXWnKA=
X-Gm-Gg: ASbGncu0Y8Iry7X8yX7GIhzT49j4eRQNJvU472isMxay4X/O8+POTViZiKps7d9w1+r
	Or91A056fxw49GwBMqbypeC7/c5qLW7c26dzoNmzJG2jrl8AwMw0qTEJloXAj5OTmsZ2Vpfmzsd
	6vGC5f9fSC4boDcqAQ70BdY+wQNvaxpMX/awXUcIMZ8ozwDGZGyhKt0w7H8KIg+s0aEZMRSJ81G
	ybChD8Z7u8j0htnq+dux4x2fKUvqKD9S4XlpSwbT1d9OwFEmip81f9NsqhGWtr7v/nZtNJPmjes
	Z+vkvzX2BjCOp5+elUJam6/4rLmX1Z+71Up4QeicVr7sE75/4blKgMIakr0HQNjHdlxpOkS89f/
	Wlf3kzPNs1VpsTyExUZHH1tYPFUHRoX5fLq3Exa4BtIW/TI7KV0XNrI90XZRoj+I2rQuglRdkkM
	T808NxwE1TWcllpcs7X4DzWBCkWLjetQ==
X-Google-Smtp-Source: AGHT+IGNsCW8GaBWE80eC552ADlIIeLb1DFaNnNWkr5NJ5EoHsoPa7vEmJGXkXIjZpH3a0KG8muD6g==
X-Received: by 2002:a05:600c:4f45:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-477c04db9a0mr64162485e9.8.1763825854228;
        Sat, 22 Nov 2025 07:37:34 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3aef57sm93496025e9.11.2025.11.22.07.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 07:37:33 -0800 (PST)
Message-ID: <ece2d53c-3e16-4e5e-9bb9-3ed7bb362b7b@tuxon.dev>
Date: Sat, 22 Nov 2025 17:37:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: at91: Move PM init functions to .init_late
 hook
To: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
 <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251120-at91-probe-v2-2-8c8592f02e8e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_073736_351685_9B99FAEE 
X-CRM114-Status: GOOD (  14.59  )
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

Hi, Rob,

On 11/20/25 23:37, Rob Herring wrote:
> Move the AT91 PM init functions to .init_late hook to ensure driver
> dependencies have probed.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

'From: Rob Herring <robh@kernel.org>' != 'Signed-off-by: Rob Herring (Arm)
<robh@kernel.org>


> ---
> v2:
>  - new patch
> ---
>  arch/arm/mach-at91/at91rm9200.c | 3 +--
>  arch/arm/mach-at91/at91sam9.c   | 3 +--
>  arch/arm/mach-at91/sam9x60.c    | 3 +--
>  arch/arm/mach-at91/sam9x7.c     | 3 +--
>  arch/arm/mach-at91/sama5.c      | 2 +-
>  arch/arm/mach-at91/sama7.c      | 3 +--
>  6 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/at91rm9200.c b/arch/arm/mach-at91/at91rm9200.c
> index 4f8186211619..2ac564eb8bbb 100644
> --- a/arch/arm/mach-at91/at91rm9200.c
> +++ b/arch/arm/mach-at91/at91rm9200.c
> @@ -17,8 +17,6 @@
>  static void __init at91rm9200_dt_device_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -
> -	at91rm9200_pm_init();
>  }
>  
>  static const char *const at91rm9200_dt_board_compat[] __initconst = {
> @@ -27,6 +25,7 @@ static const char *const at91rm9200_dt_board_compat[] __initconst = {
>  };
>  
>  DT_MACHINE_START(at91rm9200_dt, "Atmel AT91RM9200")
> +	.init_late	= at91rm9200_pm_init,
>  	.init_machine	= at91rm9200_dt_device_init,
>  	.dt_compat	= at91rm9200_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/at91sam9.c b/arch/arm/mach-at91/at91sam9.c
> index 7e572189a5eb..cf07cba4ee5d 100644
> --- a/arch/arm/mach-at91/at91sam9.c
> +++ b/arch/arm/mach-at91/at91sam9.c
> @@ -17,8 +17,6 @@
>  static void __init at91sam9_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -
> -	at91sam9_pm_init();
>  }
>  
>  static const char *const at91_dt_board_compat[] __initconst = {
> @@ -28,6 +26,7 @@ static const char *const at91_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM9")
>  	/* Maintainer: Atmel */
> +	.init_late	= at91sam9_pm_init,
>  	.init_machine	= at91sam9_init,
>  	.dt_compat	= at91_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/sam9x60.c b/arch/arm/mach-at91/sam9x60.c
> index d8c739d25458..a31beaaeffcd 100644
> --- a/arch/arm/mach-at91/sam9x60.c
> +++ b/arch/arm/mach-at91/sam9x60.c
> @@ -18,8 +18,6 @@
>  static void __init sam9x60_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -
> -	sam9x60_pm_init();
>  }
>  
>  static const char *const sam9x60_dt_board_compat[] __initconst = {
> @@ -29,6 +27,7 @@ static const char *const sam9x60_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(sam9x60_dt, "Microchip SAM9X60")
>  	/* Maintainer: Microchip */
> +	.init_late	= sam9x60_pm_init,
>  	.init_machine	= sam9x60_init,
>  	.dt_compat	= sam9x60_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/sam9x7.c b/arch/arm/mach-at91/sam9x7.c
> index e1ff30b5b09b..0c73f7fefd4f 100644
> --- a/arch/arm/mach-at91/sam9x7.c
> +++ b/arch/arm/mach-at91/sam9x7.c
> @@ -17,8 +17,6 @@
>  static void __init sam9x7_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -
> -	sam9x7_pm_init();
>  }
>  
>  static const char * const sam9x7_dt_board_compat[] __initconst = {
> @@ -28,6 +26,7 @@ static const char * const sam9x7_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(sam9x7_dt, "Microchip SAM9X7")
>  	/* Maintainer: Microchip */
> +	.init_late	= sam9x7_pm_init,
>  	.init_machine	= sam9x7_init,
>  	.dt_compat	= sam9x7_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
> index bf2b5c6a18c6..efae697ce29c 100644
> --- a/arch/arm/mach-at91/sama5.c
> +++ b/arch/arm/mach-at91/sama5.c
> @@ -33,7 +33,6 @@ static void __init sama5_secure_cache_init(void)
>  static void __init sama5_dt_device_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -	sama5_pm_init();
>  }
>  
>  static const char *const sama5_dt_board_compat[] __initconst = {
> @@ -43,6 +42,7 @@ static const char *const sama5_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(sama5_dt, "Atmel SAMA5")
>  	/* Maintainer: Atmel */
> +	.init_late	= sama5_pm_init,
>  	.init_machine	= sama5_dt_device_init,
>  	.dt_compat	= sama5_dt_board_compat,
>  MACHINE_END
> diff --git a/arch/arm/mach-at91/sama7.c b/arch/arm/mach-at91/sama7.c
> index bd43733ede18..3e28727f2a8e 100644
> --- a/arch/arm/mach-at91/sama7.c
> +++ b/arch/arm/mach-at91/sama7.c
> @@ -17,8 +17,6 @@
>  static void __init sama7_dt_device_init(void)
>  {
>  	of_platform_default_populate(NULL, NULL, NULL);
> -	sama7_pm_init();
> -}

} was dropped as well.

Thank you,
Claudiu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
