Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5C8C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQzJtuB3mmUM95NhEDfPeHIBZ40qYFYrpQ4m4GLL4Fc=; b=Edrpg2qIdETDSZ
	pDZj6oMtu6ykM/htlHtCn6HhGM1Hdlok4HJigzjXIwHGfedy2utWt9vm0eD+nOUs8SGk+EMsE7NKt
	2T2RPdR7wXLY12qoEMZbEbyIsH6MBVIVaGGc9b+LXBj7tNqqulCtXIkN9P/fe0AKaECs7k41y4wkg
	eQ8i3KDF7IXsgXJfAAsizSYXqghCzPA+IDCwekmKqPbV5CRNYYwAm9aUzwhN+YrJ8RZ3zTHsS61Xd
	leuMJ5vF8o2L/+FWfqLk5RzFcHyWfACmOi7HThb1CB81DUKFZpDx05+4Es+s2Ej1v6M0yg8U0+Hbt
	V3uj7KziO2rTWKhNdhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeH5-00CYUa-3W; Wed, 23 Nov 2022 01:10:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeGk-00CYIb-Ug; Wed, 23 Nov 2022 01:09:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 392F561985;
	Wed, 23 Nov 2022 01:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4D2C433B5;
	Wed, 23 Nov 2022 01:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669165781;
	bh=qMUCJkHDKODpGOuGW51S9S+Wc9pKi7k3jRdHTL7atTY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kqxTAzpSMsIFSOhKLHbuvGS3YhP4Ghan+L7rtN516xt08X55sIuaOEBB8Qbq4+rRi
	 5CVzboyxCV2G+AU+PT1p5KRUronWwFHZjTrZUGaMUXsVjwYJAoXcbcwRcI2FU4Lgx9
	 zL3uJIsO6hTYNQqNDUSNFjcUcJRpIdjWYeb+lIrhoMH65aVMlBoJ7veI4IQjIwBxX2
	 R8eWvVLZRvpqSzNMXVd+0kyfJ1ypml1zqGvVGS0n4j52fenoMAMuYXNN45BuFZsRKb
	 Bz9wCekpWMZk+m9CAyej743woVYbY2pYdM4eG5zWyoCH1UyEzuXxLmY3bhphXOw5Hk
	 6lGfcIjp49aAA==
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org> <20221121110615.97962-5-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 4/9] dt-bindings: drop redundant part of title (end)
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.
 org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Tue, 22 Nov 2022 17:09:39 -0800
User-Agent: alot/0.10
Message-Id: <20221123010941.7C4D2C433B5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_170943_105650_DF789BB6 
X-CRM114-Status: GOOD (  13.70  )
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:10)
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
> 
> Drop trailing "Devicetree bindings" in various forms (also with
> trailling full stop):
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [dD]evice[ -]\?[tT]ree [bB]indings\?\.\?$/title: \1/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [dD]evice[ -]\?[nN]ode [bB]indings\?\.\?$/title: \1/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [dD][tT] [bB]indings\?\.\?$/title: \1/' {} \;
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> # IIO
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/devicetree/bindings/clock/ingenic,cgu.yaml        | 2 +-
>  .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-

> diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> index df256ebcd366..9e733b10c392 100644
> --- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> +++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/ingenic,cgu.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Ingenic SoCs CGU devicetree bindings
> +title: Ingenic SoCs CGU
>  
>  description: |
>    The CGU in an Ingenic SoC provides all the clocks generated on-chip. It
> diff --git a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> index 8d4eb4475fc8..b339f1f9f072 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,versaclock7.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/renesas,versaclock7.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Renesas Versaclock7 Programmable Clock Device Tree Bindings
> +title: Renesas Versaclock7 Programmable Clock
>  
>  maintainers:
>    - Alex Helms <alexander.helms.jy@renesas.com>

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
