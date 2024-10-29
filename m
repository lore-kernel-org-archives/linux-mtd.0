Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A191DD2AB3F
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 13:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFrWKJUHJperUkheVJqTCVeF3uk2d6/FgdM1zz0JDPE=; b=NMjy5Bq9WjriUeX4NEFCTTxsWP
	RDtDLbQl9X1wV0IPKexmh1dgVwxtdTWnqA0SH8f9BNatoRHohD3qY4e5rHBpbGHXK9HJz8KMLDNqG
	uz3e6N/nha7r+1LGZ0Mf4ORfUkHQ2jISLpgnWhrJYW1OOtipjoxyYGg/Sa9ZZEwg01pVCI81P9Vns
	+uw8rAWdM8XSAxR9tSOtKlqbQMez1T0iocMQWfSvSe6FPvvdXqPEFC8Q9Wdc9CTkEHLkLSsFRJ070
	lZvExYt02AwlABdhaYl4f6OO5aW3zCHjGM1J+wdGQ51hUXs8vfbZRiLkK4zQYrKb9bJaGVsggWPsR
	YDJujM4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5mLU-0000000EaOd-2NPD;
	Tue, 29 Oct 2024 13:33:16 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5m5m-0000000EXkB-26fe;
	Tue, 29 Oct 2024 13:17:11 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so53994071fa.3;
        Tue, 29 Oct 2024 06:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730207821; x=1730812621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MSMoTBUH9ZAGTBta9ZISlFsh4dK5o/uVfCGKvcTrA3Q=;
        b=MdAbBX/2ib6LBGjkYPq+YiHmR3yhwLLoays2TihNWyzO8yq6kG840GZEGOs9lIxKzI
         cgoM9le1pmM1HglRLAk3UdJug5UB2lMS5ihEK4y8uRWemzbeClLhaD6xEqQJCu90n/Ys
         2EnBUR1TVKzUiVAqYOHAGxX/VXGRsMtaKiPhFjxLowoNaQqoWl/ZVX9M+DLFMd6uFg/K
         B41Lz2IuXqsbtsVycLz0HYPCkSauBXTuPrBpnoyIy2BCU97UL2Klx7mtsu58iVZGD14x
         khVhegpnv7wOtPf206ey+gUm7vLa7M/SYTQBmiXmUTdNFP4Z0rKLUsBQUNZ9OVJpvcXf
         FmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730207821; x=1730812621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSMoTBUH9ZAGTBta9ZISlFsh4dK5o/uVfCGKvcTrA3Q=;
        b=Gk8INzTgu4Q6qDWSkyz/e3uktwFkKZvE72zWFlRpzQhZUVCaO+eI2Tx1Poe2RozhIY
         PzYjog474pIxYktu6qx7KWF/8CpAGzPEC8+zylmU2PfhkZ1ikz0DQ1EELwvdIXRoixtq
         G5x9GGvmmO18UsoWI6Ka9CUrRgzdMuJQVFZWhiU97m8GonfVDSJZx5YlNXyhLZdRvqTe
         sElbuSJMDFg4KJ96r7Bt9XVbtK00EKVvbmHInx/rZPPxPeFpe1+Zyff2XCN9H/THjqMS
         V2wlK/g+GDIr3oGM/CHa1xR11k81JPn15KbfrRVBw19z+E2lkRU4HvHJiXI/yJzBzT6u
         jZoA==
X-Forwarded-Encrypted: i=1; AJvYcCVXv6oSTLniA+QR5jr/Yfs17PGMKGoU2TJF7ZsY3flS9JQUxlKbtaf+LumydAE6zlLlGhE6NLeeVfw1@lists.infradead.org, AJvYcCW42zel2PVSZXrx1GEwBASFyPvLsqXxlm9In2Gh2hq33IkdGarDZflGeigVQH9V8HPqq7sWIouR+FX6rm1AS1Kz@lists.infradead.org
X-Gm-Message-State: AOJu0YzjzZO9bnGmzdZh1/pPsC//Ln7vH6glCZp2/SSjmaSOCpZYd3Al
	ABStD70fG8kbcct9ej2/v4e1Q49bslApkmdVZ4SFyjdWYjlNGsu8
X-Google-Smtp-Source: AGHT+IGm3KQnRwYWnHaidTV7KPwOh6PY38rvbEADfr6oUwvsh931+CHkLC87MoQSMag+prkfjiZaDw==
X-Received: by 2002:a05:651c:1508:b0:2fb:6465:3198 with SMTP id 38308e7fff4ca-2fcbdf60348mr55008411fa.5.1730207820291;
        Tue, 29 Oct 2024 06:17:00 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4519b3esm14729631fa.44.2024.10.29.06.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 06:16:59 -0700 (PDT)
Date: Tue, 29 Oct 2024 14:16:57 +0100
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
Subject: Re: [PATCH v2] mtd: spi-nor: atmel: add at25sf321 entry
Message-ID: <ZyDgSRcT79yksuG2@gmail.com>
References: <20241029-spi-nor-v2-1-e166c3900e19@gmail.com>
 <0bbd2514-ff51-4b0c-b3ad-547e4937d9f4@linaro.org>
MIME-Version: 1.0
In-Reply-To: <0bbd2514-ff51-4b0c-b3ad-547e4937d9f4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_061702_684000_F0256D93 
X-CRM114-Status: GOOD (  23.53  )
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
Content-Type: multipart/mixed; boundary="===============2245795217212062876=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2245795217212062876==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EXAiSf3CKL2XB0RX"
Content-Disposition: inline


--EXAiSf3CKL2XB0RX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tudor,

On Tue, Oct 29, 2024 at 11:36:17AM +0000, Tudor Ambarus wrote:
>=20
>=20
> On 10/29/24 11:23 AM, Marcus Folkesson wrote:
> > Add entry for the at25sf321 32Mbit SPI flash.
> >=20
> > This flash is populated on a custom board and was tested at
> > 10MHz frequency using the "ti,da830-spi" SPI controller.
> >=20
>=20
> no sfdp for this one?

No SFDP for this one!
>=20
> > Link:
> > https://www.renesas.com/en/document/dst/at25sf321-datasheet?r=3D1608801
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---

[...]

> > diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> > index 45d1153a04a07b7c61f46b117311b24ab695038f..8285a16b253d54ae8c4a530=
2850244d2248aa755 100644
> > --- a/drivers/mtd/spi-nor/atmel.c
> > +++ b/drivers/mtd/spi-nor/atmel.c
> > @@ -238,6 +238,11 @@ static const struct flash_info atmel_nor_parts[] =
=3D {
> >  		.flags =3D SPI_NOR_HAS_LOCK,
> >  		.no_sfdp_flags =3D SECT_4K,
> >  		.fixups =3D &at25fs_nor_fixups
> > +	}, {
> > +		.id =3D SNOR_ID(0x1f, 0x87, 0x01),
> > +		.name =3D "at25sf321",
> > +		.size =3D SZ_4M,
> > +		.no_sfdp_flags =3D SECT_4K,
>=20
> it seems this flash supports dual and quad reads. Do you care to
> add/test these modes?
>=20
> you'll need mtd-utils

Sure, not sure how I test it though.
I've added mtd-utils but I do not see any good parameters to set mode?

>=20
> >  	},
> >  };
> > =20
> >=20
> > ---
> > base-commit: 200289db261f0c8131a5756133e9d30966289c3b
> > change-id: 20241018-spi-nor-dc29698dea0f
> >=20
> > Best regards,

Best regards,
Marcus Folkesson

--EXAiSf3CKL2XB0RX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmcg4EMACgkQiIBOb1ld
UjK7+xAAi3KDCD7dHqOtvAx0XfPRzW8vetxcvvhqy0rr9c53CgkPhge8+zhyPe1X
deoFKEjIzv3K1Rhn3uDD/5JMgr/MoE6ZxRPWBBFyFXkl98QF+mS9aSAUySRqrvLI
wXMa7Xt02jDF3hJGs9wqM8x9ShH1Eo1lEcIwe9nCOJNi/MmP/w07DFj976MrQB8D
7bTjM4bTUgdcNJG+LkyfjQJN0kH7Ehx0bEo6AS86vr2jmPtbcV7NqcWTVyxBX7gJ
2bjMFn+KNaHzQGxuKy2E1wgIdqQcCgLfaZV8+xzOKRaFfDwXZDw78zh4nk1F8Suf
JposidYMwbkeW3nQM4bmOgfYHOFxwRelc0LJEGTfPBYNi2kpRhmFn/cE/KCAhYRH
x9xATr8xvR2H6YcjD8hd7cdX2O5MFYAdJUKtfFJqKXS2Zj5fmNhwTOlfpnId62KO
UzyffU/LuHgQaGhZtBzsPGQUvpzfArK37BuwDvPBkKXbk5t/JWxySMSOFC+rPdmr
1QB9ovpCrl8He/quaLkJnizyoFWeQ9HeX9kOl7R5c77LtdvAnp6zWUJ0a6Qi8+c9
JOj2zqr23JJmEL4UVbs/BDjMj9soxUMta8n/tt+yRL8wYWAY7pofaW8Wm778joI6
2PdfBV8f0dbrRSoadg1QVbx39RZqFFIj1ZhHZ516N5nEpj2c6Z4=
=Jra2
-----END PGP SIGNATURE-----

--EXAiSf3CKL2XB0RX--


--===============2245795217212062876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2245795217212062876==--

