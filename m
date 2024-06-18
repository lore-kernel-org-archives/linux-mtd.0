Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6E2C27C4F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 14:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feTOrvKQ/NwK/4QAu0Nl608nHRQHV80pAohodKJzuWM=; b=V6xHo+7BuzH3vU
	V0FMHpFy6yHCA/ekUkPyEWPnYjE5A5UZEU0525NL/t0R6AGU3+8NhprOYdVjB+4YuAiqXB/WnYk+n
	niSxDXepzlVyZZI8RHOr9ENwjX9F9WAlkxb5I4F/28Zz2et+HJ7SQAQErf6gHxzZVuLNrCk+EAGMu
	wtRBIir/divUPa+NAEk0HmMUkYtvusO/T2vY+//lwmwjUFwTVtnLXn5prFXa4mOzkJdVvfMjHvEs/
	BwvcUDHeUo8FrEFApM1RkzCgfqiaWnvsKDtQdqhYPRYQC2a0oubV+N5YPTeeW4zelZ9GTChj/Q61i
	6ZOjGtnIuvSqb/utupWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJZuC-0000000FP2S-027X;
	Tue, 18 Jun 2024 14:33:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJZu3-0000000FOyD-3q5K;
	Tue, 18 Jun 2024 14:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24FD0614A3;
	Tue, 18 Jun 2024 14:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53526C3277B;
	Tue, 18 Jun 2024 14:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718721222;
	bh=tzWbw4BvxNiCK+3ZnGzIylZzOfkjpcbGq5j/2kPM9AY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uO7n9x0g7aT8cCA2KEaBUwuVI+XS9v0l8dlQhVj/cj7XPwvNBjPqQbQZrafsjVHxQ
	 lu6K/HynzDDaQeuL1cSFaFQ4Pi/hLDgqS8QJYyIuUCBwXUMceTIsVC6kXOSQ4zfz+4
	 AvPsJKyZyGncRfYjB9OLoCheN8wNBYTVgXqcx4f0Y1lPzvFIvo3AuRHi8/bgweKANC
	 aYmtsUytKiFOHJe+QZTrUUlqvE2AcarrATOyBiqFYxmIJsyeJPCCSPDBoMcVksy8T4
	 x26eFo6wz6cUehmy5k6wA2QjU3sNbnqyGfaioRPn0qX3tGnc6xupSq6lsyZ1KopdBk
	 tmvnb9z/ncj3A==
Date: Tue, 18 Jun 2024 07:33:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nikita Shubin via B4 Relay
 <devnull+nikita.shubin.maquefel.me@kernel.org>
Cc: nikita.shubin@maquefel.me, Arnd Bergmann <arnd@arndb.de>, Hartley
 Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Thierry Reding
 <thierry.reding@gmail.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <u.kleine-koenig@pengutronix.de>, Mark Brown <broonie@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron"
 <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, Olof Johansson
 <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sound@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v10 00/38] ep93xx device tree conversion
Message-ID: <20240618073339.499a7fd2@kernel.org>
In-Reply-To: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_073344_095465_F8EE375D 
X-CRM114-Status: UNSURE (   8.52  )
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

On Mon, 17 Jun 2024 12:36:34 +0300 Nikita Shubin via B4 Relay wrote:
> The goal is to recieve ACKs for all patches in series to merge it via Arnd branch.

Why? The usual process is for every subsystem to accept the relevant
patches, and then they converge during the merge window.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
