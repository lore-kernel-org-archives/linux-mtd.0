Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T617k-0001J8-IK
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 15:21:09 +0000
Message-ID: <1346081158.2848.363.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] nand: nand_bbt: Export nand_update_bbt
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Mon, 27 Aug 2012 18:25:58 +0300
In-Reply-To: <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
References: <1343514565-8983-1-git-send-email-festevam@gmail.com>
 <1343514565-8983-2-git-send-email-festevam@gmail.com>
 <1345734503.2848.247.camel@sauron.fi.intel.com>
 <CAMiH66GeHEet7NUNn+NPJKY9LgWf1whPgOXdQOFAZZUraWMnOw@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Fro8DNOfvkDM4JVV9JuA"
Mime-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>, dwmw2@infradead.org,
 b32955@freescale.com, linux-mtd@lists.infradead.org, marex.vasut@denx.de,
 kernel@pengutronix.de, shawn.guo@linaro.org,
 Fabio Estevam <festevam@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Fro8DNOfvkDM4JVV9JuA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 11:36 -0400, Huang Shijie wrote:
> > Why this driver redefined ->block_markbad() at all, it is not supposed
> For hardware reason, in mx23, the bad block mark is stored in the
> first byte of the nand page;
> in mx28/mx50/mx6q, the bad block mark is stored in the first byte of the =
OOB.
>=20
> That's why the driver redefined the ->block_markbad().

OK. Would you please tell about the driver some more, I am particularly
interested how th mx23 case works.

* So the bad block marker is the first byte of the eraseblock set to 0?=20
* What if the user data stars with zero? Or you hide the first NAND page
  from the user?
* Can you point me to the code where you check if the eraseblock is bad
  or not at the initialization time (sorry, I could find myself,
  by trying to save time).

--=20
Best Regards,
Artem Bityutskiy

--=-Fro8DNOfvkDM4JVV9JuA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQO5GGAAoJECmIfjd9wqK0pUQP/ioTCjrfoF7sMN6f8a9SeKq8
jxS7UpRBM02+yF8xSlWNN4c0zkwV2F7Sdml0ns3oIttVAQqVHDX8huFS714+0A86
1SVtBlB1Ba41+3k3bcsELLPzXYO4Zr7P+0XTkEh4LoL5Fa2Jffe6EYLl3/3JPgih
sim4MeaHvzLiqFtQYS28aVZTHWTiXp2ftDYrtPHxZ4pfuB4CFBagrnoFxrurKA5G
15kcTHe7me9FXsUBsXpDogysgAUMROdaZzDfvZOK252qcvTkmhEui4ZH8SmDMUUg
xHgAOy0TyVSyuOPfad0gJT9dF4D2IzQfAY3Txq+WaGmETXyfkpOAV/Zt/t9lS2VT
FjBSkDfQFEl51QDTtnxEf5YQsx3R6NiaNnVdRxUlf31nrZMIfRGDkqjfxP2uP61/
k7uHhUFV1vnvPkAfACbIkQ/G/BpYzYw9lBMj7HbzZPQs6AF7+VsvHEMtQt8hmzoH
WhNJZT4oXDP0WKgxpOmTtEp3cFNobzMeD+/4on/Fb7dAChi0VosVkyyIc8FDiCE0
vFM0sQRc7n9DTZR8Gap+ko0w9Fl9datu6jD0sjkchg38dJ5bDqCwZde6mK4TLGs5
7mg/w0uK9nTbpMzIUvQlx74ApiQ/hfNeyzllecSJbqzI2FEF65Yt1A2u3BROjIk9
8Z8eCQn4fpCH0CYS+tQ5
=qA3b
-----END PGP SIGNATURE-----

--=-Fro8DNOfvkDM4JVV9JuA--
