Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dxVP5-0002L7-4p
 for linux-mtd@lists.infradead.org; Thu, 28 Sep 2017 09:46:49 +0000
Date: Thu, 28 Sep 2017 11:46:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Genoud <richard.genoud@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user
Message-ID: <20170928114613.653a4d50@bbrezillon>
In-Reply-To: <1506516557.19393.5.camel@gmail.com>
References: <1506516557.19393.5.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 27 Sep 2017 14:49:17 +0200
Richard Genoud <richard.genoud@gmail.com> wrote:

> When calculating the size needed by struct atmel_pmecc_user *user,
> the dmu and delta buffer sizes were forgotten.
> This lead to a memory corruption (especially with a large ecc_strength).
> 
> Link: http://lkml.kernel.org/r/1506503157.3016.5.camel@gmail.com
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: stable@vger.kernel.org
> Reported-by: Richard Genoud <richard.genoud@gmail.com>
> Pointed-at-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/nand/atmel/pmecc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pmecc.c
> index 146af8218314..8268636675ef 100644
> --- a/drivers/mtd/nand/atmel/pmecc.c
> +++ b/drivers/mtd/nand/atmel/pmecc.c
> @@ -363,7 +363,7 @@ atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
>  	size += (req->ecc.strength + 1) * sizeof(u16);
>  	/* Reserve space for mu, dmu and delta. */
>  	size = ALIGN(size, sizeof(s32));
> -	size += (req->ecc.strength + 1) * sizeof(s32);
> +	size += (req->ecc.strength + 1) * sizeof(s32) * 3;
>  
>  	user = kzalloc(size, GFP_KERNEL);
>  	if (!user)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
