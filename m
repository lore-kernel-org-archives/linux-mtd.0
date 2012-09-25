Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGVlR-0000Om-GK
 for linux-mtd@lists.infradead.org; Tue, 25 Sep 2012 14:05:30 +0000
Message-ID: <1348581931.24309.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] MTD: nandsim: BUG: Fail if overridesize is too big
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 25 Sep 2012 17:05:31 +0300
In-Reply-To: <1347452786-10208-1-git-send-email-richard.genoud@gmail.com>
References: <1347452786-10208-1-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iKOTNijQOI1AxXZUcoh1"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-iKOTNijQOI1AxXZUcoh1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-12 at 14:26 +0200, Richard Genoud wrote:
> If override size is too big, the module was actually loaded instead of
> failing, because retval was not set.
>=20
> This lead to memory corruption with the use of the freed structs nandsim
> and nand_chip.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Pushed to l2-mtd.git, CCed -stable.

--=20
Best Regards,
Artem Bityutskiy

--=-iKOTNijQOI1AxXZUcoh1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYborAAoJECmIfjd9wqK0rRAP+wZJ7Na9hqA5/scCNQEcihMF
IYMYyduBpLWzMgZWfD8SJL5/Tc3Tbi1Je6v+YHvvAE0/1RujjKHOslIIUuJ44FZx
QGpMouWeDmhM57EzDgbj4wJjlFYEz2B8y488kabIgXNxV6WFxzg5rb4jZcV9aBqG
Vi2Zybyzkv5yrK+wCii+MMKXqW5ZV9wqnYQj4PtX154V6FKZa3fCdEmRLgtKQUjr
H6S1nPnnUmylLmymKs3YwdxpViqajaVl9rpOzQnJftWgwQhc12miv3fq4xFL5q5M
hs60MRcPbnkF/YIijoMi0nxWRm/IKkFnFHRwCc6Wnmqvvcg8ogbofGr5YC3EIz2i
TXBanwyPIvzqY8aK7eIjaraviCtPPQTTf5GzgF6KAfx7hqJpJwtjor3Fn5S+9wFO
gxVb+r97vt2suZyeiBTLMNY4yzzrOH3UrzVowEd3vJAzm/7R4+q+iRQxeGh2dOnB
T00OHV1vX2CsDdqjxmvUOCGQv35iJBb1VzQZnhowQxStF4iH6wURmIeVEk7McSR9
oMChCbHbrDCFAzPjJXFY3M80A/vZg5i40Y03YblnDk5FiCAi7zPe6K4vbV1Hb7TR
Z1xVrNA0jlYg7JY8Qzf7m0BvKPxHzT75zvbemcPhed+R9wF50emX3tkB6+IhwOhE
NC1IkmznozMPsJKvRVDI
=CtJx
-----END PGP SIGNATURE-----

--=-iKOTNijQOI1AxXZUcoh1--
