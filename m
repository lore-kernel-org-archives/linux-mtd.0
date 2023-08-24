Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C423BC71145
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Aug 2023 14:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l8CAfH8WiTTZDDRcv4E7Axj/ptyQ3+zjxQkfDB0TdxI=; b=zrV3s3espO+eEq
	1nqsK1QTR0KPozoVp38Y9DxN9T20714OMrl3/9RI42J8deAiazw6aZZ19qC/7GVhnLlPCYFvVQGQE
	z7mmggoQe/K+IknkmqRjz5WE6Q5jO4WKczgjtA/Xnt3vtjNpRA6jylX31dMqto/Po+abeV/UDHrBg
	0c9fpzEw+Oao+AXcBBA5ppNpgpkcv+yPqf2yCHYhayC3+fJ+L9LcOA8lggyd52IpzdJHM/+i3pcnk
	eT+xvd4vQsP1lag8phRKwkXxZXZofmyfrPHTdP+6I4aR0SY5BiEScnTyTqskBhYJJsiio9htLruj8
	Eh/sM+sb/h/8Ohi1H1rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZB0t-003D4H-0z;
	Thu, 24 Aug 2023 14:08:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZB0q-003D3F-0n;
	Thu, 24 Aug 2023 14:08:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 429A26509A;
	Thu, 24 Aug 2023 14:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C84DC433C8;
	Thu, 24 Aug 2023 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692886118;
	bh=Txv2hLu3aNTzAJTERw9RD8bqeBXNErQSFrwmmEc0au8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kp/1S1ZFiWvvuWExBcwO/OObuBsvLi9vpHONcBnBulHBYsKh6etFwSXLCht3YMPDY
	 q3DtqvUXyK6BuS6p7O0E1EvsuLphrBEvXUuCl4B2cV+DmABIhs09OJ8UWPmhbtzW8T
	 plYop65+oQA6dhe+cH4ywZPp2RO25QXDLDsIYi+xjGEg0zEyfQkT/2ac89u8jeiRsc
	 A8YQPQX0/xIoUfBHcIK6l6YATFhR34HKsIw/R/5jvau4fSX0FRplzzUqgJ0uuIuEZR
	 0L5r3b0+iLneCymF/gr/VEJTqFQnTrOkt3gkgNBludZ4GuF3IyCco/vzA3UUROOlv8
	 iL0wOedoKYCTQ==
Received: (nullmailer pid 715627 invoked by uid 1000);
	Thu, 24 Aug 2023 14:08:33 -0000
Date: Thu, 24 Aug 2023 09:08:33 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Mike Leach <mike.leach@linaro.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Bartosz Golaszewski <brgl@bgdev.pl>, James Clark <james.clark@arm.com>, Jonathan Cameron <jic23@kernel.org>, openipmi-developer@lists.sourceforge.net, linux-iio@vger.kernel.org, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, Corey Minyard <minyard@acm.org>, Chen-Yu Tsai <wens@csie.org>, Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Leo Yan <leo.yan@linaro.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Bart Van Assche <bvanassche@acm.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, Richard 
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, linux-mips@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Guenter Roeck <linux@roeck-us.net>, linux-scsi@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, linux-i2c@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-hwmon@vger.kernel.org, linux-mmc@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, Andy Shevchenko <andy@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, M ark Brown <broonie@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, coresight@lists.linaro.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <169288610889.715445.11107086315099689865.robh@kernel.org>
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_070840_463338_D689E0E4 
X-CRM114-Status: GOOD (  12.36  )
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


On Wed, 23 Aug 2023 13:28:47 -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/arm/arm,embedded-trace-extension.yaml   |  4 ++--
>  .../bindings/arm/arm,trace-buffer-extension.yaml     |  7 ++++---
>  .../devicetree/bindings/arm/arm,vexpress-juno.yaml   |  2 +-
>  .../devicetree/bindings/arm/aspeed/aspeed,sbc.yaml   |  4 ++--
>  .../arm/firmware/tlm,trusted-foundations.yaml        |  4 ++--
>  .../bindings/arm/mstar/mstar,l3bridge.yaml           |  4 ++--
>  .../devicetree/bindings/arm/mstar/mstar,smpctrl.yaml |  4 ++--
>  .../devicetree/bindings/arm/stm32/st,mlahb.yaml      |  4 ++--
>  .../bindings/arm/stm32/st,stm32-syscon.yaml          |  4 ++--
>  .../devicetree/bindings/connector/usb-connector.yaml |  4 ++--
>  Documentation/devicetree/bindings/eeprom/at24.yaml   |  4 ++--
>  Documentation/devicetree/bindings/eeprom/at25.yaml   |  4 ++--
>  .../intel,ixp4xx-network-processing-engine.yaml      |  4 ++--
>  .../bindings/gpio/x-powers,axp209-gpio.yaml          |  4 ++--
>  .../bindings/gpio/xlnx,zynqmp-gpio-modepin.yaml      |  4 ++--
>  .../devicetree/bindings/gpio/xylon,logicvc-gpio.yaml |  4 ++--
>  .../devicetree/bindings/hwmon/iio-hwmon.yaml         |  4 ++--
>  .../bindings/hwmon/starfive,jh71x0-temp.yaml         |  8 ++++----
>  .../devicetree/bindings/i3c/mipi-i3c-hci.yaml        |  4 ++--
>  .../devicetree/bindings/iio/accel/fsl,mma7455.yaml   |  4 ++--
>  .../bindings/iio/adc/atmel,sama9260-adc.yaml         |  4 ++--
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml        |  8 ++++----
>  .../devicetree/bindings/ipmi/ipmi-ipmb.yaml          |  2 +-
>  .../devicetree/bindings/ipmi/ipmi-smic.yaml          |  2 +-
>  .../bindings/media/qcom,msm8916-venus.yaml           |  4 ++--
>  .../bindings/mips/loongson/ls2k-reset.yaml           |  4 ++--
>  .../bindings/mips/loongson/rs780e-acpi.yaml          |  4 ++--
>  .../misc/intel,ixp4xx-ahb-queue-manager.yaml         |  4 ++--
>  .../devicetree/bindings/mmc/marvell,xenon-sdhci.yaml |  4 ++--
>  .../bindings/mtd/microchip,mchp48l640.yaml           |  4 ++--
>  .../devicetree/bindings/soc/aspeed/uart-routing.yaml |  4 ++--
>  .../bindings/soc/intel/intel,hps-copy-engine.yaml    |  4 ++--
>  .../bindings/soc/litex/litex,soc-controller.yaml     |  4 ++--
>  .../bindings/soc/renesas/renesas,rzg2l-sysc.yaml     |  4 ++--
>  .../devicetree/bindings/soc/ti/k3-ringacc.yaml       |  4 ++--
>  .../devicetree/bindings/sound/dialog,da7219.yaml     |  4 ++--
>  .../bindings/sound/nvidia,tegra-audio-max9808x.yaml  | 12 ++++++------
>  .../bindings/sound/nvidia,tegra-audio-rt5631.yaml    |  8 ++++----
>  .../devicetree/bindings/ufs/ufs-common.yaml          |  2 +-
>  .../bindings/watchdog/toshiba,visconti-wdt.yaml      |  4 ++--
>  40 files changed, 88 insertions(+), 87 deletions(-)
> 

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
