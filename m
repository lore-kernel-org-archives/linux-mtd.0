Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkVHc-0005yf-2A
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 07:06:24 +0000
Message-ID: <1340953826.3070.131.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd gpmi-nand: Fix read page when reading to vmalloced
 area
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 29 Jun 2012 10:10:26 +0300
In-Reply-To: <1340724377-22279-1-git-send-email-s.hauer@pengutronix.de>
References: <1340724377-22279-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-LHotaM4LnMfK2qja+TPU"
Mime-Version: 1.0
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Subodh Nijsure <snijsure@grid-net.com>, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LHotaM4LnMfK2qja+TPU
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-06-26 at 17:26 +0200, Sascha Hauer wrote:
> The gpmi-nand driver uses virt_addr_valid() to check whether a buffer
> is suitable for dma. If it's not, a driver allocated buffer is used
> instead. Then after a page read the driver allocated buffer must be
> copied to the user supplied buffer. This does not happen since:

Pushed to l2-mtd.git, thanks.

--=20
Best Regards,
Artem Bityutskiy

--=-LHotaM4LnMfK2qja+TPU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7VTiAAoJECmIfjd9wqK0w1QP/ju5Rm2OGEsI+OL8G0VtQer/
09g3GbQQh2MCiSK4/w5XfUC36/jycKybkX0ymoyt+OZy4iCC8VbrDLpPUVEESEWP
qzvH2kHajZK5cGDBTkP6PckNrNbCgOxR7BpTh97oE1zOUxK++KlOjxrvrY3PUW3j
QVMoTuJWH5nWZnwxNiN4lo3U71NRchcEuS/Kpzh2gXaBZxnbBra5YzN7ks1+5VC+
fgO5H7KUMerdd7YrpOl39hywX2bsXo0UDcrKg6R23JhmzwnzEaDWki9wQGf+1Nlc
7Nk2IQmi37rs56IK4k7vSqNLbkZHYxzFe8iE0JQB8DMmurN7AXsd+Sl/+JcKzQPq
rQXrsW39TU9FCOB6UZ623yOydGFY5aXAxhiBORFk1ti57dodIwVHkGA9NLJnpxvE
ySrDqfR6HgMYbUOdPx+CMXtzdpcJPISnIXt0jxR86WrUFUyY4FRe/NiIRTFwHPSL
7hFzEw2uB3xEj6UzBvXYVSNJfBELtTiCr9rJjW4VjVBtbqT/m57O8Ti7FWcly77e
036wpnQZJTHuQDB9zFHtgm/D56SRjhp+B4CBxlx7r8hmE22vuSQzWZVbOZe/q6PP
OAeb4N6sh7q3/CbEY93I+c7USXPKi0+AXIpucUqvK3tcEAmOW1w2rQGWDwbm5Po3
u/fSEofPGt6tXAooYboL
=4BAc
-----END PGP SIGNATURE-----

--=-LHotaM4LnMfK2qja+TPU--
