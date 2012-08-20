Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3XQV-0005VE-Qy
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 19:14:16 +0000
Received: by bkcji2 with SMTP id ji2so2308716bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 12:14:14 -0700 (PDT)
Message-ID: <1345490051.1789.5.camel@kyv>
Subject: Re: another issue with ubifs on v3.6-rc2: attaching an formatted
 device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 20 Aug 2012 22:14:11 +0300
In-Reply-To: <1345489867.1789.3.camel@kyv>
References: <20120820160750.GS2232@pengutronix.de>
 <1345489867.1789.3.camel@kyv>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-U3/AIEqkvO2KbBM7K0lG"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-U3/AIEqkvO2KbBM7K0lG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 22:11 +0300, Artem Bityutskiy wrote:
> On Mon, 2012-08-20 at 18:07 +0200, Uwe Kleine-K=C3=B6nig wrote:
> > [  163.714143] uncorrectable error :=20
> > [  163.727597] UBI warning: ubi_io_read: error -74 (ECC error) while
> > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > [  163.740737] uncorrectable error :=20
> > [  163.744032] UBI warning: ubi_io_read: error -74 (ECC error) while
> > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > [  163.757119] uncorrectable error :=20
> > [  163.760487] UBI warning: ubi_io_read: error -74 (ECC error) while
> > reading 64 bytes from PEB 0:0, read only 64 bytes, retry
> > [  163.774427] uncorrectable error :=20
> > [  163.777808] UBI error: ubi_io_read: error -74 (ECC error) while
> > reading 64 bytes from PEB 0:0, read 64 bytes=20
>=20
> This looks like your flash does not really support sub-pages while
> declares that it does. Check it with MTD subpage test.

Take a look at this patch in the l2-mtd.git tree:

http://git.infradead.org/users/dedekind/l2-mtd.git/commit/a1256b0e087ed3cdb=
584c683acb966ee885f733c

I am not sure, but probably you need it.

--=20
Best Regards,
Artem Bityutskiy

--=-U3/AIEqkvO2KbBM7K0lG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMoyDAAoJECmIfjd9wqK0t8EP/3M118QlswRBxZl3Xj+24c61
lsXll7P92Uxb4eKqLStaF1+ehACu9yUgJ43mly7nPYsTXyVqHWpR5j/cIUIH8ELS
R2jwAiowSQlfxWU32D+oZKys8b7fBo9XToyi40zGGd8EXA8FlzLw474e+yRIvfXY
kwf26Ar80nDHEo7mP7qu4G+2KuCdBO0f8s2A7eiv1IDAxujYaCtVrR475hud0yOu
5Ydm9PO4//8VbIDR63ewCVNVjTF5UBgQTOiRZabHfEmfPOXgXDz0+isbp8PulI0d
0tPl+7xiMT6WKlcyFLk1MvH6ASwwI0wHUk/ukeOR/9qPLbCqgH6OQocAtCknnR+z
e2j8hG83F8rFMpKSNeM1zc9qqq9mu02j8/95sitkm+8DLFd1CpdiyrU9XJVSZYX5
IhQGXcdcTeDVcNh114MbRPwY4Sw+XA4vM0yqP40XAl5ztgR20yGlVDcN8jIDCLK0
PmdNUG3duj6VjmQ7kymI2NNhWvbpfEqRC0KqXrI3YnlttWXKmRqZgOXCMdyEZRNO
YycxeDOeZHesPky9cb29cga0JkRbJQ5DHE807cS6dTNSZJkBOmRNw2E/sDcQz2gv
RvnI+FBEKR5EUr4SUlXSUz6d6cqdxiIqLtCYzxlDyQd4QJzfaRg2QDNuIF3mpIHd
d8iNHGEc2B1kRWqjKQS9
=Vsij
-----END PGP SIGNATURE-----

--=-U3/AIEqkvO2KbBM7K0lG--
