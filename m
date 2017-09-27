Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxEJ9-0006Co-FB
 for linux-mtd@lists.infradead.org; Wed, 27 Sep 2017 15:31:34 +0000
Subject: Re: [PATCH] mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user
To: Richard Genoud <richard.genoud@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Linux Kernel
 <linux-kernel@vger.kernel.org>
References: <1506516557.19393.5.camel@gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <3ab0ab38-bdd1-0f9c-2fe9-0f006b90e498@microchip.com>
Date: Wed, 27 Sep 2017 17:32:22 +0200
MIME-Version: 1.0
In-Reply-To: <1506516557.19393.5.camel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27/09/2017 at 14:49, Richard Genoud wrote:
> When calculating the size needed by struct atmel_pmecc_user *user,
> the dmu and delta buffer sizes were forgotten.
> This lead to a memory corruption (especially with a large ecc_strength).
> 
> Link: http://lkml.kernel.org/r/1506503157.3016.5.camel@gmail.com
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>

Yes:
Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks Richard and Boris for this quick fix!

Regards,
  Nicolas

> Cc: stable@vger.kernel.org
> Reported-by: Richard Genoud <richard.genoud@gmail.com>
> Pointed-at-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
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


-- 
Nicolas Ferre
