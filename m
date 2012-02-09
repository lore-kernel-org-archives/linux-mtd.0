Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RvSHB-0006nj-Dr
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2012 11:34:58 +0000
Received: by pbcun1 with SMTP id un1so263316pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2012 03:34:55 -0800 (PST)
Message-ID: <1328787423.22240.76.camel@sauron.fi.intel.com>
Subject: Re: [RFC] MTD API rework: Harmonize initialization of
 erase_info->fail_addr
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Thu, 09 Feb 2012 13:37:03 +0200
In-Reply-To: <20120209085556.0f494f05@pixies.home.jungo.com>
References: <20120209085556.0f494f05@pixies.home.jungo.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NtvnyFLiiWAAdE7vp4PX"
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


--=-NtvnyFLiiWAAdE7vp4PX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-02-09 at 08:55 +0200, Shmulik Ladkani wrote:
> Prior MTD API rework, 'mtd->erase()' users needed to initialize
> 'erase_info->fail_addr' to MTD_FAIL_ADDR_UNKNOWN.
> Sometimes it was taken care of by the mtd driver's 'erase'
> implementation.
>=20
> Harmonize this, by initializing 'fail_addr' within the new 'mtd_erase'
> interface.
>=20
> If idea is suitable, can work on a patch (although not immediately).

Sounds good - no need to ask, just send the patch :-)

--=20
Best Regards,
Artem Bityutskiy

--=-NtvnyFLiiWAAdE7vp4PX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPM6/fAAoJECmIfjd9wqK04VwP/2jjbp8fa6gGwjyb+hY1Df4y
wQy6xFQNf1kJelyFiYhYmrBBIjz1YCIL6cf4+lRrcDzXF1o9YMpUYpKvNM/e6LGI
YTozy/kKJjS82Kq8krpT6+WepyqFT89MK0s5FprrVt0rALmKjwhrxMmKb0tMI2ID
6BvXc5RCnFqgPNWT6Nc6NFmqm1rsZS/CGaRWK1gdGMmoGgd/ajyEtpCPShLGrHFc
5cPnHYBkHX9iNI2F0R9rxWsYEsZI7OzeSfS1yqwaydjAYe+jYpVDMXdYDoeA0eI+
HliR4HJeKqy1dJ9Mk9E2lctFGBZmKhflt+cUzP3ACBmkfs85Tn7s9ZrC58Fs2T+N
ZWo90VBkcZGEXlUZcd1RZdk4l+t3XiZmk1lqnyvyP9sQGTGaXu9F+Gv0q6+/GMpL
79ufQOeRuAvCa4mZEU7HLs88gPg+EHtFWHUrkxWRYR+WPeOptp1WsgVB80FiCozv
HBpefCih1AbYGQNeDVB5GaAo5VVHYi042GDjsVenXCiQ+NASlM9a7R4Br75E9Tsy
R08k72sxtEuCJek2yeLDW7QAMl3x9+MD5DVGoMAkPFLPh41xn75xNbMREruIfmgc
N1ggC3NoE6whf6+SX3bJ9Xzc+KBDc41XtTaFVqAGnazAMKQrS34p5w9gNTBIYZ+r
iR0RNuq4OxYM6mMCM89K
=1OM3
-----END PGP SIGNATURE-----

--=-NtvnyFLiiWAAdE7vp4PX--
