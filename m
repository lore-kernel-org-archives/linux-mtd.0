Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4AFFA373D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 23:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rX4SSNNzawnyGdJH/JYoGflFCx2nBr34mZ2yghzIIPY=; b=qyNTmPF2wTAnPl
	WEy7KdLn9IBcs0VT8wGnjQrnrbzMRHFuRvz9WAgT+IZmQANUzM7ARPOZlX0/gjW2rwd+27MtUZMPQ
	vaYMO8ZxY6LunFHnTcs2vbKKALHRfTBVmgXPa2bo3sydFpJlm/+xpVUYB1WjwDCIqcr6BoCiK5FJj
	n4sAyO4ig9rX/y7Tc7+OAV1d9pN72ln3UuK4EZ4jDc2ynsvIIyBKI2Aqf6udaDxsKtXBTjOSIRpof
	h2Q9n2NLsVLV3K+eO+y3DIGwPXx91kLk8ZRhPGcKvg0om/mYnIB1GyNH9YY3qSQd0SCQ76HpE2gqg
	7/igYvO7PjoCCWL6Q2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooC1t-00FCCh-DJ; Thu, 27 Oct 2022 23:11:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooC1d-00FC7d-TN; Thu, 27 Oct 2022 23:11:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 796316258F;
	Thu, 27 Oct 2022 23:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76F5C43470;
	Thu, 27 Oct 2022 23:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666912260;
	bh=KpiEoi6pX2qKSKUG5diicN97WlLWtC2P66cRAuNsOnE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Aoa2evZvjzvRF4K1QlaTMcMNpdb1/mxlcG+r8YmUmGF1l34Uecq70uF9O7xf+ICY6
	 2cQdLsVudksJ9udKltQeOWBIHEEye9dHJGVqiAjWS1HbTV3UVisCAbuiYMvo2Yp81o
	 asisy+aHeOSh5t7qrsLsMnpIID7Zcb5MfYQ5OtLH7NB8PDjZjjDupHr5NQYBVwFcrX
	 FxDZmmz94qFYesdi7izz8Foh4VPm/W80yAAQUKjsumAbM9JWXX9cNuSpvXAi0rdQnQ
	 s2pS4HeRbDMHCI541D2Tyy5G1DySXnjARmYp7LWWxFqOiLRKVgWgxXCnMg4BON7kDZ
	 na7zbhXEsEnwQ==
MIME-Version: 1.0
In-Reply-To: <20221021203329.4143397-2-arnd@kernel.org>
References: <20221021202254.4142411-1-arnd@kernel.org> <20221021203329.4143397-2-arnd@kernel.org>
Subject: Re: [PATCH 02/21] ARM: s3c: remove s3c24xx specific hacks
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>, Arnd Bergmann <arnd@arndb.de>, Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Chanwoo Choi <cw00.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-iio@vger.kernel
 .org, linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org
Date: Thu, 27 Oct 2022 16:10:58 -0700
User-Agent: alot/0.10
Message-Id: <20221027231100.C76F5C43470@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_161102_006280_91AC943B 
X-CRM114-Status: GOOD (  11.85  )
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

Quoting Arnd Bergmann (2022-10-21 13:27:35)
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A number of device drivers reference CONFIG_ARM_S3C24XX_CPUFREQ or
> similar symbols that are no longer available with the platform gone,
> though the drivers themselves are still used on newer platforms,
> so remove these hacks.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
