Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TBO7K-0004CT-E4
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 10:54:55 +0000
Message-ID: <1347361186.26206.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2] mtd: basic (read only) driver for BCMA serial flash
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, "John W.
 Linville" <linville@tuxdriver.com>
Date: Tue, 11 Sep 2012 13:59:46 +0300
In-Reply-To: <CACna6ryroY=Xbv7+VsRfBYdhRd9P6uz935b9scQqCmTjneM7sQ@mail.gmail.com>
References: <1346699237-414-1-git-send-email-zajec5@gmail.com>
 <1347358840.21359.67.camel@sauron.fi.intel.com>
 <CACna6ryroY=Xbv7+VsRfBYdhRd9P6uz935b9scQqCmTjneM7sQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Z69xBm2NnLBY69x6FIy9"
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


--=-Z69xBm2NnLBY69x6FIy9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-09-11 at 12:35 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> 2012/9/11 Artem Bityutskiy <dedekind1@gmail.com>:
> > On Mon, 2012-09-03 at 21:07 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> This registers MTD driver for serial flash platform device. Right now =
it
> >> supports reading only, writing still has to be implemented.
> >> At this point it's marked as BROKEN, because it requires code present =
in
> >> net tree that wasn't mainlined yet.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> >
> > What are exactly the changes it depends on? URL? Are they staged for
> > 3.7?
>=20
> http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-testing.git=
;a=3Dcommitdiff;h=3D23cb3b2121323443834296a8ecb582b8aeb78d75
> http://git.kernel.org/?p=3Dlinux/kernel/git/linville/wireless-testing.git=
;a=3Dcommitdiff;h=3Dd57ef3a6a2eeb88df47e892c66692e3f59722ffe
>=20
> (Yes, there are queued to be pulled during 3.7 merge window)

CCing John. I am not 100% sure how the net drivers are handled, but if
John does not rebase and just sends a pull request to David Miller, who
also does not rebase, then we could pull John's tree into the MTD tree.

--=20
Best Regards,
Artem Bityutskiy

--=-Z69xBm2NnLBY69x6FIy9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQTxmiAAoJECmIfjd9wqK0Rp8P/1z9QhqM4/adHSIxLkn3z6hV
ZNQDK0YFPnQ5fW4q8R9RJfSw+0RtzQeS1Wi3z+gwSItnjzRjfHlJm9Z6tKn9Sz/7
TU77vuA9g9OlinDB9n7Tk5aClk2Tp25b9x+P/nD11z8Zz7Q8wBxI7NIXQ9b7nXfH
CECULRu0/yabt8uuVxETVTxz/Bjn+SxHCJuTsxBMLB1Ky0Ym540KpWRbkHMnY6I5
rKwbnPKJxHr/8hcTa533aMum3nvGrjzU0Fgl8hQBB7XiEgiED2tL1Mu63VYhiW1P
2b185Pr29QVNQuSpUgITHWHzS6QGhp4gfcjsx2wJaL1CuKRm6EtZwDrRt0PlXnnR
2K0etHAFRGBvDUXguUc5S99NsBGL9v0G6a4UqpfffU46uRbaXeeLIwVlEIGIaFFk
d/uQNE6vcU9fO3+jTj1XN44l//tCif5W6oZgm2y71CXaAvwjz6lBr06/mPLjnO/6
qCduwX55dz2Yw0SGprWD+mg+OyMk4cWRRIcHCPdinRXRTIi7Qlc0MqckpH8AcxVF
abYQQ7iy21UTI8zILRcYpL1VuGTYqgRYQz9Utul9CHF9Ak1I/0V5/LBQgXnbWG2X
9qdXvtkr8bscJAdHG6zMd3sRBnIy1VCi8QrcLGMcaztF4zGPhnK10CPA8qRo6Vcj
XYk59TWZXFS0KAbtQ8AM
=XV4H
-----END PGP SIGNATURE-----

--=-Z69xBm2NnLBY69x6FIy9--
