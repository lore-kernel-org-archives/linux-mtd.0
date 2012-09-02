Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T87rK-0001MT-8Y
 for linux-mtd@lists.infradead.org; Sun, 02 Sep 2012 10:56:54 +0000
Received: by bkcji2 with SMTP id ji2so1901058bkc.36
 for <linux-mtd@lists.infradead.org>; Sun, 02 Sep 2012 03:56:52 -0700 (PDT)
Message-ID: <1346583402.2533.0.camel@kyv>
Subject: Re: [PATCH v2] mtd: cmdlinepart: fix the wrong check condition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Sun, 02 Sep 2012 13:56:42 +0300
In-Reply-To: <20120825123149.3fafa4f4@halley>
References: <1345925210-7500-1-git-send-email-shijie8@gmail.com>
 <20120825123149.3fafa4f4@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-niE4XSr/wd3DpTfSm0GM"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-niE4XSr/wd3DpTfSm0GM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-08-25 at 12:31 +0300, Shmulik Ladkani wrote:
> Hi Huang, Artem,
>=20
> On Sat, 25 Aug 2012 16:06:50 -0400 Huang Shijie <shijie8@gmail.com> wrote=
:
> > diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> > index fc960a3..216d751 100644
> > --- a/drivers/mtd/cmdlinepart.c
> > +++ b/drivers/mtd/cmdlinepart.c
> > @@ -322,13 +322,16 @@ static int parse_cmdline_partitions(struct mtd_in=
fo *master,
> >  	struct cmdline_mtd_partition *part;
> >  	const char *mtd_id =3D master->name;
> > =20
> > +	if (!mtd_id)
> > +		return 0;
> > +
> >  	/* parse command line */
> >  	if (!cmdline_parsed)
> >  		mtdpart_setup_real(cmdline);
> > =20
> >  	for(part =3D partitions; part; part =3D part->next)
> >  	{
> > -		if ((!mtd_id) || (!strcmp(part->mtd_id, mtd_id)))
> > +		if (!strcmp(part->mtd_id, mtd_id))
> >  		{
> >  			for(i =3D 0, offset =3D 0; i < part->num_parts; i++)
> >  			{
>=20
> This changes the behavior of cmdling parsing, which might affect users
> expecting the old behavior.

Yes, you are right, we should not change the mtd_id hack unless we have
checked all the users.

--=20
Best Regards,
Artem Bityutskiy

--=-niE4XSr/wd3DpTfSm0GM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQQztqAAoJECmIfjd9wqK0cXAP/RPAlDfd0QC78pPLJU1dgdwW
u0BTPkstvX81tH8i0ooTyCBAhJe3GroC/vHnPAnVX/tM1VFhr26AQf47BEqOhU5d
g39Ie56ASQL0hua3tJZ5eA/FBbNDbnr1SfUH9LE8X4SuHCzEgIwyTe1G/QKsTP5t
GuWM7H/XT23pJvrZPh2F3qBIxe/RjKPfcqCXUyKkS53S7DpHzwiVGiNYfcJNOars
Mc2P3OlZ3B0C987l1EZnEDfuU/S5LcaEDzPqRp+qJ4vwq6Yy6P0TQm/bvFKJftnr
5IdYnRiv7kg1i/rzDQCnRNXSQaw62rRq7ZJc9HjWXo18bGexJd1wOR5KEmVC/m3p
YdjCVueL9oV9JXQ3WdxU448AmfGR5XmlqFTgSwV/0NfY8YZRqeW7I65a0cwrJU22
g+/bsFxNuXmYK13y8t0nJ8sSncPSXSlko/DFlWOoSFFjCNOsAuJx+SxpXbzJ2m/o
+/x0h5vSU5UP5wZ90Y52pG5T5OCND493JH2egjcqR4GxxSUOpIxViCDRk9Xguorq
MqZ6MLa4WSe1u/mY4QM27LwA4U/jK/3WNncu+d+f2ozJ1Quz8+TQjJfH/ruND6sP
z4gPknEsZbLFlwJBaslMnoWtY4SBVsmDk4sic5fJGpKpC0k50hW/t3iysRdjfVK+
BNLKLkbqPQDMXHrX6cnR
=3DyH
-----END PGP SIGNATURE-----

--=-niE4XSr/wd3DpTfSm0GM--
