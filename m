Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TBNXM-0001dm-UA
 for linux-mtd@lists.infradead.org; Tue, 11 Sep 2012 10:17:45 +0000
Message-ID: <1347358968.21359.68.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: prepare place for BCMA NAND flash driver(s)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Tue, 11 Sep 2012 13:22:48 +0300
In-Reply-To: <1347201121-20590-1-git-send-email-zajec5@gmail.com>
References: <1347201121-20590-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-HHLEnAGF+T+QeWzRw+Q/"
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


--=-HHLEnAGF+T+QeWzRw+Q/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-09-09 at 16:32 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> BCMA bus can contain NAND flash memory, it's registered in system as
> platform device. This adds required hooks and place for controler
> specific drivers.
> At this point it doesn't work yet, so it's marked as BROKEN.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

Why should it be merged upstream as BROKEN and without
controller-specific drivers?

--=20
Best Regards,
Artem Bityutskiy

--=-HHLEnAGF+T+QeWzRw+Q/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQTxD4AAoJECmIfjd9wqK0G10P/ige9JhbmWLDvFQYpjYDqBj0
v5HTxlg99kuzb1rF2m7yBEUnXHyTX8SmFkhyht3Sh4kkHrGWoUTbjaLAg9kaR2O/
HczTg9JVbgh5ZNCIRdV3AuEzRhtWNAueOzSKj8kcf+wZsTnCsPoFa8F81ySl49EP
OlNaO0Tm9M+hxVEWyZZ6DchKcOJN8D0fOR8xe9BPYTvuYun205/M3Hl5SbIxNCKP
VtjEZAHa4pclr7B9u1s5vH3oSA9C6y7WodX7QVGOOkKsFnOR9bgN1pgbVEz+Pij9
BOJ6i7rOXie3kiFPYdFSsZtSIoLwgzsZhpxFiXk+Mnip+Zp4YeVBIv4bOudR90l+
kIFTfp46bs32jNXphWpHSjhYdBfHCgQ3Z7r7N25gGDU+IShRh81S/GfL6HRdv+5y
jhPmiVK2n3okonTU2V0VO/qNecFsHuaXREDZ9w9WJ9KsvxCb7M1J6DV4caRT+vyq
xHIjSR81/dhiera3IxSrRBk7j7SuDVuWJVuBBMNSmMgC9AB2oYmX24CVsYLntqfw
6L2qqjjFG8IBulUphf9PdpsHIi2OEZcjQYbWQCO/U+gx2nf4gbZFL0ytKffrCMuQ
UxHevqtOQo8NppbWpccebSvsZpoyan1nHtspLP1woTy1FxGYM4xaIjcDIMHIOck8
9c9/LhJStwhVUWw+nZtO
=Crgn
-----END PGP SIGNATURE-----

--=-HHLEnAGF+T+QeWzRw+Q/--
