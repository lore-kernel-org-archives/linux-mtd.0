Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fgNTI-0007Y9-CG
 for linux-mtd@lists.infradead.org; Fri, 20 Jul 2018 04:56:54 +0000
Date: Fri, 20 Jul 2018 14:56:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: jz4740: Use the proper format specifier
 to print chipnr
Message-ID: <20180720145628.6cd61fc6@canb.auug.org.au>
In-Reply-To: <20180719231156.2d3c53ee@xps13>
References: <20180719073720.19887-1-boris.brezillon@bootlin.com>
 <20180719231156.2d3c53ee@xps13>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YA8+jbXwrnrGHK2/CrntqWW"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/YA8+jbXwrnrGHK2/CrntqWW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 19 Jul 2018 23:11:56 +0200 Miquel Raynal <miquel.raynal@bootlin.com=
> wrote:
>
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
> 09:37:20 +0200:
>=20
> > In jz_nand_detect_bank(), chipnr is a size_t argument. Use %zu instead
> > of %i when printing it.
> >=20
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/jz4740_nand.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/nand/raw/jz4740_nand.c b/drivers/mtd/nand/raw/=
jz4740_nand.c
> > index 1f7aff04ad8a..9bb8a89e09f9 100644
> > --- a/drivers/mtd/nand/raw/jz4740_nand.c
> > +++ b/drivers/mtd/nand/raw/jz4740_nand.c
> > @@ -355,7 +355,7 @@ static int jz_nand_detect_bank(struct platform_devi=
ce *pdev,
> >  		mtd->size +=3D chip->chipsize;
> >  	}
> > =20
> > -	dev_info(&pdev->dev, "Found chip %i on bank %i\n", chipnr, bank);
> > +	dev_info(&pdev->dev, "Found chip %zu on bank %i\n", chipnr, bank);
> >  	return 0;
> > =20
> >  notfound_id: =20
>=20
> Applied to nand/next.

It might be a better fix to ask why chipnr is a size_t at all ... it is
only used as an index, so should probably be int ...

--=20
Cheers,
Stephen Rothwell

--Sig_/YA8+jbXwrnrGHK2/CrntqWW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltRa3wACgkQAVBC80lX
0Gx14gf8CvNBFhBeD7ON3kAZhdKF/5fVggfCX1Sbr7X7Af+Q5mdgxLrZoeJqlL1+
4AU9//5C+78iJKDTYTCBOFTJRQ4v+4WjBWYEuXx1lzQ9pfqDgk2AAtxm3RxgS4XY
h7sh0XQYrQ1ss4oMy2FINAULTJjcskqpbJdO0F6xa0daGOqFEhgeJ+I7K8D7Ug0B
E74Lonc1ifoSUI2bOKfzsUyV6CnVxZngd3UA3igH/GO9Qk03mHc7pjd4IQdxUq0f
oQw15qDxIACL4E92vJ2gVdFeucm/11wHLJ5wgbAz18fSWJZm7Tz9U/XQwDvxw5Hi
lZEcwhmfeF8Y3GWeYBYIo3sarMZNYA==
=yc6B
-----END PGP SIGNATURE-----

--Sig_/YA8+jbXwrnrGHK2/CrntqWW--
