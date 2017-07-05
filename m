Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dSeN8-0005aF-GO
 for linux-mtd@lists.infradead.org; Wed, 05 Jul 2017 07:05:21 +0000
Date: Wed, 5 Jul 2017 09:04:53 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org (open list:NAND
 FLASH SUBSYSTEM), linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] nand: fix wrong default oob layout for small pages
 using soft ecc
Message-ID: <20170705090453.7e412982@bbrezillon>
In-Reply-To: <20170705065109.7738-1-miquel.raynal@free-electrons.com>
References: <20170705065109.7738-1-miquel.raynal@free-electrons.com>
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

Hi Miquel,

On Wed,  5 Jul 2017 08:51:09 +0200
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> When using soft ecc, if no ooblayout is given, the core automatically
> uses one of the nand_ooblayout_{sp,lp}*() functions to determine the
> layout inside the out of band data.
> 
> Until kernel version 4.6, struct nand_ecclayout was used for that
> purpose. During the migration from 4.6 to 4.7, an error shown up in the
> small page layout, in the case oob section is only 8 bytes long.
> 
> The layout was using three bytes (0, 1, 2) for ecc, two bytes (3, 4)
> as free bytes, one byte (5) for bad block marker and finally
> two bytes (6, 7) as free bytes, as shown there:
> 
> [linux-4.6] drivers/mtd/nand/nand_base.c:52
> static struct nand_ecclayout nand_oob_8 = {
> 	.eccbytes = 3,
> 	.eccpos = {0, 1, 2},
> 	.oobfree = {
> 		{.offset = 3,
> 		 .length = 2},
> 		{.offset = 6,
> 		 .length = 2} }
> };
> 
> This fixes the current implementation which is incoherent. It
> references bit 3 at the same time as an ecc byte and a free byte.
> 
> Furthermore, it is clear with the previous implementation that there
> is only one ecc section with 8 bytes oob sections. We shall return
> -ERANGE in the nand_ooblayout_ecc_sp() function when asked for the
> second section.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Looks good to me. BTW, it looks like a good candidate for stable.
No need to send a v2, I'll add the following when applying:

Fixes: 41b207a70d3a ("mtd: nand: implement the default mtd_ooblayout_ops")
Cc: <stable@vger.kernel.org>

Thanks,

Boris

> ---
>  drivers/mtd/nand/nand_base.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index b1dd12729f19..c5221795a1e8 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -65,8 +65,14 @@ static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
>  
>  	if (!section) {
>  		oobregion->offset = 0;
> -		oobregion->length = 4;
> +		if (mtd->oobsize == 16)
> +			oobregion->length = 4;
> +		else
> +			oobregion->length = 3;
>  	} else {
> +		if (mtd->oobsize == 8)
> +			return -ERANGE;
> +
>  		oobregion->offset = 6;
>  		oobregion->length = ecc->total - 4;
>  	}
