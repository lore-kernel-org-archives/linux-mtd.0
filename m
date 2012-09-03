Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8Xij-0004un-8I
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 14:33:45 +0000
Message-ID: <1346683117.3061.61.camel@sauron.fi.intel.com>
Subject: RE: TR: Notification d'envoi de fichier via http://dl.free.fr
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Fabien Comte <fabien.comte@ercogener.com>
Date: Mon, 03 Sep 2012 17:38:37 +0300
In-Reply-To: <001d01cd89de$84659fd0$8d30df70$@ercogener.com>
References: <20120831133153.764EC3495D9@dl.free.fr>
 <003d01cd877e$39b71020$ad253060$@ercogener.com>
 <1346671221.3061.42.camel@sauron.fi.intel.com>
 <1346673285.3061.46.camel@sauron.fi.intel.com>
 <001d01cd89de$84659fd0$8d30df70$@ercogener.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-B6rLkH7IxkdZu2ByMYd5"
Mime-Version: 1.0
Cc: 'linux-mtd' <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-B6rLkH7IxkdZu2ByMYd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 16:15 +0200, Fabien Comte wrote:
> Hello,
>=20
> 3.0, are you sure ?
> http://git.infradead.org/users/dedekind/ubifs-v3.0.git
> http://git.infradead.org/users/dedekind/ubifs-v3.5.git -> for 3.5 kernels=
, isn't it ?

Well, here is my logic.

You say that if you create an UBIFS image in v3.0, then try to mount it
in v3.4 - it fails, while it still mounts in 3.0. Correct?

Then, if you take the ubifs-v3.0.git tree, which contains v3.0 + all the
UBI/UBIFS patches, and try to mount your image, I expect it will also
fail.

If so, you will have the kernel which:

1. Works at the 'v3.0' point.
2. Fails at the 'HEAD' point.

Then you should be able to find out which commit is guilty using 'git
bisect'. Something like:

$ git bisect start
$ git bisect bad HEAD
$ git bisect good v3.0

If you manage to find the offending commit, fixing the issue should be
relatively easy, I think (and hope).

Makes sense?

--=20
Best Regards,
Artem Bityutskiy

--=-B6rLkH7IxkdZu2ByMYd5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRMDtAAoJECmIfjd9wqK0THMP/AxA7ked0c3QO9EoYUk3Wajp
Eh7q83dXbyipl0yxaTfZpA2y38HBppyH2titXYulKYAg1QPRXrfX6b1dBa20Dt7k
Yq/Rj1hxhsvDM4H9O7KKKela897TM8dZrAWi4C+1B8z1pREz5aM8tdKJ/bovvzxt
AU8Ne3RsYjNU+SPafLyzPv5eOddXmgUDknObicnu8Y+PNNFNUb5y2uIjNiv5F0H4
OU3kWxFK4kR7e/6JADl8iFzeXZJ0LgmrC3yeGf54hCoIjk2xAwOowICemwoCCu8n
7/Mkh8y23vuoN1XqCXzq0bVG+Hst2UoY+IqUsunxc5T6niCgllzaxDXKP1kcIv9s
bLSGyOFxBb/wQZ7KGdVV1XknRxE2febNLsok2RcbpxZqVB5c4V/0KJ3eFADv4I1G
6beahQw4eJHSygQqyV4lasx6fsvLRbL5ggynI+80s6CMDZNy261ww2vooEnqK20l
d4PTu99gOXs1eWGrUoB+G3eU7JW+d74cbzkgGjtHD/uk+MNmVfjshAK+SBeulRMl
lrrPIGQWwdp8v5QDagD8ztStuAY/ebsdvW5eE9RD4kzVfOBYUR5tdZwjESZ+ifcl
NqBQDgKtL06aiSFG1zbB07uJtuwN+xlHa5dCNunJ/twaPn1oaO75UoSj6KCcsFIB
KCiBnjArRgHkaiuwCRpR
=Lthf
-----END PGP SIGNATURE-----

--=-B6rLkH7IxkdZu2ByMYd5--
