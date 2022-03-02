Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20164C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Mar 2022 02:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r/8JRTgx2I30Hta4516ba8SS1qGq7TV5Q1WwYt2LeNk=; b=PzA31lCGNC3R9V
	mvYNqFDL+1H8H+kJj4DgJOqyDNh13tiXzIOIe3InCD41/spiZ5KCQyrDV5lMAol7rJMxwevOEs6Y+
	fMLHv3wZU96p9awvgyRw2CKmoyOfP6nY9KkVsxdeVooXZG6T0AswkcAJZ6xtBQwXCffPAP8a2w2FC
	vhSfMIiQ7/fUerJJho5aoUn9xVVp/JkPB021DWalE1aVSkhQ2N7acAyp1x5puOXuX+3eqkAgrW1Nu
	60MPaHRGmXu/Mfgm+LLmSdPWujQZNkG/7dgHEbN/iJ4soPE7r8yuU4Hfiiup3TDWAKdUz7Yx9KDLq
	y2/u4YaKJWKkKZ4nB4pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPF0c-001A60-DW; Wed, 02 Mar 2022 02:46:34 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPF0B-0019wN-Et
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2022 02:46:10 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso467368ooi.1
 for <linux-mtd@lists.infradead.org>; Tue, 01 Mar 2022 18:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wjdqSaPpltqhLridozcEUTEQoIYV6/3L4YmJnQ5z0lY=;
 b=LN9nnhqICRhttXAVr1od9T1t/Ymtpxhtz4tHsjH3dYjcd3Rkq9C9wMhSXlkrlSYC1A
 DlJ/JptFxg1yVABD2c1AkWjsPC7Du3KLmBhl0PmcAe7J/mlUk1cp6g/yIWvbZRRK/ixo
 +bm5IDVzJdC4fxWuoEI4G5CHndK46TO9kW9KbAaQI641rdN+rU1dvb6VBLEpmuuVwgUt
 80QLDod/jgV5iicQ0WoUYh+G5NUspA9Y6GZrYqrOz6zP3KBF8+B00J/JX/kKtJbsLcZw
 Nn9Y0EtKII81vB9nbqmK7v/AXIDRsz2QxYS4EGE2oGDGOXpVkmABqBHnLwBv01oaAEdI
 u6og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wjdqSaPpltqhLridozcEUTEQoIYV6/3L4YmJnQ5z0lY=;
 b=VWTRkMsBUN+nv7hMy7k1c8InRZo8HtMTAPk1CV4JBynSMTT8d4e8jgLNr+GFzF6+e8
 x1isM105x5csggM5VAv16gl7o+vH6awTZcolhGPaLbk2wwUAqt8MNYluczaObaD2KsdN
 zEJRfJEk3VQDcJ5ZMhjAJywjahM0VYHSjEXbNTvIlWliiDAvWI9LnO7qlUfk1o2vQuT9
 5HWk12qOpau5iczLC7W0JKwK7FvoQev/JpRaOC8ZiNrHo+8nr//+9aDcmv5n8tzt4K/s
 r8LV5K63bm2+/wzSWzVWoUEGbJN9vypCjg584goxQPtYLnxWZC20W9H6WFcS4i4CY+bN
 vBQQ==
X-Gm-Message-State: AOAM533M1r9x2L4X5iNO0VHzNW+AyuU76w37QZTogNjTdVsbsVDMKFrP
 w+qzuE93imdw6gYHI5s7aL/ZhQ==
X-Google-Smtp-Source: ABdhPJyABJwssvqzs0MiuFje5MNOUuD4BXQpc8Bd2B6R1kdb3joprE0iJZUcrLXMN5kygRaNyqLzdA==
X-Received: by 2002:a05:6820:1396:b0:31c:59f4:2fe4 with SMTP id
 i22-20020a056820139600b0031c59f42fe4mr13722344oow.10.1646189166017; 
 Tue, 01 Mar 2022 18:46:06 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 23-20020a9d0b97000000b005ad33994e93sm7196700oth.31.2022.03.01.18.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 18:46:05 -0800 (PST)
Date: Tue, 1 Mar 2022 18:47:56 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Guenter Roeck <groeck@chromium.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh7a3Gl6PPamTjY5@ripper>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_184607_562297_1FC211A9 
X-CRM114-Status: GOOD (  16.84  )
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

On Mon 28 Feb 13:38 PST 2022, Rob Herring wrote:

> Another pass at removing unnecessary use of 'allOf' with a '$ref'.
> 
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Kishon Vijay Abraham I <kishon@ti.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: netdev@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-spi@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/connector/usb-connector.yaml         |  3 +--
>  .../bindings/display/brcm,bcm2711-hdmi.yaml       |  3 +--
>  .../bindings/display/bridge/adi,adv7511.yaml      |  5 ++---
>  .../bindings/display/bridge/synopsys,dw-hdmi.yaml |  5 ++---
>  .../bindings/display/panel/display-timings.yaml   |  3 +--
>  .../devicetree/bindings/display/ste,mcde.yaml     |  4 ++--
>  .../devicetree/bindings/input/adc-joystick.yaml   |  9 ++++-----
>  .../bindings/leds/cznic,turris-omnia-leds.yaml    |  3 +--
>  .../devicetree/bindings/leds/leds-lp50xx.yaml     |  3 +--
>  .../devicetree/bindings/mfd/google,cros-ec.yaml   | 12 ++++--------
>  .../devicetree/bindings/mtd/nand-controller.yaml  |  8 +++-----
>  .../bindings/mtd/rockchip,nand-controller.yaml    |  3 +--
>  .../devicetree/bindings/net/ti,cpsw-switch.yaml   |  3 +--
>  .../bindings/phy/phy-stm32-usbphyc.yaml           |  3 +--
>  .../bindings/power/supply/sbs,sbs-manager.yaml    |  4 +---
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml      |  3 +--

For the remoteproc binding:

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks,
Bjorn

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
