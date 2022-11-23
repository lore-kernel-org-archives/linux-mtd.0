Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD42C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRpsf9jD/8QVwgapIeUVheaSIRbUuk3PUfvWpMBMSzI=; b=RZIkqqKs5yYRwT
	SAjKDAFmm1YIwnoXrQ8GmQr1HZYAPS7o3xdylFGh0Th45Pkd1MX0wRPpklubzikLQh7ioUoiAdb1y
	KngTG/pV5nB8h7B3l8iT1/IAtJ132hcHzn3STQ8D89CDErxYZK1gV/A85ptZHQCJM4Z9BXEtH6v7N
	63jigfiBnUg7hAPnFCvxSADA0NNMeKtbI3zqMJBn4LUVXxpy1JARjk/8Z7QVNVk3XHvMcgX+Rx53U
	Ddj1Z47q1Wbxgh0VdPXoW0rg6W/PQYu4rdK3yS3dKc/rQKPQqtsFlVImlS3BGjPhiWkSUInLJ1w2F
	l2kVVzDflBVaAFoGo4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeJu-00CaCG-Ro; Wed, 23 Nov 2022 01:12:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeJF-00CZpZ-N8; Wed, 23 Nov 2022 01:12:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 47B83B81E4B;
	Wed, 23 Nov 2022 01:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACF5C433D6;
	Wed, 23 Nov 2022 01:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669165935;
	bh=b4lFQBJuE6E5nzM4uZRkyZngXj37aTtlWv6pt98Ral4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YnKK/Cra0JtvnIKJARfKziOYN414MerZu6PUoHIOWpuUNiyK1L9awWhP6TaUzexyE
	 yraYSJIA3TPiPSppXaaJHrdxalNvCmBPZxQTKQoJA5FQv+lIoabMprAKO0Ap7CZKcZ
	 OALpLx2qpy2t4FkvkUMBd707omeudCxo9bIGjrNdNiIP/DaPNhHv3aXBILwfwTKcQI
	 4Im6+9PZo0Ph40oJmi0KRqGv+Nz5Of+Pag75DmXiJpSvrBjDdI7iXI0mNx87P4G2fC
	 Uoxs2iDXMllbPSQ3hzs8srOANRRiLFITFR3KXiKFWCahDsZEN0jbWLVvOjtj0bDsyD
	 DMufxFuXFWKRg==
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org> <20221121110615.97962-8-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 7/9] dt-bindings: drop redundant part of title (beginning)
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.
 org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Tue, 22 Nov 2022 17:12:12 -0800
User-Agent: alot/0.10
Message-Id: <20221123011214.DACF5C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_171218_076955_7965DA40 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:13)
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding", but instead just describe the hardware.
> 
> Drop beginning "Devicetree bindings" in various forms:
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD]evice[ -]\?[tT]ree [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -exec sed -i -e 's/^title: [dD][tT] [bB]indings\? for \([tT]he \)\?\(.*\)$/title: \u\2/' {} \;
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/devicetree/bindings/clock/adi,axi-clkgen.yaml     | 2 +-
>  Documentation/devicetree/bindings/clock/fixed-clock.yaml        | 2 +-
>  Documentation/devicetree/bindings/clock/fixed-factor-clock.yaml | 2 +-
>  Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml   | 2 +-
>  Documentation/devicetree/bindings/clock/idt,versaclock5.yaml    | 2 +-
>  Documentation/devicetree/bindings/clock/renesas,9series.yaml    | 2 +-
>  Documentation/devicetree/bindings/clock/ti/ti,clksel.yaml       | 2 +-

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
