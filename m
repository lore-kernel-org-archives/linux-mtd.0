Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq72l-0005KJ-FN
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 22:44:23 +0000
Date: Wed, 13 Apr 2016 00:43:51 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: gpmi: get correct free oob space
Message-ID: <20160413004351.40064fcd@bbrezillon>
In-Reply-To: <1460498793-19431-1-git-send-email-han.xu@nxp.com>
References: <1460498793-19431-1-git-send-email-han.xu@nxp.com>
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

Hi Han,

On Tue, 12 Apr 2016 17:06:33 -0500
Han Xu <han.xu@nxp.com> wrote:

> change the way to calculate pagesize to get correct free oob space for
> legacy_set_geometry function.

Are you sure it's safe to expose free OOB bytes in this case? Do you
know why it wasn't done before?

Best Regards,

Boris

> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> index 316b5ac..bda77a9 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -319,7 +319,8 @@ static int legacy_set_geometry(struct gpmi_nand_data *this)
>  		return -EINVAL;
>  	}
>  
> -	geo->page_size = mtd->writesize + mtd->oobsize;
> +	geo->page_size = mtd->writesize + geo->metadata_size +
> +		(geo->gf_len * geo->ecc_strength * geo->ecc_chunk_count) / 8;
>  	geo->payload_size = mtd->writesize;
>  
>  	/*



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
