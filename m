Date: Tue, 3 Mar 2015 10:57:59 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH v4 2/2] ARM: mvebu: a385-db-ap: Enable the NAND
Message-ID: <20150303095759.GE4911@lukather>
References: <1424255528-1717-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424255528-1717-3-git-send-email-maxime.ripard@free-electrons.com>
 <54F56C67.7070404@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Content-Disposition: inline
In-Reply-To: <54F56C67.7070404@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, Sudhakar Gundubogula <sudhakar@marvell.com>,
 Nadav Haklai <nadavh@marvell.com>, Boris Brezillon <boris@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
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


--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2015 at 09:10:15AM +0100, Gregory CLEMENT wrote:
> Hi Maxime,
>=20
> On 18/02/2015 11:32, Maxime Ripard wrote:
> > The Armada 385 Access Point Development Board has a 1GB NAND SLC chip f=
rom
> > Micron as its main storage. Enable it.
>=20
> I wanted applying your patch but it failed. Actually it depends on your
> other patch "ARM: mvebu: armada-385-ap: Enable USB3 port" and this patch
> depend on an other patch "usb: xhci: plat: Add USB phy support" which
> hadn't been merged.

Hmmmm, indeed.

> So either you send a new version which apply on 4.0-rc1, or we can wait f=
or
> that "usb: xhci: plat: Add USB phy support" will be merged then I will be=
 able
> applying "ARM: mvebu: armada-385-ap: Enable USB3 port" and finally this p=
atch.
> As you want.

I'll send a new version.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU9YWnAAoJEBx+YmzsjxAgmfcP/36B0YMBOOf0xnb4Z1JIl4M1
0Rkv3QZ4kRCyGjhDG9VGuwastGVbyOdYpQISMPvbl/IYLy+/CEGE5yue7sn0K1rs
ynMFRjdn173WdNqbIOxACCtUI6VfHdsrzFyZJM+IhC9EN190tPvbxdZzu7csm4g/
kAZ3FBkZ7duul+8Lz9z1vDNGd54dnWGAozwiq/npfwV4uq1bGozjvVqJoDSt2CTS
OydAzG1eamXXQGyx2C3q040QoO/8PxyNa+ePCRGbRY+2LOQAfOfmdZ6WBvsaUhiZ
DhYDylMEHQp4ILxW7o2X2PAhFacKzRrhjAS1GcgT775jrb7qAGd1H53abROOlGB3
20zBVLY0vmUvBhoZBu5Cd6Cf1xmAA4WEWH2iV1yzq0rvco3qNyWbXmvK3ROInIlt
VpYBgdxnubsGg+3ukY7oehoGILCNl4PkA0RGzKNpML6oA/y11SFyAa8PEtfA6l2A
IlD7Gc+vYz4hkymIXDs7sBqz+f5sS1TaKDuIDVe2YkhQrCkfqn9nNv3PtVNElwUg
ny0dnnG3+S7G2XbKKe1/CqxiLvBNyL829/lCotbYu07kDv3AorBDxp6duBfjUMRH
y+Ff3UavsOXdNsOSxj7BRbbmlFE0eJm01UfxYf9O2btyBwWaeNSm/9Up9EqvJ67C
3RxZHlPYxNWcIfNCzl4i
=iQU6
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
