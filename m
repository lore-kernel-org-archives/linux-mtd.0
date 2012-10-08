Received: from mail-out.m-online.net ([212.18.0.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLD90-0000hK-3U
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 13:13:15 +0000
From: Marek Vasut <marex@denx.de>
To: =?iso-8859-1?q?Gr=E9gor_Boirie?= <gregor.boirie@parrot.com>
Subject: Re: [PATCH] mtd: m25p80: fix missing MTD module owner
Date: Mon, 8 Oct 2012 15:09:44 +0200
References: <50728A5E.3020102@parrot.com>
In-Reply-To: <50728A5E.3020102@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201210081509.44802.marex@denx.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Gr=E9gor Boirie,

> Marek,
>=20
> Sorry about that. I didn't really mean to submit an official patch at
> first...

No no, nothing to be sorry about actually, we're really grateful you spotte=
d the=20
issue and reported it!

> Nevermind, please find one just below.

Actually, can you try one more time and after commiting the change to your =
local=20
git tree, do "git send-email --to=3D"linux-mtd@lists.infradead.org" HEAD~1"=
=20
please?

Also, it is a good idea to add "Cc: Name Surname <e@ma.il>" lines to the pa=
tch=20
description just before the Signed-off-by line so that the people who will =
end=20
up applying it are CCed. That's at least Artem.

> Regards,
> gregor
>=20
> ---
>  drivers/mtd/devices/m25p80.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 1924d24..06beb3f 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -873,6 +873,7 @@ static int __devinit m25p_probe(struct spi_device *sp=
i)
>  	else
>  		flash->mtd.name =3D dev_name(&spi->dev);
>  +	flash->mtd.owner =3D THIS_MODULE;
>  	flash->mtd.type =3D MTD_NORFLASH;
>  	flash->mtd.writesize =3D 1;
>  	flash->mtd.flags =3D MTD_CAP_NORFLASH;

Best regards,
Marek Vasut
