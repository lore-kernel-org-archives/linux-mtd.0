Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7Isf-0002wr-UF
 for linux-mtd@lists.infradead.org; Fri, 11 Dec 2015 08:16:47 +0000
Date: Fri, 11 Dec 2015 09:16:20 +0100
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: support JEDEC additional redundant parameter
 pages
Message-ID: <20151211081620.GE28188@kwain>
References: <1449268528-18154-1-git-send-email-antoine.tenart@free-electrons.com>
 <20151210202052.GJ144338@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OfrWf2Fun5Ae4m0Y"
Content-Disposition: inline
In-Reply-To: <20151210202052.GJ144338@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--OfrWf2Fun5Ae4m0Y
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Brian,

On Thu, Dec 10, 2015 at 12:20:52PM -0800, Brian Norris wrote:
> On Fri, Dec 04, 2015 at 11:35:28PM +0100, Antoine Tenart wrote:
> > The JEDEC standard defines the JEDEC parameter page data structure.
> > One page plus two redundant pages are always there, in bits 0-1535.
> > Additionnal redundant parameter pages can be stored at bits 1536+.
> > Add support to read these pages.
> >=20
> > The first 3 JEDEC parameter pages are always checked, and if none
> > is valid we try to read additional redundant pages following the
> > standard definition: we continue while at least two of the four bytes
> > of the parameter page signature match (stored in the first dword).
> >=20
> > There is no limit to the number of additional redundant parameter
> > page.
>=20
> Hmm, do we really want this to be unbounded? What if (for example) a
> driver is buggy and has some kind of wraparound, so that it keeps
> returning the same parameter page (or a sequence of a few pages)?

I would say buggy drivers need to be fixed. It's complicated to handle
all possible bugs a driver may have in the common code.

If you prefer we can put a limit to the tries the code make, but this
can also impact working drivers by not trying enough. I'm open to
suggestions.

> Also, is this actually solving any real problem? Have you seen flash
> that have more than the first 3 parameter pages? Have you tested
> this beyond the first 3?

This does not solve any real world problem I had. I had to look at the
JEDEC standard and I made this in order to test something. So I thought
this could be useful to others, as the current code does not fully
implement the standard.

> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> > ---
> >  drivers/mtd/nand/nand_base.c | 44 ++++++++++++++++++++++++++++++++++--=
--------
> >  1 file changed, 34 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> > index cc74142938b0..31f4a6585703 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -3392,6 +3392,32 @@ static int nand_flash_detect_onfi(struct mtd_inf=
o *mtd, struct nand_chip *chip,
> >  	return 1;
> >  }
> > =20
> > +static int nand_flash_jedec_read_param(struct mtd_info *mtd,
> > +				       struct nand_chip *chip,
> > +				       struct nand_jedec_params *p)
> > +{
> > +	int i, match =3D 0;
> > +	char sig[4] =3D "JESD";
>=20
> sparse likes to complain about this:
>=20
> drivers/mtd/nand/nand_base.c:3400:23: warning: too long initializer-strin=
g for array of char(no space for nul char) [sparse]
>=20
> I'm not sure it has a real effect (though I haven't checked the C spec
> for what happens here), because we're not really using it like a
> 0-terminated string, but perhaps we can do something small to squash it?
> e.g., don't specify the [4], and just do this?
>=20
> 	char sig[] =3D "JESD";

Sure.

> > +
> > +	for (i =3D 0; i < sizeof(*p); i++)
> > +		((uint8_t *)p)[i] =3D chip->read_byte(mtd);
> > +
> > +	for (i =3D 0; i < 4; i++)
>=20
> Maybe s/4/ARRAY_SIZE(p->sig)/ ?

Yes, that's better.

> Also could use a comment either here or above
> nand_flash_jedec_read_param() as to what the match criteria are.

Good idea.

> > +		if (p->sig[i] =3D=3D sig[i])
> > +			match++;
> > +
> > +	if (match < 2) {
> > +		pr_warn("Invalid JEDEC page\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) =3D=3D
> > +			le16_to_cpu(p->crc))
> > +		return 0;
> > +
> > +	return -EAGAIN;
> > +}
> > +
> >  /*
> >   * Check if the NAND chip is JEDEC compliant, returns 1 if it is, 0 ot=
herwise.
> >   */
> > @@ -3400,8 +3426,7 @@ static int nand_flash_detect_jedec(struct mtd_inf=
o *mtd, struct nand_chip *chip,
> >  {
> >  	struct nand_jedec_params *p =3D &chip->jedec_params;
> >  	struct jedec_ecc_info *ecc;
> > -	int val;
> > -	int i, j;
> > +	int val, i, ret =3D 0;
> > =20
> >  	/* Try JEDEC for unknown chip or LP */
> >  	chip->cmdfunc(mtd, NAND_CMD_READID, 0x40, -1);
> > @@ -3411,16 +3436,15 @@ static int nand_flash_detect_jedec(struct mtd_i=
nfo *mtd, struct nand_chip *chip,
> >  		return 0;
> > =20
> >  	chip->cmdfunc(mtd, NAND_CMD_PARAM, 0x40, -1);
> > -	for (i =3D 0; i < 3; i++) {
> > -		for (j =3D 0; j < sizeof(*p); j++)
> > -			((uint8_t *)p)[j] =3D chip->read_byte(mtd);
> > -
> > -		if (onfi_crc16(ONFI_CRC_BASE, (uint8_t *)p, 510) =3D=3D
> > -				le16_to_cpu(p->crc))
> > +	for (i =3D 0; i < 3; i++)
> > +		if (!nand_flash_jedec_read_param(mtd, chip, p))
> >  			break;
> > -	}
> > =20
> > -	if (i =3D=3D 3) {
> > +	/* Try reading additional parameter pages */
> > +	if (i =3D=3D 3)
> > +		while ((ret =3D nand_flash_jedec_read_param(mtd, chip, p)) =3D=3D
> > +				-EAGAIN);
>=20
> This loop has a few problems aesthetically and functionally. As
> mentioned before, the unbounded loop is not very nice. I would suggest
> at least putting some kind of bound to it. Also, it's probably best not
> to try so hard to cram everything into one "line". And for a rare
> change, I agree with checkpatch.pl:
>=20
> ERROR:TRAILING_STATEMENTS: trailing statements should be on next line
> #89: FILE: drivers/mtd/nand/nand_base.c:3445:
> +               while ((ret =3D nand_flash_jedec_read_param(mtd, chip, p)=
) =3D=3D
> +                               -EAGAIN);
>=20
> In this case, I think it's saying the empty statement (;) should be on a =
new
> line.
>=20
> So, it could more clearly be something like:
>=20
> 	if (i =3D=3D 3) {
> 		do {
> 			ret =3D nand_flash_jedec_read_param(mtd, chip, p);
> 		} while (ret =3D=3D -EAGAIN);
> 	}

I agree, this is easier to read.

Thanks for the review!

Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--OfrWf2Fun5Ae4m0Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWaoZQAAoJEFxNi8it27zYOhYQAIZbUMLaL32LOFXovQEZ90tw
mjirDILhuHR8j6eNkClQPtbUCgwynJHpCG0iJGxFaCLmrjVAENBuN7j1Xb/h/MEu
S5oeBqKzIuXGSYGjEM1Z31w/REsVv3SwQkaEYDY+6BFV/jeM38L16zySZu54xW4k
VvgitkK0YngNQwEcGVpv16/ftuDJyv+YWxRnW4zX32HVG03bgqHX/rBgr9PUNpYb
VAs3k2tYnHRG65Zg6XY0em6A9OyKxZufotfAzPm6STCdiS1fuP70ZOb0vkT75iT1
A720+ZivpDD+ijAUVuBi2ZBOqfogfLt8sKNcZauZHzmWMgGkDq+/2vYLNiH/EZbt
8J25H233XKarD4cuYKXZ/JCN83Guu8r6tameEGCPeGmIIM1NSE0jdkpN6FofIyHu
YVYpXOFbKj2tpewhJGOX7gbAS6hGjQHvH+QE2jZWrxW7iWuRLv3vZm4sLvKbHQzi
4YoGFHOQKXPd9WkcXq6y1KgN05gk4omMMwr7EIGU7JcBuUMuV2Gl3EK3Rw0qY1Bk
mre2Vcom3ugArR0ZETwaJRVca0mxv9AeopQsm9ig8Ph1/m/nDDiODanFEOQ+sMki
YoZL7Glv6b2PsZsk87Ut7ZFyTXTi7DIUeqS+uBlYoCfDEZxnJnG0XzFWpLb1I9P/
T9L9R8zjW/FxcfYRklaT
=e5xE
-----END PGP SIGNATURE-----

--OfrWf2Fun5Ae4m0Y--
