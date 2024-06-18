Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96814C27C4F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Jun 2024 11:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wMyYe/s15MLBwzkLmP6qw9vuMVBYVBsVqOWoeMIXkNE=; b=2L/XiPaAGsPZpXvC+Qygu8GdX8
	Rxav4SNddgDuyZxvHT3BVEn9WRLEERN8zHAsGU+uCc+UQpPiVezkYVKXSHb8r1Ya+f66bgm9wY5lm
	iVbvpqF1ol2iwlCqVYpndc2gzVjEmGoROZD6i/WjTh9314YwNMcDnnFTSiQlzEiSTEFZnVZw9PT25
	vyCZxoErtiBocAcesaxeZ7f0hTcZ/s8w/VEVBEWMFEuvYl94zmkexReeFXK7IZnReMCDVt/LUmRZH
	3DH7mcOaP0iRMnZ3ZllWSUft2UokE1wY5N+xTOnKSYN5G/XvmsKykzpg2OhEBkmhzXnSpplhMGMA7
	wzbKpQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWn0-0000000EZ64-3M1Q;
	Tue, 18 Jun 2024 11:14:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWmw-0000000EZ3m-0Wxo
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jun 2024 11:14:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1CAD860F0A;
	Tue, 18 Jun 2024 11:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718F8C3277B;
	Tue, 18 Jun 2024 11:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718709248;
	bh=gsoN9bsY0Ylo+lc1Cq9XA37iwfd1xzM6Aee7rnvKp+o=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=SLE+3EmFyZIadEXuElCV2DEid0uH63iaCN1BJp6a7K+KfFvX93YdSUyQRGRh0zx4V
	 7TMQYGW2BQqf0qyeEnh+GFmPuoPM1FU62obH73qTMia1l586tTT/yl0oKGchmESrN2
	 7FmMRngDDMzDxp66Qd9/r5hqCGFlgBuCNeWSXGxXVryko3pFOLY4sjbEPOXGqIXvNo
	 +umleYT+raE9mRu6RRTxcICvTOSOlDTXRJLM2Eey1sNbAM/u5iV3rwg31A+a5vqzTF
	 saohvY1NvMiP/onUxUJagWJNbFS/xC4GWOIGoAKKit1Jb+JiBOa6Y8B5BCQ2uenFFa
	 a/ZI8A5pN4D7g==
Date: Tue, 18 Jun 2024 13:14:03 +0200
Message-Id: <D233KUGR81P5.1BJ8JSACE7C6A@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Linus Walleij" <linus.walleij@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: winbond: fix w25q128 regression
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "e9hack" <e9hack@gmail.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240610074809.2180535-1-mwalle@kernel.org>
 <76f8be4e-3050-4ae6-93b4-9524a0689022@linaro.org>
In-Reply-To: <76f8be4e-3050-4ae6-93b4-9524a0689022@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_041410_296078_5E34AAE6 
X-CRM114-Status: GOOD (  25.61  )
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
Content-Type: multipart/mixed; boundary="===============8512290457507981997=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8512290457507981997==
Content-Type: multipart/signed;
 boundary=15a9403428c9151ae6f526bf0d43cad5e1d85be656b58492aa9773431918;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--15a9403428c9151ae6f526bf0d43cad5e1d85be656b58492aa9773431918
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Tudor,

On Tue Jun 18, 2024 at 12:33 PM CEST, Tudor Ambarus wrote:
> On 6/10/24 8:48 AM, Michael Walle wrote:
> > Commit 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
>
> That commit did:
> -       { "w25q128", INFO(0xef4018, 0, 64 * 1024, 256)
> -               NO_SFDP_FLAGS(SECT_4K) },
> +       { "w25q128", INFO(0xef4018, 0, 0, 0)
> +               PARSE_SFDP
> +               FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>
> > removed the flags for non-SFDP devices. It was assumed that it wasn't i=
n
> > use anymore. This turned out to be wrong. Add the no_sfdp_flags as
> > well as the size again.
> >=20
> > Reported-by: e9hack <e9hack@gmail.com>
> > Fixes: 83e824a4a595 ("mtd: spi-nor: Correct flags for Winbond w25q128")
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > Hartmut, Linus, could you please test it on your boards? Also, do
> > you have a real name we should put in the Reported-by tag?
> >=20
> > This will also need a manual backport to the stable kernels due to
> > the new syntax. But that should be straight forward.
> > ---
> >  drivers/mtd/spi-nor/winbond.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbon=
d.c
> > index ca67bf2c46c3..6b6dec6f8faf 100644
> > --- a/drivers/mtd/spi-nor/winbond.c
> > +++ b/drivers/mtd/spi-nor/winbond.c
> > @@ -105,7 +105,9 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
> >  	}, {
> >  		.id =3D SNOR_ID(0xef, 0x40, 0x18),
> >  		.name =3D "w25q128",
> > +		.size =3D SZ_16M,
> >  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
> > +		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>
> and here you add dual and quad to trigger SFDP parsing I guess. All fine
> if the old flash supports dual and quad read. But please update the
> commit message describing the intention. With that ACK. Would be good to
> have this merged soon.

Right. It's not because it will trigger the SFDP parsing, but
because that what was tested by Esben. We're lucky that this will
trigger the SFDP parsing ;) I'll explain that in more detail and add
a Link: to the bug report mail.

-michael

>
> >  	}, {
> >  		.id =3D SNOR_ID(0xef, 0x40, 0x19),
> >  		.name =3D "w25q256",


--15a9403428c9151ae6f526bf0d43cad5e1d85be656b58492aa9773431918
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZnFr/BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hiLAGAg+Khd4RBojemy8adXmvaISa79v2rcf5r
+KI0MNrT8r1TlCYHMwpebvKmTBFAZxS4AX9qoV2l2Cy7D882vKVYJTT58IsH8QtG
jujq6cZWjdcC8gSPaEhSiDBLrl08GY/KRI4=
=UUef
-----END PGP SIGNATURE-----

--15a9403428c9151ae6f526bf0d43cad5e1d85be656b58492aa9773431918--


--===============8512290457507981997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8512290457507981997==--

