Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SXSjE-00069A-Bz
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 07:45:01 +0000
Message-ID: <1337845719.15137.71.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: block2mtd: fix recursive call of mtd_writev
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Gabor Juhos <juhosg@openwrt.org>
Date: Thu, 24 May 2012 10:48:39 +0300
In-Reply-To: <1337811443-2603-1-git-send-email-juhosg@openwrt.org>
References: <1337811443-2603-1-git-send-email-juhosg@openwrt.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iYo/Z0+2DWUkn8uQ83f0"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 stable@vger.kernel.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iYo/Z0+2DWUkn8uQ83f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-24 at 00:17 +0200, Gabor Juhos wrote:
> The 'mtd_writev' interface calls the function assigned
> to the '_write' field of a given mtd device if that is
> not NULL. The block2mtd driver sets the '_writev' field
> to the 'mtd_writev' function itself and thus causes a
> endless loop.
>=20
> This is caused by 1dbebd32562b3c2caeca35960e5cb00bfcc12900
> (mtd: harmonize mtd_writev usage).
>=20
> Remove the assignment from the block2mtd driver to fix the
> issue.
>=20
> Signed-off-by: Gabor Juhos <juhosg@openwrt.org>
> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: stable@vger.kernel.org

Amended the "stable" tag and pushed to l2-mtd.git, thanks:

Cc: stable@kernel.org [3.3+]

--=20
Best Regards,
Artem Bityutskiy

--=-iYo/Z0+2DWUkn8uQ83f0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPvefXAAoJECmIfjd9wqK0XFsP+wWegaskGwwfOgRBmkUbcB6z
5VzfpQHjhHYC+wXGKxwW+mX/EVlPHG2SfFu/5OKS9Y6BEh7R7zSJX8Tt/WFOOgh+
vsyDVmeaVxt+TfqD2k67uE15YPJ9ekxLxPCG7vanR95z6tfSmME+0UMm/HEns/qi
jHNQ4etNoFn5HmRisjJceladhz5wFIEo6SAb8YYLdk9OMFBJzPHrTX4ICWjI3Dvd
7TfqeynrdpH4I9uNr//nyOgbYcQSgxcrU3c7jzbqTzWLqKc+EQMP3Ny3Zq+K6liQ
HIvFBEkvtU3e4+Bj+/e5EFwkdR5IugBvKSVexFGydf6yStqhnGyLUkW8U4FgAMAN
67gKWWBuSgAdfu+qtyz2cAUvxOqDCRgKe+XwepAOHee76e37yGakI4EAb+RPgmhP
TED9e3MrD6xIwsaLBbpNKKX/Fis2KW78WFZxeyPyQRnfFdMDN730Ftj8Dg+47ya+
q40iKjRs6Dl316T56gSPG8j1gjNhOiTY2HoPw6qGybXxIALWUM8YaWkxVj3h1PXP
b4cF2aRyDquVVFp5/XY9KLrX5GrvXolRSomsn6Q8eM4SEClzGe4jq3TW70R3HKfU
kCUYrNBLUfzvGQQboYxaT53UvLgAVx2FbXu8HKS3wZvnRVGeNdPgymdBsYSmkWJL
iSNsPo/pqWyiIW56+5uI
=z/Px
-----END PGP SIGNATURE-----

--=-iYo/Z0+2DWUkn8uQ83f0--
