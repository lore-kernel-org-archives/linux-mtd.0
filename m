Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D58C3DA66
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Aug 2023 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBPNxRBeTBUAA61itj9/4L0+VtlBqQkOtdP//d/00bI=; b=u6s3LM3R5Q3CK1YpCCvgcSeW8Z
	gJ2AsYw4gSjPXF5boh2D9HinzLsJfFsWN3ZqkFlkuoI/sVVhrp2W3U7o40cBafE8+/uoJ7mtOdQ3u
	LZHdtDepua8yyTPS0KXwhONqhsQzby00TkhTk1nPXTRKP26KQ6phJwQ0fW3/hBm1HTOeYYxA1Lixx
	2FCoe2SpcuEpRMn6z/8fZ/kNbBshfXAt/CBG5Md2Mp6wQQLKs7kHzE+MzdHVwdcsEbLWhHNV6B+oG
	z04LbmkOvlNWh6Koba2VdWSFsXY2AIMS58x85QqfUTEwtklAERTQSpMRAZISgb+Zzkd5hf4T7EknI
	AioFxgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtO9-001Oyl-2Z;
	Wed, 23 Aug 2023 19:19:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtO6-001Oxq-0E;
	Wed, 23 Aug 2023 19:19:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E630D65D36;
	Wed, 23 Aug 2023 19:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBAFDC433CD;
	Wed, 23 Aug 2023 19:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692818368;
	bh=z7owpDA4k2E0Ij+VJAllz0k9twsgKGzrUNXPPIMEbGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RLK+HCznqKathi9Leh0P+xR1D8A/NYgTQJMo99gN/QSAnrhe1rGOwhqFu+HNYKKB7
	 2oFKgjPA5KRsI8k9bM3r6fM63p4dgpOrMWVS3cNPMbRnDgP7p0VZhaKEqnNmvRLGq4
	 8tzIsC7ROMJzD3+DcpGvGFUmtSoNTsHdCJWIMaD7uPpo6m3YGadz35mz6L3ILULNBF
	 jpPX0PzakI7//HGxxl5lrQiUw4t/3xORFy++z4b8j5vZSoS3N/2gXdguykfxsD5ghQ
	 fIRFPmPWhInlFvcrM+4EmP7zA6kapAXO9bpURBOpE/ujA7h3qLXTKOkhxqZ5cx81xj
	 6cIxmFtSwXhuA==
Date: Wed, 23 Aug 2023 21:19:25 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Corey Minyard <minyard@acm.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	M ark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop remaining unneeded quotes
Message-ID: <ZOZbvbQCfE/7za7A@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>, Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Corey Minyard <minyard@acm.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	M ark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
	linux-watchdog@vger.kernel.org
References: <20230823183749.2609013-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230823183749.2609013-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_121930_213174_2AFD6BE0 
X-CRM114-Status: GOOD (  12.36  )
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
Content-Type: multipart/mixed; boundary="===============6422099694629104941=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6422099694629104941==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W9LDWghRC/uN9wQg"
Content-Disposition: inline


--W9LDWghRC/uN9wQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 01:28:47PM -0500, Rob Herring wrote:
> Cleanup bindings dropping the last remaining unneeded quotes. With this,
> the check for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Wolfram Sang <wsa@kernel.org> # for AT24/I2C


--W9LDWghRC/uN9wQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmTmW70ACgkQFA3kzBSg
KbYDpQ//TxfkWdWliCVOwgunoynDj8QbT0LI4crB95MmkexsMTX8+s4LTc8eQGfV
pyqAEdN6UWa+iETe1rDdvwMKvSik7m3o9JvCy3BwxcTkHeVsnH3aqQvORh1ehka6
HKXT+KozcWWe7ZVqyqCApjqb9VIE6six7kI2381p9eSiSTzpjZR988QLcEcV3fIK
hdH21sLgCm+pt7vwnhNLyL4DqSKc4a3xBjcCDY2fW0XYAEhdsi8mVu58gnct1yTF
mRcbv717gndwG4XgL9wnA0DCZVPc27acPi/daHtp+jPsvsqMQSnQz9TDbkTRJX95
z47oWS6p2ol6iJqbbr80wZ2ozdE0avfydrdhwHEWx6ndnAQ3DZgqVeSwmwEE+mxQ
FZvFYVM06i7rX8DScen91PFvcLpkGmvmBED6KKvsrovou0cPlcTEIdycxKlNtxEk
bbahDY5Kl7MLuUxfLMZV03upU/y/S8AgWwd26kE0zUBolCi09v9e822TqLgfd2TO
VmPqs3dvxwmykO9s8HkGdTSrgkdgGv9NMXnm6Psg5MlTtkDk12CspSFQ4fdD4VgY
GPCKVGvGzdhrJ0vUe7GODt2C/uHGCO1W7/efVtFbcdOvLcmQIr9uqD/JpfBXGh70
tjpBBAx/9dVKkiFTHjhZ2CzBQS22G6GWuDFnJaWIygpWTE7XaE0=
=RXY7
-----END PGP SIGNATURE-----

--W9LDWghRC/uN9wQg--


--===============6422099694629104941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6422099694629104941==--

