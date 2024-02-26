Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8997C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VoguWi4Y+idRdyZiEhq7YU3W+PX0WXIkmEBkRNW/gM=; b=auGb10nGOug/9r2njAkLTbYBR3
	L5HPKxI1KJLBflWzmOyY9tTKyEQGCiuRJ60Yp8yLZWWwsaEC6WhB8dd3dAectq9XUgCQYNovzhfGf
	T54l2idbhxoTmXVCBv8sxRMkPnXtz01qaQv4nu5gFMXleAp96HSXTN6ExDXmWexiu8Woj7YHVFp1A
	pA4ldT59zj/zFPrRYKfPueDPxqFbjo5Xb9OACehTUg5gWDsSynS7Ycf1J8KbHFnE1KnmTGAgRWfDU
	24QcRLNY0jxWoLgbpgoV5a34+6kEvX1JfF6N0Qf1kiu5UYWYRvyB37Ah/yM1KkEKQi/EZ3iu6Z/f4
	+no096KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reb8C-00000000qxg-3oTO;
	Mon, 26 Feb 2024 13:34:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reb7u-00000000qsX-07ef;
	Mon, 26 Feb 2024 13:34:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61F45611B6;
	Mon, 26 Feb 2024 13:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2ADBC433F1;
	Mon, 26 Feb 2024 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708954477;
	bh=/x/cq3y9mTCgiZ8o1taGp5qapBsu0Js+9yDBIjMHSCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlXB3JIDgx/sTAcksbq0alUlQoDqCg6Xa3YRQvX+pgHlAoRwWxZK+VdSrlRj2tFh2
	 WgOrqwDvcC936qN+jwQVKZ/yBQozALrLax6Y8j04m5tXRnyj+JkydmSGoAHzI7WgUI
	 KqHTDMC3IriE7ZmWZAWypMlkbGGGXGTUl75UxvB8UQxmPLTH1VniZKEwN8uwFciqms
	 hwp8jKhmWx+NwD6hVHBlXwL+99E5v8sceenvE+1GFPEtOhMZEULqLhe1Vhh6Xoh1H7
	 LbARsrm2bNZ7stG6i92/78t2no6FlD6iljD6IA0lgyMjwaXW3x4+YOsejbn+51ZFV8
	 QZQeWeabe5phA==
Date: Mon, 26 Feb 2024 13:34:23 +0000
From: Mark Brown <broonie@kernel.org>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	"Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>,
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v8 00/38] ep93xx device tree conversion
Message-ID: <168fd3d7-d1e9-467e-bdd0-36c12aa81b68@sirena.org.uk>
References: <20240226-ep93xx-v8-0-3136dca7238f@maquefel.me>
MIME-Version: 1.0
In-Reply-To: <20240226-ep93xx-v8-0-3136dca7238f@maquefel.me>
X-Cookie: Walk softly and carry a BFG-9000.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_053446_357523_CCA15AB0 
X-CRM114-Status: GOOD (  10.60  )
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
Content-Type: multipart/mixed; boundary="===============8527568261078765861=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8527568261078765861==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bOKaKvSbzTVE2lWB"
Content-Disposition: inline


--bOKaKvSbzTVE2lWB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 10:29:56AM +0300, Nikita Shubin via B4 Relay wrote:

> The goal is to receive ACKs for all patches in series to merge it via Arnd branch.

What are the actual dependencies here?

--bOKaKvSbzTVE2lWB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXck18ACgkQJNaLcl1U
h9CsAAf+OGvM07gxhxeVoFEY2namqi3/k8QFeVfcgOHP2bvSRWzLj+Za5HJ77pCz
5NPf/dOYtbqSn6Tg6tGG7nkioQECfPyoUc75jpIZHzFp2uPzk5Zx62L2WVoDnbBX
6hzWj6VDqDZtgCB5xzXzHhEDL/OpxrUTqA3S+jeaPIeLLf5xnRDl1M4sESkZQseD
DMzGQouGu00Z+BSB/iAt4O2uN1DAyS/jipqNGmJzmCGD8wt9LbHfpDdzzQ+q6+iw
JDA6z8gDwF3jF1NH6SuoCvsVgNsRQyqLoMP/4ziVTz/XxQa2S91NnuSVz3Vk3y/k
gLUn1koeWlce3T54eUcZau09HwlwFg==
=w2Qd
-----END PGP SIGNATURE-----

--bOKaKvSbzTVE2lWB--


--===============8527568261078765861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8527568261078765861==--

