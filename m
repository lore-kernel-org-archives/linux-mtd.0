Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94914C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOOowPJ/LA5zPnRtXiF7y3X1DVJUhgC4dLwzvy98urQ=; b=tzh4mQZ8unYyzs
	3aF2rWkZksdLSUoCaDEt65sPMl9HlkzJrJ86/7xT9oMXuXzKRzaPpEIAcy+ptRpfr48t7Zelfpubn
	L/91trshi4SW4bbh97gS/ZrsFO+dpz6o7Xl1kSfIldagWQIVAVMBBvFq4VjzNySLZGhxfy6JDx4I4
	+pmn1kB13tShrEaOriJK1pzfNTCwdO8so5rrHlwioVjXDc/kGjytC2+VsR/T2Prdiq6R16JnTqFEU
	omrR7MrF+1sMh4yDQ7L1FBLaNYWH+SabrImceUJaN+svwiTy8AxKbMgGryqU4VnNnj6+VBNV2itZy
	LPt17/J45dyUJ/I9519A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeHm-00CYuu-Dw; Wed, 23 Nov 2022 01:10:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeH8-00CYWN-TC; Wed, 23 Nov 2022 01:10:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F40D61995;
	Wed, 23 Nov 2022 01:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD9EC433B5;
	Wed, 23 Nov 2022 01:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669165806;
	bh=rXOvu1e2etLRq3CMGISVIMIOQhLrgiLZaBMVOwuTAjI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Q62EsxGHVZLCsPw0ucsA71H9q1uzbpJejlgvneTDzf81PBaStl1j92/UjTYMFSJLf
	 +1cnC1i+4xFCDi8K5rrd+XqrSqI4peARWRYD7qyCrN+bJY2hnpRFlQ2M0RS1NqMdrz
	 mTRiCLqa327jxIv8zxqbxIUHsXQdUZ5S1iOaZwOed1GbaEB8rQmLmSeQJ0uxFfC13P
	 KHIF6NukB4TNZOIGJeuwCQkY/wgbiPrFTNfqaQLk22QRK+OXaXR3qMP3LRmjKf5guk
	 6wkvrMRVrBqjZ0H/3k9Dfd1J8jLSlm31F2PpODDHrBOqDwNnJv6gqu2l6/7uckY9z+
	 mTfA5G2FcKVlw==
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org> <20221121110615.97962-6-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: drop redundant part of title (end, part two)
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.
 org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Tue, 22 Nov 2022 17:10:04 -0800
User-Agent: alot/0.10
Message-Id: <20221123011006.1BD9EC433B5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_171007_060110_A9E43BBA 
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:11)
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.
> 
> Drop trailing "Node|Tree|Generic bindings" in various forms (also with
> trailling full stop):
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [nN]ode [bB]indings\?\.\?$/title: \1/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [tT]ree [bB]indings\?\.\?$/title: \1/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [gG]eneric [bB]indings\?\.\?$/title: \1/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [bB]indings\? description\.\?$/title: \1/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [bB]indings\? document\.\?$/title: \1/' {} \;
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/devicetree/bindings/clock/ti,sci-clk.yaml         | 2 +-
> 
> diff --git a/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml b/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
> index 0e370289a053..63d976341696 100644
> --- a/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
> +++ b/Documentation/devicetree/bindings/clock/ti,sci-clk.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/clock/ti,sci-clk.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: TI-SCI clock controller node bindings
> +title: TI-SCI clock controller
>  
>  maintainers:
>    - Nishanth Menon <nm@ti.com>

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
