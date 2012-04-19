Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SKyD7-0003EX-N6
 for linux-mtd@lists.infradead.org; Thu, 19 Apr 2012 20:44:15 +0000
Received: by eaak13 with SMTP id k13so2347714eaa.36
 for <linux-mtd@lists.infradead.org>; Thu, 19 Apr 2012 13:44:11 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH] MTD: bcm63xxpart: handle Broadcom partition order
Date: Thu, 19 Apr 2012 22:44:07 +0200
Message-ID: <2162174.ToTc5ziCmi@bender>
In-Reply-To: <1334834157-16860-1-git-send-email-jonas.gorski@gmail.com>
References: <1334834157-16860-1-git-send-email-jonas.gorski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 19 April 2012 13:15:57 Jonas Gorski wrote:
> The original Broadcom partition order has the root fs in front of the=

> kernel, which resulted in miscalculated partition sizes.
> Detect when such an image is on the flash and also reorder the partit=
ions
> accordingly.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Acked-by: Florian Fainelli <florian@openwrt.org>

> ---
>=20
> This patch is made on top of l2-mtd.
>=20
>  drivers/mtd/bcm63xxpart.c |   41 ++++++++++++++++++++++++++++++-----=
------
>  1 files changed, 30 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
> index 608321e..63d2a64 100644
> --- a/drivers/mtd/bcm63xxpart.c
> +++ b/drivers/mtd/bcm63xxpart.c
> @@ -4,7 +4,7 @@
>   * Copyright =A9 2006-2008  Florian Fainelli <florian@openwrt.org>
>   *=09=09=09  Mike Albon <malbon@openwrt.org>
>   * Copyright =A9 2009-2010  Daniel Dickinson <openwrt@cshore.neomail=
box.net>
> - * Copyright =A9 2011 Jonas Gorski <jonas.gorski@gmail.com>
> + * Copyright =A9 2011-2012  Jonas Gorski <jonas.gorski@gmail.com>
>   *
>   * This program is free software; you can redistribute it and/or mod=
ify
>   * it under the terms of the GNU General Public License as published=
 by
> @@ -82,6 +82,7 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_=
info
> *master, int namelen =3D 0;
>  =09int i;
>  =09u32 computed_crc;
> +=09bool rootfs_first =3D false;
>=20
>  =09if (bcm63xx_detect_cfe(master))
>  =09=09return -EINVAL;
> @@ -109,6 +110,7 @@ static int bcm63xx_parse_cfe_partitions(struct mt=
d_info
> *master, char *boardid =3D &(buf->board_id[0]);
>  =09=09char *tagversion =3D &(buf->tag_version[0]);
>=20
> +=09=09sscanf(buf->flash_image_start, "%u", &rootfsaddr);
>  =09=09sscanf(buf->kernel_address, "%u", &kerneladdr);
>  =09=09sscanf(buf->kernel_length, "%u", &kernellen);
>  =09=09sscanf(buf->total_length, "%u", &totallen);
> @@ -117,10 +119,19 @@ static int bcm63xx_parse_cfe_partitions(struct
> mtd_info *master, tagversion, boardid);
>=20
>  =09=09kerneladdr =3D kerneladdr - BCM63XX_EXTENDED_SIZE;
> -=09=09rootfsaddr =3D kerneladdr + kernellen;
> +=09=09rootfsaddr =3D rootfsaddr - BCM63XX_EXTENDED_SIZE;
>  =09=09spareaddr =3D roundup(totallen, master->erasesize) + cfelen;
>  =09=09sparelen =3D master->size - spareaddr - nvramlen;
> -=09=09rootfslen =3D spareaddr - rootfsaddr;
> +
> +=09=09if (rootfsaddr < kerneladdr) {
> +=09=09=09/* default Broadcom layout */
> +=09=09=09rootfslen =3D kerneladdr - rootfsaddr;
> +=09=09=09rootfs_first =3D true;
> +=09=09} else {
> +=09=09=09/* OpenWrt layout */
> +=09=09=09rootfsaddr =3D kerneladdr + kernellen;
> +=09=09=09rootfslen =3D spareaddr - rootfsaddr;
> +=09=09}
>  =09} else {
>  =09=09pr_warn("CFE boot tag CRC invalid (expected %08x, actual %08x)=
\n",
>  =09=09=09buf->header_crc, computed_crc);
> @@ -156,18 +167,26 @@ static int bcm63xx_parse_cfe_partitions(struct
> mtd_info *master, curpart++;
>=20
>  =09if (kernellen > 0) {
> -=09=09parts[curpart].name =3D "kernel";
> -=09=09parts[curpart].offset =3D kerneladdr;
> -=09=09parts[curpart].size =3D kernellen;
> +=09=09int kernelpart =3D curpart;
> +
> +=09=09if (rootfslen > 0 && rootfs_first)
> +=09=09=09kernelpart++;
> +=09=09parts[kernelpart].name =3D "kernel";
> +=09=09parts[kernelpart].offset =3D kerneladdr;
> +=09=09parts[kernelpart].size =3D kernellen;
>  =09=09curpart++;
>  =09}
>=20
>  =09if (rootfslen > 0) {
> -=09=09parts[curpart].name =3D "rootfs";
> -=09=09parts[curpart].offset =3D rootfsaddr;
> -=09=09parts[curpart].size =3D rootfslen;
> -=09=09if (sparelen > 0)
> -=09=09=09parts[curpart].size +=3D sparelen;
> +=09=09int rootfspart =3D curpart;
> +
> +=09=09if (kernellen > 0 && rootfs_first)
> +=09=09=09rootfspart--;
> +=09=09parts[rootfspart].name =3D "rootfs";
> +=09=09parts[rootfspart].offset =3D rootfsaddr;
> +=09=09parts[rootfspart].size =3D rootfslen;
> +=09=09if (sparelen > 0  && !rootfs_first)
> +=09=09=09parts[rootfspart].size +=3D sparelen;
>  =09=09curpart++;
>  =09}
--=20
Florian
