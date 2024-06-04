Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2ADC25B78
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggNV2ADJBfll4zBkiuimwAGi1NgDlI94tIzBGh8b9nM=; b=PBKiqxyIRvI1AJ2cCVwQolMhgB
	mtIcmBZ80yvUdH40eQmqclhsLpZRtMPcBR7YylFO2b/Px4wf11UQRjbHy8RMn4wPHbd94RBVPa6//
	ODrK2IFhEuwzr1HzswHec7oSG+QxZ/6owRDr28t8aUTIXYYIERD136Ei8T9wmrlxnMAgFkbByNUvc
	UVmFLcmUIIkdMoWuHGDxYFkwI4tZP9BPWoTvxG3SPljq5nO6NIGWtG7wsZABsH/5he9uaFdkVgt2p
	P2aHey2DaP6bLUnVD03dzip0Rhlrnd4nrcdj+6B6rbBLyUyz7bANcLjL0F+N6f0IVE4OdQzWz9NVG
	C5/Rtvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXXS-00000003E2x-3D8f;
	Tue, 04 Jun 2024 17:01:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEXXP-00000003E1g-1ROh
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 17:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8FE92CE1268;
	Tue,  4 Jun 2024 17:01:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D40C2BBFC;
	Tue,  4 Jun 2024 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717520488;
	bh=R6BbQWmZ4P9fschyN5itAlWnBsUdPsq0nefia1AQqJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ip1BNRF/dND0ElXHf+t3tJJ9w39d706EeHlpD8aicjNPUPRAQKV1tZn3o8oe0G6i9
	 Zc7suHix4wIxOTZ3KsvuBg9DIKFwDR05kqn3rnIuH5l0VQ3D0YJvFlGfplOUHdh7GM
	 Zwc95653ntre+06ZScGg3XT8JwDnX+VFVBJ19hZx1EiAm+8Faz7bLuty58k+1vIV05
	 bhQQa/hpD8CWXsul+EQoTlhF5fQUH96vAoC+UtmvijgO49t/FFhiPp4/FGEB2s4Wjn
	 CJnbBCJvjEDub39mjIdALz7Fh01rbRZy8IvrQTnDT2QVjGCQrsQAd0WwDnOEoI26Lk
	 7lguoLO8//HdQ==
Date: Tue, 4 Jun 2024 18:01:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Marek Vasut <marex@denx.de>, Imre Kaloz <kaloz@openwrt.org>,
	Andrew Lunn <andrew@lunn.ch>, Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM
 devices
Message-ID: <20240604-ladylike-gout-6fd6ae992712@spud>
References: <20240604074231.1874972-1-mwalle@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240604074231.1874972-1-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_100131_907564_1480B1A3 
X-CRM114-Status: GOOD (  30.28  )
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
Content-Type: multipart/mixed; boundary="===============2232797022601186464=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2232797022601186464==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HGv9EZxHu5PamIl2"
Content-Disposition: inline


--HGv9EZxHu5PamIl2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 09:42:31AM +0200, Michael Walle wrote:
> These devices are more like an AT25 compatible EEPROM instead of
> flashes. Like an EEPROM the user doesn't need to explicitly erase the
> memory, nor are there sectors or pages. Thus, instead of the SPI-NOR
> (flash) driver, one should instead use the at25 EEPROM driver.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Cc: Thorsten Scherer <t.scherer@eckelmann.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Imre Kaloz <kaloz@openwrt.org>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Flavio Suligoi <f.suligoi@asem.it>
> ---
> The referenced binding only supports the true AT25 compatible EEPROMs
> where you have to specify additional properties like size and page size
> or cypress FRAM devices where all the properties are discovered by the
> driver. I don't have the actual hardware, therefore I can't work on a
> proper driver and binding. But I really want to deprecate the use of
> these EEPROM like devices in SPI-NOR. So as a first step, mark the
> devices in the DT bindings as deprecated.
>=20
> There are three in-tree users of this. I hope I've CCed all the relevant
> people. With the switch to the at25 driver also comes a user-space
> facing change: there is no more MTD device. Instead there is an "eeprom"
> file in /sys now, just like for every other EEPROM.
>=20
> Marek already expressed, that the sps1 dts can likely be removed
> altogether. I'd like to hear from the other board DTS maintainers if
> they seem some problems moving to the EEPROM interface - or maybe that
> device isn't used at all anyway. So in the end, we can hopefully move
> all the users over to the at25 driver.
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/D=
ocumentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 6e3afb42926e..2dccb6b049ea 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -21,7 +21,6 @@ properties:
>                (m25p(40|80|16|32|64|128)|\
>                n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
>                atmel,at25df(321a|641|081a)|\
> -              everspin,mr25h(10|40|128|256)|\
>                (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635=
e)|\
>                (mxicy|macronix),mx25u(4033|4035)|\
>                (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
> @@ -42,6 +41,14 @@ properties:
>                - spansion,s25fs512s
>            - const: jedec,spi-nor
>        - const: jedec,spi-nor
> +
> +      # Deprecated bindings
> +      - items:
> +          - pattern: "^everspin,mr25h(10|40|128|256)$"
> +          - const: jedec,spi-nor
> +        description:
> +          Deprecated binding, use Documentation/devicetree/bindings/eepr=
om/at25.yaml.
> +        deprecated: true

The idea here seems okay, but directing people to use the at25 binding,
without actually documenting the replacement compatibles etc is far from
ideal. I think even a wording change that points out that that these
devices need to be documented in that file would be an improvement, the
current wording makes it seem like the works been done.
Until there's a replacement driver, I don't think you could really
expect anyone to move to a new binding anyway.

--HGv9EZxHu5PamIl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZl9IYwAKCRB4tDGHoIJi
0teVAP9+WE9Aa+SjNHv9SwetwqU+ib6o+pUyU7AnhGLRW5bKSgD/Q9iMrnHzSIg3
MshQhm2puWAwgGZUaoE1eXPubreqxww=
=z7/H
-----END PGP SIGNATURE-----

--HGv9EZxHu5PamIl2--


--===============2232797022601186464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2232797022601186464==--

