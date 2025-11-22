Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBD7CFC536
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Nov 2025 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bcr9ZH0DJk3LpgRASOGuoxLA6VPINj5Rofbjm/fRAYE=; b=eufyOw2EUBQekG
	kSUQyxgJp8Dcz7u2PdCn5Non4YanBtlyjjcXj15Wil3rtF9dLFNDG9N0mUK2cWnTWCKADstnXz0i4
	svzv4vbP/TvU4UMjLr+KVM1cCzTn+meDB1ILJ/KTauVmnYQfgoLwCmLLOCdCV9dryxajXKeluYt3g
	brsQEewoEwc5JrU7EmOWa7zon76DVTSPJjbwsvoSQPiLQdCjjHnrPlyOaPis8nyj/OLFDXRigVGIk
	wSaY1GXSmZpXly/kxp35RwviUa7ncXNRbAMLOi3nqZOnKE7McGtFSWhrSTNBMaFR0QEH0u0VZrzmB
	zucjQTc55joyUg+O8e6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMpgI-00000009hP3-2xtF;
	Sat, 22 Nov 2025 15:37:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMpgF-00000009hNt-3iDd
	for linux-mtd@lists.infradead.org;
	Sat, 22 Nov 2025 15:37:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42b3b29153fso1706842f8f.3
        for <linux-mtd@lists.infradead.org>; Sat, 22 Nov 2025 07:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763825862; x=1764430662; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t08qHXnMcST7KOq0j7X4ZwqqxOnWp8qODdnF3cViEMA=;
        b=p1xYbO/pXwfDSnZzNGy4DjVMlxcoMPsDnpDVf/vznYE5OJiQy8sG+FJNd2zLf5oo/J
         uN8mcXVRPzgznNbz7qh1eIyWP1yxvcv2WiWpd4lYu2wacRfwpZfF4at/Y7D4RpwoZ7Vc
         GTqhZP1IFOSxaFZjyfF6yemgKZRVO1OqPY1uYqW84AMKIFS91fFZxFPbyygMPHUVA4nl
         g2kuazXZ0Xzo9Zrm2xRJEsF5JHfqbiRaVfCpZBkMSXMaGClowaOelLKyEEmLssMgZcNl
         KT1iIURAs3cjp1Zl4fxjq9XPWmFs77kXbATPTK404xtNzVtEVJG9u9JxWOJw+6reO/xk
         AKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763825862; x=1764430662;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t08qHXnMcST7KOq0j7X4ZwqqxOnWp8qODdnF3cViEMA=;
        b=p5b3PUr8fW+IxKgkerGl9B5lGp4CdKCoqM9r1zYhjNZyARp7YrVcY+mqPB5honP6lu
         AF1rTureVKMWDytRjEQXZMFcIBqXGpH38/SUQD+Ws21twzscf5KKdGmoPE/HCOt/5SY1
         QfjPzFEpKMcI7KRcDR2TvluOrw7YYn74XApTDbBgKWAoh3jueF+lt2zbkYUmUBNIgkPQ
         dDmomk7t1sXaPNYZeHlOvTpGOQkuXE4ARfSZGfBzUz2oLe5PAeFGtE1G36hkzG88qUx5
         jt+9If1i7XmmaBf9ySwHM6Gj/cNCWIGowWWMg2Hqh941bQq5cC0MpzBxtpkjM7iXVlav
         TUAw==
X-Gm-Message-State: AOJu0Yy2aqoHrkS5ZfWBxawUTawHmXfkA8f1YCV6GETVLu94Vvse4+aB
	COSwcuGvu4PQ75cs8GVsT9Pe7P/C6as5eLae0aNqgIgnnOoWgYcserFVgysfz9vjEd1NuFEWmji
	wq8TAlr8=
X-Gm-Gg: ASbGncuuNlo8DQguYv9vk/yQ/ttSzU+oV8pBMk0q04ZfutvtJZyMk33IcCU5eW4Rps2
	FbxkoUDoL+qUbQt42kgRlk9dcFJYuCdeiq6yyluq41vchIAJc80UEK/osW9llKvemLcA3pyHSZC
	zGmExhPxALxCzIZYUVB+LyMC2cekCnyIohuqZqzcscqlCg99r/fCrLNC2zZeEm2zwpQsYnapGOm
	Bg++TRx+W5S9pL+pW2rntgGneM+Bfs5ar+eMAAhqSsmpyqUvcVFWm4EOCeEyc9LZZPVEH8kUi45
	Gc1dY7TBfxPLIqpBKbQIcsNrGbxpLeuCs+iUhLRTmnxn7MXB0HBLFCBvhQ0ok40zSYIXGP1wLGw
	kQb406YZPabFSEbFxUELi2dXZjozD32rKo+/rrAPBnvhKwunZkw5peP+IrHwp/ydkileB0ypV/7
	u4xLD82PXelJMo9aNBVnI=
X-Google-Smtp-Source: AGHT+IGO0A8r2uuBqox0fVT2/tCFSYV3FxpYBlRvXTVbmzZJv9FxgHqP1rZPRso0qsJLGxd+to3LYA==
X-Received: by 2002:a05:6000:24c4:b0:42b:3268:bfc0 with SMTP id ffacd0b85a97d-42cc1d51edcmr6210355f8f.49.1763825862080;
        Sat, 22 Nov 2025 07:37:42 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb91f4sm17660970f8f.31.2025.11.22.07.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 07:37:41 -0800 (PST)
Message-ID: <c2e353ea-ad0b-40f0-9180-948e77d6d163@tuxon.dev>
Date: Sat, 22 Nov 2025 17:37:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: at91: remove unnecessary
 of_platform_default_populate calls
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251120-at91-probe-v2-0-8c8592f02e8e@kernel.org>
 <20251120-at91-probe-v2-3-8c8592f02e8e@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251120-at91-probe-v2-3-8c8592f02e8e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_073743_960302_83454A4D 
X-CRM114-Status: GOOD (  16.05  )
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

On 11/20/25 23:37, Rob Herring (Arm) wrote:
> The DT core will call of_platform_default_populate, so it is not
> necessary for machine specific code to call it unless there are custom
> match entries, auxdata or parent device. Neither of those apply here, so
> remove the call.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Dust off and rebase to 6.18-rc1
>  - Add new platforms added since v1
> ---
>  arch/arm/mach-at91/at91rm9200.c |  9 ---------
>  arch/arm/mach-at91/at91sam9.c   |  9 ---------
>  arch/arm/mach-at91/sam9x60.c    |  9 ---------
>  arch/arm/mach-at91/sam9x7.c     |  9 ---------
>  arch/arm/mach-at91/sama5.c      | 19 ++-----------------
>  arch/arm/mach-at91/sama7.c      |  8 --------
>  6 files changed, 2 insertions(+), 61 deletions(-)
> 

[ ...]

> diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
> index efae697ce29c..e56022f00800 100644
> --- a/arch/arm/mach-at91/sama5.c
> +++ b/arch/arm/mach-at91/sama5.c
> @@ -6,9 +6,6 @@
>   *                2013 Ludovic Desroches <ludovic.desroches@atmel.com>
>   */
>  
> -#include <linux/of.h>
> -#include <linux/of_platform.h>
> -
>  #include <asm/hardware/cache-l2x0.h>
>  #include <asm/mach/arch.h>
>  #include <asm/mach/map.h>
> @@ -30,11 +27,6 @@ static void __init sama5_secure_cache_init(void)
>  		outer_cache.write_sec = sama5_l2c310_write_sec;
>  }
>  
> -static void __init sama5_dt_device_init(void)
> -{
> -	of_platform_default_populate(NULL, NULL, NULL);
> -}
> -
>  static const char *const sama5_dt_board_compat[] __initconst = {
>  	"atmel,sama5",
>  	NULL
> @@ -43,7 +35,6 @@ static const char *const sama5_dt_board_compat[] __initconst = {
>  DT_MACHINE_START(sama5_dt, "Atmel SAMA5")
>  	/* Maintainer: Atmel */
>  	.init_late	= sama5_pm_init,
> -	.init_machine	= sama5_dt_device_init,
>  	.dt_compat	= sama5_dt_board_compat,
>  MACHINE_END
>  
> @@ -54,17 +45,11 @@ static const char *const sama5_alt_dt_board_compat[] __initconst = {
>  
>  DT_MACHINE_START(sama5_alt_dt, "Atmel SAMA5")
>  	/* Maintainer: Atmel */
> -	.init_machine	= sama5_dt_device_init,
> +	.init_late	= sama5_pm_init,

Should this be in the previous patch?


>  	.dt_compat	= sama5_alt_dt_board_compat,
>  	.l2c_aux_mask	= ~0UL,
>  MACHINE_END
>  
> -static void __init sama5d2_init(void)
> -{
> -	of_platform_default_populate(NULL, NULL, NULL);
> -	sama5d2_pm_init();
> -}
> -
>  static const char *const sama5d2_compat[] __initconst = {
>  	"atmel,sama5d2",
>  	NULL
> @@ -72,8 +57,8 @@ static const char *const sama5d2_compat[] __initconst = {
>  
>  DT_MACHINE_START(sama5d2, "Atmel SAMA5")
>  	/* Maintainer: Atmel */
> -	.init_machine	= sama5d2_init,
>  	.init_early	= sama5_secure_cache_init,
> +	.init_late	= sama5d2_pm_init,

Should this be in the previous patch?

Thank you,
Claudiu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
