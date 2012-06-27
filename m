Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjr5s-0002MJ-9W
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 12:11:36 +0000
Message-ID: <1340799333.1799.15.camel@sauron.fi.intel.com>
Subject: Re: ubi_update_fastmap: could not find an early PEB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Nikita V. Youshchenko" <nyoushchenko@mvista.com>
Date: Wed, 27 Jun 2012 15:15:33 +0300
In-Reply-To: <201206271507.42980@zigzag.lvk.cs.msu.su>
References: <201206222005.02308@blacky.localdomain>
 <1340794586.29342.52.camel@sauron.fi.intel.com> <4FEAE7CD.6060803@nod.at>
 <201206271507.42980@zigzag.lvk.cs.msu.su>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0VSTAz+h0P5d45Hx2Kuc"
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, Rob Taylor <rtaylor@mvista.com>,
 Alexander Kaliadin <akaliadin@mvista.com>, linux-mtd@lists.infradead.org,
 Pavan Jadhav <pjadhav@mvista.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0VSTAz+h0P5d45Hx2Kuc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-27 at 15:07 +0400, Nikita V. Youshchenko wrote:
> > Especially the size of both pools used by fastmap needs to be discussed
> > more. If the pool size is too small UBI was to write the fastmap very
> > often. A too large pool means that attaching takes longer because
> > fastmap has to rescan more PEBs.
>=20
> I'd prefer to see those configurable.

I agree, all parameters should be in the fastmap anchor instead of being
hard-coded. It is OK to hard-code the default values for the
auto-format, but if the UBI image is created with ubinize - the user
should be able to tune for himself.

--=20
Best Regards,
Artem Bityutskiy

--=-0VSTAz+h0P5d45Hx2Kuc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6vllAAoJECmIfjd9wqK06A4P/2j+JVxj/7fklk9Tf5BiA/4M
tSkI3WO8EUCT+qXDaCIH9VmMCLeII9WVQE5wk/n+IwCiqsyuS1RXXqcCnCBBrp3G
zpwzfQtmyERj/5vG0JHKtN6a3eB2+C3rZ6hWDYDs4LOYlKuznSuASNnPW/1rXoNM
nwTs5vXuqIbGsm+g7xRP7Ne7H3IFG44ZaWaokyDauSditzRb8eMEvlrsXqU9SEHF
+5BSjG86EeSDKAO9SxV43QY8uQLsc6d4VAIg1pMTdx495mPEf7nQeXRfXx69Ecft
iqBZkdRALV00SW7DOvd+4Moj1tsGMf2qUMJJKrIuTky1K7mS2bBHboZu4Ac+Il4l
z449QMMCk0wsFZG9ruB6i8oeDComI9530qfUdC5qT42r539rDtEXpuDRnCnbFJ2Q
hT1o7tH2Z04AwE0p+cEsNzxD4q/dg5kLVEZRs5aeOWA17P+LggGXeFw/wISvpYKF
49UAFiXBOtxziNNXAp3cQeLldmgcZdMs+ciz49sLHO87S4RMSR6l9HHOl9J3quxU
37ZIbgoofW0wHaaBIPMR3ljZdSQ0I+u0YI+8KGrL01eS58FUIOqXBx65JHULGX+Y
S1AVxLPbKT99iLw16OpvjgrXH6WdRWzMT225K/psxxmhlYHFCnhTkFKMEaGtTp2s
BvMCq3n37/9qIJt1odh2
=Srn1
-----END PGP SIGNATURE-----

--=-0VSTAz+h0P5d45Hx2Kuc--
