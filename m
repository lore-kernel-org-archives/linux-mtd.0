Message-ID: <1339075683.6875.109.camel@sauron.fi.intel.com>
Subject: Re: [CFT 09/11] mtd: omap2: add DMA engine support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Thu, 07 Jun 2012 16:28:03 +0300
In-Reply-To: <20120607131158.GC15973@n2100.arm.linux.org.uk>
References: <20120607110610.GB15973@n2100.arm.linux.org.uk>
 <E1Scaaa-0003uB-1l@rmk-PC.arm.linux.org.uk>
 <1339073375.6875.102.camel@sauron.fi.intel.com>
 <20120607131158.GC15973@n2100.arm.linux.org.uk>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YJJUcFuMMw2jXBEcQEui"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YJJUcFuMMw2jXBEcQEui
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-07 at 14:11 +0100, Russell King - ARM Linux wrote:
> No, it makes sense to get this stuff via a single tree all together,
> because, as you can see from the thread structure, it isn't purely
> an OMAP thing.
>=20
> The OMAP stuff depends on a core set, as does a bunch of PL08x and
> SA11x0 changes.  We can't stuff all that through the OMAP tree, that
> wouldn't make any sense.
>=20
> What probably should happen is that the tip of the OMAP stuff gets
> pulled by Tony into his tree, and we share those commits between my
> tree and his - and then it doesn't matter what goes in when and by
> whom.

Oh, sure, sorry, I actually wanted to say that these to patches should
_not_ got via the MTD tree.

--=20
Best Regards,
Artem Bityutskiy

--=-YJJUcFuMMw2jXBEcQEui
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP0KxjAAoJECmIfjd9wqK09KQP/3rgp5e2/qOp4C6P4131kiiG
AZMSWH2Bq59oiBuz4bnlZqQuCDuVmc5fU6J6YvNqgWmvoPrTFNObDSJ589an2/tm
sGx0J0tJYHA8oI7sxNFpjXZrod+JXnIoVsI9qo0Y4heFwmmF/5QFzj/OLsAvskKR
MhOHtbctZt6K2huu9wM0XpR/Taken7RwvLR/C1E7somh875XaBb7scdlhkShD3c2
G+Ub7DlMMB6vUaF1Kw9XgCoXvyKYB89I3tS84SzGevWA8JjlA+rOR8GwpzactLqW
yQCPLot67xhGRIHYMHbuMM8QC9LlastZ3MP4vzeEYQmioQiLIvgpYSrYcymB9wa8
S0wnOazA7rLrkukbygmYEi437OwHQbmRKpW3fDdFgElXw+Z33Zl0KwEzP2uPMUu9
pd3KhE6ZEF/EnaQFwXQwdm66q5TQ9BocrJTUgUshiLDVuh3hfBrYyO5EHlEEYPhf
K1J5Z9dKeOhUXf7/Xt+u+MRwzdVWqXznMj4FAqpkxj+/czfeNY9YYNU2hzho9get
epVEQ8bzhSR/BCGWXGxqFOdxqr4wPFZC0V4UbfcnOK8D4MrT+RMxXUV5X2P1OgYs
0ubzL0kelh/ZUzvtOdN6Vl/wsusho2SDUtNhidBmCD7DLh2y5swk1NKrCmm/eZPF
9VTBv5bHPduTJwnEkaqj
=MwEk
-----END PGP SIGNATURE-----

--=-YJJUcFuMMw2jXBEcQEui--
