Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6998FC47095
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 20:56:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F67520853
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 20:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KeL9B/JB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ee9g6t5x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F67520853
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0c4BspSAt7fg1brBpLPLSsvmK5KHVnd9Tip51qpJVqo=; b=KeL9B/JBHFdL6FYroEM35DRnt
	Hp0mTKqqxPCJ8cJgSOB8j0gEPrYTvrwDE4WQtHviWo+s7P6BwKeIZSo99IOVZMfypcjOHoy/igiDA
	AFJRuSFMBlvquv2sAyGq3oJribFDOt8GnY4YMmG3excP+9UPn+ApaTkXTwrNH9D3LBBh7Mste4X79
	PE9KjAOWx/oTrrs1w5d46K6T7FKwTtFSToIZ1zkdzPCBb1R4Qsgoz6uwcDFy/e1ZwjgMREU3vMQN7
	sznfU87aPXNnLuyrgIt97POfokT15itbvcU/xlRqMQCkBIygjeMCwGoUwrph+tYMNpULxuI+xDP/D
	lTRW0d0Sg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPXWS-00036T-S3; Mon, 05 Oct 2020 20:55:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPXWP-00035C-Al; Mon, 05 Oct 2020 20:55:50 +0000
Received: from earth.universe (dyndsl-095-033-158-146.ewe-ip-backbone.de
 [95.33.158.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E455A212CC;
 Mon,  5 Oct 2020 20:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601931348;
 bh=RauhoP+lY6PB4M6PjyFmPFjt0my1MIgv0r1A7kpjI2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ee9g6t5xN1OxdKi2wd4UGvlS2s4aCwrZH8Q0UWdDMaCdLHbTCpREEzaNNAQgtyvSN
 N3GB1BEfbo5uuiLy2wYaTx84L3htFNcfAnS/xFvkMPS68jJKIEq5wv+3leXUApvIiC
 KdEECqq7ynbrubFDHIIHw20X7TPtN7Odd0sbpGpQ=
Received: by earth.universe (Postfix, from userid 1000)
 id B9D193C0C87; Mon,  5 Oct 2020 22:55:45 +0200 (CEST)
Date: Mon, 5 Oct 2020 22:55:45 +0200
From: Sebastian Reichel <sre@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Explicitly allow additional properties
 in common schemas
Message-ID: <20201005205545.sqvohrh7jpt7w63w@earth.universe>
References: <20201005183830.486085-1-robh@kernel.org>
 <20201005183830.486085-5-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201005183830.486085-5-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_165549_549536_0D205935 
X-CRM114-Status: GOOD (  17.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-usb@vger.kernel.org, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Sam Ravnborg <sam@ravnborg.org>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-ide@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, linux-mips@vger.kernel.org,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Jason Cooper <jason@lakedaemon.net>, linux-pm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-watchdog@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-i2c@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Richard Weinberger <richard@nod.at>, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: multipart/mixed; boundary="===============4024205319050677030=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4024205319050677030==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7db5qni5yh4rtlce"
Content-Disposition: inline


--7db5qni5yh4rtlce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 05, 2020 at 01:38:30PM -0500, Rob Herring wrote:
> In order to add meta-schema checks for additional/unevaluatedProperties
> being present, all schema need to make this explicit. As common/shared
> schema are included by other schemas, they should always allow for
> additionalProperties.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  [...]
>  .../devicetree/bindings/power/supply/power-supply.yaml       | 2 ++
>  [...]

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--7db5qni5yh4rtlce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl97iEsACgkQ2O7X88g7
+pr9vg//fpVYpKsaZc4pw203Kmzwve+W4z3OPaQS7g1Y93QHWykKxFYpCgOrbmA7
Ikwy3xwBLfMhPIUs8KZDsiaLVkKTi9XJifhEKiG4Uz772vFOZqAPgskcT6Sx4+iN
4lqd7WmgV3hGelDss8qw6dQ1FY0/MHuMXvoDeNHTvqi0ZhttRrQmOEO6spkWL1io
39Au/Pxbh2dK06Y7Y0qoKlqCKxnL4fWlUjFqJkJI+d4LjK/XYvukOTPmAhEYfP2H
tZ38WZd/3SxwQD+Nh6ZJCfKC54D00G54g+fkxhaiypSSgI1IPWfIsrqPfPnVMowq
wI2fo/C10LMZ1kqUi/LCW+OET8aePRkYjUMWZ2GBNRY9MJCJH/WkOPy7PaKHrOfU
EdJx9OH7guvFWaEJGhClazwYS6QkM8CEKy7Nd5nJTeQOBEg/p2Lb2etNPNq34nju
o9euArIjrnqbHK5X9Ijyvhaqw3bxsVPmPkOGUayDMB44UtwHNFqIosmboJnkJ6bt
BGS1zVnJs2sdLMqMZcCwfHGoX00rThZgvCACDas7fVEdsZgtaEnCW8aySbWCKPdY
1gtR+xdosJheKba+kMxfhmR0nm62rAmJvS9XOZaBY+cveye5NtC3kvk+Al5ixucd
jYmH3Iudn+0hC44ZPGUl49YUa5cwsX8NZlyh8ItyWm/x+WiVyb8=
=9y9P
-----END PGP SIGNATURE-----

--7db5qni5yh4rtlce--


--===============4024205319050677030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4024205319050677030==--

