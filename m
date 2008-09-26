Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kj1F1-0001fw-PM
	for linux-mtd@lists.infradead.org; Fri, 26 Sep 2008 00:31:28 +0000
Received: by gxk5 with SMTP id 5so7948165gxk.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Sep 2008 17:31:27 -0700 (PDT)
Message-ID: <9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
Date: Fri, 26 Sep 2008 09:31:27 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: apgmoorthy <moorthy.apg@samsung.com>
Subject: Re: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
In-Reply-To: <000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

A few comments

>
> Signed-off-by: Vishak G <vishak.g@samsung.com>
> Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

> ---
> diff -uprN a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c
> --- a/drivers/mtd/onenand/onenand_base.c        2008-09-16
> 20:48:12.000000000 +0530
> +++ b/drivers/mtd/onenand/onenand_base.c        2008-09-24
> 17:51:34.000000000 +0530
> @@ -9,6 +9,10 @@
>  *     auto-placement support, read-while load support, various fixes
>  *     Copyright (C) Nokia Corporation, 2007
>  *
> + *     Vishak G <vishak.g@samsung.com>, Rohit Hagargundgi
> <h.rohit@samsung.com>
> + *     Flex-OneNAND support
> + *     Copyright (C) Samsung Electronics, 2008
> + *
>  * This program is free software; you can redistribute it and/or modify
>  * it under the terms of the GNU General Public License version 2 as
>  * published by the Free Software Foundation.
> @@ -27,6 +31,37 @@
>
>  #include <asm/io.h>
>
> +const static int boundary[] = {
> +       FLEXONENAND_DIE0_BOUNDARY,
> +       FLEXONENAND_DIE1_BOUNDARY,
> +};
> +
> +const static int lock[] = {
> +       FLEXONENAND_DIE0_ISLOCKED,
> +       FLEXONENAND_DIE1_ISLOCKED,
> +};
> +

static const as others.


> diff -uprN a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> --- a/include/mtd/mtd-abi.h     2008-09-16 20:48:12.000000000 +0530
> +++ b/include/mtd/mtd-abi.h     2008-09-24 14:09:06.000000000 +0530
> @@ -102,7 +102,11 @@ struct nand_oobinfo {
>        uint32_t useecc;
>        uint32_t eccbytes;
>        uint32_t oobfree[8][2];
> +#ifdef CONFIG_MTD_ONENAND
> +       uint32_t eccpos[128];
> +#else
>        uint32_t eccpos[32];
> +#endif
>  };
>
>  struct nand_oobfree {
> @@ -117,7 +121,11 @@ struct nand_oobfree {
>  */
>  struct nand_ecclayout {
>        uint32_t eccbytes;
> +#ifdef CONFIG_MTD_ONENAND
> +       uint32_t eccpos[128];
> +#else
>        uint32_t eccpos[64];
> +#endif
>        uint32_t oobavail;
>        struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
>  };
>
>

This patch is already included others. Please remove it at this patch.

Thank you,
Kyungmin Park
