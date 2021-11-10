Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB449C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 19:53:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BF73610D2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 19:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BF73610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DShr2QR2aCV+gn0fSHdvzh0AD5RisV9X4h7uNXHyYWw=; b=va/d2CPZWX+6CD
	9x+xwA3mRsC7pj/E4+exb1O0rcps0bJbDb4j9M4c9C+0/vKW6mIcMju/dkEBBC6S0XthIQM6rfgQT
	V7QgBVe2BjfEYAOMc0BL9joVocbFE9qeLt3cCcUcja3ayorTc2SwqaefMV4hHOum8t92HLiNo6gi/
	I5pouEXmFbmTD9cswN45Tdoa2dQ/7GdPE5mqusxtf1vE0NJa5MEMuOuTnzieKG9wXwPLTfSHtjOfA
	/O5AHHteNkIxdX76CZzsTzRt4A6iFNiC9hn2LtYAy3/AH9OHaoD+TsvKdxrWz5S3xUSB4lqekiilc
	5iY/AXkIrW13twCuDsmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkteh-006EPs-Ej; Wed, 10 Nov 2021 19:53:11 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktd0-006DPc-6U; Wed, 10 Nov 2021 19:51:27 +0000
Received: by mail-ot1-f54.google.com with SMTP id
 x19-20020a9d7053000000b0055c8b39420bso5583447otj.1; 
 Wed, 10 Nov 2021 11:51:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ObzL7zoc4FaanTV0FRdsY2Jh7qTWU6rDhJWsEvGiEMQ=;
 b=78+8z5fyxqXP3Q1ROgjOrlzYD4mj2Ny3VxcidwEMAUGaPdHXUkDkdDsr69Do2x9BTk
 rpCSbSHKMWAfyp+KndwC8AE7wYmRbb5jw/dDU4oFgDZ4RZSsEICG8aOdId6G+s86QFry
 j29HG7bypnI53yVjMCqmz8+gZTyUwJp0TJOZWF4KBq7monI7vwBI7A6P8Guv/16/1pvB
 Qt2WqjTane91Cvr+k7LgTQWv+J9MXIGhlICwP6TiAJfr3UkSVbye5orrc/iyvjKBn5wY
 UXy5L5rxLsfiSz7Kt5QCGph/xO7VzLp2aiXrm1fqEUpfMPVQyhA2Foj5bEMzLC5UJOcU
 78OA==
X-Gm-Message-State: AOAM531pur/RAusudyVf5f7N/Xt3ctrAhwyYJHOtvhyLht+wdWFSWj5A
 ZgZUSO7eIyAs8DeJJGWbtw==
X-Google-Smtp-Source: ABdhPJyc+9+E+QZMI61J8RiueoqqJVjd5eWhNxneY0MS3rvPxMprKNWZtdE0NAi9tMvBLGJnnztoeA==
X-Received: by 2002:a9d:bf2:: with SMTP id 105mr1475029oth.21.1636573885318;
 Wed, 10 Nov 2021 11:51:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bb39sm213735oib.28.2021.11.10.11.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:51:24 -0800 (PST)
Received: (nullmailer pid 1851374 invoked by uid 1000);
 Wed, 10 Nov 2021 19:51:21 -0000
Date: Wed, 10 Nov 2021 13:51:20 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Cc: linux-i2c@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, 
 dri-devel@lists.freedesktop.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-gpio@vger.kernel.org, 
 daniel vetter <daniel@ffwll.ch>, linux-crypto@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>,
 yannick fertre <yannick.fertre@foss.st.com>, 
 Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>, 
 linux-arm-kernel@lists.infradead.org, pascal Paillet <p.paillet@foss.st.com>, 
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
 michael turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 jonathan cameron <jic23@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
 Sebastian Reichel <sre@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org, 
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-remoteproc@vger.kernel.org, 
 benjamin gaignard <benjamin.gaignard@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>, Matt Mackall <mpm@selenic.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, 
 alexandre torgue <alexandre.torgue@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 baolin wang <baolin.wang7@gmail.com>, lars-peter clausen <lars@metafoo.de>,
 netdev@vger.kernel.org, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 david airlie <airlied@linux.ie>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-iio@vger.kernel.org, 
 olivier moysan <olivier.moysan@foss.st.com>, ohad ben-cohen <ohad@wizery.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-spi@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 herbert xu <herbert@gondor.apana.org.au>, 
 philippe cornu <philippe.cornu@foss.st.com>, linux-mtd@lists.infradead.org, 
 stephen boyd <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Mark Brown <broonie@kernel.org>, 
 linux-serial@vger.kernel.org, "david s . miller" <davem@davemloft.net>, 
 dillon min <dillon.minfei@gmail.com>, alsa-devel@alsa-project.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, linux-phy@lists.infradead.org, 
 Jakub Kicinski <kuba@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Richard Weinberger <richard@nod.at>, Thomas Gleixner <tglx@linutronix.de>,
 Le Ray <erwan.leray@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>, 
 linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org, 
 sam ravnborg <sam@ravnborg.org>, bjorn andersson <bjorn.andersson@linaro.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Marc Zyngier <maz@kernel.org>, Ludovic Barre <ludovic.barre@foss.st.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Lee Jones <lee.jones@linaro.org>,
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>, 
 vinod koul <vkoul@kernel.org>, thierry reding <thierry.reding@gmail.com>, 
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: media: Update maintainers for
 st,stm32-hwspinlock.yaml
Message-ID: <YYwiuItyk2NtQC4v@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-5-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-5-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_115126_284141_C44E32B9 
X-CRM114-Status: GOOD (  13.24  )
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

On Wed, 10 Nov 2021 16:01:43 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, remove his name from maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  .../devicetree/bindings/hwlock/st,stm32-hwspinlock.yaml          | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
