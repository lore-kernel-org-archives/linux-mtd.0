Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2Kn7-0007MO-1E
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 11:32:38 +0000
Message-ID: <1345203441.27859.56.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/2] GPIO control of physmap-ed chip's VPP
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Pawel Moll <pawel.moll@arm.com>
Date: Fri, 17 Aug 2012 14:37:21 +0300
In-Reply-To: <1342111121-23161-1-git-send-email-pawel.moll@arm.com>
References: <1342111121-23161-1-git-send-email-pawel.moll@arm.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lZGBtJ+5Wf7dQbTgNkhO"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lZGBtJ+5Wf7dQbTgNkhO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-12 at 17:38 +0100, Pawel Moll wrote:
> Hi All,
>=20
> Some time ago physmap driver gained "set_vpp" platform function. That's
> good but it can't be used on a Device Tree platform. This micro-series
> adds the necessary bindings in the physmap_of driver, and - to keep
> harmony in nature ;-) - makes similar change in the "normal" physmap
> driver.

Hi, would you please re-send it with the following mailing lists in CC
as well:

devicetree-discuss@lists.ozlabs.org
linux-arm-kernel@lists.infradead.org

--=20
Best Regards,
Artem Bityutskiy

--=-lZGBtJ+5Wf7dQbTgNkhO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLizyAAoJECmIfjd9wqK0yLEP/3doKp+/UfxGi9GPAgBEXxmk
nRo/3v/j1nokBq/pWmaxiT4qILs8MoKOLiLtSbGlnaLfnBrTCXdpDkyHIsjqLrZw
DhAvCMOMJtyRwdX6+lr+WKF6f4qQAhorl/hb4ivZ8sl6glrE9XRHr+ECGrK0BkpV
Jr8W1PJnRCP68hi82GKPqLlK9Z7FChT1tPjZEqb9e3PZxL0DtNVxM3Dj8gSwspf7
NbdfSj1I97sl/X5nJt7dSRH29WT/wyj53IEstaoTTtH05As168ocgjHu1vVjgeLR
ZexuMMsTRlP2h2CCxH9G/JvuZUJBfotC+SBkqdQNg8IR/n29Nj71TBJgFte8Zxkk
t7uX9SaMSmBMwKXErzktGELVCkXtlC3+bZlU1pbOwG7b4qwXM4aGllp2a4Xa4LE/
RSlk/d9UEIDqtAQevAcF3bls1Weddn2F8Q9zIBEoxjNp6zefWkqh3pWUr2Iy4zHL
Ve/ySJWLl32m3F4No9Nwfl5UbLf4+IV0G8kLiHGv9IPP82urnHY2YO3m0HmXEI6A
DnkLEAznfUcR/xNvi9SlvDP6P//43iEop6J2Sy6TfpPx+djDhva0/MPIbmSCQGir
iy0ZljTkczkTIfeO/Z/aiWHBzpFvAtpJbBjtWxNUNe7VaoV+LqWjNp2xtKfwAym0
Lg+1Z48/NG4LqpdAM4Ng
=4CQb
-----END PGP SIGNATURE-----

--=-lZGBtJ+5Wf7dQbTgNkhO--
