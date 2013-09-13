Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKare-0007Zq-S5
 for linux-mtd@lists.infradead.org; Fri, 13 Sep 2013 21:25:20 +0000
Received: by mail-ee0-f44.google.com with SMTP id b47so836008eek.17
 for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2013 14:24:55 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V2] mtd: bcm47xxpart: detect block aligned Squashfs
 partition
Date: Fri, 13 Sep 2013 22:24:51 +0100
Message-ID: <2030071.nWr24CInOj@lenovo>
In-Reply-To: <1379103930-3987-1-git-send-email-zajec5@gmail.com>
References: <1379090297-2880-1-git-send-email-zajec5@gmail.com>
 <1379103930-3987-1-git-send-email-zajec5@gmail.com>
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

Le vendredi 13 septembre 2013 22:25:30 Rafa=C5=82 Mi=C5=82ecki a =C3=A9=
crit :
> Most of the bcm47xx devices use TRX format for storing kernel and som=
e
> partition like Squashfs or JFFS2. This is pretty flexible solution, C=
FE
> (the bootloader) just writes (and later boots) TRX at some hardcoded
> place and paritions can vary in the size.
>=20
> However some devices don't use TRX format. Very recently we have
> discovered ZTE H218N that has kernel and rootfs partitions at some
> "random" places.
>=20
> This patch allows Linux find a rootfs partition after installing cust=
om
> image with a CFE bootloader.
>=20

This looks much better, thanks! Couple of nitpicks below.

> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/bcm47xxpart.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
> index 9279a91..61213f9 100644
> --- a/drivers/mtd/bcm47xxpart.c
> +++ b/drivers/mtd/bcm47xxpart.c
> @@ -32,6 +32,7 @@
>  #define ML_MAGIC1=09=09=090x39685a42
>  #define ML_MAGIC2=09=09=090x26594131
>  #define TRX_MAGIC=09=09=090x30524448
> +#define SQSH_MAGIC=09=09=090x71736873=09/* shsq */

You could include uapi/linux/magic.h and use the SQUASHFS_MAGIC constan=
t=20
directly, sorry for not noticing earlier.

>=20
>  struct trx_header {
>  =09uint32_t magic;
> @@ -167,6 +168,13 @@ static int bcm47xxpart_parse(struct mtd_info *ma=
ster,
>  =09=09=09offset =3D rounddown(offset + trx->length, blocksize);
>  =09=09=09continue;
>  =09=09}
> +
> +=09=09/* Squashfs on devices not using TRX */
> +=09=09if (buf[0x000 / 4] =3D=3D SQSH_MAGIC) {

In theory le32_to_cpu() should be used to mimic what init/do_mounts_rd.=
c does=20
but we do not support big-endian BCM47xx devices yet so this probably d=
oes not=20
matter much.
--=20
Florian
