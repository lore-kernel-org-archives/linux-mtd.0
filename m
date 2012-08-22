Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T482e-0000kv-5i
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 10:20:04 +0000
Message-ID: <1345631089.2848.137.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 1/5] sync include/mtd/ubi-user.h with kernel
 v3.6-rc1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 13:24:49 +0300
In-Reply-To: <1345627680-8166-2-git-send-email-richard.genoud@gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-2-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mw0wod5m2TJcMKuCClV+"
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


--=-mw0wod5m2TJcMKuCClV+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 11:27 +0200, Richard Genoud wrote:
> @@ -21,6 +21,8 @@
>  #ifndef __UBI_USER_H__
>  #define __UBI_USER_H__
> =20
> +#include <linux/types.h>
> +

And I dropped this chunk.

--=20
Best Regards,
Artem Bityutskiy

--=-mw0wod5m2TJcMKuCClV+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNLNxAAoJECmIfjd9wqK09PMP/jTOi0EIJZA+mQ05XH2La4hT
qHg6tAmwMeiWJZ5tTDXrqz9OdxHJ17ehzD7py7I00WxcLGmevwe9IzPY9Rzt9Zcz
G0AguXFqz2s7LDGhan270p6TUGfp+zLkUbsAFjEJCb5nOOG6TV+KGfe9z72hCJS0
08dlIka/I0BZ/iXjR/QLIP+LOXwd9QHzPpVDBxpUn2edHbSDM0c8/Gky6QWyoP/B
YE4kEYDDHvCpt0AbOnQL3rrIec/8S/GRmBdwWW/hO4moMlqQljhdwmuNDHmOukoF
7SizADQiBaj94xKwwJlkjxu4X8n/ww9lFDDNc3I4lmXP0lFpX7JWu06/BA5jTMW2
cgjGfHAjYjb6vpS0vPmOD7eByZCTtCWA/Aez2cCdtPJk36OfcAA46r1dH60ESZif
dQIT8j2skjc0vEEHVIZJyMvNaq5lhkOdiW5URijHMzwv8LzWE4U+TH4XBZEJ7JHh
pvGYTQ6V0vTxsEyNmgKN6kDnrA1ekKqquTMfdCqS8lX8xlNmi+jB0bwVu3ucRGe8
3QoqV2sa0lMSYHhcyh7MYE1wUWfxPUMOHy7pyFm7TVKc9NKD4d/bFQvWC2rsd/qu
MYZTJ3cBDpxSwJJRWZAvtY2Te5ex+PiznyjBUxvRVVeKkyXQ1hPPaMainLhxZTAH
ab53KRYrtfRuZMKu0v+g
=E6fh
-----END PGP SIGNATURE-----

--=-mw0wod5m2TJcMKuCClV+--
