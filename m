Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQKeP-0003WJ-Uk
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2018 23:14:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Sat, 24 Nov 2018 00:14:06 +0100
From: Stefan Agner <stefan@agner.ch>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Vladimir Zapolskiy
 <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>
Subject: Re: [PATCH 09/10] mtd: rawnand: vf610: Add an SPDX tag to replace the
 license text
In-Reply-To: <20181120090239.5792-10-boris.brezillon@bootlin.com>
References: <20181120090239.5792-1-boris.brezillon@bootlin.com>
 <20181120090239.5792-10-boris.brezillon@bootlin.com>
Message-ID: <b51f2dbf64aeda6b764dbde2c0235a4e@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20.11.2018 10:02, Boris Brezillon wrote:
> Replace the license test by an SPDX tag.

s/test/text

Reviewed-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  drivers/mtd/nand/raw/vf610_nfc.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
> index 2e8b7e9314a3..a662ca1970e5 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -1,3 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0+
>  /*
>   * Copyright 2009-2015 Freescale Semiconductor, Inc. and others
>   *
> @@ -10,11 +11,6 @@
>   *
>   * Based on original driver mpc5121_nfc.c.
>   *
> - * This is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License as published by
> - * the Free Software Foundation; either version 2 of the License, or
> - * (at your option) any later version.
> - *
>   * Limitations:
>   * - Untested on MPC5125 and M54418.
>   * - DMA and pipelining not used.
