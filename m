Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0E6ECAAA1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Oct 2022 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/BzbVcyeC/B9tZixvdX7KWkhO6ee64El8ZpG2naGBA=; b=ZdFujBHhcvm/id
	CikDI9+CVskcIM5N2+hE+SwftH4u+9wMmFvddftkoTs+ln32ev9IjwRW0u0dYGzL+XMpIy78jmGhO
	pU79SKIi300mOf5Pha6AYawZkfW0hLzehSf/3T+dAIxxMopcJLv20eQsFlhFR9UfXk2Qw/z4Kh39x
	F0cwuD4Js9rQOwpAGZm+3JNddEmsjH0hfPgcx+sklzq3xQK54xgeeGEmx84sxtMHF1bz54xYrbYb5
	nShCRNwRcmZnkzHi1nBnK+vEWfGrkn8+fFWonYPHDNkV/Emx0sTjtwzg+ihl9N48gWrHbPaCAKj39
	UsxXHKP3XGZB7QIIni9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omx4W-001bGe-De; Mon, 24 Oct 2022 13:00:52 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omx4J-001bA7-HK; Mon, 24 Oct 2022 13:00:40 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-132fb4fd495so11672655fac.12;
        Mon, 24 Oct 2022 06:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+x9joGdXdBFLPPxN1p6d7/jrm+b1E7zu0ZikUl9XbM=;
        b=3HTrlZYW7zD74R4539XWrN4uU4BSRTYLyNpUDiACChhwSdEsTR/AdgJ7BnzO2o9POG
         UKep/B9g5E1f/cwGCA16JxAJLPEuohzMy9n6EjPGbyi1kND/h7XrfQyMnRCqvJpphVYo
         TVaN5HfltCU92Fv6PMZoSnHyJtdFjp3LHOxtsubAe8D6SQENQwVo1CrtTY+J0sPzGtbv
         mzxuHRmqjNFi4/oPIM6qVYepoFheAL5faLXFLlRV2J6ue4K0Zh2icxdoicDEv55UeKZm
         SOQCddmONszeYC5roDiaewWYaRQG3ZTP9t+iXnyt/cKpne+1IBK9Ttse9p5TRF1nl6Ms
         UAPw==
X-Gm-Message-State: ACrzQf1e8VyAF4pe3vvlKMDCChampYsD6qLvVWYVp/5h5yqPkZ2TfSzz
	avW2BcClhPh6ewe6z5ke/g==
X-Google-Smtp-Source: AMsMyM4RB1x55W7tWXLqKMCfn9+yNGKoyP28eeDXqoWuK46CSg7FurAIxSSG6961lNUtLuCZU2W88g==
X-Received: by 2002:a05:6870:e9a8:b0:133:223f:49a1 with SMTP id r40-20020a056870e9a800b00133223f49a1mr38235091oao.114.1666616434841;
        Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g20-20020a056870c15400b0012796e8033dsm2716705oad.57.2022.10.24.06.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 06:00:34 -0700 (PDT)
Received: (nullmailer pid 1652638 invoked by uid 1000);
	Mon, 24 Oct 2022 13:00:35 -0000
Date: Mon, 24 Oct 2022 08:00:35 -0500
From: Rob Herring <robh@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org, 
	Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>, Arnd Bergmann <arnd@arndb.de>, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-stm32@st-md-mailman.stormreply.com, linux-ide@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
Message-ID: <20221024130035.GA1645003-robh@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_060039_594144_3ED6E929 
X-CRM114-Status: GOOD (  15.02  )
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

On Fri, Oct 21, 2022 at 10:22:28PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was marked as deprecated a while ago,
> and for the s3c64xx platform, we marked all except one legacy
> board file as unused.
> 
> This series removes all of those, leaving only s3c64xx support
> for DT based boots as well as the cragg6410 board file.
> 
> About half of the s3c specific drivers were only used on
> the now removed machines, so these drivers can be retired
> as well. I can either merge the driver removal patches through
> the soc tree along with the board file patches, or subsystem
> maintainers can pick them up into their own trees, whichever
> they prefer.

[...]

>  Documentation/arm/index.rst                   |    1 -
>  Documentation/arm/samsung-s3c24xx/cpufreq.rst |   77 -
>  .../arm/samsung-s3c24xx/eb2410itx.rst         |   59 -
>  Documentation/arm/samsung-s3c24xx/gpio.rst    |  172 --
>  Documentation/arm/samsung-s3c24xx/h1940.rst   |   41 -
>  Documentation/arm/samsung-s3c24xx/index.rst   |   20 -
>  Documentation/arm/samsung-s3c24xx/nand.rst    |   30 -
>  .../arm/samsung-s3c24xx/overview.rst          |  311 ---
>  Documentation/arm/samsung-s3c24xx/s3c2412.rst |  121 -
>  Documentation/arm/samsung-s3c24xx/s3c2413.rst |   22 -
>  .../arm/samsung-s3c24xx/smdk2440.rst          |   57 -
>  Documentation/arm/samsung-s3c24xx/suspend.rst |  137 --
>  .../arm/samsung-s3c24xx/usb-host.rst          |   91 -
>  Documentation/arm/samsung/overview.rst        |   13 -

What about?:

Documentation/devicetree/bindings/clock/samsung,s3c2410-clock.txt
Documentation/devicetree/bindings/interrupt-controller/samsung,s3c24xx-irq.txt
Documentation/devicetree/bindings/mmc/samsung,s3cmci.txt
Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
Documentation/devicetree/bindings/usb/s3c2410-usb.txt

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
