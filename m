Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89C5C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 13:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okZK53XTlMH3xEA5tbS9Qyz0k9uXc7dAxMA9FWuaR1M=; b=w359j5EuHApq2idTA+EUwSXA1j
	2JPz7oJsMrFXD5fQtLp03NIj4vusrTP9K9rEfgBnqMNnWrfBjLFCUh3t6+yj3+nzAxvBU6Sd2lRDD
	J2YID/dBCzQG5AQZWKxIrgZnJ89rcgWWZeydkbTaDwZEQ2WtdydDrXWoF8i6qcUTLOHT8W8BBR4pv
	stM4V3gRlfv7LeMWBXr/9DPfKBf9GEeXKeK/u1RTbGjE6EkwSWbipMrKkTLwfW1DI6Vpzc04RNtQ4
	lPTpidetfQ1uAH65F3jSWN5jGPWQH62o2VXIYEoAN+S6xF8yxVBdgsskMC2/T1agZ8+v7PhZGR4lE
	JyBX938A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBR4-000000026QU-1fk8;
	Tue, 09 Apr 2024 13:22:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBR0-000000026Og-3k6u
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 13:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F961616E3;
	Tue,  9 Apr 2024 13:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB7BC43399;
	Tue,  9 Apr 2024 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712668965;
	bh=+qRpdfn6imp+KKjieABpdtfi/x/YK+WbMGLOebjohNk=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=Nk/px9LiDpuUrGNWp4QUd2ZRpM8tUx7ILrgAPBox1vJaVZUta8bFvsx4oHja8ZamL
	 EOQUJ99W0uoHEIaJEkZWU3wOJ/XTmIcyPU2AhW39jw10Sgtdj//YlvGU+45G/rDd2P
	 AUXBqdDmR9UlFb/N5cG0iFTWkq2YsHmYAAZ4WfwlvXplSc4KBD4UbcZgZdErQMGnPN
	 AakX3AiO6eaWlHp19uTYSVVHWaipTGQz7wNx61qtFcHGUJnIGDJgXu0mRZHc5/onke
	 CInI7908qRJdFKCVNrjg3yvvl8+JhJGLVZvF0rYKApbmoUlmiUpXHdb/7nU3iKmEom
	 7/0nHOcmkAJyA==
Date: Tue, 09 Apr 2024 15:22:00 +0200
Message-Id: <D0FMGOEWQC1O.30D61WTXL4087@kernel.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "FLAVIO SULIGOI" <f.suligoi@asem.it>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: EXTERNAL: Re: [PATCH 1/1] mtd: spi-nor: everspin: add em004lxb
 entry
X-Mailer: aerc 0.16.0
References: <20240405100104.480779-1-f.suligoi@asem.it>
 <20240405100104.480779-2-f.suligoi@asem.it>
 <D0C9NCOMI27O.2VW2U3FNFTSPK@kernel.org>
 <PH0PR22MB3789719A62A1EE483C9FDF76F9072@PH0PR22MB3789.namprd22.prod.outlook.com>
In-Reply-To: <
 <PH0PR22MB3789719A62A1EE483C9FDF76F9072@PH0PR22MB3789.namprd22.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_062247_050107_9C5ADBE7 
X-CRM114-Status: GOOD (  26.60  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3794672495859805702=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3794672495859805702==
Content-Type: multipart/signed;
 boundary=075ae5208db4a3d47fdbb558f3a42d323bc83d22469cd68f40760735a749;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--075ae5208db4a3d47fdbb558f3a42d323bc83d22469cd68f40760735a749
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue Apr 9, 2024 at 2:07 PM CEST, FLAVIO SULIGOI wrote:
> > On Fri Apr 5, 2024 at 12:01 PM CEST, Flavio Suligoi wrote:
> > > Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
> > > Memory.
> > > This device is JEDEC compatible (JESD251 and JESD251-1), but it is no=
t
> > > able to provide SFDP information.
> >=20
> > Did you try the at25 driver if it will fit your usecase? Judging from
> > your last response, it sounds like it will do.
>
> Yes, you are right, it works with at25 driver!
> Thanks!

Good news :)

> At the moment I have to use a page size of 256 bytes, using "atmel,at25".
> Since the Everspin EM0004LXB MRAM doesn't have problem with any page size
> (theoretically I could use a single page size of 512KB), can I update the
> at25.c driver with a support for the EM0004LXB MRAM, as already done for
> the Cypress fm25 F-RAM?

Feel free to propose a patch. Keep in mind that it is another ML and
maintainer. Just use get_maintainer.pl. Keep me on CC if you like.

-michael

> >=20
> > >
> > > Link: https://www.everspin.com/file/158244/download
> > >
> > > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > > ---
> > >  drivers/mtd/spi-nor/everspin.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/mtd/spi-nor/everspin.c
> > > b/drivers/mtd/spi-nor/everspin.c index 5f321e24ae7d..4741930ce9a8
> > > 100644
> > > --- a/drivers/mtd/spi-nor/everspin.c
> > > +++ b/drivers/mtd/spi-nor/everspin.c
> > > @@ -31,6 +31,14 @@ static const struct flash_info everspin_nor_parts[=
]
> > =3D {
> > >  		.size =3D SZ_512K,
> > >  		.sector_size =3D SZ_512K,
> > >  		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> > > +	}, {
> > > +		.id =3D SNOR_ID(0x6b, 0xbb, 0x13),
> > > +		.name =3D "em004lxb",
> > > +		.size =3D SZ_512K,
> > > +		.sector_size =3D SZ_512K,
> > > +		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR | SPI_NOR_HAS_LOCK
> > |
> >=20
> > Will it also work without SPI_NOR_NO_ERASE? Also, the flash supports
> > fast read, so drop NO_FR. Also, please have a look at [1] for the
> > testing requirements.
> >=20
> > Thanks.
> > -michael
> >=20
> > > +			 SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
> > > +		.no_sfdp_flags =3D SPI_NOR_SKIP_SFDP,
> > >  	}
> > >  };
> > >
> >=20
> > [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
>
> Thanks and best regards,
> Flavio


--075ae5208db4a3d47fdbb558f3a42d323bc83d22469cd68f40760735a749
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZhVA+hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/i8/AF/fD2dzcyQr3HGVxsEAOBduorhF05MB4hO
h5jZbHCSISsiRqqlasJnnSPViXGrm4OcAYDd7cDbdX1ItpPATVlsfP8dkRWSRju1
l3e0T4hfE1nZO4iUukBEDc9TS8dL0MTgMDw=
=HQCi
-----END PGP SIGNATURE-----

--075ae5208db4a3d47fdbb558f3a42d323bc83d22469cd68f40760735a749--


--===============3794672495859805702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3794672495859805702==--

