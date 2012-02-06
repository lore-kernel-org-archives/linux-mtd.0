Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RuKaZ-0000L4-Cu
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2012 09:10:19 +0000
Received: by iafj26 with SMTP id j26so9775145iaf.36
 for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2012 01:10:18 -0800 (PST)
Message-ID: <1328519540.22240.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] mtd: remove R/O checking duplication
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Mon, 06 Feb 2012 11:12:20 +0200
In-Reply-To: <20120205103321.0a7e2e1c@pixies.home.jungo.com>
References: <1328288491-8744-1-git-send-email-dedekind1@gmail.com>
 <1328288491-8744-4-git-send-email-dedekind1@gmail.com>
 <20120205103321.0a7e2e1c@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-OQ4MHkCG0x5jWIUCAXiS"
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-OQ4MHkCG0x5jWIUCAXiS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-02-05 at 10:33 +0200, Shmulik Ladkani wrote:
> On Fri,  3 Feb 2012 19:01:31 +0200 Artem Bityutskiy <dedekind1@gmail.com>=
 wrote:
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 13bd4fa..78e1df6 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -754,7 +756,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size=
_t len, size_t *retlen,
> >  	      const u_char *buf)
> >  {
> >  	*retlen =3D 0;
> > -	if (!mtd->_write)
> > +	if (!mtd->_write || !(mtd->flags & MTD_WRITEABLE))
> >  		return -EROFS;
> >  	if (to < 0 || to > mtd->size || len > mtd->size - to)
> >  		return -EINVAL;
>=20
> (sorry for nit-picking)

No need to sorry, you are very welcome - I am happy when people spot
issues before patches get merged.

> Here you perform "writable" (EROFS) validation prior offset/length
> validation (EINVAL) - however in other API funtions you had it
> vice-versa.
> Really not that important, but better if handling is consistent.

I think this is rather important to first validate the input parameters
and then check for R/O. I've done this in other functions, but failed to
do in 'mtd_write()'. Fixed in l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-OQ4MHkCG0x5jWIUCAXiS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPL5l0AAoJECmIfjd9wqK0OosQAMcRqY5mCH8SutdbGVnx6EBe
wXWpcZbeuXkGrk9eubzIbLR1bfuifvX7JgsKjhpfCEx0HnwMLPvxVSgPGWzPe2EZ
WyVsvvI0uomUXNmWzTFtC9k9NaAjgzfap284v+UQWu8xwbJH11+xMO0JVl0PKuVq
f2mzK+/VeShETrAV6vg/RK5jfgCCrhq1eaB9hTqNwcfLz1A9F4CXhUtiC2lysh4U
lrUTj6/YUoRLKkIWnPox/39oapNUpYWq13b0jNhcyyZcJoff29J2IJoAtu+DVQcU
eyq2GTm+A9IVgXcwq7E/kS7uewDZfYVUyXTha04UqL56XjqYGEH3wFICDZCF/1YN
nbKCnQhAl7yTRlnI/nZGUgBFrb0vwjoFutHVlOewaUDH0mypQKrdrI5Ol3jLfqb3
wSYb7rGG3dtMSKrjcjbFuHsN/eKq2+WzeVBmYTELKV1FRR4t4DzBvkY5QPqU8ChF
1/LzZRGTP2ylKKJcxu4Pzl20P1Jqllc8EaDqgSorhitVug7vxL03oxm17y27s3QE
Y37ItWTjUrwLmzHGbzP275dsriAUt1CCuM703/1+j754GYMEfDICNvSBsq4caRzo
62R+vlhc3ZvCQys3jfDL01i4iULf2C4weD1z4RmBuo8nDFcAJBZXGXn8VKPBlvKC
sONPo3tPUtrPd7eJ9ir5
=iNHK
-----END PGP SIGNATURE-----

--=-OQ4MHkCG0x5jWIUCAXiS--
