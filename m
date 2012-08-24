Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4s91-0006ji-0Q
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 11:33:44 +0000
Message-ID: <1345808311.2848.286.camel@sauron.fi.intel.com>
Subject: Re: ARM: LPC32XX SLC ECC Handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sebastian Huber <sebastian.huber@embedded-brains.de>, Roland Stigge
 <stigge@antcom.de>
Date: Fri, 24 Aug 2012 14:38:31 +0300
In-Reply-To: <50222E55.5070204@embedded-brains.de>
References: <50222E55.5070204@embedded-brains.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3Ixv5M8yKq69Q/YGSxMc"
Mime-Version: 1.0
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-3Ixv5M8yKq69Q/YGSxMc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-08 at 11:16 +0200, Sebastian Huber wrote:
> Hi,
>=20
> the LPC32XX SLC controller has a ECC feature that covers only the main da=
ta=20
> area, but not the OOB data.  Is it the responsibility of the user to prot=
ect=20
> its OOB data via an ECC?  The LPC32XX MLC controller on the other hand co=
vers=20
> the complete OOB data with its ECC.  How can a user determine if it has t=
o=20
> protect its OOB data?

I guess it is good idea to CC the author of the drivers.

--=20
Best Regards,
Artem Bityutskiy

--=-3Ixv5M8yKq69Q/YGSxMc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2e3AAoJECmIfjd9wqK0ivUQALnDBRwEUOgSjsEML2aWuWTI
/OOuOtPSXZZ2hXmMwvZDcWgYoo0/Ei+g6/Lm+TJPunRBwp5aSGOyr/eKsAyM5VgC
x/pUJWPpeJlB44jGrBgwQXXaXvagEOcui1HsNDHPFWbbS7uoE3XDmc4aJjqlKdHP
8quBnGWFMrglKihS6ByfG1D/Asea7T0EX4hJjGeAJLhpg06L9I/WPhtx9m623SFW
1TYIfCcJiP5UzfGRYvoBfmvgYynIGy1PFfdmkl2C1CXj0imvrrGZexAkGdieDLo0
sxkGD1KknTDtmP0jqCw753LHQJeFwW1HGENqSR7owYn2sDr1NnFxTvZ2TzrH/xC5
vDeiS7E9j4XPJJS+eST1pcOPYHru/oBw7GWo6CGFp6xgxjv46VucrY+XnSHKzuIF
IVHgi0N1m+R4TijD/Iv+Rx4MdcqY1tn4XNj5cDR5oe/BvdYDrpxacf+hW7hTKkH3
hik3qP3dAC2X+SsGFZA/6hpIcxI9BHuRc/C93thK8BVXsohD9R8uhAC9YUrLkQYY
7jTQUCd9zkv9e4Fsk3umEpgoB5FQSIVnvbvG3yhwLpJb4TYiqmdXp+5SNfH5riuZ
9wsVC10U/HwlKGvUOs5OrMY+bLBK8I+ndWbGZ8D4zd9urHOwpWv94b3wmqo47FAq
4+ZohIBxo46sjpYFpNGt
=jVm0
-----END PGP SIGNATURE-----

--=-3Ixv5M8yKq69Q/YGSxMc--
