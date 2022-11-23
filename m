Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8E5C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 04:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=czMEAKzsKmfAanOT7RzolURuY5Yidg48AOKXc6uc5kk=; b=uILZ7qxOHrAUM4
	F+w4trh1u/SMn0jYUX4YVqSxRthAZdtDnV/hfjixH4w2rDeDWlOuezm8OuNKYm1aSxZ6mR+bSST7g
	PWmC9AsjBantmz9/TegU9ZVuvCpqxqxJH4hTUnGbcoFSpL0jjKW1rMxxSQnPcqxUPovVenLF8HmHI
	PnygDqPxc7IH2PPk0/JvrJ7SrXzBhGZlm43gKeWPhIMV1vwh3ahnkxlX6WyolPTWWSf3+eXPuyNJn
	Dpu0f0wNNeDJefqXNXG/kKi+oSyTXIQm3h9XQYcAuRx8DH+NpEJpCM8Am8sz/atZDVljkJvRU86od
	X+zrwklWLlSMBPm1XlAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxhXO-00Dx5m-9K; Wed, 23 Nov 2022 04:39:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxhXC-00Dx1U-Pr; Wed, 23 Nov 2022 04:38:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC96461990;
	Wed, 23 Nov 2022 04:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DBDC433C1;
	Wed, 23 Nov 2022 04:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669178332;
	bh=QqrDbDLRcAQr4MUv+oZ9PutfTqVkNXwAFQlJXbN9odk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e//Q0Igg0hWRrSaEgwdgmlRQd6QUnoz7COLqfkBnj6LOQdy+G730Ld4a0mtbj4mXF
	 2Ns0fWlqq5UDuwlf9gZi0p759DWrC6wlC8ge0bN3ZHQX7ihQg5stNciFtDWoi+LjF+
	 jWzWEBluurxmktSYXewY3T9nYOayIZyWy4v5xTekb99HPZYHOBbHZT0xSp18BLpDTb
	 NaAioF2pMRU0zHtAQ3RqHqTT9WvlSrvbvq0f834SNj6byw1vq/7zTaiB7b45SOLdS0
	 ZrrsM+AKFkbmsFDsQ5lzS4sSEz1POrgSXaqhxXHOGYxGm3acH0ikOnG+UML9Urblga
	 OhyWc3tcT/vgQ==
Date: Wed, 23 Nov 2022 10:08:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
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
	linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 1/9] dt-bindings: drop redundant part of title of
 shared bindings
Message-ID: <Y32j1+T3bBVTEDxO@matsya>
References: <20221121110615.97962-1-krzysztof.kozlowski@linaro.org>
 <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121110615.97962-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_203854_920087_F8BC4584 
X-CRM114-Status: GOOD (  11.37  )
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

On 21-11-22, 12:06, Krzysztof Kozlowski wrote:
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
>  Documentation/devicetree/bindings/dma/dma-common.yaml           | 2 +-
>  Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>  Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
