Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dtscE-0004pf-UC
 for linux-mtd@lists.infradead.org; Mon, 18 Sep 2017 09:45:25 +0000
Date: Mon, 18 Sep 2017 11:44:51 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Kill check with no effect
Message-ID: <20170918114451.74e6fe68@bbrezillon>
In-Reply-To: <20170917141352.23691-1-richard@nod.at>
References: <20170917141352.23691-1-richard@nod.at>
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

On Sun, 17 Sep 2017 16:13:52 +0200
Richard Weinberger <richard@nod.at> wrote:

> header.major is of type u8 and cannot be negative.

I guess you meant header.minor here.

> 
> Detected by CoverityScan CID#1417858 ("Integer handling issues")
> 
> Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable
> Parameters (SFDP) tables")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> Cyrille,
> 
> I'm not sure what exactly you wanted to test.
> Maybe it makes sense casting header.major to s8 before checking against < 0?
> 
> Thanks,
> //richard
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index d71765739a93..4b86decdf13e 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2252,8 +2252,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  
>  	/* Check the SFDP header version. */
>  	if (le32_to_cpu(header.signature) != SFDP_SIGNATURE ||
> -	    header.major != SFDP_JESD216_MAJOR ||
> -	    header.minor < SFDP_JESD216_MINOR)
> +	    header.major != SFDP_JESD216_MAJOR)
>  		return -EINVAL;
>  
>  	/*
