Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D89C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 01:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qc9HE1V+mfIA+N/yl1K6eonb0qyRVqB+OPZaGAmx3RE=; b=qtedgkiguc4nI+
	mafJpMTmPkUVPwa1f7tqhzeXCcwygfGvzh/JcmvPhW4Y/b4X759gAJwe5Jh3d3UqIMhivkEB8AyeR
	i15RLvJjCnKmD9yNHSSyUH2QP6buxz0eH2WoKLPKuBKqzpTRz9NCEGMURHCSZqJ0Xy5YUkRh8KuVZ
	guX7pu/5tyNhVRIgA8agSKGnRjgT03IfiTbrZY0EQTEnqMXE4VZzlX/OYkP6/D5mTM0IgOVhBAZ81
	jxI2z/CV70H7P56qMc2uZX2RuW5OJY1HBZT9q8yCZx1+XrUxooAX8Sgz58a+LCwUMN8rAgFfS6aDT
	sRb2kTfRBAOfH3kAmtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeLq-00CbOt-Sk; Wed, 23 Nov 2022 01:14:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxeL4-00CawW-JB; Wed, 23 Nov 2022 01:14:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1FF92B81CBD;
	Wed, 23 Nov 2022 01:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4865C433C1;
	Wed, 23 Nov 2022 01:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669166047;
	bh=zTIEHGwbmaOUDyrFquKdXCAjwyHAbKSqMbl1KSejD2g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=eaqRSV6gh2g8+WVKDH/rSd6EIzEqzis9/feCSBijzsbchaDY16DVRXkr5SjQuLDxC
	 7fFsAiTlHOtbCQobJA9rIus3yeEH05iQ5b+/eWR8Cy/6qg0a6USR5sTCYd3kvCn8em
	 qT8U9JmY/0vhbBd5HDBe8OI/firQwaWsAvppdD+im72NdeZS2tjv2zaJ6cI9JBkgim
	 j8qGtcznNz9LDH6vGVds1wI6vrnqGGvZ3NT10jY/uiOdHiWLqyF5Nh/64+3Tp7RqMo
	 SItZwvNGid1/Zq1R/Mvtl11rtcOt1bTpsEe5A+U+frR0T4LcVH9Is4s6YqT0uz48or
	 Xm/gSZNYXPrpw==
MIME-Version: 1.0
In-Reply-To: <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org> <20221121110615.97962-10-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 9/9] dt-bindings: drop redundant part of title (manual)
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-media@vger.kernel.org, linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.
 org, linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, virtualization@lists.linux-foundation.org
Date: Tue, 22 Nov 2022 17:14:05 -0800
User-Agent: alot/0.10
Message-Id: <20221123011407.C4865C433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_171410_842084_96C0372B 
X-CRM114-Status: GOOD (  10.37  )
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

Quoting Krzysztof Kozlowski (2022-11-21 03:06:15)
> The Devicetree bindings document does not have to say in the title that
> it is a "Devicetree binding" or a "schema", but instead just describe
> the hardware.
> 
> Manual updates to various binding titles, including capitalizing them.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 2 +-
>  Documentation/devicetree/bindings/clock/fsl,scu-clk.yaml        | 2 +-
>  .../devicetree/bindings/clock/qcom,dispcc-sc8280xp.yaml         | 2 +-

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
