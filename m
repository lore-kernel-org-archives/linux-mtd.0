Date: Tue, 17 Feb 2015 11:29:14 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150217102914.GJ25269@lukather>
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150216172753.5e92739a@free-electrons.com>
 <20150216164134.GE25269@lukather>
 <54E22168.7070703@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="x+WOirvrtTKur1pg"
Content-Disposition: inline
In-Reply-To: <54E22168.7070703@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>,
 Boris Brezillon <boris@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--x+WOirvrtTKur1pg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 01:57:12PM -0300, Ezequiel Garcia wrote:
> On 02/16/2015 01:41 PM, Maxime Ripard wrote:
> > On Mon, Feb 16, 2015 at 05:27:53PM +0100, Thomas Petazzoni wrote:
> >> Dear Maxime Ripard,
> >>
> >> On Mon, 16 Feb 2015 13:51:11 +0100, Maxime Ripard wrote:
> >>
> >>> +		while (index < (len * 4)) {
> >>> +			u32 timeout;
> >>> +
> >>> +			__raw_readsl(info->mmio_base + NDDB, data + index, 8);
> >>
> >> Are you guaranteed that 'len' is a multiple of 32 bytes?
> >=20
> > I don't know if you're guaranteed of anything, but the controller
> > supports only 512, 2k, 4k and 8k pages, which are all mutiples of 32
> > bytes.
> >=20
>=20
> 'len' here comes from:
>=20
> do_bytes =3D min(info->data_size, info->chunk_size);
>=20
> and
>=20
> DIV_ROUND_UP(do_bytes, 4)
>=20
> Where chunk_size is the size we want to read/write in each command step
> (keep in mind that with extended commands we issue multiple commands, and
> read/write data in chunks for each page).
>=20
> And data_size is initialized at mtd->writesize (i.e. the size of a page).
>=20
> Given all the flash pages I'm aware of are multiples of 32-bytes, and
> given a chunk is either a quarter or half a page... I'd say it's
> guaranteed to be 32-byte multiple, but perhaps it's a good idea to enforc=
e it.

I've fixed the function to both support non-aligned reading, just in
case, and to not poll on the last chunk, as Boris suggested.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--x+WOirvrtTKur1pg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU4xf6AAoJEBx+YmzsjxAgODkP/AlS+vN2//m6fpAVIiE8b68x
gxxsjcy/deXVQn1f1BA3ciZlAncnDL8VJPWbYnAb8uSAjkFoiK6EhVXGk6d6Ta9s
3gEIShI71h2C3wKeu9WMbFafFiF4kUxvyThf6+vrM9l6p/TUT3tW+gGzP6DJQP49
0FmfGsKo9c+8c8iBNNH0oBHjHKJRCQwAQ0vdae6HOveAzhtTGfdgTc5NDjl/vAqP
XirVcP9U0LnlwPrktIDmSoEq/SFGzH6wsigPzIDGlMoo5yDLALjV/3oq8NawZLVQ
WeBdpvaaZtXCH9+bbkIRbf7EthueH943pHPO99LjFdHHYcmaLuv/1m2AXDLkMy1U
cQ4JvjscOZ/5hThUgpe5LB5Z2wDQXN4B5UHidxuI/6besB1vriEIUQJ5qXLR2AfK
HvftlmrtkCEEQ+7NY7Io39ccIAJQlysDFafwOqyl5R/BqiaE5rvarrftp/UB77mC
OKt48dwuM1/kQocye3QJPWJs8sSEZk9siJfVPNVzar78qVH8AjyRyZ8RzlUUbkxS
+x21Dp/lsN37eS7i9f4dAzs9UszOCQNrfRHjAbkANTlwkg/Xhon/8brtMey4LFiH
g2WDZis5a8PYid7PsO42/jRQ6wlxNDLtn5duIC85q4AGTgdLqgWubdJv+z2OmxXV
kkrdlSx3br5TTo2CtY6q
=jQmi
-----END PGP SIGNATURE-----

--x+WOirvrtTKur1pg--
