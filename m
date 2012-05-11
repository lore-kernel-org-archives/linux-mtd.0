Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SSoK7-0008N1-3X
 for linux-mtd@lists.infradead.org; Fri, 11 May 2012 11:47:54 +0000
Message-ID: <1336737075.2625.52.camel@sauron.fi.intel.com>
Subject: Re: Regarding latest EUCLEAN/bitflip_threshold patchset
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>, Mike Dunn
 <mikedunn@newsguy.com>
Date: Fri, 11 May 2012 14:51:15 +0300
In-Reply-To: <20120509132613.40db5533@pixies.home.jungo.com>
References: <20120509132613.40db5533@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-X/qq3Tkp4qj2Lo2xV2g5"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-X/qq3Tkp4qj2Lo2xV2g5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-09 at 13:26 +0300, Shmulik Ladkani wrote:
> Hi Mike,
>=20
> I noticed 'nand_do_read_oob' explicitly tests 'mtd->ecc_stats.corrected'
> and returns EUCLEAN - as it was not ported to use the new
> 'bitflip_threshold'.

Good point. Mike did you miss this function?

--=20
Best Regards,
Artem Bityutskiy

--=-X/qq3Tkp4qj2Lo2xV2g5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPrP0zAAoJECmIfjd9wqK05t0QAM+xappBFzp38EVu5p8kaPnp
mZuMugnFJcyyYhqbrXzoB3v2WCRvNsaqCEZwQstS9R4LhwGgm5K32dG1Nfq7cJtd
aZoayIEowc6m5lWtN2Fd41ed+glJm1SGtSUOcsJfuWmI8cuS2E6fCdy28v6EfD5v
tcYZM7O06kcB2LSAeRafUT55Ptz0kzJIHgJRmA87o44Qaq+oVgUlF/sJp+kdbMBY
iX0kydfmq5JNL+CGwq4U+WHiu5CsWxoBg01qavlHtRArsqiPIfjsNzWOz18Xxbhq
pZ3N5n169Wzt3IX+9ugrJupNUMKzFc3MU7wa7bNtVBHYyRJi/cfu5QEaI9j30PEH
mboGZ23xoZKOjWeyXCK3xXo9+SlSZz6k63UDBUKhBM/jELLOO3a0nQIBRWr7gGn+
wmX5SOqEplRfpjow6yJZIwkFGAXYsBox6CzrOg6JUej8+KNAKEu8BZzu+kVw6U4K
sApvP3tGPNRtYENtwRLYULlS7ZbLq5WA5QudBvuckCg9QB5UVPMjVHijxBm2MTwS
5T6P8uM0/KUswG3Le9dUBQE+JPqtbUlpxKk3KcI/0f3XB9RUdkabz1SsYDnbIiJ7
Fwh1DHWdP0OBZ5ho8x0Rdue9qHF7HVbaQ7l3E2qi3x3XmjGdCNdnmBlWpq94OePX
fJyfQVTBp7jbdAvK2/gg
=4kvc
-----END PGP SIGNATURE-----

--=-X/qq3Tkp4qj2Lo2xV2g5--
