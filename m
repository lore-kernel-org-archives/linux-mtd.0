Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSpvc-0007dB-9U
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 13:30:41 +0000
Message-ID: <1336743245.2625.71.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/2] mtd: nand: check the return code of
 'read_oob/read_oob_raw'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 11 May 2012 16:34:05 +0300
In-Reply-To: <20120511155424.7e7c5666@halley>
References: <20120509130635.32973038@pixies.home.jungo.com>
 <20120509131334.2d0b7160@pixies.home.jungo.com>
 <1336736891.2625.49.camel@sauron.fi.intel.com>
 <20120511155424.7e7c5666@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-qUzl8Wq215GvJ/FogeDg"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-qUzl8Wq215GvJ/FogeDg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-11 at 15:54 +0300, Shmulik Ladkani wrote:
> Hi Artem,
>=20
> On Fri, 11 May 2012 14:48:11 +0300 Artem Bityutskiy <dedekind1@gmail.com>=
 wrote:
> > On Wed, 2012-05-09 at 13:13 +0300, Shmulik Ladkani wrote:
> > > @@ -1826,9 +1827,12 @@ static int nand_do_read_oob(struct mtd_info *m=
td, loff_t from,
> > > =20
> > >  	while (1) {
> > >  		if (ops->mode =3D=3D MTD_OPS_RAW)
> > > -			chip->ecc.read_oob_raw(mtd, chip, page);
> > > +			ret =3D chip->ecc.read_oob_raw(mtd, chip, page);
> > >  		else
> > > -			chip->ecc.read_oob(mtd, chip, page);
> > > +			ret =3D chip->ecc.read_oob(mtd, chip, page);
> > > +
> > > +		if (ret < 0)
> > > +			break;
> >=20
> > For page reading the convention is that we keep reading and try to read
> > everything anyway, I guess it is reasonable thing to do for OOB as well=
?
>=20
> AFAIU, we actually _stop_ reading upon 'ecc.read_page()' error.
> And 'ops->retlen' is updated to reflect actual bytes sucessfully read.

Yes, you are right. It should keep reading in case of an ECC error, not
in case of any error.

--=20
Best Regards,
Artem Bityutskiy

--=-qUzl8Wq215GvJ/FogeDg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrRVNAAoJECmIfjd9wqK0LI8QAKp0MjB1Dzfww5jagq1Vx7Vp
7EZMy5ILha3EB53NDBihHgS6eMcSeHGzf6ojN2V1O+MgiiFerhZVI6OcgNfQeXc4
f71jnPMaAgq0y6aDqGa/D4IaXUcRyJ6zcMpC18vafyx5h5heeua21vcCGUjfEmXn
KQudoQC2tUTvIIgJqjSXfOhZBxYe7Rm49XWjzXAJCjpnY7KaLvFRw5Vzr6Xz5Ke6
KlNtwYUo+LIjgsUPw7t9TjZwghDzrmB3OtosWy3HpIBU2yoNCewAaSrws3d0Jvy4
UV40hjxD/FcIpF24q1efCqE7QDF2xSVC9NZs5dQdwQH+0CiOg/2BKf/qsc/N/UQB
bj4eQSnZerBnK2UQvfwkgI5qsmFI5ErHWT/O5WdzxyrZLY+oWNOr19m4fDxGcw02
20PQZM3NVDvaJL24fF8HLa+FRWVC5o5zRGG/qnwQ02JerTlYhD4FbttVa95x0b1y
ZzEyZwYyKjZR9QBxEZWoBZi+JHFs0fKH4S5KdEpLrrp01VnQE11HSeEhX/7JkyyZ
j1A3kOEEWfv4Ffi1k+4aYGrM9RVgfVX0h/D8a7YD5KY/XCYu3BklOFzwMRWfNDQ/
INXdIXl1RwbaZXnQ5KQltRo5VRSQ8mb6QUfdftBfwmnMV3BG9NUL/t7HPtrGfJU9
v6fMR1gduJhhT2PEQNAq
=8Jad
-----END PGP SIGNATURE-----

--=-qUzl8Wq215GvJ/FogeDg--
