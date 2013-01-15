Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv3ue-0003iN-VT
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 10:38:38 +0000
Message-ID: <1358246400.2731.123.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Kconfig: drop utf8 characters
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Martin Walch <walch.martin@web.de>
Date: Tue, 15 Jan 2013 12:40:00 +0200
In-Reply-To: <1568980.QkbR4hXzWB@tacticalops>
References: <1353971245-26735-1-git-send-email-wolfram@the-dreams.de>
 <1353971928.2383.18@tyr> <1354541353.11583.12.camel@sauron.fi.intel.com>
 <1568980.QkbR4hXzWB@tacticalops>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IGutuGEyy3oqH1r7W/ik"
Mime-Version: 1.0
Cc: Scott Wood <scottwood@freescale.com>, Wolfram Sang <wolfram@the-dreams.de>,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IGutuGEyy3oqH1r7W/ik
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-17 at 04:27 +0100, Martin Walch wrote:
>=20
> To make a long story short: multibyte characters in Kconfig files lead to=
=20
> undefined behaviour. This is no implementation bug. The configuration sys=
tem=20
> just has not been designed for processing them. So utf-8 support can not =
be=20
> achieved with an easy fix, but will need comprehensive changes.
>=20
> I do not know if anyone is willing to actually make all the necessary wor=
k to=20
> properly support utf-8 in the configuration system. However, I suppose th=
is=20
> will not happen any time soon. Therefore I suggest removing the multibyte=
=20
> characters for now.=20

Sure, thanks for a detailed analysis. What I agree with is removing
non-ASCII characters in case they cause a functional or build problems,
just because, as you said, fixing Kbuild is a big task.

However, in this particular case, this is just about user seeing rubbins
in the configuration menu, which is not a big deal, I think, so I would
prefer to rather expose the issue than fix it.

--=20
Best Regards,
Artem Bityutskiy

--=-IGutuGEyy3oqH1r7W/ik
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9TIAAAoJECmIfjd9wqK0MjEP/0jgIoxpe1rE5d49hZ1l8wml
jpiF+qGEZallsEndcxpaIBCA33xhHNQR4Q1XX/bS3xtBZJeIni/fVMbRaCrOrZaI
tf0HxI+X1qDW+QnSmMjdBsg4pFZrUnIDi/gz8vpDnQFrPG+wWI6BgYspdh/7rjVt
Kybg5Clh9c+CkScoerrT+w1KL2w5bt9iOZdyRMrH8VVYE0uRslgVOdWInro5Q9+N
t5a1ZPPWljwxCvmfBzXKLxYbdzD2lMpBckPHM71SrTIINDnu9C61ROKdCyW0hDD5
St4k4MieUehs15lk2FW4DQWEZHEsJJBP3HVXKKm6TzGXy0sRyDP/4rDcYhTUbGEZ
NsSsbX/8CkFJDbrlnHkYK9C7duJmwRp0XvC/Crie0W9MIlTbYvrwd3erxozgrrvl
z5WBo/RE5V+Ip5tHHrX7P566fLgcEqDY/NSxnVt9PXK0fAerIURmdYTc9N8VOkpW
uF9A3nRFOPuP32qWy078N0HTBpEERSxIJ5VC5HEGEt1wvDMmo6UgFVvTYA54W+3c
bhKlpJJB/+Btau9D0zx5gqSW9EmHUHZ1rbvg2T31WS9cs8SqoOWj9HBLaj2SUFGv
LteDQpfHOAWYFb9t/jAIAF87N6Ccjjbk/PSSuZaSe9clzpAeNPx0f1IIr3wfcMOk
ugNgbOlImC3GLUIjykw1
=/CUZ
-----END PGP SIGNATURE-----

--=-IGutuGEyy3oqH1r7W/ik--
