Date: Fri, 6 Feb 2015 21:33:46 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
Message-ID: <20150206203346.GI2079@lukather>
References: <1422284164-16867-1-git-send-email-maxime.ripard@free-electrons.com>
 <1422284164-16867-2-git-send-email-maxime.ripard@free-electrons.com>
 <20150204111028.2f0bd376@bbrezillon>
 <20150206010835.GB30781@ld-irv-0074>
 <20150206091307.1162b123@bbrezillon>
 <54D4CCEB.5090009@free-electrons.com>
 <20150206193859.GP18140@ld-irv-0074>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="svExV93C05KqedWb"
Content-Disposition: inline
In-Reply-To: <20150206193859.GP18140@ld-irv-0074>
Cc: Lior Amsalem <alior@marvell.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Andrew Lunn <andrew@lunn.ch>, Thomas Petazzoni <thomas@free-electrons.com>,
 Seif Mazareeb <seif@marvell.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Sudhakar Gundubogula <sudhakar@marvell.com>,
 Nadav Haklai <nadavh@marvell.com>, Boris Brezillon <boris@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--svExV93C05KqedWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 06, 2015 at 11:38:59AM -0800, Brian Norris wrote:
> > > An alternative would be to move this part into the read/write_buf
> > > functions, but that's a lot of work...
> > >=20
> >=20
> > Yeah, indeed. This also has other benefits. As we discussed on IRC, it
> > would allow to support raw writes (i.e. ECC off).
>=20
> OK. This is probably a good work item for later. But let's get back on
> point.
>=20
> I'd like to see version 2 with the following:
>=20
> 1. For sure the jiffies loop needs to be rewritten
>=20
> 2. Optionally, the RDDREQ bit should be checked less often, per the
>    datasheet and Boris's comments
>=20
> Maxime, would that be OK?

Yep. I actually worked on these two issues just today.

It looks like I blew my boards' bootloader in the process, so it might
take so time.

> Then maybe I can get this into 3.20. Maybe not in my primary -rc1
> pullreq, if we haven't had enough time to look at and test v2, but ASAP.
> Only after than am I likely to take Rob's ARM64 cleanup.

Sounds good, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--svExV93C05KqedWb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU1SUqAAoJEBx+YmzsjxAgYbUQAJCitdtmdvnyH+xDwvxLUpqa
uuCMdqUBKVh16OP4agaLMmx1Q66+qG9ckrEATOJFOIqDw6aC2P0qjMQ5U6RLuc2x
ACBhZJwW/JWPkvvZU4ghk5ZnDALgF7NLF9biCZb5uu3UpAqH6l6oJSTdmQTyw+gW
CzaIkBk78cwYo7rNdGAqkPaWUv4c5+F8LRZPYgTjVfk4w3CGE2kykR16cqdgqDYX
bH5ViYoPp3x4AxGW3FNc2Dq2GZx0ic1VaZ0Sifh+sodDK+QUKb/HSx2B3G76PYYt
nx3tbQ5Jm+85kgB2HUgv81zd7KjLSSPBKJy8f8hP9vRDtUKJ+TIserHNSKOlgdVy
kgshP0ClOHAA2FWuOndDoE5G659zzi13JksFwiY9P2cYQgO4a2G8djHXNgLo13x9
VTaow12cNfXMmkpgUZlKSld8syHCoui2osW7eL5zT/LwCaKEr1kYiWVjRKV4VXO5
CHTAE8ye3XJJnmvatjhjhsjYNJcGB63YM8CReo/5cd8okMb2uxhzEJg4UjgwxIDq
Ze7R/p/MaaOPQadLMZ8QcjvTliKtu8nPBrMlgiO7g0AeibuITT+5qHPMiVLWEyPW
gWskf0/Tm1bCFCT/78W89JBGp/OctFnjWG20P5FlqmRa7CjW/jUYWZ/cmhrKLiG0
c9E+zPO2VL4a0bfBcPNZ
=txUN
-----END PGP SIGNATURE-----

--svExV93C05KqedWb--
