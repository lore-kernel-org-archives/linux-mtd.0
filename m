Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F5AC2BA18
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 18:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKuPjSeO/f9bEhCzHY137idSE+mBqSM+NpoULo8rKFw=; b=a9x1aNT5MaBGfB
	vxOJfM/0XyBrJjAzHOKG/UC5Tt/5w4rjlmnQM9rJqdAAU6ZXdj72J/4c7WkAaDp7desN6deYhystX
	lOonePCXliDHF0NcgnY1bavySMykL0BNTgCg0SxTNc+Vs9LDpCruX5w7dsUqYaxrRAY2VZr7EVNXY
	2A68TWDK7Moe8TYllnxLJiVoGfha6fr9eF0xnM7ft7+Ry8RXnix5nNUAjUuCWcsUyxNctJ6ohD/XY
	HhP7/VVsG/TAJf0c7SB+QVEncZidUxnQf8D9ULnPQt8HM66p1hNYtBJyHcztE5fqD5k3OT/Na5+z/
	J2U3lVqW8ZsOIICuGzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJdFk-0000000G8Z6-3EoV;
	Tue, 18 Jun 2024 18:08:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJdFg-0000000G8XG-07uF;
	Tue, 18 Jun 2024 18:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 22C5DCE1BC9;
	Tue, 18 Jun 2024 18:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7DEC3277B;
	Tue, 18 Jun 2024 18:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718734092;
	bh=DIWXHzFM9LsRVNoscUsRZE3SjmaDFUBGMVeyHHcwIVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=reM0BcBULhL6vYCBFsQHRbgWG5t1mnQuBX+OxOLkwHYD+348b48Pop5sdU56arf7R
	 5ZUKPyMW2OeJ4YWwFCVqziOF8Dvt/0qf4QJ9BGGLpPdXhhPwtO2QwbnqLDNLCBkb3C
	 d3ye1WHVxcV5T2Khjv6w5GVrPKRK4R6bsu38ajXcO2fyb0PJrcFC+8/5tQlNph6Mqp
	 Ts/78Nny3XKmqU8zGR6pWzZri2i2DfZ0j45IsZzgIdBJTAw88ywiABpYlyIGycAFhG
	 2iVl2TLzmtH5vNbKEQfW8UqChqsI4M8sPv9NNrjj58eo5AMnzITc48yooNFNJsiC9n
	 LlRU+twT52wOA==
Date: Tue, 18 Jun 2024 11:08:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Nikita Shubin via B4 Relay 
 <devnull+nikita.shubin.maquefel.me@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Hartley Sweeten <hsweeten@visionengravers.com>, Alexander
 Sverdlin <alexander.sverdlin@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
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
Message-ID: <20240618110808.7829d214@kernel.org>
In-Reply-To: <eb3e6c0b883f408fed68e725a23b54854701ce9e.camel@maquefel.me>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
	<20240618073339.499a7fd2@kernel.org>
	<eb3e6c0b883f408fed68e725a23b54854701ce9e.camel@maquefel.me>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_110816_834628_8E7551C9 
X-CRM114-Status: GOOD (  15.16  )
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

On Tue, 18 Jun 2024 19:33:49 +0300 Nikita Shubin wrote:
> On Tue, 2024-06-18 at 07:33 -0700, Jakub Kicinski wrote:
> > On Mon, 17 Jun 2024 12:36:34 +0300 Nikita Shubin via B4 Relay wrote:  
> > > The goal is to recieve ACKs for all patches in series to merge it
> > > via Arnd branch.  
> > 
> > Why? The usual process is for every subsystem to accept the relevant
> > patches, and then they converge during the merge window.  
> 
> It was decided from the very beginning of these series, mostly because
> it's a full conversion of platform code to DT and it seemed not
> convenient to maintain compatibility with both platform and DT.
> 
> Generally i think it's too late to ask such a question, when just a few
> patches left.

Put the relevant information in the cover letter. Justification why you
can't follow normal merging rules is very relevant.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
