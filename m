Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ScE4W-0005ti-UR
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 11:06:41 +0000
Message-ID: <1338981027.6875.45.camel@sauron.fi.intel.com>
Subject: Re: ubi debugfs possible regression
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Parsons <lost.distance@yahoo.com>
Date: Wed, 06 Jun 2012 14:10:27 +0300
In-Reply-To: <1338979723.6875.34.camel@sauron.fi.intel.com>
References: <1338943789.75555.YahooMailClassic@web29010.mail.ird.yahoo.com>
 <1338979723.6875.34.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QdCYmaX+mobwOU8jTgQ8"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, adrian.hunter@intel.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QdCYmaX+mobwOU8jTgQ8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 13:48 +0300, Artem Bityutskiy wrote:
> On Wed, 2012-06-06 at 01:49 +0100, Paul Parsons wrote:
> > In v3.4, ubi worked OK without debugfs.
> >=20
> > In v3.5-rc1, ubi fails without debugfs:
> >=20
> > UBI error: ubi_debugfs_init: cannot create "ubi" debugfs directory, err=
or -19
> > UBI error: ubi_init: UBI error: cannot initialize UBI, error -19
> >=20
> > Is this not a regression?
>=20
> It is, I'll look at this.

Can you please send me your .config file - I cannot easily disable
debugfs - it is enabled/required by so many things.

--=20
Best Regards,
Artem Bityutskiy

--=-QdCYmaX+mobwOU8jTgQ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPzzqjAAoJECmIfjd9wqK0hYwP/j/Za7/GiMoYPeV0hptcgeO9
OTQr6iMIkerONRHiShWWocQFwOuDBf2PNAB8jw+BUoR8zHuBogvxBNtYshiPxA4C
Ow1otM/5jEdlD+oEzwSW3UacgzaV8Urv3szN7x1wPuYuumOaKIeBh559RyYptRQh
4e66YY3n4jF0MkE8dlLScruMTjnT7xzS62hjcO5QTcxA0QCqB3cAnqjRvPj5SsJm
wpLHxvY/4d7BrTDvprCq0HEgJ+yYDIth7T5oPddRQzNz708YJwj16VgVsdiwsK9x
fy+lFEYpwQQ7fv1/WvWz88Rkmu4gaYZNibr95E3AutMD2XKruAKvi3ulNkf/zFV+
n+MmBVMYYQQ/cCxOTzRhnx6GVTR5IZWczQHr2lKPPCwdrhvpfiWMuPdr3Fa03KEt
TsojeczmlPS6iFMflfm4U7IIu+oPgubGfNWhACL2qhSXEUDnqo1KzueURIMKICQD
FatFV/a1i1USIBPUXdOcZlvXNws8DcRHzhwypyf4BA4M9lefWaiaTab/JWuCyfQW
HL7ViJ3mxphC0ynuzmSlmmVeomCE/0Q5uJhkuN/h8NQEnCVmAxnJNwKXLtuSyv9R
YqithCRJfKVM82KrJssXOyzjpsSDFtXqRkuvf+kyMKvImqri93hA/+jX+cFFTlqm
VihIjWul1GIln7mOfiK6
=rdOn
-----END PGP SIGNATURE-----

--=-QdCYmaX+mobwOU8jTgQ8--
