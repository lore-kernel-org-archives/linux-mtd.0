Date: Mon, 16 Feb 2015 17:41:34 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150216164134.GE25269@lukather>
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>
 <1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150216172753.5e92739a@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline
In-Reply-To: <20150216172753.5e92739a@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
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


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 05:27:53PM +0100, Thomas Petazzoni wrote:
> Dear Maxime Ripard,
>=20
> On Mon, 16 Feb 2015 13:51:11 +0100, Maxime Ripard wrote:
>=20
> > +		while (index < (len * 4)) {
> > +			u32 timeout;
> > +
> > +			__raw_readsl(info->mmio_base + NDDB, data + index, 8);
>=20
> Are you guaranteed that 'len' is a multiple of 32 bytes?

I don't know if you're guaranteed of anything, but the controller
supports only 512, 2k, 4k and 8k pages, which are all mutiples of 32
bytes.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU4h2+AAoJEBx+YmzsjxAg/moP/1TNHyU/h8sT++vksuBAL/PJ
/cLZc6ladwpmNRuu1ia1sla9QSIkkfEpjLoB05kJ14KiNw+Axv1e+QOVGy9s0H54
wc+ZTFEKWydjql957MeETGiCTVmU+OnFSXi+M3JlDo6Ju+2qYSiTfbpJ9Ejjv2IH
Q52tO8C8Fu20icfKBXhoGdE64t14VEoc0v4tKsgg0yvpCit/8wmIXCw5ErjIFGFr
ffi8+U3ypYhR2j/1O7tPpQ33GcnRIreEtEhiBcfK72UY/jBtGkvs4GEJOT7S8mzv
W7lRVCS+/ILPHYx69Td9s9yD7xIpHlBVSA813ZVNNcYSFyjwDRxOuaLsDzbb/793
ZYPNXPm0UY17nd0gy2UI1vQgdHyaBbmDUGPoyaNLZVUnd2mUBSzRcYCIOXbADHV/
EeXKHfa1MTYaWlDIQVLsrZ2Rdn3xtyJR/m2OJy2TVW1AR3aahvwBDtJrlQPlSC9y
ZLNacx9LCR7LszE1xzoVmqWAWLO9a1p26isAt5sH+EfdbKxE7FpSlZMkftroDTSs
ZiBZytSpmEpGOFWraRZod4+md1HPlLdXR5dAYdnUxeOYnA09np5+3Y655lItVp4t
vcRY7JaP7Jl/JxVm3reJn4JGxZDgnwLREqWqhmwMTlF2dw5j9nv3WYJSst6YDHDD
iAsp++DEOhsSVMVGLC0d
=+yV8
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
