Date: Wed, 4 Feb 2015 10:13:17 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150204091317.GA5492@lukather>
References: <1422284164-16867-1-git-send-email-maxime.ripard@free-electrons.com>
 <1422284164-16867-2-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <1422284164-16867-2-git-send-email-maxime.ripard@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
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


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Brian,

On Mon, Jan 26, 2015 at 03:56:03PM +0100, Maxime Ripard wrote:
> The NDDB register holds the data that are needed by the read and write
> commands.
>=20
> However, during a read PIO access, the datasheet specifies that after eac=
h 32
> bits read in that register, when BCH is enabled, we have to make sure tha=
t the
> RDDREQ bit is set in the NDSR register.
>=20
> This fixes an issue that was seen on the Armada 385, and presumably other=
 mvebu
> SoCs, when a read on a newly erased page would end up in the driver repor=
ting a
> timeout from the NAND.
>=20
> Cc: <stable@vger.kernel.org> # v3.14
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Any chance for this fix to come in 3.19?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU0eKtAAoJEBx+YmzsjxAgE80P/Ro/RhYd06mjCQjvSJqtVvzF
5QVjcd3TRmoMyb8my51xTM0QdGQN7nTQ9k9C4E9h6m1FIWs5RmJth43RRgnMt4Dg
ca8pb9YLaGf05Xcdi7wiVnZdSCC0/KpwBpbK/2pmkeemiSMRGEehsqEcsyEEU98I
qHZSvitHz+WzHt44ARNPD+kuxM6fUn3nW1SSI9dyduyxMYbrmOEKeR/nmUVdiDnm
wdzmq1Qy8zgmXumWJL4Xgg0RshVdTJCN48IWLKZZW87DF8DOo/RXDDge4iRD1c8S
UmfEPEBkFSQNWJ9z02ge/3gxjeU930t/w8nb5tjxY6Lmkp2Wshrk0CcQk4/j59YZ
PU87Vzz15fkGvN0ziJ60PYh15Io50qSbFs4SxQiVR3BFNmG3hnduTwfWm6N3/3YH
uf/98IvFcjDM8ZQBAp05Iw93VXpMOdeP7otqiFWsaH25/lJ7pZc7zyqwnRbUCNZB
LgdWzEg/pAzBG7iUNig9UEnLiM7YB5uY+9E6dLfRu7s49BEG7woIimaCDxkiapmd
D2Pfs+OKFhaHcohmIYwASUcaeSpqnIzkbxrU7Clh9A31M5CV0CHnNaqekHF0fZMh
FV0NKV5opS9Scqw1+LWVeMPOV2W1J4rhUfal7ZXZP0BmlDk7e5uSPGbAnRymfzrM
JGwa/3cjhmt/arP6YDMN
=dOAh
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
