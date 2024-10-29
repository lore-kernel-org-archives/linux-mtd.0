Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30024D3E2DF
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVeuuFXANlOjc0CqrqWjEiNTFMB6jDvRULc7xg34k78=; b=NPzfF37Wh8JiUsSBKMjKY2WbO6
	+Ug2B5Sv8l91B7TXZtEo9KKABExxJvNGhWs6rrG8vZa9HjTwGPrMu7qCzOZowpZZm3d8K463lNhR3
	Ms0JsolKGkLBMts+zwQBoUSnk2ZKW5U/FZhQPBjc5+JQ38wi4vDRlh9YQsdwfYbTDTgZaO1V83EdU
	tmyzz/1+ntpEbSkzZGXQArEsjAF2L07Z1aE9NMuDJu+uE/qiF/55UrOs2YKwf7byrTP/5687G/6YY
	PUKa3Bj1SvWNKzip1mG7bg40QnfToF2+uj9YNI11JmeoYZ68nJzc5QPUa/6MLSQV1csntFlvI2oIy
	w71C67Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hAH-0000000DbcS-1Ywx;
	Tue, 29 Oct 2024 08:01:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hA4-0000000DbYN-2E6g;
	Tue, 29 Oct 2024 08:01:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d495d217bso4799413f8f.0;
        Tue, 29 Oct 2024 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730188866; x=1730793666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bzhZz2GbYuomV5MFzqF3P/eLv0fnWUj7r5Lpx812OSI=;
        b=IqMLW3sfh/HT+EAHwAQliAe/LYnn3CuXYErrQ3X6zT6S73hhMW3ecO67y/Hs0q0acb
         BC/oceFSQCiPaUTv5XX5KkxdP9VEAdbZvUH7GXPHFScivdlJKE7HaztC6hcpFxsI+K9n
         8/ywMEE1WaWKJja3obPtLthPHPPxM5YuKWpSyRs7wIcc3x/KAHQ36rSiC8+4caZRwhrm
         mWYOdYiKctt/sVy7dSFj/wyeUQtlJAHu8AyioVh7WVec9VxUjtCcx5Aa87267yC3QECh
         YmaX3AmYCH5b0PzBUoEz/5z9xaZrFA+Dak5S/bFT7XnFDMBFBSoCoBF8glrHECezQ2C3
         OQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188866; x=1730793666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzhZz2GbYuomV5MFzqF3P/eLv0fnWUj7r5Lpx812OSI=;
        b=cqEpftdYZea2z50l4tP2ZWWBlZk08DWec0exK5jWnOghFCKsRAj1a0hBUb9hPIFXga
         K+wwpb39kzu3pBV2g/ZrHCf/y1hThBWWi/4GonIdwMwpbewVHm6yW9L8i8Q64gqfFuoL
         5zGi0qCwsTEJ7PQDAKfzsTCtAXxRmj3AX+NAuJ+f2PVGt9cy2ZCKmDSHWwDI+Zy399o7
         bfL6ffgSJtO7VWYyVjtrPF2w7aisWD0gWQ0SuE4HW4kOUR8WmafOAybYU5hEyjkQL9H3
         hwmy1eEA15pnHCt3itOLClB4mOZ7z84wiBQoJUJCT4YoYZKMifLvy+P//53EpP1j9C7X
         BjNw==
X-Forwarded-Encrypted: i=1; AJvYcCVYfCoh/h/ZZ3e3iNh5WaTGAsnabeIXGnU9OfZ8C2lTHCkBViTm6y9Tz7msy7MlPH1Ty1ob1/xKWgC3@lists.infradead.org, AJvYcCXCBa5B3eBPF+J0gVYSI2RBJogp9OI8oey5FllQnGKGroiRE+fapaS6y6cT7HdnCYZmsgnHtbNCb9cjO0JLggOK@lists.infradead.org
X-Gm-Message-State: AOJu0YwYbes+eum/eqA6SfyRe3wgDS6gGSWZ8T+4D53rlLkjKfBolipy
	swaQNCHTToCjVbKqBqpCa+R5B0Bc9sSCU76UuDlTSa5w48fhV2KRJlsehq8Z
X-Google-Smtp-Source: AGHT+IFr0REKzIVW7Tl7PWuzYb/YDn87kfUPNpGrBe1ZEl3WOV7PcWg4Lczgc6Zu7KIosbpcVpyrhA==
X-Received: by 2002:a05:6512:108c:b0:539:8f68:e036 with SMTP id 2adb3069b0e04-53b348e755fmr7646927e87.34.1730188854996;
        Tue, 29 Oct 2024 01:00:54 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c96ebsm1305019e87.223.2024.10.29.01.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:00:54 -0700 (PDT)
Date: Tue, 29 Oct 2024 09:00:52 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: atmel: add at25sf321b entry
Message-ID: <ZyCWNK_xMIsW4Ibq@gmail.com>
References: <20241018-spi-nor-v1-1-d725bfb701ec@gmail.com>
 <239d2425-52f6-4deb-964e-e22d1a1f6637@linaro.org>
MIME-Version: 1.0
In-Reply-To: <239d2425-52f6-4deb-964e-e22d1a1f6637@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_010108_604213_8A967AE3 
X-CRM114-Status: GOOD (  16.97  )
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
Content-Type: multipart/mixed; boundary="===============4063657749190821989=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4063657749190821989==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KknHUEYmorMeUoPi"
Content-Disposition: inline


--KknHUEYmorMeUoPi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tudor,

On Tue, Oct 29, 2024 at 07:16:08AM +0000, Tudor Ambarus wrote:
>=20
>=20
> On 10/18/24 10:51 AM, Marcus Folkesson wrote:
> > Add entry for the at25sf321b 32Mbit SPI flash which is able to provide
> > SFDP information.
>=20
> then we could initialize the flash based on SFDP. If you don't need
> locking then probably you won't need a flash entry at all. See
> https://docs.kernel.org/driver-api/mtd/spi-nor.html

Hrmf. It seems like I have been looking into the wrong datasheet.

The actual device is at25sf321, not at25s321b, where the former can not
be identified using the SFDP table.
At25sf321 and at25s321b uses the same JEDEC ID though, probably what got
me wrong in the first place.

Please see page 10 in
https://www.renesas.cn/zh/document/apn/an201-adesto-32mbit-products-overview
for further reading.

I will send a v2 with updated details.

Best regards,
Marcus Folkesson

--KknHUEYmorMeUoPi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmcgli8ACgkQiIBOb1ld
UjLqWBAAyi0k9ULJfnyCaEkxEVEnWiyzPbYA3Tb5WlQoY/FuzK9QF2YO5eAZcnX3
1MI2jYg6AXHK5Peep8m0if7Zeul+lhXxoIbQ5rSvpg8V9emyP5H4OBMyC/Ut2Xn8
dAmHWzZq/4x7tvioOuceQMyvom3f31ruLYj1UIQDxqkgPxph/Vs10uz6VDYD7+5m
a2fws0yI32dprIjt17WJiNVqti7t8OB7UTtb+cMrYssTtcMJgg+ZwDbSbqKgKKgt
jb53eSQM8o45g7W7FwZG5niwV+BDnv3+U2iBqez4Z+Az2fJxH0hUqYajlRGDtAMw
9+OQW2YfXVuAhYBPeq1tbVRgYZYUi2gCo5QHtbXJ5dgetdzhHl1j1ZrSDTTWbSvO
BkMoDBlW8tdik9S9WPu++i8yqq/2uvbhOFz+vlimTjJJELiu9GdGGNiuf7JG0S2g
KuJdxtn0Md+s2+hHDK5ZguT6OljNsx0DADS1XW/K2TGsBrvHeUSsB05RvDaaUiwO
BK47ytYmWued1tcflYvtj/9RL36rrHTJx1EQzedpzCHYqdGTPvXlfLPMqZVM7hvx
qJOctA11w5wkDje2DUuxYzeG8uytdXglmAsnYM5DTZnTHpOtSAZf1VjCKCm9YkLh
GeTIBZcjHffbAB4053mzvDA+Nxt88VTVteiUByfu6gKKVkcv3Jo=
=l+pl
-----END PGP SIGNATURE-----

--KknHUEYmorMeUoPi--


--===============4063657749190821989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4063657749190821989==--

