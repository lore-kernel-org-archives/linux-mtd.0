Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ACEC6FD1F
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Mar 2024 10:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMgjgXCSVtfLy4vD0Q13d5EtLKv7z/ZPEcNQCqO8VDU=; b=N+YxC0OpBT5mka
	nPR3cj4XPZi6QhkPboQoeFgdEomRyBJQ5MjgA4uOZO1fLCMANILwkEtC90XKtPsZ18QYMsScmCjwA
	TXXYlZJrY54wj5hv9vSk/RS5ZYYBDLUvgYSpfivvx+hROsxCmBMPAY4ZVrHqZhBsVYD+RnAvHIB+c
	qpxUPpXQLz2txKJ3LzXfhtUQBCmERWujOw4J0+r42f+pxJ+u+grjpf+O9zJ41T9eszX4Halyjj8Wk
	oZo/N80ZKuoTAOssXtf/3R76VEL8pX9Yx1M4CmbaBF1+f6n2PS/3bCuKQqO94l1Q82CognAixa0k0
	m4N9GSGKrzod2bhgL5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp3iR-00000003xNd-2hYv;
	Tue, 26 Mar 2024 10:07:35 +0000
Received: from flow2-smtp.messagingengine.com ([103.168.172.137])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp3iM-00000003xK2-48cZ;
	Tue, 26 Mar 2024 10:07:32 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 19AEF20063A;
	Tue, 26 Mar 2024 06:07:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 26 Mar 2024 06:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711447649; x=1711454849; bh=LwutBSd20d
	Y9F2mV05mJEYeO4BD3EduCXGrjUsQ79Ro=; b=PJFRJLskOPk2rK+iB7VvkPPP1e
	SLERW5kzTADhItQdrbiFv7tHcH459/NpFcy9PVmm2d3OMZxaeh4ysJYYP5cZf3qj
	6kjIVklsQy+lvoygejE+/OdIqRnqn7vhNuUyKcCouDezDB2zrzbQAcrOcG5wRx1Q
	/hyrVAIthJ3IcKcUv70qLinqbc0/cuSq+lRcpEVPspAtrLBo049R/SlUmMrbdiGs
	TArsa7RG1X/FxCSiLg57bN6iu/mWAPJTP7y/4UxfORaC+BlRTRVj1SlffpoHl5qi
	pgcEbeW0r+BWpFJHnJbm98mW6OQYQt+6RUbF3F8dlyhbgvQAD4/6+EMJOgig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711447649; x=1711454849; bh=LwutBSd20dY9F2mV05mJEYeO4BD3
	EduCXGrjUsQ79Ro=; b=DvF0P3czs1dT3R3uZ4D9WNdJ2Jvy5Q/+5INgRPqZyxK+
	hkqBV3aCiIN+QgTQEUKV5qtqUGvod8DLhb4bQ4i/xDPexgDy/LVf/8n/SJG7rush
	XEBrOGiQWpazHs9g1aNsGBmL9W7WKcnYtFoJnaylqiK3kyAaruyJHAEbhDFJEixz
	5C4r3h9JlVJuv4pfz8arK6cd1bEtQT3q/wE5BJms9/xT6Cqp7CF1eewQzWbLj6CQ
	kT+x1WrKGo7OqATRWp5uF+DNlqL9lnGL1Sxa/z3LB3DLbhM/+QCE+v7JbE1GfhI2
	32FgJGmKdK/NrXqToufcvz/D0yB1o1nZjODsft/Oig==
X-ME-Sender: <xms:X54CZuxNGYqpCrTpdkoMeYu7QHep-DtABIoilrdxkHD3sWQYbCebew>
    <xme:X54CZqRRTk4BO6C0XUl_JYlUMa3bpBBaMeXDG4sLQi4OS4DrIkLZzvu8UfG_OQaS1
    B-Yn9ExIQl6NTvvdyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledruddufedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:X54CZgVzQidMIFZ5N9JpoYFGxrVx7337JziEMcVKsZMuJH165E0AZA>
    <xmx:X54CZkjjIA4yhyjXlr5VojHurih3Ujo9_CVAICaJW8Ost8Vl5nVLqA>
    <xmx:X54CZgA618J6_VWBxFs5t0RmjT9d4r6JLbi7Tkm1KxTbcEZMnccM0Q>
    <xmx:X54CZlJOpkzdS_UtGHyqZuzem8YjLstkDNB3SMS9OX5-aGoBVoQ36w>
    <xmx:YZ4CZvfWf4jPj0Z4AOpwXEiirjZXkASxh6SPn7mRGqleIMTKC6GJcUpzF9w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 717EEB6008D; Tue, 26 Mar 2024 06:07:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-328-gc998c829b7-fm-20240325.002-gc998c829
MIME-Version: 1.0
Message-Id: <66e1da99-5cf4-4506-b0bf-4bdf04959f41@app.fastmail.com>
In-Reply-To: <20240326-ep93xx-v9-0-156e2ae5dfc8@maquefel.me>
References: <20240326-ep93xx-v9-0-156e2ae5dfc8@maquefel.me>
Date: Tue, 26 Mar 2024 11:07:06 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nikita Shubin" <nikita.shubin@maquefel.me>,
 "Hartley Sweeten" <hsweeten@visionengravers.com>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Lukasz Majewski" <lukma@denx.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Sebastian Reichel" <sre@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>,
 "Guenter Roeck" <linux@roeck-us.net>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Mark Brown" <broonie@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "Sergey Shtylyov" <s.shtylyov@omp.ru>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Ralf Baechle" <ralf@linux-mips.org>, "Aaron Wu" <Aaron.Wu@analog.com>,
 "Lee Jones" <lee@kernel.org>, "Olof Johansson" <olof@lixom.net>,
 "Niklas Cassel" <cassel@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-spi@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, linux-sound@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Andy Shevchenko" <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v9 00/38] ep93xx device tree conversion
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_030731_164611_E19EDB69 
X-CRM114-Status: GOOD (  16.52  )
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

On Tue, Mar 26, 2024, at 10:18, Nikita Shubin via B4 Relay wrote:
> The goal is to recieve ACKs for all patches in series to merge it via 
> Arnd branch.

Thank you for the continued updates, I really hope we can merge
it all for 6.10. I've looked through it again and I'm pretty much
ready to just merge it, though I admit that the process is not
working out that great, and it would probably have been quicker
to add DT support to drivers individually through the subsystem
trees.

> Stephen Boyd, Vinod Koul PLEASE! give some comments on following, couse 
> i hadn't one for a couple of iterations already:
>
> Following patches require attention from Stephen Boyd, as they were 
> converted to aux_dev as suggested:
>
> - ARM: ep93xx: add regmap aux_dev
> - clk: ep93xx: add DT support for Cirrus EP93xx
>
> Following patches require attention from Vinod Koul:
>
> - dma: cirrus: Convert to DT for Cirrus EP93xx
> - dma: cirrus: remove platform code

I suspect that Stephen and Vinod may be missing this, as reviewing
a 38 patch series tends to be a lot of work, and they may have
missed that they are on the critical path here. I certainly
tend to just ignore an entire thread when it looks like I'm not
immediately going to be reviewing it all and other people are
likely to have more comments first, so I'm not blaming them.

To better catch their attention, I would suggest you repost the
two smaller sets of patches as a separate series, with only the
relevant people on Cc. Please also include the respective
bindings when you send send these patches to Stephen and
Vinod.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
