Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYztu-0000ZV-5J
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 13:54:38 +0000
Message-ID: <1352987717.2221.54.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] nand_wait_ready timeout fix
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Thu, 15 Nov 2012 15:55:17 +0200
In-Reply-To: <1352123511-31538-1-git-send-email-matthieu.castet@parrot.com>
References: <1352123511-31538-1-git-send-email-matthieu.castet@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lT/DdVuNgCAw9hKAW37N"
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


--=-lT/DdVuNgCAw9hKAW37N
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-11-05 at 14:51 +0100, Matthieu CASTET wrote:
> nand_wait_ready timeout should not assume HZ=3D1000.
> Make it independent of HZ value like it is done in nand_wait.
>=20
> Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
> ---
>  drivers/mtd/nand/nand_base.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d5ece6e..ee49fe2 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -492,7 +492,7 @@ static void panic_nand_wait_ready(struct mtd_info *mt=
d, unsigned long timeo)
>  void nand_wait_ready(struct mtd_info *mtd)
>  {
>  	struct nand_chip *chip =3D mtd->priv;
> -	unsigned long timeo =3D jiffies + 2;
> +	unsigned long timeo =3D jiffies + (2 * HZ) / 1000;

I HZ=3D100, (2 * HZ) / 1000 will be 0, which is probably wrong.

Instead, this cruft should be re-worked and should use milliseconds for
time-outs, and use things like 'msecs_to_jiffies()' instead.


--=20
Best Regards,
Artem Bityutskiy

--=-lT/DdVuNgCAw9hKAW37N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpPRFAAoJECmIfjd9wqK07q4QAJo3MceydQX+Lg/Op8+TwwKn
FgZPyWFpMVyHyAcaBw92sqv5HQS4R6Wowh5u73sYRbF3tTXND79LJPQcX7lpoNnE
gv7eSf3tN8qKI4T8B3MoRfainAEvIgtFiFMrPmb2xxr3ctso8TNgm6COy0NSFNOi
cKHNB2MKB3Ip7AZCZ7CcnLSVTSHZ4Lf/wgypsyeMoDvoSbKas2TfvhKezHt5r95i
eohLYiXCd0R/N/TNQXjkT8bXFQ5Us9lfGNkeAGtarb/dn3SuXPhyh8zcVoInRB96
d5AtbsdaNcT4M3xEh5vk+1Uvozh1Xw65IlXb4iyyBiyFoUQUpsBVwQ3D0uChwrBY
p4zws28C6qUj1dAJ5y6ZMQ70JcqzIzf8+xfqEwsSkVxQTMGQFfPeG0fkqb3P8mx3
VJ7XTO852ctkoOT+uMfW1mxMf7legJCqxZuxZ/KmsWlXe4URtgkNbPCiyLwzYysE
p84r1nNl/oMxq3DVRg3Jh0n/nupA30eAdn+BcIv8TeblMqu6DbNwtUA+Xrx6l+Ye
qigss3y2WelSq+XhlbITRoLaQvcgFvOiPIvo3acTDrrByaAU1M5AuML6TGvhKLGh
oB9woxf2ho0PxC1Jp/4kclATh/yIpKmyiR0Sink1zEr3Am5QLOTOd6PMAuylcsic
F8CQ7MMKQpPr/RaLSsfQ
=LNOc
-----END PGP SIGNATURE-----

--=-lT/DdVuNgCAw9hKAW37N--
