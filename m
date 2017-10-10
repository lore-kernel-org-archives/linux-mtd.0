Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1w63-0002bU-NZ
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 15:05:32 +0000
Subject: Re: [PATCH] mtd: spi-nor: Kill check with no effect
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org
References: <20170917141352.23691-1-richard@nod.at>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <7d982c3b-4629-faf6-387f-667cc61ef74c@wedev4u.fr>
Date: Tue, 10 Oct 2017 17:04:55 +0200
MIME-Version: 1.0
In-Reply-To: <20170917141352.23691-1-richard@nod.at>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 17/09/2017 à 16:13, Richard Weinberger a écrit :
> header.major is of type u8 and cannot be negative.
> 
> Detected by CoverityScan CID#1417858 ("Integer handling issues")
> 
> Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable
> Parameters (SFDP) tables")
> Signed-off-by: Richard Weinberger <richard@nod.at>

Applied to the spi-nor/next branch of l2-mtd

I've replaced header.major by header.minor in the commit message as
reported by Boris.

Thanks!

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
> 
