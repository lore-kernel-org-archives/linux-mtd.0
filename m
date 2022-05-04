Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E69C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  4 May 2022 21:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=st9pxzOWTQsOXvEjPKqUotjuhlXwy3wvT4rtBoPTVuM=; b=dr+UefoqwbbVk8
	XdfM3P/+6AP4bpUiEMb9TFZ3We5XU4hYCJm0Y+tXZm6i9/sq0D8Ch7ubwUythW8T1qy0d+Kzu88Me
	8dj7SroBVG2/m04Ad4dHEQOiUHcEtfPyC5mgrUNp6T5c1fEchiMrZw1UJaS2vjgR+dGL5ttluKjwG
	Pqh/0w5WWlxm+YfxDsD5PSrT5AjbGdiLdKdjfTlVxHBZ9b6grFfV/2/09wHRY3RqhnUuIbH00+xAy
	Eq5SJ5vXcVVl+wGoAFu1876kBPH1kE5gkudkDYAHlivKN1JoKP7N50lNo3ntO7v60WYeEs5/1sNyI
	AXRn901afEEFiHwspcoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmMOh-00Clzx-KC; Wed, 04 May 2022 21:18:59 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmMOe-00Clyi-Gp; Wed, 04 May 2022 21:18:58 +0000
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso2504010fac.1; 
 Wed, 04 May 2022 14:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=S5KOsETtEM/tlLh5aE4TllMhkuOxHv7tKaCHP6S4dRs=;
 b=K1yDhs6XuvUY9kf4R5Xva/GzZqsqlY9BrlC5gwSmTNx/JseexQkITRluE5NCNlTQwu
 Xh4yKv1tq6o9wsuZYX4upd2UJk4YJUEEHuB12hGPGPEBubGNL73OROc2nvpYbMBg2x8Y
 hVtmFjXAN6z3m0ljGl8HTMkc2m5AtF5hjOOQFYALuA5JWhWGzf0ZEJN40O/izB8sMt8D
 z23lWoYjzGaUy53x+F1yEzvqoCxlWkZ1K3lbl1eorszTmvy6+JhTeaSO2dkexqCUUUpV
 ouToJUZ9yFxH63odk/bsCv+XATx2hSbs2DS64Fjwsrym00wfxitbInaRVK6GLgY/izZZ
 rStQ==
X-Gm-Message-State: AOAM531gL1me3UeE03tbb+SA9F4+HmF2/W6m0MfMSmpvRXGLKfo+5ndY
 f6aED1uEiDTaTTWeW6gfWA==
X-Google-Smtp-Source: ABdhPJx70C27VXLkiWuEEIrWSrTpQJyJY8Bcpnd3QFecXI5OFZqDfycowXXO+amY4bM1axvVUtwzWg==
X-Received: by 2002:a05:6870:7a8:b0:e5:d471:1e82 with SMTP id
 en40-20020a05687007a800b000e5d4711e82mr785288oab.138.1651699135188; 
 Wed, 04 May 2022 14:18:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m1-20020a056808024100b00325cda1ff88sm15372oie.7.2022.05.04.14.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:18:54 -0700 (PDT)
Received: (nullmailer pid 2242697 invoked by uid 1000);
 Wed, 04 May 2022 21:18:52 -0000
Date: Wed, 4 May 2022 16:18:52 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Wolfgang Grandegger <wg@grandegger.com>, 
 Jonathan Cameron <jic23@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, netdev@vger.kernel.org, 
 Dario Binacchi <dariobin@libero.it>, Han Xu <han.xu@nxp.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Anson Huang <Anson.Huang@nxp.com>, Richard Weinberger <richard@nod.at>,
 Chen-Yu Tsai <wens@csie.org>, 
 linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, 
 linux-iio@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, 
 Jakub Kicinski <kuba@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Mark Brown <broonie@kernel.org>, 
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-serial@vger.kernel.org, 
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-phy@lists.infradead.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Abel Vesa <abel.vesa@nxp.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-rtc@vger.kernel.org, 
 Jonathan Hunter <jonathanh@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-mmc@vger.kernel.org, 
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop redundant 'maxItems/minItems' in
 if/then schemas
Message-ID: <YnLtvA9hWMSIfSP7@robh.at.kernel.org>
References: <20220503162738.3827041-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503162738.3827041-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_141856_601662_52A19E40 
X-CRM114-Status: GOOD (  19.95  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 03 May 2022 11:27:38 -0500, Rob Herring wrote:
> Another round of removing redundant minItems/maxItems when 'items' list is
> specified. This time it is in if/then schemas as the meta-schema was
> failing to check this case.
> =

> If a property has an 'items' list, then a 'minItems' or 'maxItems' with t=
he
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooli=
ng
> will fixup the final schema adding any unspecified minItems/maxItems.
> =

> Cc: Abel Vesa <abel.vesa@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Wolfgang Grandegger <wg@grandegger.com>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: "Niklas S=F6derlund" <niklas.soderlund@ragnatech.se>
> Cc: Anson Huang <Anson.Huang@nxp.com>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Han Xu <han.xu@nxp.com>
> Cc: Dario Binacchi <dariobin@libero.it>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: linux-clk@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-serial@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/clock/imx8m-clock.yaml           |  4 ----
>  .../bindings/display/bridge/renesas,lvds.yaml |  4 ----
>  .../bindings/display/renesas,du.yaml          | 23 -------------------
>  .../bindings/iio/adc/st,stm32-adc.yaml        |  2 --
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    |  7 +-----
>  .../devicetree/bindings/mtd/gpmi-nand.yaml    |  2 --
>  .../bindings/net/can/bosch,c_can.yaml         |  3 ---
>  .../bindings/phy/brcm,sata-phy.yaml           | 10 ++++----
>  .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml | 10 --------
>  .../bindings/serial/samsung_uart.yaml         |  4 ----
>  .../sound/allwinner,sun4i-a10-i2s.yaml        |  1 -
>  .../bindings/sound/ti,j721e-cpb-audio.yaml    |  2 --
>  .../bindings/thermal/rcar-gen3-thermal.yaml   |  1 -
>  13 files changed, 5 insertions(+), 68 deletions(-)
> =


Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
