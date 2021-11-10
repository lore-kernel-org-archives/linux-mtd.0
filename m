Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C911C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 19:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3BD061186
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 19:50:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3BD061186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEilOBvO8MzZslBozPywWpu+sSetQRkFHTGljJdtHCM=; b=U1MVeOYgtUXHXi
	CQOTn7kH8QMuyFckkjeHjLFh4aFe5BoQ+AWrvta0B9TGdseTO/3ffbAtfq+7App8A59FnBcTYkwKz
	Mwtf4JsAP7QNKzMe48PtbvxOBqSVUe0Q28dc7Zp8WIXUPPD7kiQsTMFCtcBSh8qxxcwpr5Jq715Vg
	M1L67LR9lV6M1OfvNdR3pGJqTaG9D9uz1ZEG2xxvDI3qSLveZzywQhu8xaWyjFlC/8wrFx8Ln+KIO
	IC75ARy9+m55352+NObPgBrxTMPccL79LcflQ+UzRbNXJJBLRHB+mFZajsYqcJVtbV+PqNCNsY42e
	J8xSgmG0E/2mXPE4nBVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktbT-006ClC-MV; Wed, 10 Nov 2021 19:49:51 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktbR-006CkK-J8; Wed, 10 Nov 2021 19:49:50 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 q33-20020a056830442100b0055abeab1e9aso5529660otv.7; 
 Wed, 10 Nov 2021 11:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jffv+4OBBpjkkC43YZCngYWCvEJMwZVhqAxEmFK8L/I=;
 b=oRqKVVwM9Ixh9G7Jb30gU7bVt7fQob07afgAsaU3oqckZLtehJN2bVKkp+pIuHlCH/
 0CjjQ9xH1ErukqNcrxztJuyCG63jcQ+A8hInwxsTKwY/IpQl9afjeDSD3A5kTL1NR0De
 lp9sE32hAdNDrS5zn1fkl0GVYyQoP3jVA1VipIPF+4SDmMZc6dE9RGFI00rp4hAhhu8L
 hBqY/NLQY+g/p6i65Kv56mmPF45U3VrJj5lKdnxApV7IB6QJUW8LMMkvnQYVh/grZxNe
 E++q4+w1Du9z/4QaRJYesQiqVRXDX5uwxI914y12/X7+w2U4cOXNeuF1CgP7DErX9gbM
 HP8g==
X-Gm-Message-State: AOAM530woEZNLEf2kEl4Bs9kLlnL6B0/I5JJpKuTZsfjCfvy+FPOES3A
 HlnRWp2j7Xmi3Ok0HSJuQQ==
X-Google-Smtp-Source: ABdhPJyfVpmfG+ubS7aEU1ww03RUaTffAeDZHobEFdd7aYoPfW2ZAH5HMpiQ+tL5kGtHFO9Urrh52g==
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr1412382otn.299.1636573788340; 
 Wed, 10 Nov 2021 11:49:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p14sm130082oov.0.2021.11.10.11.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:49:47 -0800 (PST)
Received: (nullmailer pid 1843729 invoked by uid 1000);
 Wed, 10 Nov 2021 19:49:44 -0000
Date: Wed, 10 Nov 2021 13:49:44 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Cc: Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org, 
 thierry reding <thierry.reding@gmail.com>, linux-iio@vger.kernel.org, 
 Paul Cercueil <paul@crapouillou.net>, herbert xu <herbert@gondor.apana.org.au>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-remoteproc@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-mtd@lists.infradead.org, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 "david s . miller" <davem@davemloft.net>, 
 olivier moysan <olivier.moysan@foss.st.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-clk@vger.kernel.org, 
 michael turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>, netdev@vger.kernel.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 dmaengine@vger.kernel.org, 
 linux-usb@vger.kernel.org, dillon min <dillon.minfei@gmail.com>, 
 yannick fertre <yannick.fertre@foss.st.com>, linux-watchdog@vger.kernel.org, 
 ohad ben-cohen <ohad@wizery.com>, Le Ray <erwan.leray@foss.st.com>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-spi@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 bjorn andersson <bjorn.andersson@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-i2c@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Jagan Teki <jagan@amarulasolutions.com>, 
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, 
 david airlie <airlied@linux.ie>, alsa-devel@alsa-project.org, 
 baolin wang <baolin.wang7@gmail.com>,
 philippe cornu <philippe.cornu@foss.st.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, daniel vetter <daniel@ffwll.ch>,
 linux-media@vger.kernel.org, 
 Lee Jones <lee.jones@linaro.org>, maxime coquelin <mcoquelin.stm32@gmail.com>, 
 Ludovic Barre <ludovic.barre@foss.st.com>, linux-crypto@vger.kernel.org, 
 Jose Abreu <joabreu@synopsys.com>, linux-kernel@vger.kernel.org, 
 Alessandro Zummo <a.zummo@towertech.it>, Zhang Rui <rui.zhang@intel.com>, 
 jonathan cameron <jic23@kernel.org>, Matt Mackall <mpm@selenic.com>, 
 alexandre torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Vignesh Raghavendra <vigneshr@ti.com>, sam ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Marek Vasut <marex@denx.de>, linux-phy@lists.infradead.org, 
 Guenter Roeck <linux@roeck-us.net>, Richard Weinberger <richard@nod.at>, 
 Lionel Debieve <lionel.debieve@foss.st.com>, vinod koul <vkoul@kernel.org>, 
 Marc Zyngier <maz@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 lars-peter clausen <lars@metafoo.de>, linux-serial@vger.kernel.org, 
 pascal Paillet <p.paillet@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>,
 stephen boyd <sboyd@kernel.org>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: timer: Update maintainers for
 st,stm32-timer
Message-ID: <YYwiWGn0ehnD4nDZ@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-2-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-2-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_114949_660667_B98B9395 
X-CRM114-Status: GOOD (  13.79  )
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

On Wed, 10 Nov 2021 16:01:40 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, add Fabrice and myself as maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/timer/st,stm32-timer.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
