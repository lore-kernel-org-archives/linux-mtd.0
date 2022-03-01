Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAE3C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 08:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3k3VTVxIBpzcGyEkqZy4h/zeyhgT50f0z7/HzdKTb4=; b=rwek0LRa4YOiqS
	mu2EMYuFIhmIl1lPEnwXur888ev0qfpWA6teIu54oRewizE+7KA42O1cDLxm48Vm4hd1Y3ukcTFOT
	uQwHo5QL9i183F8XnY8edZjaU63YMbXs4lPoEaltdqymhYVZvC24AV7Q9Bzz9Cm8KzVdkt55XcN2w
	cUm0meq46PLS4KJ3GIdWc0I44U1em28qV81U1pnaPdnkUOuqzchzhYDr5G2F6/wziWTZVP6UgJQfJ
	5nkm7TXrPq+tYnV3Glc1+YbokuMgBBp16FwYNcx1kVATYYAD6lIIcUfzwZHpWov1c+fSieb4yYOtO
	xTcYuytVQfVLewNM01Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxiv-00FYZP-5t; Tue, 01 Mar 2022 08:19:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxig-00FYQR-Sn; Tue, 01 Mar 2022 08:18:56 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6776A478;
 Tue,  1 Mar 2022 09:18:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646122732;
 bh=GUeID2Un8vVSdeuDNIEpa8RZjMMEHoy9L8wSmXbuUy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=miR5YmRNNJOlmDq2Yqs9dB5x+/XGsPj5xCWEd5d4QNz5EOGQpnsdmFZxXhyD4MKIk
 rbf5ayN8604es0VCCAiQRs20sEQGYm4i485kkz8RqNa01HdgUMWxmhGcc7qoMO3hEb
 q2nC3FtfDQ133CVtcapt7269jyXQ9M8016CxGHSY=
Date: Tue, 1 Mar 2022 10:18:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh3W4r7rNSI60rVT@pendragon.ideasonboard.com>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_001855_159338_B9DAF9F3 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Rob,

Thank you for the patch.

On Mon, Feb 28, 2022 at 03:38:02PM -0600, Rob Herring wrote:
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

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml      | 15 +++------------
>  .../devicetree/bindings/sound/st,stm32-sai.yaml   |  3 +--
>  .../devicetree/bindings/sound/tlv320adcx140.yaml  | 13 ++++++-------
>  .../devicetree/bindings/spi/spi-controller.yaml   |  4 +---
>  .../devicetree/bindings/usb/st,stusb160x.yaml     |  4 +---
>  21 files changed, 39 insertions(+), 74 deletions(-)

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
