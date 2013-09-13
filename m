Received: from mail-ea0-x230.google.com ([2a00:1450:4013:c01::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKYNS-0004Zk-K8
 for linux-mtd@lists.infradead.org; Fri, 13 Sep 2013 18:45:59 +0000
Received: by mail-ea0-f176.google.com with SMTP id q16so759175ead.7
 for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2013 11:45:36 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: bcm47xxpart: detect Squashfs partition
Date: Fri, 13 Sep 2013 19:45:29 +0100
Message-ID: <2926043.ie0k1Z5zv6@lenovo>
In-Reply-To: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
References: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le vendredi 13 septembre 2013 18:38:17 Rafa=C5=82 Mi=C5=82ecki a =C3=A9=
crit :
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>

A little commit message would be welcome.

> ---
>  drivers/mtd/bcm47xxpart.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index 9279a91..96f821a 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -32,6 +32,7 @@
>  #define ML_MAGIC1=09=09=090x39685a42
>  #define ML_MAGIC2=09=09=090x26594131
>  #define TRX_MAGIC=09=09=090x30524448
> +#define SQSH_MAGIC=09=09=090x71736873=09/* shsq */
>=20
>  struct trx_header {
>  =09uint32_t magic;
> @@ -167,6 +168,13 @@ static int bcm47xxpart_parse(struct mtd_info *ma=
ster,
>  =09=09=09offset =3D rounddown(offset + trx->length, blocksize);
>  =09=09=09continue;
>  =09=09}
> +
> +=09=09/* Squashfs */
> +=09=09if (buf[0x000 / 4] =3D=3D SQSH_MAGIC) {

So basically buf[0], which is a bit more readable.

Thanks!
--=20
Florian
