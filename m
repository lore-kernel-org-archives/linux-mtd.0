Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SB7fj-0001YX-5B
 for linux-mtd@lists.infradead.org; Fri, 23 Mar 2012 16:49:03 +0000
Message-ID: <1332521515.22278.2.camel@sauron.fi.intel.com>
Subject: Re: [patch] Move CRC computation to separate function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Fri, 23 Mar 2012 18:51:55 +0200
In-Reply-To: <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
 <alpine.DEB.2.00.1202202112220.21022@eristoteles.iwoars.net>
 <1330531826.3545.128.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203191635030.22256@eristoteles.iwoars.net>
 <1332511796.18717.72.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1203231739330.22944@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-x/UXHhAS76QY8NFbR05n"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-x/UXHhAS76QY8NFbR05n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-23 at 17:45 +0100, Joel Reardon wrote:
> When GCing a data node, it may be reencrypted as a means of organizing th=
e
> KSA and reducing the number of LEBs that need to be erased. A Long term
> keys in one half for stable data, short term in the other.  During this
> reencryption the CRC is recomputed. Also, after truncating it the last
> chunk needs to be reencrypted too, or else the key can be used with the
> old version to find the truncated part.

I guess this means there will be more users for this function.

> For the misc.h approach, it does not currently include ubifs-media.h, but
> that is where UBIFS_CRC32_INIT is defined, so move it also to misc.h

Just include it from misc.h.

--=20
Best Regards,
Artem Bityutskiy

--=-x/UXHhAS76QY8NFbR05n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPbKorAAoJECmIfjd9wqK07j4P+gJITDwq7ywgWxe3BjIHfthk
q5BisS0wdoKvlcaJw8+cRr3onLtI/aY5wdQizDjWasjl+59roAIRzvu3v39YQbKs
yH5RytmudlMpDhXqDLtqSdOz+bIJ8r4N4eQY1Qymy+ietFVmQDGsW2cbdwATB8oO
nyBAGjDVwcw3o2f2GWH2/nznePyDJDHERHSLea9Ps7TRoremezRpBaEvfPm+aTxs
JzraHsaPT8Sg08DVeSV5hpnJMJzBb4aZd61b7bUulLjBvC9/4+MvqZlRfgv+mUZL
Jq3utK6dCLu0QGIYHkat5hDT48ZLmjLkCwtduilMUrGus7lyNaAgeIsfFdOw1hhA
7ANhkAsCmPw+i8FLG9UqcTmLXPtlORzu2Y4zgQYXOY+Kj3f0peIC8H0gze0fFdsn
ESQbHemWJDw1MS+jrwbI6VbFXcJCfsFuWCrJDmvH/y//XG33mUtKnGPe2E2L8UBQ
jpxyY0jX41VshXcSaJzl0T5qgNsnAEDBy5IDKLPCqOZt4WaUz3zaR27W6s4qYeyk
d5eTVY/8CmJXXybwpfOtwxkFcwtebrNkw2Cdg1SgQ9s3DLGQASDf7DiiuVdZR5Mh
v224YeFS5twUrAbkSVytTPQnk60PrhGGVZK3bsrKNSdqsVt5PgB7nUULbUugTZA3
1yApQfmHLFA4D2QR9Lvt
=J/fD
-----END PGP SIGNATURE-----

--=-x/UXHhAS76QY8NFbR05n--
