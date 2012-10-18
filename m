Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TOkkt-0002mK-IF
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2012 07:43:00 +0000
Message-ID: <1350546197.5769.297.camel@sauron.fi.intel.com>
Subject: Re: GPMI NAND crashes with UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Thu, 18 Oct 2012 10:43:17 +0300
In-Reply-To: <CALF0-+W0SqnxBVaTHjpjTzdw-fJoQ1qHBY8u3-rMcZ6wwc7z3w@mail.gmail.com>
References: <201210050345.49507.marex@denx.de>
 <201210111355.33836.marex@denx.de>
 <1350479529.5769.155.camel@sauron.fi.intel.com>
 <201210171516.55693.marex@denx.de>
 <1350480112.5769.160.camel@sauron.fi.intel.com>
 <CALF0-+W0SqnxBVaTHjpjTzdw-fJoQ1qHBY8u3-rMcZ6wwc7z3w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-+ZrRk6yNsA7Maj4T2Xwv"
Mime-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Fabio Estevam <fabio.estevam@freescale.com>,
 linux-mtd@lists.infradead.org, Huang Shijie <b32955@freescale.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-+ZrRk6yNsA7Maj4T2Xwv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-17 at 15:28 -0300, Ezequiel Garcia wrote:
> On Wed, Oct 17, 2012 at 10:21 AM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
> > On Wed, 2012-10-17 at 15:16 +0200, Marek Vasut wrote:
> >> Ok, I'll re-check. Though I suspect this problem disappeared with the
> >> recently
> >> applied UBI patches.
> >
> > No, you ask UBIFS to emulate a power cut, so it switched to R/O mode at
> > a random point. It printed scary error messages, which are normal
> > because an I/O operation failed. Then integck reported you the error an=
d
> > stopped.
> >
> > All expected.
> >
> > If you use -p integck option you will just make integck _not_ fail when
> > the file-system suddenly becomes R/O, integck will just unmount it,
> > mount back, remove all its data, and start over. Then you'll get anothe=
r
> > emulated power cut, and so on.
> >
> > Ideally this should never stop. The idea is to test that UBIFS can moun=
t
> > the file-system in case of a power cut.
> >
> > If there is a problem, integck should die.
> >
> > To just stress-test your driver you do not need power-cut emulation.
> >
>=20
> Is this expected behavior documented somewhere?

Sorry, no. I do not mind if someone sends a patch for mtd-www.git with
some docs WRT power-cut emulation stuff.

--=20
Best Regards,
Artem Bityutskiy

--=-+ZrRk6yNsA7Maj4T2Xwv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQf7MVAAoJECmIfjd9wqK0SLgP/2b1+xyL+wC4R/iMYZqO4fy6
kcGEO9hgPx0PcTmkn/SSXEmBaQBlCX4quCwcURpV+HCWD3l2gap2W2AxzxQtXI7N
UDWzt/uOw8PpaiMNRq4j+TCviRKdR9ylQKJPsxbwtnrFMvRVMvGBKWvFmBBFtkh2
gFSVVJ0lX0hSMS53DoQz/9nbFYfFe1eogqFf8zencbKpOWlvJ9wS347WShW0C8vj
SpGWRSzONuO+0Ip3NMrCjsgsGqCYl3KMzKXiH2sSdgfaaqeUSrF9mYLvfF15ucXH
6nNFHkURkCmyqezI58tEELrq/g5nxaL9xoPqtbpahc2W5S8+uaN+3ZU187h8bnbJ
AtjMeaktxsHyPEVtGpK9+Bst1o5YGWl482ob49iZj/EbODuJVn3oyBbEFpYIUW3b
tMkAgcJWmZDL5Pi5s4O+PB0WSWpeqxICJMDfGy8s5waGNB3tkI/WxwREJEjLetK4
v+C/YlGCn8azZ8/xUsdrSR+LLJS/7zJNiBV58CsQW0wbnhU8RpcNCIALufZZEUxw
0QpQPMZ7BVg6pkxtjr+9eDAHXjA18E1sn1xKaIB4lNzxiFyTc1RQrurFna8s2cXO
odKh0jX++C+kAzBw71DWFD3O3OI8s+kSwwDtkHG9CrUrUoTLGZVzNd9om/BV3D5j
jyQ4B6xzKNEQt498LHu6
=wcQ0
-----END PGP SIGNATURE-----

--=-+ZrRk6yNsA7Maj4T2Xwv--
