Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4372EC3A5A0
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 16:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E152074F
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 16:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kJOLMzTl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E152074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+c1DGcDlTNGm7U0xeLdl23007GilIg0AEZOpFqM9tQw=; b=kJOLMzTlGCKZHvkQCsYaRJv4p
	J8Qtd8Nb/mEUNgj8sLSPhu+jG3wMIlBi88Nj0jSHBb84FjQMVu5h+SPOKlP0+C/vQSn5K8nQDNYXT
	2+W0aNwrQ93KdSV2NHmURqMwfMXVhk8/fx7nyIJpovK0DNkr574HvI8JVHHWGGFS2CzsPqSHrQc17
	3AQ50El8X21mC2qnxtj2rKwkDfaaPEtJkKLlEjQwpuw5uFDXFl+IZBR3wUdJ/arCJ8Pg5RpCK85v6
	C44jSfnqubhuOYqhgr5btz4mbQ7jscyVkNKOsAQJjpIolbdkbWoE6IqKbR+mgiZ0AB5V5wq7nDIlS
	EXIpbkULg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQZH8-00008H-BQ; Mon, 20 Apr 2020 16:28:02 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQZGx-0008Me-AY; Mon, 20 Apr 2020 16:27:53 +0000
Received: from localhost (p54B335B8.dip0.t-ipconnect.de [84.179.53.184])
 by pokefinder.org (Postfix) with ESMTPSA id A6EEB2C1F4C;
 Mon, 20 Apr 2020 18:27:47 +0200 (CEST)
Date: Mon, 20 Apr 2020 18:27:47 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up schema indentation formatting
Message-ID: <20200420162747.GA3721@ninjato>
References: <20200416005549.9683-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200416005549.9683-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_092751_662035_5D15463E 
X-CRM114-Status: GOOD (  11.50  )
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
 Heiko Stuebner <heiko@sntech.de>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 linux-riscv@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>, alsa-devel@alsa-project.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============6479079080126694960=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6479079080126694960==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 07:55:48PM -0500, Rob Herring wrote:
> Fix various inconsistencies in schema indentation. Most of these are
> list indentation which should be 2 spaces more than the start of the
> enclosing keyword. This doesn't matter functionally, but affects running
> scripts which do transforms on the schema files.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

I see that people had comments but I can't judge the topics raised. So,
I trust you guys that you find out when it is good to go and for that,
here is my ack:

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6dzX8ACgkQFA3kzBSg
KbauIw//UsNN3sTG1Vo4Bgtp5Vw0s3m8ojCBjku/VuI/dnL/nKMqOKViAqP/ihOW
epD4QCANZZ0InnhrhnkpKlsCZ3/i+OME4nuCopTRpWH5TUrX4T0f+1NLegcwoxw/
UZ1N+HIQrTXUqpkvVw677OEH4fd4qO2mulRZYu7EPi1zhsQs8tyc0spdKvLPg8IR
Wi165b1RDDsH6+ZFy9+KMDjPmklcrXxWRF/Qc5ATOmaSGMEFc3BTb2uVzVO64Oh0
dZXGDontJcsz+7KQSXatmu38Xwys1bGGxhG7nvkSS/DmaFwnbkLx2jBZFz9GzVNm
QZz3tC7olD6edfkgyL76W7dGYQfeA03MZZ88Sgq304Cgv0QwbTM26C0MXhpG1LZR
sIxf8ZSbwOVUAuXRtABR6Pqu4xm9qbIXtth68kmF8KGPPXIaInqZPOaL0T0ApXm8
ggBIcp2KoH117WlUDqmLOWlvSjecvUh5WxegsaGpmzxU/XTs9YxYvWvLNG5tGBs7
Se2LAoLynrGy7LuUQYtRfbYSULgv0cyhO3V6oRjeqNpgekKCqpzStLFWVdCniiuq
z3guYyMgQ13m1XwXHpeXwhUaak/dp7MvZeg9YxXn1g5MGCVQBMKBAak4aBGnxPLR
OZq32nBakfGpLUy17vQXKQ0FsM9g8+mMc0xbGgzyyjca0mQuJCs=
=5aFH
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


--===============6479079080126694960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6479079080126694960==--

