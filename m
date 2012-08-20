Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3O31-0002uI-1Y
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 09:13:25 +0000
Message-ID: <1345454272.2848.20.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 1/2] mtd: fix wrong usage of ioremap_nocache() in
 uclinux.c map driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: gerg@snapgear.com
Date: Mon, 20 Aug 2012 12:17:52 +0300
In-Reply-To: <1342676566-25651-1-git-send-email-gerg@snapgear.com>
References: <1342676566-25651-1-git-send-email-gerg@snapgear.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Mvt5PAIZckOoYR8e7Nre"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Mvt5PAIZckOoYR8e7Nre
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-19 at 15:42 +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>=20
> The uclinux.c mapping driver uses ioremap_nocache() to map its physical
> mapping address to a system virtual address. Problem is that the region
> it is mapping is not device memory. It is ordinary system RAM. On most
> non-MMU systems this doesn't matter, and the mapping is always a 1:1
> translation of the address. On paged memory systems on some architectures
> the page table mappings are not compatible between normal RAM and device
> memory.

Took both to l2-mtd.git tree, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-Mvt5PAIZckOoYR8e7Nre
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMgDAAAoJECmIfjd9wqK0VzIP/iP2Cn7HhhV+piKlbJfce9cl
xCezbN+waNBVmCCO7Y9EBMe0qMAfM1WDunTmVpNfA/mIQn4G2s4svKNK2sqkArB5
lFRBZ6hINWo/E/Mi4G0t/R4BgYCCE1sjMAQ9p8tdqe4JfN1ecACnRQPHJpwuPKgY
hWVjL1wOgnBUuU/2rRT28Vr6h2FmoqjmuIlsKw5Io7AUnhszMoAO/4cdk5GO0s4D
LjBGm6vxlxZuPl4ER1S14V39a6oqVxNvxIxfXx5gw9TFnojdZYxxAxPeF5xxaTTs
mci413taQ+BkCm5VBzbaPd6bsQvfvM0U7TAnicy82Cpf+DBNvHAhiJdXauC97l8G
98KCmnNKwYUvZPAuvidkYmrkuPeBNkunJUWe74TR/0V7kCdy5Elv2+MfcpEkTZT+
ENeqBq9VyFDj5G4NJFwRSUSoKt7WrCwFrIpZnhBzNPbr7Nb9O5vyukluK3ue0Uq9
2i2VMfroAR2GAJb2jD5/jxyfp/GWJsCHer1aBYfjwqM3oktTnBfCForm2aTHO3Ul
R3jUUFDkUgbh8X9t0pp0EO51geeyp/R5aLN01iUIUZQACjl+UxoIr0Y6+cXtrAyK
w/3cs+pzWVRlB6ALXhIshRKDeotjJUnKNAOeA1nIok1TzKoYKXU9jRqIHksv4wMF
DXP5ghWUDAur1B6Ccut1
=GxNn
-----END PGP SIGNATURE-----

--=-Mvt5PAIZckOoYR8e7Nre--
