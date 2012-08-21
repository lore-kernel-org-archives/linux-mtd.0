Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3oVJ-0006Py-4t
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 13:28:21 +0000
Message-ID: <1345555983.2848.106.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] UBI: introduce MTD_PARAM_MAX_COUNT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 21 Aug 2012 16:33:03 +0300
In-Reply-To: <1345552402-25190-1-git-send-email-richard.genoud@gmail.com>
References: <1345552402-25190-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-8HBrQTFLVji+s16MGs0v"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-8HBrQTFLVji+s16MGs0v
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-08-21 at 14:33 +0200, Richard Genoud wrote:
> Here is the patch accidentally dropped.
> I rebased it on linux-ubi/master (9baf0a2) and made sure the other ones:
> * UBI: replace MTD_UBI_BEB_LIMIT with module parameter
> * UBI: add ioctl for max_beb_per1024
> * UBI: drop CONFIG_MTD_UBI_BEB_LIMIT
>=20
> still apply correctly (and they still do, so I don't resend them).

Thanks Richard, I said that I returned it, but I forgot to push. Now I
actually pushed the changes out.

--=20
Best Regards,
Artem Bityutskiy

--=-8HBrQTFLVji+s16MGs0v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQM44PAAoJECmIfjd9wqK0H9sP/jP9/N1SbSJS5wRx5yZz3aBT
JQcnZNeJO0HJgWzwaVDSPeX9AtR+GO6BzpfNKac8pUHrcal6LedYxGoJkHrPgNou
HJcTs4AKDBh3lNwt19z6j0Seays9x3WFM/q+XD15t84HGqRSjm6v3Xc1G1Dr6F3f
zjTbcsnhI7cIJG3KUhLVb5f8nj1/hq/OBoophmtQtgR/scMq0gxBwOa89+KS4ssB
IIz05pkM6hQTrGT5DNxhiVQufIthLQpHFLUeginnpCNw98owlK9yC5GFLm4LW+tO
oWEDjimTcicqqRMA1Xn5GAozuAYg1kaa7xyJr8rEXbhSON4jGvQUVYPdP76JXiIa
nhNrBRaVs0eiE7ACmFVbbvcEOF/VgPP9NGvAs697eRhmavskSnDLTRUQEq2OwgAf
UPyp3YaTccEktArt/fYOkkYVpJwOyxDVYxVd7UVKdOz6zdUOwTJDfaf3tp3WMUVk
XiVDM4BAJum4yjn/LM0cCNckHjSdE3PVyPt5EfDuqBZhC4UuwXIkDIRf/+GgSoEy
xH0X8mENnDiAsI/YcyAGXxEhTPpFjdUXAIFShb0/AHgSeaN08kIM3AuOoaJrLQb2
oO7LsXLXLOUAcZtwztzPzB3abVDZNOPlsAwtq4tHnCbGSV2GF+5SkZXsOLaK4/ju
3/Bufqpc7TtLSglEBwO7
=kJ7W
-----END PGP SIGNATURE-----

--=-8HBrQTFLVji+s16MGs0v--
