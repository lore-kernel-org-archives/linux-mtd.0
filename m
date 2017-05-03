Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5y8o-0007u9-DF
 for linux-mtd@lists.infradead.org; Wed, 03 May 2017 17:32:44 +0000
Received: by mail-wr0-x243.google.com with SMTP id w50so23924067wrc.0
 for <linux-mtd@lists.infradead.org>; Wed, 03 May 2017 10:32:21 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: jz4780: Use mtd_set_ooblayout() to set the
 ooblayout
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <1493720953-8471-1-git-send-email-boris.brezillon@free-electrons.com>
From: Harvey Hunt <harveyhuntnexus@gmail.com>
Message-ID: <082cd6f0-ec59-2f81-526c-91886077092f@gmail.com>
Date: Wed, 3 May 2017 18:32:47 +0100
MIME-Version: 1.0
In-Reply-To: <1493720953-8471-1-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi Boris,

On 05/02/2017 11:29 AM, Boris Brezillon wrote:
> The mtd_set_ooblayout() accesor has been added to hide internals of
> mtd_info and ease future refactoring. Call mtd_set_ooblayout() instead of
> directly accessing mtd->ooblayout.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>   drivers/mtd/nand/jz4780_nand.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> index a39bb70175ee..8bc835f71b26 100644
> --- a/drivers/mtd/nand/jz4780_nand.c
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -205,7 +205,7 @@ static int jz4780_nand_init_ecc(struct jz4780_nand_chip *nand, struct device *de
>   		return -EINVAL;
>   	}
>   
> -	mtd->ooblayout = &nand_ooblayout_lp_ops;
> +	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
>   
>   	return 0;
>   }
> 

Looks good to me.

Acked-by: Harvey Hunt <harveyhuntnexus@gmail.com>

Thanks,

Harvey
