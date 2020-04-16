Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C01C2BB85
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 10:41:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BCF921D92
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 10:41:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQj0u6CA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xp/KXtyB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BCF921D92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7/QkEcr7zWDCJTw2X/VvKBb7l53Q9UzN8eDLCboBEkY=; b=IQj0u6CA4odwrRtstidUW4C3s
	HSY9L1Lmrf4shdzdk0XmOuBn/Hk9XU+5+a7X7xrgsUutfP98tXaJen1nAOsKsqWmUh/zIhislcufA
	kTpIDSsFJCzMZvt0TTsyYxCnof83kraxHLiq5yfdX33jECCap7zrIHv9iht2lLu70cRcFxFzNWIye
	OoCwp7y0FRllzXnuA/Ro/6PoOcZTrG5QXItTx1ea1mHx62I4t8SW44N8Voxl0o9IvhmLSFwkPoqZK
	skRTvky00Z3gjvR7IT8qGECKIyZbu4nBzGKVZ5EE4ij/2px/BtTnQ4p2Kdeqxnvwa/21vHLAsrXYt
	pIV0RRg6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP1xJ-0003ux-Jb; Thu, 16 Apr 2020 10:41:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1xD-0003mw-VG; Thu, 16 Apr 2020 10:41:09 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8860221E9;
 Thu, 16 Apr 2020 10:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587033667;
 bh=u5fMQDNAUuXaPw+89dTTA0ZVG5dJuZz63WEnr/aWCsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xp/KXtyBC+AW47+w/EThPewPKJno4LpErrb9k/MShW8CSZOjoH/eQie3gyamQtAPZ
 7+2VNJeLRNNDDKaVoGmzb7acrQ3F10p7zOFoaEDwJaxmNypi234utwSFrQnjNbswMB
 9dE8DImjkqaSZMR+teMounUi1jKOEIZOXIrffOdk=
Date: Thu, 16 Apr 2020 11:41:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: Remove cases of 'allOf' containing a
 '$ref'
Message-ID: <20200416104104.GE5354@sirena.org.uk>
References: <20200416005549.9683-1-robh@kernel.org>
 <20200416005549.9683-2-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200416005549.9683-2-robh@kernel.org>
X-Cookie: Tempt me with a spoon!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_034108_070281_553AB4C2 
X-CRM114-Status: GOOD (  11.17  )
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
 linux-gpio@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Content-Type: multipart/mixed; boundary="===============7728558634019002172=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7728558634019002172==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/2994txjAzEdQwm5"
Content-Disposition: inline


--/2994txjAzEdQwm5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2020 at 07:55:49PM -0500, Rob Herring wrote:
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed

Acked-by: Mark Brown <broonie@kernel.org>

--/2994txjAzEdQwm5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6YNkAACgkQJNaLcl1U
h9B9Tgf/e6Ex42p5b/rjUYhiAhK+0T+nvTbdLGjxGyRfopnnVMMaYPWXmkdGdh0H
/nGE0rn04EUyWfBkjgCeKuclbzRWJCfQBSl+4dlYbMuX1LKrybV3nRANP03o7A9y
sqPsDL3Qq01Rgb8waJiwmXqcHjxKBbCZd5bzU8ff82hg8jGKMIDVzJdnYrzGJJm7
wLygPWU+Nj65KniavgesiRhfwSLfveuWwAR6SsWCCiOhJOWgl0/KbhceiFTRLJ4c
pQQeBPzy+/C5VH2sYPCZB3/MEQ4/6+CC1AchkSDqGwOooj4KsPXXCjiJtj4YZB86
9wfRx0ePvlfgBQgHYw4LX6341lhYUw==
=Rw7L
-----END PGP SIGNATURE-----

--/2994txjAzEdQwm5--


--===============7728558634019002172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7728558634019002172==--

