Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09175C41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 09:14:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8003620866
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 09:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KpHXiRAt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sl5DvJTU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8003620866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bTu20CWGbcnM7/pWLEVxCGJeZnmAzEPvI0OvZYon4B0=; b=KpHXiRAt31olL4kbSi2OwmPXC
	FfGQQcEY8dtTZyfKw5XpDzqJWq4o20OtFs/J3irHPp90JxsY7SNFk66XMaqSuCuNop4w48fNLsCms
	NdCMPSNNeHc2nbn4bUl975awsB/FA4e7gFdc+z55++C+8ziSkbYvfc/CsrUJPnfuP1g1h915hj5Oi
	spiMTwSO/u52GlmYF/g1kRmccPHP1AYyZSRMyxo2E61xeAe4QFn7iCr0rbaF5mgvevV+3MZ5yUEig
	OHlmkcMvDe70+eDApE9VuAwU/4mCh/rZIzNqk5WHxk0LMaoK5Kl6lS6cRnIG8fEhtNMNkqW1Wzlr3
	gKDySf5xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPj2R-0004M7-5F; Tue, 06 Oct 2020 09:13:39 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPj2M-0004Jc-9L
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 09:13:36 +0000
Received: by mail-vs1-xe43.google.com with SMTP id x185so1143850vsb.1
 for <linux-mtd@lists.infradead.org>; Tue, 06 Oct 2020 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9zZ3JqKuAucMkJsBK3uQ6oqn08Q8o246NeeOkBUzIpE=;
 b=sl5DvJTU8XoKckrDy72v6SE14TnVpy4Bt91zBzW0shyY1MAQ6mAh44/03XDifpnVyT
 4w+72PUsHJIIJhKHPRrCT8pTCi2CZ3lYrznO931Zy9GGzbJgV3AbLMDW/WTkvZw1ySi0
 xZ8mKac9WB616FWJmzh+4pR4DO2W+qMrWvhETvIhmdmS6svN/TirR+Lk59vHi5nED0Fw
 UNsL0wfC4tJEer6UJgLfY8iJyldfPPnH6zruIDXY8NS9LaxnxiZNZZ15iF6VLc8jtGT7
 kw77Swrlk5F0D0JlHVpGszmJH8RyljctW41ctPimXYx2UDZ6rbS2tZM9fINpQJUVuEtk
 CGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9zZ3JqKuAucMkJsBK3uQ6oqn08Q8o246NeeOkBUzIpE=;
 b=lG79G6JDwESAtpuVbQGgWmbimwaaKJbNzLGueNmCfxICCBIbxapsXPh8Mx8W1Kgawz
 Leo0eTVWmqQAjpp7dMAGs+HgByPb/RIsohvIDajvAamTLqHUTsOcNDWO1YO3NsCxm3Gs
 Wo8NlzkXMeHRvs/majvuMbDmZk14ET0Q7czagW5VD8m4WuL7UBXi2xdthQrGE9w4NlBm
 9qzOWtbg6jjngLJc+tHdTJi+S8k8GyIMzlsSN9kovZfKwbnFgDOa3STnVCUOdJFP5KUS
 SAuGo66ubMQmeFm5W3CjVJPe6zEG98YZ7RlQPfSS6InzKEu9jmgThuyPFBH9mvimXcQe
 2axw==
X-Gm-Message-State: AOAM533M5cqGS2XW12Jec80YFOowjYwTVwC3sNE2x0abUakO7z+gZxlw
 1NvNfVp2yJ8EhYW2ERbei66laSXGY2vHqwNVL36l2Q==
X-Google-Smtp-Source: ABdhPJw+U5yOHue/Ytd8RPqMjT92IYE0mZoO7yO1YIY/4s+p2JNLru501tVYMlY3tURTLHPZrBHXQO8va9HmuomgCis=
X-Received: by 2002:a67:6b07:: with SMTP id g7mr2713184vsc.48.1601975612161;
 Tue, 06 Oct 2020 02:13:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 6 Oct 2020 11:12:55 +0200
Message-ID: <CAPDyKFoxg_i8tcRjV_htv9s1Z=gxYzJtxPAnCqRR9gzR2hkG0w@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_051334_350437_80525338 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Linux USB List <linux-usb@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Sam Ravnborg <sam@ravnborg.org>,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, Linux PM <linux-pm@vger.kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Richard Weinberger <richard@nod.at>,
 dmaengine@vger.kernel.org, linux-mtd@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 at 20:38, Rob Herring <robh@kernel.org> wrote:
>
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml    | 2 ++
>  .../devicetree/bindings/mmc/synopsys-dw-mshc-common.yaml     | 2 ++
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml   | 2 ++

[...]

>  Documentation/devicetree/bindings/power/power-domain.yaml    | 2 ++

For mmc and power-domain:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

[...]

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
