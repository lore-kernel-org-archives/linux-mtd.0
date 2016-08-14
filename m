Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYxbf-0002qL-L0
 for linux-mtd@lists.infradead.org; Sun, 14 Aug 2016 15:45:48 +0000
Date: Sun, 14 Aug 2016 17:45:25 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: nand: gpmi: get correct free oob space
Message-ID: <20160814174525.2d731774@bbrezillon>
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

On Tue, 12 Apr 2016 17:06:33 -0500
Han Xu <han.xu@nxp.com> wrote:

> change the way to calculate pagesize to get correct free oob space for
> legacy_set_geometry function.
> 

Applied (sorry for the delay, it seems this patch felt through the
cracks).

Thanks,

Boris

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
