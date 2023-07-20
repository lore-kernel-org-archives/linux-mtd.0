Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDA6EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yza/BbX7vlvNbG2RJBjcZHpYIE9blH6AhxHWLyOgW7I=; b=J2/J7d+hehuYRj
	CvXgzmOzrb9GpmS+TqKq///AcUi2PxVvIOjdROfPO1jP1VtVWl+LOzuwJXbI0TIz2qlyyHrnmiAx6
	JWXuvDAohgG/Ml2erZIX9+4qWNIVPUpjmKaaEca2ssAotyUUPYqco/4gTMkyPW/UV5qTftN6kxYRE
	VbcgFYgNWeotXD7kzKIFCV9q1wfb4e2rjYt3zflAMah3gYJlJ4Z3Efj9NBoa4dSvtkxUe4vArSRpB
	wkK0UEitCLbxUAHmysFLgcOmZCeF/U8p3I+4xx/IOBaBo1v9qZ0roRPB2uGVOgl9N11oUaQRnbemp
	m51LNHoOPVrqpos43nNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXHE-00Bly7-0F;
	Thu, 20 Jul 2023 17:17:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMXHB-00BlxO-00;
	Thu, 20 Jul 2023 17:17:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-666edfc50deso756140b3a.0;
        Thu, 20 Jul 2023 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689873435; x=1690478235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J0uAt1FpVvgdk69DWGVo/B/WilumnjHo3ckls2wQj2c=;
        b=MK+qmNNORXwB0I5M1ECJrML+kKdViRer5kBwEH13jqFqWPrvH9qpVwD+NCq/1d018c
         dmHLfc1tu6kO/ikoIBoIR1krTQBsGZ3+q9u5v3XSZyYbOkyC67YXvHVlcxgsQWsqZgtm
         4SH2TD93EzA0VP1rFamx/Cxpixhc1xvinZAjcekhOe3ngbMxphygvDdsOviDfTtnsbmZ
         umZ7UPenNo+uzSz1TkMIjeWQt9QLKY1ACnKSlpgNnzP7MRX/LNX+PoEOdVdbQQ+Lidiy
         cOGFq119CJN/FS7RftR/9pmwUsBDbw0jIdcDb2SJf2KjVezldwj7jUFTSW8pAI6VW6KZ
         ONLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689873435; x=1690478235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0uAt1FpVvgdk69DWGVo/B/WilumnjHo3ckls2wQj2c=;
        b=Bp0hBUbi+u3QafZkYqofvzL+gSzNWiwv10nNFMpm2p2yC7gJCOrlv23exZmd4M/xOY
         UGb2H63PY0KYzjf+LOESAeAkUagVfVPDsuOewf19IO8F2LiNHIRbgLE3gR2au1Ntb3Ft
         8miQUCwqBja1UmkYfRsn2jTuTJyjhxaFVRWJUemo7plUSArGv7w202Hvn2P7PvWRNYh0
         BxoK8ilOGBA4Cb97FRuZdxet3K75CJvlt2/86r7OBU1pEqr52uKk2aLy9eG4eVihFLVj
         sI6wrIyiXINxHQK/pLgs1V7vvwAL/iwjScQEHKhqS6Vwlqf1XnNxBjF8/Xulno+OYA5Z
         Yyxg==
X-Gm-Message-State: ABy/qLZ6IAafGtjwzf/3+cri+3M/FsjNEnhCRq7ToVy2ZlXx4LEhYWHO
	2ezArCdM9L7ON993JQPljW0=
X-Google-Smtp-Source: APBJJlEkTI4A4ZrOCc+WXlC2nBipWy2JSRmd1c5HMwU8MruA6yjpC2qz2tfZemAEl4HUzSYjKYO5qQ==
X-Received: by 2002:a05:6a00:24d1:b0:668:8ad5:778f with SMTP id d17-20020a056a0024d100b006688ad5778fmr10559001pfv.17.1689873434754;
        Thu, 20 Jul 2023 10:17:14 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e754:74d1:c368:67a2])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b00682a75a50e3sm1502944pfn.17.2023.07.20.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 10:17:14 -0700 (PDT)
Date: Thu, 20 Jul 2023 10:17:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 28/42] input: keypad: ep93xx: add DT support for
 Cirrus EP93xx
Message-ID: <ZLlsFTe2nvFw698l@google.com>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-28-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605-ep93xx-v3-28-3d63a5f1103e@maquefel.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_101717_040482_B297B892 
X-CRM114-Status: GOOD (  14.52  )
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

On Thu, Jul 20, 2023 at 02:29:28PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> - drop flags, they were not used anyway
> - add OF ID match table
> - process "autorepeat", "debounce-delay-ms", prescale from device tree
> - drop platform data usage and it's header
> - keymap goes from device tree now on
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>

This is awesome, thank you!

>  
>  #include <linux/bits.h>
>  #include <linux/module.h>
> +#include <linux/of.h>

Are you sure you need this? I think the only OF-specific structure that
is being used is of_device_id, which comes from mod_devicetable.h that
you include below.

Otherwise:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the rest of the series.

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
