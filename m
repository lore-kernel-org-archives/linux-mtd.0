Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exfbr-0000fx-D6
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2018 21:12:57 +0000
Date: Sun, 18 Mar 2018 22:12:31 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, Kyungmin Park
 <kyungmin.park@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 1/2] mtd: onenand: Get rid of comments giving the file
 path inside the file itself
Message-ID: <20180318221231.4645cd9f@bbrezillon>
In-Reply-To: <20180218160516.27946-1-boris.brezillon@bootlin.com>
References: <20180218160516.27946-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 18 Feb 2018 17:05:15 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> Some files add a comment giving the path of the file inside the Linux
> tree, which is pretty useless since the reader had to find the file to
> open it.
>=20
> Getting rid of these comments will also allow us to easily move these
> files around when needed.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Queued both patches to nand/next.

> ---
>  drivers/mtd/onenand/generic.c      | 2 --
>  drivers/mtd/onenand/omap2.c        | 2 --
>  drivers/mtd/onenand/onenand_base.c | 2 --
>  drivers/mtd/onenand/onenand_bbt.c  | 2 --
>  4 files changed, 8 deletions(-)
>=20
> diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
> index 125da34d8ff9..d5ccaf943b91 100644
> --- a/drivers/mtd/onenand/generic.c
> +++ b/drivers/mtd/onenand/generic.c
> @@ -1,6 +1,4 @@
>  /*
> - *  linux/drivers/mtd/onenand/generic.c
> - *
>   *  Copyright (c) 2005 Samsung Electronics
>   *  Kyungmin Park <kyungmin.park@samsung.com>
>   *
> diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
> index 87c34f607a75..9c159f0dd9a6 100644
> --- a/drivers/mtd/onenand/omap2.c
> +++ b/drivers/mtd/onenand/omap2.c
> @@ -1,6 +1,4 @@
>  /*
> - *  linux/drivers/mtd/onenand/omap2.c
> - *
>   *  OneNAND driver for OMAP2 / OMAP3
>   *
>   *  Copyright =C2=A9 2005-2006 Nokia Corporation
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 979f4031f23c..05907b1b4098 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1,6 +1,4 @@
>  /*
> - *  linux/drivers/mtd/onenand/onenand_base.c
> - *
>   *  Copyright =C2=A9 2005-2009 Samsung Electronics
>   *  Copyright =C2=A9 2007 Nokia Corporation
>   *
> diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onen=
and_bbt.c
> index 420260c25ca0..dde20487937d 100644
> --- a/drivers/mtd/onenand/onenand_bbt.c
> +++ b/drivers/mtd/onenand/onenand_bbt.c
> @@ -1,7 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - *  linux/drivers/mtd/onenand/onenand_bbt.c
> - *
>   *  Bad Block Table support for the OneNAND driver
>   *
>   *  Copyright(c) 2005 Samsung Electronics



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
