Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4sR9-0000P2-2I
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 11:52:27 +0000
Message-ID: <1345809435.2848.297.camel@sauron.fi.intel.com>
Subject: Re: Mainline status about MTD drivers (Atmel at91 PMECC)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Fri, 24 Aug 2012 14:57:15 +0300
In-Reply-To: <502A26BB.8050705@atmel.com>
References: <502A26BB.8050705@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-EAnh/3RmpBYIRNwpMTd+"
Mime-Version: 1.0
Cc: stigge@antcom.de, dwmw2@infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-EAnh/3RmpBYIRNwpMTd+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-14 at 18:21 +0800, Josh Wu wrote:
> Hi, David
>=20
> I just notice the thread about the mainline of MTD drivers:=20
> http://article.gmane.org/gmane.linux.drivers.mtd/42792
>=20
> I am in the same situation as Roland. (the Atmel PMECC patches are=20
> pushed in l2-mtd during v3.5 phase). So I am wondering whether there is=
=20
> any chance those patches can go into v3.6-rcx mainline. I will be very=
=20
> appreciated if it can go into v3.6. Thanks.

The MTD subsystem missed the 3.6 merge window, so the stuff that was
scheduled for 3.6 will only get merge to 3.7.

--=20
Best Regards,
Artem Bityutskiy

--=-EAnh/3RmpBYIRNwpMTd+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN2wbAAoJECmIfjd9wqK0CTYQAKRzDv1Ig15oZKTLUWkIjLNX
c4yA2RJW1zeNPEAD5IXzi7pSCgy1U8ocwplVpZAr4LwXdu0KrADiNZZcrZ0n4XVx
fWwPQy92qxhxF5+tOyIbKi1co/AfhPQhPpSAiXVeB8aYE8ynNDUTf/+QkWgy0GlM
Kiy6CrnXyaBB7nOyJkgvRFwBpXKTteLDOx3VUNy3DVomL+kCwhE4Sa4IMjknCvV1
sTkwHHRf3TfiuXx0u7cEbQXDdqizvjlzbQt0RFdYT71hsyfYDDiGodHD0sQcauLF
gHAz4XMcMmmHrfoknYJ+KJKebaQj3PfPwbmomMrZwBJLYG8VJJLRLWFMWHTyXnMW
Rq+DlfQCq0Vnjn+60sDCGNPcaCTk9VYvFEw0z4CeUV0bJuHzvIWPt35QmO+VtE3z
9W/i8jgxUD8HoC0DXimsVe76W9g2oSFm2dCi77u4YibdzWr84sbmvD0MZSUwxVj9
mQyWMNk3ALW5gyb2YKuuzIgzfgnRE5pWZ4LWHOMhJA8qCgN6OIayyoQlUPyJDu0j
OM5XBl6l440NxftMuIjjXVS1ntRMfMH1CxoZGnhbfdcGmjUt1Im1IFoe627zBIIX
t769lDqfUf6r4njjYJyxjeyZbZ7zwYPwjnJrxLWV/lY21wFdVQKfsOyX6j1EDDL5
25wuBQ4ToFAM5Rt3Fp9b
=ERsS
-----END PGP SIGNATURE-----

--=-EAnh/3RmpBYIRNwpMTd+--
