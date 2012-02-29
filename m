Content-Type: multipart/mixed; boundary="===============1250292779=="
MIME-Version: 1.0
From: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd :  change the location of the ONFI detected log
Date: Wed, 29 Feb 2012 15:08:26 +0000
Message-ID: <1330528256.3545.124.camel@sauron.fi.intel.com>
References: <1329448957-9756-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1329448957-9756-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "ffainelli@freebox.fr" <ffainelli@freebox.fr>
Reply-To: "Bityutskiy, Artem" <artem.bityutskiy@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--===============1250292779==
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-BO2ZHxc/1cKQdkoNX4PQ"

--=-BO2ZHxc/1cKQdkoNX4PQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-02-17 at 11:22 +0800, Huang Shijie wrote:
> Some strange nand chip(such as Hynix H27UBG8T2A) can pass the `ONFI` sign=
ature
> check. So the log can be printed out even it is not an ONFI nand indeed.
>=20
> Change this log to the end of the function. Print out the log only when w=
e
> really detect an ONFI nand.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-BO2ZHxc/1cKQdkoNX4PQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPTkABAAoJECmIfjd9wqK0uIcQALIjMobD/ZvKV1CdG93UAhI/
n64m6uPspx/1fqM/W79s5DcXB+YXemc81jrhZWDyPH3bK7m3fCksIXQoB29Kj6Og
Jhrbiplno5qPVOiLUEZZRo/Wo3zegaHZXIzdkQplIiYzhu3vJqcNB+2PP5X2My/e
W9lgpaOBThQpR5z5YBr3HWXrTWU2Q0JiZz8FFB8cD3USa3hRzcMJ5a9+xpEtKHEj
NMgXlglYBrsA/LPIdixG2+z4aTulSezOfgFtqqbOCDCOaAO0mymFbXGjhh1OtTOc
kAVwz6AgogzVaAcvs2pV1BaAOIhsSxlAHIobwtTwLEZpwhgZ1n46MqMJprSGJ9Mj
xv8Nxywrj4zsowGj+iFrTXSYX4LVmGwAOX/udlucHKZYOq0HfUBBrGokdylE9plh
BdqdeL1b/KI5+cCyd3UfQEbTt2p8aQp9MmpC2+3DdybZEKFs4NrFocOQN4EHl1s5
fQycA8uCZEb2RQgj9r8iOjbarsDtP1978tIABN8HQXu5t1HCqyt6DHVhG6T00WuX
fZpbeICvZCyz1sdMNPg7Jy7K8G5cWEkku36P+Yes1iGfbzhCKU+5cwNrafarJZQF
3Yi3fMJ6Zb3THnV4wLrDDHbIWsXMuljoopLQGB3m6Gxm0kw6M+5J8rbHl9wMT8qd
jmsOluHsYOKsqgXM6QwW
=jshK
-----END PGP SIGNATURE-----

--=-BO2ZHxc/1cKQdkoNX4PQ--

--===============1250292779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki =

Business Identity Code: 0357606 - 4 =

Domiciled in Helsinki =


This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

--===============1250292779==--
