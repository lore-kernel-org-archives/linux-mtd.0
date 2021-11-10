Return-Path: <SRS0=TRF+=P5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DD8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 19:52:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571B1610D2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Nov 2021 19:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 571B1610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iW9fOul3hrDeGw8FYxpOL7nIZYl9gtaZlV4Pn4PUjqA=; b=vzna7gvu1ThGOQ
	+BLxoXRPYr08+G1gw2UcgfMYUpOKaYKmZ34IUKKHG/81C05O1WLw7iXIau6AGsGJ24JT537hwhJBQ
	AwV2H4ONsHGm4Bc6zpe2a50iaxuRqGRsNE6mR7ke74waLF9c/peo51nsp4fvfiUEGyos8Fm8Kvhbu
	v7tWTfKfoUcbx1QXPaWm1nbNs8qmqfasR6aT/+Pkw6CG2/CJ+aVD6GF8138onlHAdwdp2lZKPoqVY
	4SbwbZoCzvlIA3j64sfANHSyg1+jwynMVSKp/yrTzCVcPJETZQKsSj1RBd1xoYEffPq0/iYE98DHh
	OBvnwGxqRrkr4bTYJJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mktdv-006DvQ-Lx; Wed, 10 Nov 2021 19:52:24 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mktch-006DEL-70; Wed, 10 Nov 2021 19:51:08 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 z2-20020a9d71c2000000b0055c6a7d08b8so5587648otj.5; 
 Wed, 10 Nov 2021 11:51:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IaGtHvG6f2Nq9zdI9Tpc3bPF147EUDcHeqfU5NOs8/A=;
 b=CgzEhCkcVZ/uWs6GhfeqP20vqD5xYazdjgS0wVgrUWrtUx6ntEOJ5slVR3TvcqNJ3x
 imr+XRI3t0MAoIRr1dsbfU0ZcxPRRCS2/QMn/W6GF+JV0AfhIsA8nu6dcmqlmBqYTnGF
 41E9q882r8d2JP72mVY18nSIlDDz0I3Cof7Bfj6i0idBk/J0Z+16gVFxP6UATdOu4Dsm
 hpfMEaHXRDniM02K439PpAbHsFnm1g2Hg2QGuLcT40jDBk9waUDwQOvAp2l2YvQyAWZU
 OqC37DgVhZPW55AXxuNssfe4sd8uSU1IDxhnPxTGN/fi2NTccfXJTaYT4Fe9/o/xxKVm
 OsIg==
X-Gm-Message-State: AOAM5320yOfpEKAkge4PoH8dMWnB4+t5mGwvuXSofyUUA7jVoKXSD0rL
 LD+yMmWaOJthktESxXpg5A==
X-Google-Smtp-Source: ABdhPJyoqzCKoO1mccILtZ9+sI1239ZXZq43Cb4nIbMhmS7HoNW5DY3iPPKtMi57BRAkrSAOfgsptg==
X-Received: by 2002:a9d:6854:: with SMTP id c20mr1506260oto.190.1636573866562; 
 Wed, 10 Nov 2021 11:51:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id q44sm190616otv.80.2021.11.10.11.51.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 11:51:05 -0800 (PST)
Received: (nullmailer pid 1849495 invoked by uid 1000);
 Wed, 10 Nov 2021 19:51:02 -0000
Date: Wed, 10 Nov 2021 13:51:02 -0600
From: Rob Herring <robh@kernel.org>
To: patrice.chotard@foss.st.com
Cc: linux-i2c@vger.kernel.org, olivier moysan <olivier.moysan@foss.st.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, linux-pm@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, dillon min <dillon.minfei@gmail.com>, 
 yannick fertre <yannick.fertre@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 linux-spi@vger.kernel.org, thierry reding <thierry.reding@gmail.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 david airlie <airlied@linux.ie>, linux-iio@vger.kernel.org,
 linux-rtc@vger.kernel.org, jonathan cameron <jic23@kernel.org>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 maxime coquelin <mcoquelin.stm32@gmail.com>,
 bjorn andersson <bjorn.andersson@linaro.org>, 
 Sebastian Reichel <sre@kernel.org>, daniel vetter <daniel@ffwll.ch>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, linux-media@vger.kernel.org, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "david s . miller" <davem@davemloft.net>, alsa-devel@alsa-project.org, 
 Guenter Roeck <linux@roeck-us.net>,
 benjamin gaignard <benjamin.gaignard@linaro.org>, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, netdev@vger.kernel.org,
 alexandre torgue <alexandre.torgue@foss.st.com>, dmaengine@vger.kernel.org, 
 Alessandro Zummo <a.zummo@towertech.it>, Jakub Kicinski <kuba@kernel.org>, 
 lars-peter clausen <lars@metafoo.de>, Lee Jones <lee.jones@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Le Ray <erwan.leray@foss.st.com>, pascal Paillet <p.paillet@foss.st.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Matt Mackall <mpm@selenic.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-stm32@st-md-mailman.stormreply.com, ohad ben-cohen <ohad@wizery.com>, 
 Lionel Debieve <lionel.debieve@foss.st.com>, linux-watchdog@vger.kernel.org, 
 philippe cornu <philippe.cornu@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 linux-serial@vger.kernel.org, Richard Weinberger <richard@nod.at>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-gpio@vger.kernel.org, Ludovic Barre <ludovic.barre@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 linux-phy@lists.infradead.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>, 
 arnaud pouliquen <arnaud.pouliquen@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
 sam ravnborg <sam@ravnborg.org>, 
 vinod koul <vkoul@kernel.org>, linux-remoteproc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, michael turquette <mturquette@baylibre.com>, 
 linux-kernel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 linux-usb@vger.kernel.org, 
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 linux-crypto@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>, 
 Marek Vasut <marex@denx.de>,
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 baolin wang <baolin.wang7@gmail.com>, 
 stephen boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
 herbert xu <herbert@gondor.apana.org.au>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: media: Update maintainers for
 st,stm32-cec.yaml
Message-ID: <YYwipuVeW+U9LgXa@robh.at.kernel.org>
References: <20211110150144.18272-1-patrice.chotard@foss.st.com>
 <20211110150144.18272-4-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110150144.18272-4-patrice.chotard@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_115107_306206_4BBBFD66 
X-CRM114-Status: GOOD (  13.15  )
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

On Wed, 10 Nov 2021 16:01:42 +0100, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Benjamin has left the company, remove his name from maintainers.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>  Documentation/devicetree/bindings/media/st,stm32-cec.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
