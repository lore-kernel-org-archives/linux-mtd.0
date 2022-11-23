Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C756C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEzgqwVoyvGo9QGHDxjgneLWWeINS18eab0ZkkeiJTI=; b=dcu4IpxjRF47ax
	2lAPbxHU2uImSdr34BR33+EA9vbwhSOZXw4mdkhNziUGnCAswsAU+NbGBqbcgBWgf58hhbydHtHpp
	LhjZOdbplnMD9aVStQpO5gju1qtyYKXFze0aW8oOMfn6DXJ3i8M0dITnrOy23S922zxZrWRDb4suv
	L8NwI5d2+mCOYKDJWwvkUPkr82W8ffJfFVIN+L0hZMOUeinOV4Xi7W5t7ej68AZGpBYZHBJkML/Wq
	zDDROvhIO/mV12zy6YHvPllsPiD6pYs3NIxwbxD7fjcRae+qQHLC9pnT+XHw5Q1SJiajtDmaW3lbY
	YSaFDq3QA+TR22ClzeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeIz-00CZfJ-SW; Wed, 23 Nov 2022 01:12:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeIV-00CZOl-Sx; Wed, 23 Nov 2022 01:11:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E19161972;
	Wed, 23 Nov 2022 01:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDB5C433D6;
	Wed, 23 Nov 2022 01:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669165887;
	bh=ADbZq4YwW1C+91LIdQtYbccEDrGI/iE1NCMBgSuxYyc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mcNBGmmaNNNKqJjI81qBoU1BnHKL/Od65PEiCM5eFS6rB3FMDGHuSwiR2KIVbhE/L
	 7dF6XJbD2xB42+q+79Hj+uKuOsQEZ2NZVw3F3KY5WGdOWwKOH+MDJvbY6NNaq2ebZe
	 OhmSGXztCFZsqwDD4yPnkHiXlKTER0HV9ALchzxPzIqjFWx3BoaWYwoPCydWpzZ1nt
	 VJVMq7NkiDRF/lqctbrNTB0LNvK+kQdYINT2J+igN+zulIsY6oTbHdQJLwyoJ5a29q
	 u974j5yATKuTF2SI4fgGfHzwI0SI22L4R/m02aMeH0OJeBZf6JsinR5AbhUTI2iu0w
	 MLwWiuRxgGUoQ==
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-7-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org> <20221121110615.97962-7-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 6/9] dt-bindings: drop redundant part of title (end, part three)
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.
 org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Tue, 22 Nov 2022 17:11:25 -0800
User-Agent: alot/0.10
Message-Id: <20221123011127.BBDB5C433D6@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_171132_036795_67837C3A 
X-CRM114-Status: UNSURE (   9.36  )
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:12)
> The Devicetree bindings document does not have to say in the title that
> it is a "binding", but instead just describe the hardware.
> 
> Drop trailing "bindings" in various forms (also with trailling full
> stop):
> 
>   find Documentation/devicetree/bindings/ -type f -name '*.yaml' \
>     -not -name 'trivial-devices.yaml' \
>     -exec sed -i -e 's/^title: \(.*\) [bB]indings\?\.\?$/title: \1/' {} \;
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
