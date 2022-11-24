Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BE7C4321E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDYHNZGcPf20l1KoffHBxSVh7U0wkuIOf0icAycRmGQ=; b=RQ1Vl7AwBFyW1+
	LwjXDvTOgGERLfeMIbkftEw+mf5rdndOae8ektM9p+QaFOQuEkiua1fBEqmPoDTD5SFzXdQk0BT2x
	tDxsTUFrIir2CUycrIEuX+EdYXR3wERJexY7uOLpCTMP4BjnSXJk7VuIKPXN3PRAd/TL+JCxitNy8
	O9Hs/hxHz51WS/tXqLZecEDLOxjX7rZHZB6ycNQBp/KSAKZ8nvaBuni4V1cW4JMuRAHnX66Mg9Usb
	CAAQGlZdnPBLG8bdIWexy6tqdPGyytcOtHG9WijgYep9+rkz+h2jcI6D7IrUZWHTarYj6wIS4q92P
	WG+fqhNPRTLukGmHrKpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyCah-008xPs-2w; Thu, 24 Nov 2022 13:48:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyCaJ-008xDD-S7; Thu, 24 Nov 2022 13:48:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0CDD7B827F1;
	Thu, 24 Nov 2022 13:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88102C433D6;
	Thu, 24 Nov 2022 13:48:01 +0000 (UTC)
Message-ID: <94d9789d-017c-5f56-3d6e-90f7e9cc8c70@xs4all.nl>
Date: Thu, 24 Nov 2022 14:47:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-can@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Viresh Kumar
 <vireshk@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_054812_305842_A59D3B21 
X-CRM114-Status: GOOD (  18.75  )
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

On 21/11/2022 12:06, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.  For shared
> (re-usable) schemas, name them all as "common properties".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Guenter Roeck <linux@roeck-us.net> # watchdog
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # IIO
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.yaml           | 2 +-
>  Documentation/devicetree/bindings/dma/dma-common.yaml           | 2 +-
>  Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-
>  Documentation/devicetree/bindings/iio/adc/adc.yaml              | 2 +-
>  Documentation/devicetree/bindings/input/input.yaml              | 2 +-
>  .../devicetree/bindings/media/video-interface-devices.yaml      | 2 +-
>  Documentation/devicetree/bindings/media/video-interfaces.yaml   | 2 +-

For these media files:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

>  Documentation/devicetree/bindings/mmc/mmc-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-chip.yaml            | 2 +-
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml      | 2 +-
>  .../devicetree/bindings/net/bluetooth/bluetooth-controller.yaml | 2 +-
>  Documentation/devicetree/bindings/net/can/can-controller.yaml   | 2 +-
>  Documentation/devicetree/bindings/net/ethernet-controller.yaml  | 2 +-
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml         | 2 +-
>  Documentation/devicetree/bindings/net/mdio.yaml                 | 2 +-
>  Documentation/devicetree/bindings/opp/opp-v2-base.yaml          | 2 +-
>  .../devicetree/bindings/power/reset/restart-handler.yaml        | 2 +-
>  Documentation/devicetree/bindings/rtc/rtc.yaml                  | 2 +-
>  .../devicetree/bindings/soundwire/soundwire-controller.yaml     | 2 +-
>  Documentation/devicetree/bindings/spi/spi-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/watchdog/watchdog.yaml        | 2 +-
>  22 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index 1ab416c83c8d..7129fbcf2b6c 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/qcom,gcc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Global Clock & Reset Controller Common Bindings
> +title: Qualcomm Global Clock & Reset Controller Common Properties
>  
>  maintainers:
>    - Stephen Boyd <sboyd@kernel.org>
> diff --git a/Documentation/devicetree/bindings/dma/dma-common.yaml b/Documentation/devicetree/bindings/dma/dma-common.yaml
> index ad06d36af208..ea700f8ee6c6 100644
> --- a/Documentation/devicetree/bindings/dma/dma-common.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-common.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/dma/dma-common.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Engine Generic Binding
> +title: DMA Engine Common Properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
> diff --git a/Documentation/devicetree/bindings/dma/dma-controller.yaml b/Documentation/devicetree/bindings/dma/dma-controller.yaml
> index 6d3727267fa8..538ebadff652 100644
> --- a/Documentation/devicetree/bindings/dma/dma-controller.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/dma/dma-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Controller Generic Binding
> +title: DMA Controller Common Properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
> diff --git a/Documentation/devicetree/bindings/dma/dma-router.yaml b/Documentation/devicetree/bindings/dma/dma-router.yaml
> index 4b817f5dc30e..f8d8c3c88bcc 100644
> --- a/Documentation/devicetree/bindings/dma/dma-router.yaml
> +++ b/Documentation/devicetree/bindings/dma/dma-router.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/dma/dma-router.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: DMA Router Generic Binding
> +title: DMA Router Common Properties
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
> diff --git a/Documentation/devicetree/bindings/iio/adc/adc.yaml b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> index db348fcbb52c..261601729745 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/iio/adc/adc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Generic IIO bindings for ADC channels
> +title: IIO Common Properties for ADC Channels
>  
>  maintainers:
>    - Jonathan Cameron <jic23@kernel.org>
> diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
> index 17512f4347fd..94f7942189e8 100644
> --- a/Documentation/devicetree/bindings/input/input.yaml
> +++ b/Documentation/devicetree/bindings/input/input.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/input/input.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Common input schema binding
> +title: Input Devices Common Properties
>  
>  maintainers:
>    - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index 4527f56a5a6e..cf7712ad297c 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/video-interface-devices.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Common bindings for video receiver and transmitter devices
> +title: Common Properties for Video Receiver and Transmitter Devices
>  
>  maintainers:
>    - Jacopo Mondi <jacopo@jmondi.org>
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 68c3b9871cf3..8a7162ce34f6 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/video-interfaces.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Common bindings for video receiver and transmitter interface endpoints
> +title: Common Properties for Video Receiver and Transmitter Interface Endpoints
>  
>  maintainers:
>    - Sakari Ailus <sakari.ailus@linux.intel.com>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> index 802e3ca8be4d..613095a3d19d 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mmc/mmc-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MMC Controller Generic Binding
> +title: MMC Controller Common Properties
>  
>  maintainers:
>    - Ulf Hansson <ulf.hansson@linaro.org>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> index 6e2dc025d694..33d079f76c05 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mtd/nand-chip.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NAND Chip and NAND Controller Generic Binding
> +title: NAND Chip Common Properties
>  
>  maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index 220aa2c8c0b5..efcd415f8641 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: NAND Chip and NAND Controller Generic Binding
> +title: NAND Controller Common Properties
>  
>  maintainers:
>    - Miquel Raynal <miquel.raynal@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml b/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> index 9309dc40f54f..59bb0d7e8ab3 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/bluetooth-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/bluetooth/bluetooth-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Bluetooth Controller Generic Binding
> +title: Bluetooth Controller Common Properties
>  
>  maintainers:
>    - Marcel Holtmann <marcel@holtmann.org>
> diff --git a/Documentation/devicetree/bindings/net/can/can-controller.yaml b/Documentation/devicetree/bindings/net/can/can-controller.yaml
> index 1f0e98051074..217be90960e8 100644
> --- a/Documentation/devicetree/bindings/net/can/can-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/can/can-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/can/can-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: CAN Controller Generic Binding
> +title: CAN Controller Common Properties
>  
>  maintainers:
>    - Marc Kleine-Budde <mkl@pengutronix.de>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> index 3aef506fa158..00be387984ac 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/ethernet-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ethernet Controller Generic Binding
> +title: Ethernet Controller Common Properties
>  
>  maintainers:
>    - David S. Miller <davem@davemloft.net>
> diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> index ad808e9ce5b9..1327b81f15a2 100644
> --- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ethernet PHY Generic Binding
> +title: Ethernet PHY Common Properties
>  
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
> diff --git a/Documentation/devicetree/bindings/net/mdio.yaml b/Documentation/devicetree/bindings/net/mdio.yaml
> index b5706d4e7e38..a266ade918ca 100644
> --- a/Documentation/devicetree/bindings/net/mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/mdio.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/net/mdio.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MDIO Bus Generic Binding
> +title: MDIO Bus Common Properties
>  
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
> diff --git a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> index cf9c2f7bddc2..47e6f36b7637 100644
> --- a/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> +++ b/Documentation/devicetree/bindings/opp/opp-v2-base.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/opp/opp-v2-base.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Generic OPP (Operating Performance Points) Common Binding
> +title: Generic OPP (Operating Performance Points) Common Properties
>  
>  maintainers:
>    - Viresh Kumar <viresh.kumar@linaro.org>
> diff --git a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> index 1f9a2aac53c0..378b404af7fd 100644
> --- a/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> +++ b/Documentation/devicetree/bindings/power/reset/restart-handler.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/power/reset/restart-handler.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Restart and shutdown handler generic binding
> +title: Restart and Shutdown Handler Common Properties
>  
>  maintainers:
>    - Sebastian Reichel <sre@kernel.org>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc.yaml b/Documentation/devicetree/bindings/rtc/rtc.yaml
> index 0ec3551f12dd..c6fff5486fe6 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/rtc.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/rtc/rtc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: RTC Generic Binding
> +title: Real Time Clock Common Properties
>  
>  maintainers:
>    - Alexandre Belloni <alexandre.belloni@bootlin.com>
> diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> index 4aad121eff3f..fdeb8af417d7 100644
> --- a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SoundWire Controller Generic Binding
> +title: SoundWire Controller Common Properties
>  
>  maintainers:
>    - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> index 01042a7f382e..5a7c72cadf76 100644
> --- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/spi/spi-controller.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: SPI Controller Generic Binding
> +title: SPI Controller Common Properties
>  
>  maintainers:
>    - Mark Brown <broonie@kernel.org>
> diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> index e3dfb02f0ca5..fccae0d00110 100644
> --- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/watchdog/watchdog.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Watchdog Generic Bindings
> +title: Watchdog Common Properties
>  
>  maintainers:
>    - Guenter Roeck <linux@roeck-us.net>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
