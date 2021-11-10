Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B07FC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 19:55:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3561761106
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 19:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3561761106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sypX6vHILuglzEpRQK7gSr3QPjAPEvDTtGmLRI06tw=; b=FmcYkYl9wWFQ6m
	Hn5+Ijl/Lun+OHqXoZyhlTOp4wYgH37Y872k7amLEy6LR1cfYIm477nA1qv2tbmfRGbWgKMN+4T6x
	BhJDwwOZb0cZtzlKU9+IrqU/uFdAehuxGkpgKycYCiKBf7e/HkpWgRYO912089Mh6VpG6BJ4+6Ws5
	Mf/Eux37QYtp5x1HZOo2roJWvqaEwuJaaED0r6Kp/65p5OLBJbv0q2AYl6ey9o+CKtc3jE7WX9NF6
	GGvmFsNYBShiWTEIFwv83Uo+dN6HqJeF67HD9dtJsnPX6IttDYi/7MiG9MI97mAZkRYEcQ0N6xzG8
	TzQpWK99Za41sWdjN9ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktg8-006F7q-Jb; Wed, 10 Nov 2021 19:54:41 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktf6-006EdU-TP; Wed, 10 Nov 2021 19:53:38 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 z2-20020a9d71c2000000b0055c6a7d08b8so5596967otj.5; 
 Wed, 10 Nov 2021 11:53:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rtQL/sbdzpxz6Lu8ElJAZUiYQnGOPRjAvEo183EhEZQ=;
 b=PVxBAEehHcMDizxH1tWCOn4ubK+qIV+c4Qq6odCL1pRa3/u0daHP6iHAAWVyluX3z7
 Pb1X7gths3XZS3iLvfOfYRxEQOB8ddwglCMMejcLku0WODxH43n6klqKC/6hGEg8nqan
 6q/rRHqIvuLEphCuytJcaf0hLUBfqWNA1F7N1mK8iT4xuwU1ebWy1RZlJk90I5epSaYF
 YTD+Og7HYfZOTQSsynupIw7qc2Diww/V+a+vrjhkomPklRAWVwVZEec+udl6ZfCOHwxn
 0hgkedLQkw7X4+k672mn6dg4TutTTEol009YrZDarAhWJh2GTzVDMHbuDEjCjvZ66e+e
 RCQA==
X-Gm-Message-State: AOAM533K9P7GFXpNpl3bFF4gDfKoxu9+7GqYHhck8uA0Rv6KQdpafRiC
 HfMZgD8Oc5c6EVKraAQh6w==
X-Google-Smtp-Source: ABdhPJzPMoAqV3AUGDDa1G/mcQBg1/+e3vLu75Mv4kA30QovRpmA/hmvXuDtC6I5AysjT0t7pidUQg==
X-Received: by 2002:a9d:6a4e:: with SMTP id h14mr1449816otn.134.1636574015905; 
 Wed, 10 Nov 2021 11:53:35 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j7sm129827oon.13.2021.11.10.11.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:53:35 -0800 (PST)
Received: (nullmailer pid 1864115 invoked by uid 1000);
 Wed, 10 Nov 2021 19:53:32 -0000
Date: Wed, 10 Nov 2021 13:53:32 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 alexandre torgue <alexandre.torgue@foss.st.com>,
 jonathan cameron <jic23@kernel.org>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 olivier moysan <olivier.moysan@foss.st.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>, Lee Jones <lee.jones@linaro.org>,
 linux-mtd@lists.infradead.org, linux-watchdog@vger.kernel.org, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 maxime coquelin <mcoquelin.stm32@gmail.com>, Matt Mackall <mpm@selenic.com>, 
 vinod koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 baolin wang <baolin.wang7@gmail.com>, linux-spi@vger.kernel.org, 
 david airlie <airlied@linux.ie>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 netdev@vger.kernel.org, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, ohad ben-cohen <ohad@wizery.com>,
 linux-gpio@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>, 
 Le Ray <erwan.leray@foss.st.com>, herbert xu <herbert@gondor.apana.org.au>, 
 michael turquette <mturquette@baylibre.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>,
 linux-serial@vger.kernel.org, 
 Amit Kucheria <amitk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Ludovic Barre <ludovic.barre@foss.st.com>,
 "david s . miller" <davem@davemloft.net>, 
 Lionel Debieve <lionel.debieve@foss.st.com>, linux-i2c@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
 thierry reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 philippe cornu <philippe.cornu@foss.st.com>, linux-rtc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 alsa-devel@alsa-project.org, Zhang Rui <rui.zhang@intel.com>, 
 linux-crypto@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-iio@vger.kernel.org, 
 pascal Paillet <p.paillet@foss.st.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-pm@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>, stephen boyd <sboyd@kernel.org>, 
 dillon min <dillon.minfei@gmail.com>, devicetree@vger.kernel.org, 
 yannick fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 linux-phy@lists.infradead.org, 
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 sam ravnborg <sam@ravnborg.org>, 
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 Viresh Kumar <viresh.kumar@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-clk@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Richard Weinberger <richard@nod.at>, 
 Rob Herring <robh+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>, 
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org, 
 daniel vetter <daniel@ffwll.ch>, Marc Zyngier <maz@kernel.org>, 
 bjorn andersson <bjorn.andersson@linaro.org>,
 lars-peter clausen <lars@metafoo.de>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: timers: Update maintainers for
 st,stm32-timers
Message-ID: <YYwjPAoCtuM6iycz@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-3-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-3-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_115337_001695_A5E068E7 
X-CRM114-Status: GOOD (  13.67  )
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

On Wed, 10 Nov 2021 16:01:41 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, remove his name from maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/mfd/st,stm32-timers.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Lee indicated he was going to pick this one up, so:

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
